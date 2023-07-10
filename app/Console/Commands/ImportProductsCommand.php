<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class ImportProductsCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:import-products {--csvPath=}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $csvPath = $this->option('csvPath') ?? public_path('input.csv');
        $this->info('ImportProducts: Import Product Data');
    }
}
