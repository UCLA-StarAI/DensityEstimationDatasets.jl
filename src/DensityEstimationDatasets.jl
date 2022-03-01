module DensityEstimationDatasets

export sampled_mnist, 
    twenty_datasets,
    twenty_dataset_names,
    twenty_datasets_file
    
using CSV
using DataFrames
using LazyArtifacts

####################
# Constants
#####################

const twenty_dataset_names = [
        "accidents", "ad", "baudio", "bbc", "bnetflix", "book", "c20ng", "cr52", "cwebkb",
        "dna", "jester", "kdd", "kosarek", "msnbc", "msweb", "nltcs", "plants", "pumsb_star", "tmovie", "tretail", 
        "binarized_mnist"
];


#####################
# Data loaders
#####################

sampled_mnist() = twenty_datasets("binarized_mnist")

"""
    twenty_datasets_file(name, type)

Returns the file path the dataset. Automatically downloads all the datasets using `LazyArtifcats` the first time you call this function.

- `name`: Name of the dataset. See `twenty_dataset_names()` for valid options
- `type`: depending on the dataset, usual options are "train", "valid", and "test".
"""
function twenty_datasets_file(name, type)
    @assert in(name, twenty_dataset_names)
    data_dir = artifact"density_estimation_datasets"
    return data_dir*"/Density-Estimation-Datasets-1.0.1/datasets/$name/$name.$type.data"
end

"""
    train, valid, test = twenty_datasets(name)

Load a given dataset from the density estimation datasets. Automatically downloads the files as julia Artifacts. 
See https://github.com/UCLA-StarAI/Density-Estimation-Datasets for a list of avaialble datasets.
"""
function twenty_datasets(name)
    @assert in(name, twenty_dataset_names)
    function load(type)
        dataframe = CSV.read(twenty_datasets_file(name, type), DataFrame; 
            header=false, truestrings=["1"], falsestrings=["0"], types=Bool, strict=true)
    end
    train = load("train")
    valid = load("valid")
    test = load("test")
    return train, valid, test
end



end # module
