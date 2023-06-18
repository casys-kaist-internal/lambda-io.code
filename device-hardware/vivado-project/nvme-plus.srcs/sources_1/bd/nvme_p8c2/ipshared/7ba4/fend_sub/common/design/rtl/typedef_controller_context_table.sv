/**
 * OpenExpress - Fully Hardware Automated Open Research Framework for Future
 *               Fast NVMe Devices
 *
 * Copyright (c) 2020 CAMELab.org. All rights reserved.
 *
 * OpenExpress License 0.1.
 *
 * OpenExpress is provided for “academic research” and “non-commercial”
 * purposes. Here, OpenExpress means the hardware source code, documents, etc.
 * that you can download from a link given by https://openexpress.camelab.org.
 * One of the main purposes of sharing OpenExpress's hardware IP cores is to be
 * an educational reference point for academic researchers, and the author
 * doesn't want to implicitly and/or explicitly have an impact on industry
 * business and complicated situation behind them.
 *
 * The author thus does allow downloading OpenExpress "only" from the designated
 *  website, and permit to examine and do any activities on OpenExpress (such as
 *  use/modify) for "only the one" who is successfully verified and agrees on
 * this End User License Agreement. OpenExpress is protected by one or more
 * patents. Note that all use cases of OpenExpress without registration at
 *  https://openexpress.camelab.org will be in violation of the law.
 *
 * The academic users (permitted) to download OpenExpress require understanding
 * that any form of non-permitted distribution, including a variation and
 * reproduction of the original OpenExpress version (you downloaded), is not
 * allowed. If a user left a university program, any local copy of OpenExpress
 * should be removed. OpenExpress is provided as is without warranty of any
 * kind, express, or implied.  In no event shall the author be liable for any
 * claim, damages or other liability whether in an action of contract, tort or
 * other liability, otherwise, arising from, out of or in connection with
 * OpenExpress or the use or other dealings with OpenExpress.
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of OpenExpress.
 */

`ifndef _TYPEDEF_CONTROLLER_CONTEXT_TABLE_SV_
`define _TYPEDEF_CONTROLLER_CONTEXT_TABLE_SV_

typedef struct packed {
    logic [ 7: 0]   rsvd0;
    logic [ 7: 0]   size;
    logic [15: 0]   offset;
} fext_cfg_t;

typedef struct packed
{
    fext_cfg_t      fext1_cfg;
    fext_cfg_t      fext0_cfg;
    logic [15: 0]   awun;
    logic [ 7: 0]   cqesz;
    logic [ 7: 0]   sqesz;
    logic [23: 0]   rsvd;
    struct packed
    {
        logic           rsvd;
        enum logic
        {
            crc_enable= 1'b1,
            ffffh = 1'b0
        } pi_guard_field;
        enum logic
        {
            support_dealloc = 1'b1,
            not_supported   = 1'b0
        } write_zero;
        enum logic [ 2: 0]
        {
            not_reported    = 3'b000,
            all_bytes_00h   = 3'b001,
            all_bytes_ffh   = 3'b010
        } read_value;
    } dlfeat;

    logic disnvme;
    logic enbifur;
    enum logic
    {
        nvme_disable = 1'b1,
        nvme_enable  = 1'b0
    } disnvme_e;
    enum logic
    {
        bifur_enable  = 1'b1,
        bifur_disable = 1'b0
    } enbifur_e;
} controller_context_table_t;

`endif
