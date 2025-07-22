<?php

namespace Database\Seeders;

use App\Models\Order;
use App\Models\Customer;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        $isUserExist = User::where('email', 'admin@admin.com')->exists();

        if (!$isUserExist) {
            User::factory()->create([
                'name' => 'admin',
                'email' => 'admin@admin.com',
                'password' => Hash::make('P@ssw0rd'),
                'avatar' => 'https://media.tenor.com/zLFrBs-2_h8AAAAM/counterside-sigma.gif'
            ]);
        }

        Customer::factory(10)->has(
            Order::factory()->count(3)
        )->create();

        /**
         * Manual Create Invitation
         * 
         */
        $orders = Order::where('customer_id', 1);
        $orders->each(function ($order) {
            $customer = $order->customer;
            $customer->invitations()->create([
                'order_id' => $order->id,
                'template' => 'adat-jawa',
            ]);
        });
    }
}
