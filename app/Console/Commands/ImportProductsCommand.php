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
    protected $description = 'This command is the entry point of the coding challenge';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $csvPath = $this->option('csvPath') ?? public_path('input.csv');

        $this->info('ImportProductsCommand: Start importing product data from ' . $csvPath);

        $countCorruptedRows = $countProducts = $countVariants = 0;

        // TODO: Implement

        $this->info('ImportProductsCommand: End importing product data from ' . $csvPath);
        $this->info('ImportProductsCommand: Imported ' . $countProducts . ' products and ' . $countVariants . ' variants.');
        $this->warn('ImportProductsCommand: Skipped ' . $countCorruptedRows . ' corrupted rows.');
    }
}
