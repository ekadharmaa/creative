<script setup lang="ts">
import { ref, onMounted } from "vue";
import { Chart, registerables } from "chart.js";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import { Head, usePage, router } from "@inertiajs/vue3";
import { ArrowDownTrayIcon, DocumentTextIcon } from "@heroicons/vue/24/solid";
import { route } from "ziggy-js";


// Register Chart.js modules
Chart.register(...registerables);

const page = usePage();

// Props dari backend Laravel
const orderStatusData = page.props.orderStatusData || {};
const dailySales = page.props.dailySales || {};
const monthlySales = page.props.monthlySales || {};
const yearlySales = page.props.yearlySales || {};

// Chart refs
const statusChartRef = ref(null);
const dailyChartRef = ref(null);
const monthlyChartRef = ref(null);
const yearlyChartRef = ref(null);

// Warna berdasarkan status
const statusLabels = Object.keys(orderStatusData);
const statusCounts = Object.values(orderStatusData);
const statusColors = statusLabels.map((label) => {
  const lower = label.toLowerCase();
  if (lower === "success") return "#34d399";
  if (lower === "pending") return "#fbbf24";
  if (lower === "expired") return "#f87171";
  return "#94a3b8";
});

// Helper buat chart line
function buildLineChart(ref, labels, data, label, borderColor) {
  if (!ref.value) return;
  new Chart(ref.value, {
    type: "line",
    data: {
      labels,
      datasets: [
        {
          label,
          data,
          borderColor,
          backgroundColor: borderColor + "33",
          fill: true,
          tension: 0.3,
        },
      ],
    },
    options: {
      responsive: true,
      scales: {
        y: {
          beginAtZero: true,
        },
      },
    },
  });
}

onMounted(() => {
  if (statusChartRef.value) {
    new Chart(statusChartRef.value, {
      type: "pie",
      data: {
        labels: statusLabels,
        datasets: [
          {
            label: "Jumlah Pesanan",
            data: statusCounts,
            backgroundColor: statusColors,
          },
        ],
      },
    });
  }

  buildLineChart(
    dailyChartRef,
    Object.keys(dailySales),
    Object.values(dailySales),
    "Total Harian (Rp)",
    "#3b82f6"
  );

  buildLineChart(
    monthlyChartRef,
    Object.keys(monthlySales),
    Object.values(monthlySales),
    "Total Bulanan (Rp)",
    "#10b981"
  );

  buildLineChart(
    yearlyChartRef,
    Object.keys(yearlySales),
    Object.values(yearlySales),
    "Total Tahunan (Rp)",
    "#f59e0b"
  );
});
</script>

<template>
  <Head title="Laporan" />
  <AuthenticatedLayout>
    <div class="p-6 bg-white shadow rounded-lg">
      <div class="flex flex-col sm:flex-row justify-between items-center mb-6 gap-4">
        <h2 class="text-xl font-semibold">Laporan Pendapatan</h2>
        <div class="flex gap-2">
        </div>
      </div>

      <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
        <!-- Chart Status -->
        <div class="bg-gray-100 p-5 rounded-lg">
          <h3 class="text-lg font-medium mb-2">Status Pesanan</h3>
          <p class="text-sm text-gray-600 mb-4">
            Grafik ini menunjukkan jumlah pesanan berdasarkan status terakhir.
          </p>
          <canvas ref="statusChartRef" />
        </div>

        <!-- Harian -->
        <div class="bg-gray-100 p-5 rounded-lg">
          <h3 class="text-lg font-medium mb-2">Transaksi Harian</h3>
          <p class="text-sm text-gray-600 mb-4">
            Grafik ini menunjukkan total transaksi berdasarkan hari.
          </p>
          <canvas ref="dailyChartRef" />
        </div>

        <!-- Bulanan -->
        <div class="bg-gray-100 p-5 rounded-lg">
          <h3 class="text-lg font-medium mb-2">Transaksi Bulanan</h3>
          <p class="text-sm text-gray-600 mb-4">
            Grafik ini menunjukkan total transaksi per bulan.
          </p>
          <canvas ref="monthlyChartRef" />
        </div>

        <!-- Tahunan -->
        <div class="bg-gray-100 p-5 rounded-lg">
          <h3 class="text-lg font-medium mb-2">Transaksi Tahunan</h3>
          <p class="text-sm text-gray-600 mb-4">
            Grafik ini menunjukkan total transaksi per tahun.
          </p>
          <canvas ref="yearlyChartRef" />
        </div>
      </div>
    </div>
  </AuthenticatedLayout>
</template>
