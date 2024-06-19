def configure_fermions(Fermions):

    """
    set all user defined parameters for fermions interface

    :param: Fermions: PyFermiONs object
    :return: options dictionary
    """
    
    # Geometry, Multiplicity, Charge
    Fermions.charge = 1
    Fermions.mult = 1

    # Method
    Fermions.basis = "def2-svp"
    Fermions.method = "dft"
    Fermions.exc = "xc_gga_x_pbe"
    Fermions.ecorr = "xc_gga_c_pbe"
    
    # Details
    Fermions.scf_conv = 1e-7
    Fermions.exx_mode = "senex"
    Fermions.grid = "gm5"
    Fermions.ri_j = True

    options = {
               "sys": """
    inc_density     false
    integral_thresh_rij     1e-12
    senex_grid_type gm4
    diis            diis""",
               "tdscf": """
    tda           true
    rpa           false
    triplets      true
    singlets      true
    conv          1e-6
    diis_dim      200
    soc           true
    trans_dipoles true
    nroots        4""",
               "tdscf_deriv": """
    zconv         1e-5
    z_diis_dim    200
    nacv          false
    expop         false"""}

    return options

