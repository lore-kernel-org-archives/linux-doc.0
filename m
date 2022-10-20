Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1483C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 17:57:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbiJTR5H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 13:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiJTR5G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 13:57:06 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1AD5199F45
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 10:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666288624; x=1697824624;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m2r7COfPD+GRyevUno5IMG60hpKoNPIlXxjgIIBcKUs=;
  b=XhSw9ocVXJwls/nJHlZyG2zkoSt6L1HQJdUIUtKFoxuoorFDhQs5T1Qm
   FtTp9PhwadAA/o2JswS38feEoJDtcSGtbZAnKq2fYZ5UoceZTnm6CK/GN
   8pBPrdXVKIfw57YVjfclN3t05vXZBgkpg8T3ySbB56J/73C36ThjHI0BG
   0XhSC+yhV2rfYC2bCf3Q/cLvpwMegHOaEVObfjTqI9FMk7JhXE+m5EC9+
   7/KkvSRT7lT4KkyQ3z9vp2Z7viRYSNj99YJUFSqf3S3hzJq8mivJy0MBE
   lyzwG3vIUjOU7EG/zEU8f6t8mkmC6OrV45bpG2ziaFx9Yvlwo/9daxe6G
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="286510758"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="286510758"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 10:57:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="772516693"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="772516693"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 10:57:00 -0700
From:   Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
To:     Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Olof Johansson <olof@lixom.net>
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Subject: [PATCH v5 00/10] Driver of Intel(R) Gaussian & Neural Accelerator
Date:   Thu, 20 Oct 2022 19:53:24 +0200
Message-Id: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Dear kernel maintainers,

This submission is a kernel driver to support Intel(R) Gaussian & Neural
Accelerator (Intel(R) GNA). Intel(R) GNA is a PCI-based neural co-processor
available on multiple Intel platforms. AI developers and users can offload
continuous inference workloads to an Intel(R) GNA device in order to free
processor resources and save power. Noise reduction and speech recognition
are the examples of the workloads Intel(R) GNA deals with while its usage
is not limited to the two.

For a list of processors equipped with Intel(R) GNA device, please refer to
this link:
https://docs.openvinotoolkit.org/latest/openvino_docs_IE_DG_supported_plugins_GNA.html

We think contributing this driver to the upstream kernel project is the
best way for developers and users to get the latest Intel(R) GNA support in
a Linux kernel, through the mainline to any Linux distributions installed
on their systems. Upstreaming also enables contribution from developers
around the world to the driver once it is merged.

The driver works with Intel(R) libraries in user space. The Intel(R) driver
exposes a few IOCTL interfaces for use by libraries in user space. The
libraries are open sourced and are available at:
https://github.com/intel/gna

---

Changelogs:

 v1->v2:
 - driver's new layout:
   - driver name: gna -> intel_gna
   - module name: gna -> intel_gna
   - device file name: /dev/gnaN -> /dev/intel_gnaN
   - driver's source directory: drivers/misc/gna/ -> drivers/misc/intel/gna/
   - UAPI: include/uapi/misc/gna.h -> include/uapi/misc/intel/gna.h
   - DOC: Documentation/misc-devices/gna.rst ->
       Documentation/misc-devices/intel/gna.rst
 - 'MISC' device framework used
 - fixes throughout GNA device's PCI management
 - header files' includes and forward declarations cleanup
 - ISR made static
 - unused comments cleanup
 - "_priv_" segment removed from function names
 - tested: v5.11-rc3 -> v5.11
 - number of other/minor fixes

 v2->v3:
 - PCI glue driver part split.
 - GNA probe fail path made fully implicit.
 - 'recovery_timeout' module parameter present under 'CONFIG_DEBUG_INTEL_GNA' flag only.
 - build for X86_32 enabled.
 - module initialization through 'module_pci_driver()'.
 - gna_priv->file_list cleanup.
 - 'gna_' prefix removed from source files' names.
 - power management handling added.
 - number of other/minor fixes
 - tests performed on kernel v5.12

 v3->v4:
 - GNA driver adapted to DRM framework (+userspace GNA library adapted to use the driver)
   - drm_managed (drmm) feature is used for objects lifetime management
   - GNA memory objects use ~drm_gem_shmem_object~ objects as a base
 - patches reorganized to meet symbols' usage with their declarations/definitions
 - 'recovery_timeout' module parameter removed
 - number of other/minor fixes from v3 review
 - tests performed on kernel v6.0

 v4->v5:
 - indentation fixed in drivers/gpu/drm/gna/Kconfig

Maciej Kwapulinski (4):
  gna: add PCI driver module
  gna: add GNA DRM device
  gna: add GNA_GEM_NEW and GNA_GEM_FREE ioctls
  gna: add power management

Tomasz Jankowski (6):
  gna: read hardware info
  gna: initialize MMU
  gna: add GNA_GET_PARAMETER ioctl
  gna: add GNA_COMPUTE ioctl
  gna: add GNA_WAIT ioctl
  gna: add open and close operations on GNA device

 Documentation/gpu/drivers.rst     |   1 +
 Documentation/gpu/gna.rst         |  64 +++++
 MAINTAINERS                       |   7 +
 drivers/gpu/drm/Kconfig           |   2 +
 drivers/gpu/drm/Makefile          |   1 +
 drivers/gpu/drm/gna/Kbuild        |   5 +
 drivers/gpu/drm/gna/Kconfig       |  15 +
 drivers/gpu/drm/gna/gna_device.c  | 317 +++++++++++++++++++++
 drivers/gpu/drm/gna/gna_device.h  | 114 ++++++++
 drivers/gpu/drm/gna/gna_gem.h     |  22 ++
 drivers/gpu/drm/gna/gna_hw.c      | 110 ++++++++
 drivers/gpu/drm/gna/gna_hw.h      | 107 ++++++++
 drivers/gpu/drm/gna/gna_ioctl.c   | 208 ++++++++++++++
 drivers/gpu/drm/gna/gna_mem.c     | 249 +++++++++++++++++
 drivers/gpu/drm/gna/gna_mem.h     |  58 ++++
 drivers/gpu/drm/gna/gna_pci.c     | 148 ++++++++++
 drivers/gpu/drm/gna/gna_pci.h     |  12 +
 drivers/gpu/drm/gna/gna_request.c | 441 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/gna/gna_request.h |  64 +++++
 drivers/gpu/drm/gna/gna_score.c   | 222 +++++++++++++++
 drivers/gpu/drm/gna/gna_score.h   |  11 +
 include/uapi/drm/gna_drm.h        | 169 ++++++++++++
 22 files changed, 2347 insertions(+)
 create mode 100644 Documentation/gpu/gna.rst
 create mode 100644 drivers/gpu/drm/gna/Kbuild
 create mode 100644 drivers/gpu/drm/gna/Kconfig
 create mode 100644 drivers/gpu/drm/gna/gna_device.c
 create mode 100644 drivers/gpu/drm/gna/gna_device.h
 create mode 100644 drivers/gpu/drm/gna/gna_gem.h
 create mode 100644 drivers/gpu/drm/gna/gna_hw.c
 create mode 100644 drivers/gpu/drm/gna/gna_hw.h
 create mode 100644 drivers/gpu/drm/gna/gna_ioctl.c
 create mode 100644 drivers/gpu/drm/gna/gna_mem.c
 create mode 100644 drivers/gpu/drm/gna/gna_mem.h
 create mode 100644 drivers/gpu/drm/gna/gna_pci.c
 create mode 100644 drivers/gpu/drm/gna/gna_pci.h
 create mode 100644 drivers/gpu/drm/gna/gna_request.c
 create mode 100644 drivers/gpu/drm/gna/gna_request.h
 create mode 100644 drivers/gpu/drm/gna/gna_score.c
 create mode 100644 drivers/gpu/drm/gna/gna_score.h
 create mode 100644 include/uapi/drm/gna_drm.h

-- 
2.25.1

