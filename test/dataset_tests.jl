using DensityEstimationDatasets
using Test

@testset "API Tests" begin

    file_train = twenty_dataset_names("plants", "train")
    file_valid =  twenty_dataset_names("plants", "valid")
    file_test =  twenty_dataset_names("plants", "test")

    @test file_train isa String && isfile(file_string)
    @test file_valid isa String && isfile(file_valid)
    @test file_test isa String && isfile(file_test)


    train, valid, test = twenty_datasets("plants");

    @test train isa DataFrame
    @test valid isa DataFrame
    @test test isa DataFrame

    @test size(train) == (17412, 69)
    @test size(valid) == (2321, 69)
    @test size(test) == (3482, 69)

end