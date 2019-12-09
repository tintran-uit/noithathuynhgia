<?php

use App\Product;
use Illuminate\Database\Seeder;

class ProductsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Laptops
        for ($i=1; $i <= 30; $i++) {
            $isFeatured = false;
            if($i%2==0){
                $isFeatured = true;
            }
            Product::create([
                'name' => 'Sàn nhựa '.$i,
                'slug' => 'san-nhua'.$i,
                'details' => [13,14,15][array_rand([13,14,15])] . ' inch, ' . [1, 2, 3][array_rand([1, 2, 3])] .' TB SSD, 32GB RAM',
                'price' => rand(149999, 249999),
                'description' =>'Lorem '. $i . ' ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!',
                'image' => 'products/dummy/san.jpg',
                'images' => '["products\/dummy\/san-2.jpg","products\/dummy\/san-3.jpg","products\/dummy\/san-4.jpg"]',
                'featured' => $isFeatured,
            ])->categories()->attach(1);
        }


    }
}
