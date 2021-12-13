Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0B5C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 13 Dec 2021 20:36:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238005AbhLMUgT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Dec 2021 15:36:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbhLMUgT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Dec 2021 15:36:19 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68CFC061574
        for <linux-doc@vger.kernel.org>; Mon, 13 Dec 2021 12:36:18 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso18810686otf.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Dec 2021 12:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7ymw4zzbx0fGEGW9oOqaMZw8xenwjMHHLGEYhutDDMI=;
        b=VqRj8hZn6aVzmGCiI1bqFAsrrdWp2dKCRPrOjRTu8VPhRnGlOBKJTLHeMY1U+v/1Lm
         Et08IkhtoVY2aIRLiCrFA3Ft6J+zrPBP4SvUOjVi2vLsPu/GvtMnumz38wQPlumjwlGW
         qsd1PYDswXnoQeZSZhbGxSV2w8TwF3cnpjIbXPMrFZ1SkrTeYBGR0FXKxMD0j6OdQLug
         rlTcP13JwdVK+dPclSJJ5ad2XO0dpnA+dK1TM6u2edPQxxl7wB+E+ZLgD0nj0JlLb4k4
         A3zn4amE9as8f333FaP+CKh7nZx7EojXkGq6e+C64pVcS453pNqtCZzVGs66J8e+iQhD
         hUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ymw4zzbx0fGEGW9oOqaMZw8xenwjMHHLGEYhutDDMI=;
        b=hsuSDtAd7z5MpW2b/jV5G8riau6jdtXbdfVLiEhhl8JRnJBT1EWeGlG+Quyf19P6HZ
         3fPDXqi2q86v1hG+62lKxGW8MrTOiq70frRS9V6tvOSnFUN4qRf9R6dCIJHVVe6hXpOW
         G9cOm025VZkPAShiPRBemaJOOJipi55S58brGuP/+ZoXYydqzJJ0ZMJOPt8N4mbeNISu
         TE0OG7joNQzIUHKnMfeMvIOHCQwHHzUJ43nuyBMPMcP4rbvY2N4loj2K6v3hFzPFdt7T
         4tqF2ZfRF7/CVRGEiwyGE9MJnXORBhd3kiFy/TU+UE1JYXNmem5vxlYnZOlxIerBS6Cq
         faKQ==
X-Gm-Message-State: AOAM533hhO8UUVE02kBM9GwxezIY0wbOIZA4leoidUuKJZivXuGUGvVn
        9b2UNxBbCGxkkWaaY+1M1qaCVHWJ58kAALDdjDqZAj/H
X-Google-Smtp-Source: ABdhPJw21J+2Oiu0OYbofiF9BdcRlQNtwFLgBXvwOvMcNEupDAT8bQ4oFJjaWmh/O5e44Pc+zeHBarTSH1EFBu3EBCE=
X-Received: by 2002:a9d:67c1:: with SMTP id c1mr703100otn.299.1639427778116;
 Mon, 13 Dec 2021 12:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20211210182030.3834-1-ydirson@free.fr> <20211210182030.3834-2-ydirson@free.fr>
 <c47a7b5b-a77c-6538-97e9-cb665f6e4dae@amd.com>
In-Reply-To: <c47a7b5b-a77c-6538-97e9-cb665f6e4dae@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 13 Dec 2021 15:36:07 -0500
Message-ID: <CADnq5_OyHMOyFYXXEYRvZb_Mefm8JH10T8vMMNXqKk-WQHkXzA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] Documentation/gpu: split amdgpu/index for readability
To:     Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Cc:     Yann Dirson <ydirson@free.fr>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Applied. thanks!

Alex

On Mon, Dec 13, 2021 at 3:07 PM Rodrigo Siqueira Jordao
<rjordrigo@amd.com> wrote:
>
>
>
> On 2021-12-10 1:20 p.m., Yann Dirson wrote:
> > This starts to make the formated index much more manageable to the reader.
> >
> > Signed-off-by: Yann Dirson <ydirson@free.fr>
> > ---
> >   Documentation/gpu/amdgpu/driver-core.rst      |  65 ++++
> >   Documentation/gpu/amdgpu/driver-misc.rst      | 112 ++++++
> >   Documentation/gpu/amdgpu/index.rst            | 342 +-----------------
> >   .../gpu/amdgpu/module-parameters.rst          |   7 +
> >   Documentation/gpu/amdgpu/ras.rst              |  62 ++++
> >   Documentation/gpu/amdgpu/thermal.rst          |  65 ++++
> >   Documentation/gpu/amdgpu/xgmi.rst             |   5 +
> >   7 files changed, 324 insertions(+), 334 deletions(-)
> >   create mode 100644 Documentation/gpu/amdgpu/driver-core.rst
> >   create mode 100644 Documentation/gpu/amdgpu/driver-misc.rst
> >   create mode 100644 Documentation/gpu/amdgpu/module-parameters.rst
> >   create mode 100644 Documentation/gpu/amdgpu/ras.rst
> >   create mode 100644 Documentation/gpu/amdgpu/thermal.rst
> >   create mode 100644 Documentation/gpu/amdgpu/xgmi.rst
> >
> > diff --git a/Documentation/gpu/amdgpu/driver-core.rst b/Documentation/gpu/amdgpu/driver-core.rst
> > new file mode 100644
> > index 000000000000..97f9a9b68924
> > --- /dev/null
> > +++ b/Documentation/gpu/amdgpu/driver-core.rst
> > @@ -0,0 +1,65 @@
> > +============================
> > + Core Driver Infrastructure
> > +============================
> > +
> > +.. _amdgpu_memory_domains:
> > +
> > +Memory Domains
> > +==============
> > +
> > +.. kernel-doc:: include/uapi/drm/amdgpu_drm.h
> > +   :doc: memory domains
> > +
> > +Buffer Objects
> > +==============
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > +   :doc: amdgpu_object
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > +   :internal:
> > +
> > +PRIME Buffer Sharing
> > +====================
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > +   :doc: PRIME Buffer Sharing
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > +   :internal:
> > +
> > +MMU Notifier
> > +============
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> > +   :doc: MMU Notifier
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> > +   :internal:
> > +
> > +AMDGPU Virtual Memory
> > +=====================
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +   :doc: GPUVM
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +   :internal:
> > +
> > +Interrupt Handling
> > +==================
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> > +   :doc: Interrupt Handling
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> > +   :internal:
> > +
> > +IP Blocks
> > +=========
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/include/amd_shared.h
> > +   :doc: IP Blocks
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/include/amd_shared.h
> > +   :identifiers: amd_ip_block_type amd_ip_funcs
> > diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu/amdgpu/driver-misc.rst
> > new file mode 100644
> > index 000000000000..e3d6b2fa2493
> > --- /dev/null
> > +++ b/Documentation/gpu/amdgpu/driver-misc.rst
> > @@ -0,0 +1,112 @@
> > +================================
> > + Misc AMDGPU driver information
> > +================================
> > +
> > +GPU Product Information
> > +=======================
> > +
> > +Information about the GPU can be obtained on certain cards
> > +via sysfs
> > +
> > +product_name
> > +------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +   :doc: product_name
> > +
> > +product_number
> > +--------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +   :doc: product_name
> > +
> > +serial_number
> > +-------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +   :doc: serial_number
> > +
> > +unique_id
> > +---------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +   :doc: unique_id
> > +
> > +GPU Memory Usage Information
> > +============================
> > +
> > +Various memory accounting can be accessed via sysfs
> > +
> > +mem_info_vram_total
> > +-------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > +   :doc: mem_info_vram_total
> > +
> > +mem_info_vram_used
> > +------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > +   :doc: mem_info_vram_used
> > +
> > +mem_info_vis_vram_total
> > +-----------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > +   :doc: mem_info_vis_vram_total
> > +
> > +mem_info_vis_vram_used
> > +----------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > +   :doc: mem_info_vis_vram_used
> > +
> > +mem_info_gtt_total
> > +------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> > +   :doc: mem_info_gtt_total
> > +
> > +mem_info_gtt_used
> > +-----------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> > +   :doc: mem_info_gtt_used
> > +
> > +PCIe Accounting Information
> > +===========================
> > +
> > +pcie_bw
> > +-------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +   :doc: pcie_bw
> > +
> > +pcie_replay_count
> > +-----------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +   :doc: pcie_replay_count
> > +
> > +GPU SmartShift Information
> > +==========================
> > +
> > +GPU SmartShift information via sysfs
> > +
> > +smartshift_apu_power
> > +--------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +   :doc: smartshift_apu_power
> > +
> > +smartshift_dgpu_power
> > +---------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +   :doc: smartshift_dgpu_power
> > +
> > +smartshift_bias
> > +---------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +   :doc: smartshift_bias
> > diff --git a/Documentation/gpu/amdgpu/index.rst b/Documentation/gpu/amdgpu/index.rst
> > index ff38c360b04e..a24e1cfa7407 100644
> > --- a/Documentation/gpu/amdgpu/index.rst
> > +++ b/Documentation/gpu/amdgpu/index.rst
> > @@ -5,339 +5,13 @@
> >   The drm/amdgpu driver supports all AMD Radeon GPUs based on the Graphics Core
> >   Next (GCN) architecture.
> >
> > -Module Parameters
> > -=================
> > -
> > -The amdgpu driver supports the following module parameters:
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > -
> > -Core Driver Infrastructure
> > -==========================
> > -
> > -This section covers core driver infrastructure.
> > -
> > -.. _amdgpu_memory_domains:
> > -
> > -Memory Domains
> > ---------------
> > -
> > -.. kernel-doc:: include/uapi/drm/amdgpu_drm.h
> > -   :doc: memory domains
> > -
> > -Buffer Objects
> > ---------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > -   :doc: amdgpu_object
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > -   :internal:
> > -
> > -PRIME Buffer Sharing
> > ---------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > -   :doc: PRIME Buffer Sharing
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > -   :internal:
> > -
> > -MMU Notifier
> > -------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> > -   :doc: MMU Notifier
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> > -   :internal:
> > -
> > -AMDGPU Virtual Memory
> > ----------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > -   :doc: GPUVM
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > -   :internal:
> > -
> > -Interrupt Handling
> > -------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> > -   :doc: Interrupt Handling
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> > -   :internal:
> > -
> > -IP Blocks
> > ----------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/include/amd_shared.h
> > -   :doc: IP Blocks
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/include/amd_shared.h
> > -   :identifiers: amd_ip_block_type amd_ip_funcs
> > -
> > -Display Core
> > -============
> > -
> > -This section covers Display core.
> > -
> > -.. toctree::
> > -
> > -  display/index
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > -   :doc: overview
> > -
> > -AMDGPU XGMI Support
> > -===================
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> > -
> > -AMDGPU RAS Support
> > -==================
> > -
> > -The AMDGPU RAS interfaces are exposed via sysfs (for informational queries) and
> > -debugfs (for error injection).
> > -
> > -RAS debugfs/sysfs Control and Error Injection Interfaces
> > ---------------------------------------------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > -   :doc: AMDGPU RAS debugfs control interface
> > -
> > -RAS Reboot Behavior for Unrecoverable Errors
> > ---------------------------------------------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > -   :doc: AMDGPU RAS Reboot Behavior for Unrecoverable Errors
> > -
> > -RAS Error Count sysfs Interface
> > --------------------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > -   :doc: AMDGPU RAS sysfs Error Count Interface
> > -
> > -RAS EEPROM debugfs Interface
> > -----------------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > -   :doc: AMDGPU RAS debugfs EEPROM table reset interface
> > -
> > -RAS VRAM Bad Pages sysfs Interface
> > -----------------------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > -   :doc: AMDGPU RAS sysfs gpu_vram_bad_pages Interface
> > -
> > -Sample Code
> > ------------
> > -Sample code for testing error injection can be found here:
> > -https://cgit.freedesktop.org/mesa/drm/tree/tests/amdgpu/ras_tests.c
> > -
> > -This is part of the libdrm amdgpu unit tests which cover several areas of the GPU.
> > -There are four sets of tests:
> > -
> > -RAS Basic Test
> > -
> > -The test verifies the RAS feature enabled status and makes sure the necessary sysfs and debugfs files
> > -are present.
> > -
> > -RAS Query Test
> > -
> > -This test checks the RAS availability and enablement status for each supported IP block as well as
> > -the error counts.
> > -
> > -RAS Inject Test
> > -
> > -This test injects errors for each IP.
> > -
> > -RAS Disable Test
> > -
> > -This test tests disabling of RAS features for each IP block.
> > -
> > -
> > -GPU Power/Thermal Controls and Monitoring
> > -=========================================
> > -
> > -This section covers hwmon and power/thermal controls.
> > -
> > -HWMON Interfaces
> > -----------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > -   :doc: hwmon
> > -
> > -GPU sysfs Power State Interfaces
> > ---------------------------------
> > -
> > -GPU power controls are exposed via sysfs files.
> > -
> > -power_dpm_state
> > -~~~~~~~~~~~~~~~
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > -   :doc: power_dpm_state
> > -
> > -power_dpm_force_performance_level
> > -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > -   :doc: power_dpm_force_performance_level
> > -
> > -pp_table
> > -~~~~~~~~
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > -   :doc: pp_table
> > -
> > -pp_od_clk_voltage
> > -~~~~~~~~~~~~~~~~~
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > -   :doc: pp_od_clk_voltage
> > -
> > -pp_dpm_*
> > -~~~~~~~~
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > -   :doc: pp_dpm_sclk pp_dpm_mclk pp_dpm_socclk pp_dpm_fclk pp_dpm_dcefclk pp_dpm_pcie
> > -
> > -pp_power_profile_mode
> > -~~~~~~~~~~~~~~~~~~~~~
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > -   :doc: pp_power_profile_mode
> > -
> > -\*_busy_percent
> > -~~~~~~~~~~~~~~~
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > -   :doc: gpu_busy_percent
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > -   :doc: mem_busy_percent
> > -
> > -gpu_metrics
> > -~~~~~~~~~~~~~~~~~~~~~
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > -   :doc: gpu_metrics
> > -
> > -GPU Product Information
> > -=======================
> > -
> > -Information about the GPU can be obtained on certain cards
> > -via sysfs
> > -
> > -product_name
> > -------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > -   :doc: product_name
> > -
> > -product_number
> > ---------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > -   :doc: product_name
> > -
> > -serial_number
> > --------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > -   :doc: serial_number
> > -
> > -unique_id
> > ----------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > -   :doc: unique_id
> > -
> > -GPU Memory Usage Information
> > -============================
> > -
> > -Various memory accounting can be accessed via sysfs
> > -
> > -mem_info_vram_total
> > --------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > -   :doc: mem_info_vram_total
> > -
> > -mem_info_vram_used
> > -------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > -   :doc: mem_info_vram_used
> > -
> > -mem_info_vis_vram_total
> > ------------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > -   :doc: mem_info_vis_vram_total
> > -
> > -mem_info_vis_vram_used
> > -----------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > -   :doc: mem_info_vis_vram_used
> > -
> > -mem_info_gtt_total
> > -------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> > -   :doc: mem_info_gtt_total
> > -
> > -mem_info_gtt_used
> > ------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> > -   :doc: mem_info_gtt_used
> > -
> > -PCIe Accounting Information
> > -===========================
> > -
> > -pcie_bw
> > --------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > -   :doc: pcie_bw
> > -
> > -pcie_replay_count
> > ------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > -   :doc: pcie_replay_count
> > -
> > -GPU SmartShift Information
> > -==========================
> > -
> > -GPU SmartShift information via sysfs
> > -
> > -smartshift_apu_power
> > ---------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > -   :doc: smartshift_apu_power
> > -
> > -smartshift_dgpu_power
> > ----------------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > -   :doc: smartshift_dgpu_power
> > -
> > -smartshift_bias
> > ----------------
> > -
> > -.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > -   :doc: smartshift_bias
> > -
> > -AMDGPU Glossary
> > -===============
> > -
> >   .. toctree::
> >
> > -   amdgpu-glossary.rst
> > +   module-parameters
> > +   driver-core
> > +   display/index
> > +   xgmi
> > +   ras
> > +   thermal
> > +   driver-misc
> > +   amdgpu-glossary
> > diff --git a/Documentation/gpu/amdgpu/module-parameters.rst b/Documentation/gpu/amdgpu/module-parameters.rst
> > new file mode 100644
> > index 000000000000..ea538c8dda35
> > --- /dev/null
> > +++ b/Documentation/gpu/amdgpu/module-parameters.rst
> > @@ -0,0 +1,7 @@
> > +===================
> > + Module Parameters
> > +===================
> > +
> > +The amdgpu driver supports the following module parameters:
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > diff --git a/Documentation/gpu/amdgpu/ras.rst b/Documentation/gpu/amdgpu/ras.rst
> > new file mode 100644
> > index 000000000000..047f76e395cf
> > --- /dev/null
> > +++ b/Documentation/gpu/amdgpu/ras.rst
> > @@ -0,0 +1,62 @@
> > +====================
> > + AMDGPU RAS Support
> > +====================
> > +
> > +The AMDGPU RAS interfaces are exposed via sysfs (for informational queries) and
> > +debugfs (for error injection).
> > +
> > +RAS debugfs/sysfs Control and Error Injection Interfaces
> > +========================================================
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > +   :doc: AMDGPU RAS debugfs control interface
> > +
> > +RAS Reboot Behavior for Unrecoverable Errors
> > +============================================
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > +   :doc: AMDGPU RAS Reboot Behavior for Unrecoverable Errors
> > +
> > +RAS Error Count sysfs Interface
> > +===============================
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > +   :doc: AMDGPU RAS sysfs Error Count Interface
> > +
> > +RAS EEPROM debugfs Interface
> > +============================
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > +   :doc: AMDGPU RAS debugfs EEPROM table reset interface
> > +
> > +RAS VRAM Bad Pages sysfs Interface
> > +==================================
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > +   :doc: AMDGPU RAS sysfs gpu_vram_bad_pages Interface
> > +
> > +Sample Code
> > +===========
> > +Sample code for testing error injection can be found here:
> > +https://cgit.freedesktop.org/mesa/drm/tree/tests/amdgpu/ras_tests.c
> > +
> > +This is part of the libdrm amdgpu unit tests which cover several areas of the GPU.
> > +There are four sets of tests:
> > +
> > +RAS Basic Test
> > +
> > +The test verifies the RAS feature enabled status and makes sure the necessary sysfs and debugfs files
> > +are present.
> > +
> > +RAS Query Test
> > +
> > +This test checks the RAS availability and enablement status for each supported IP block as well as
> > +the error counts.
> > +
> > +RAS Inject Test
> > +
> > +This test injects errors for each IP.
> > +
> > +RAS Disable Test
> > +
> > +This test tests disabling of RAS features for each IP block.
> > diff --git a/Documentation/gpu/amdgpu/thermal.rst b/Documentation/gpu/amdgpu/thermal.rst
> > new file mode 100644
> > index 000000000000..8aeb0186c9ef
> > --- /dev/null
> > +++ b/Documentation/gpu/amdgpu/thermal.rst
> > @@ -0,0 +1,65 @@
> > +===========================================
> > + GPU Power/Thermal Controls and Monitoring
> > +===========================================
> > +
> > +HWMON Interfaces
> > +================
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +   :doc: hwmon
> > +
> > +GPU sysfs Power State Interfaces
> > +================================
> > +
> > +GPU power controls are exposed via sysfs files.
> > +
> > +power_dpm_state
> > +---------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +   :doc: power_dpm_state
> > +
> > +power_dpm_force_performance_level
> > +---------------------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +   :doc: power_dpm_force_performance_level
> > +
> > +pp_table
> > +--------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +   :doc: pp_table
> > +
> > +pp_od_clk_voltage
> > +-----------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +   :doc: pp_od_clk_voltage
> > +
> > +pp_dpm_*
> > +--------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +   :doc: pp_dpm_sclk pp_dpm_mclk pp_dpm_socclk pp_dpm_fclk pp_dpm_dcefclk pp_dpm_pcie
> > +
> > +pp_power_profile_mode
> > +---------------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +   :doc: pp_power_profile_mode
> > +
> > +\*_busy_percent
> > +---------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +   :doc: gpu_busy_percent
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +   :doc: mem_busy_percent
> > +
> > +gpu_metrics
> > +-----------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +   :doc: gpu_metrics
> > diff --git a/Documentation/gpu/amdgpu/xgmi.rst b/Documentation/gpu/amdgpu/xgmi.rst
> > new file mode 100644
> > index 000000000000..23f2856f4524
> > --- /dev/null
> > +++ b/Documentation/gpu/amdgpu/xgmi.rst
> > @@ -0,0 +1,5 @@
> > +=====================
> > + AMDGPU XGMI Support
> > +=====================
> > +
> > +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> >
>
> lgtm
>
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>
> Thanks.
