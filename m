Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF222C61DA4
	for <linux-doc@archiver.kernel.org>; Thu,  9 Mar 2023 06:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbjCIGpW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Mar 2023 01:45:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjCIGpV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Mar 2023 01:45:21 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A3562847
        for <linux-doc@vger.kernel.org>; Wed,  8 Mar 2023 22:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678344320; x=1709880320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cs3vNazsszbTUlWEUkC6mluH9xTzAryK1Hv6ySX6Awc=;
  b=i1lnEcwvxvhhj3oTZ2MKgRsyJ0i0DDL1xr4kc6JLEBk83Xm06aykXPVX
   QI//vZT9MUxVxs5OTimyqhJztIgImnB6kfs+BLCqZ2Z6OdyPw8M1QEP7c
   lqStooaHCILhQffDsjpKZCFx08EmizogqJNnwFHcR2/0Z0QLutINxeBEk
   FHrgmbjiwM+p91k/DAzaRadcP5k2EgE1Bov6naJmT9vyKJ1puD9043UGr
   dG6weDA5RIQAgzfnxnoleMK3qxKLNImM6BEemp6KGx3GRysrTcnFoE08v
   sJIGTH+MjT9nSBTLNDJNvBmys4Ys0UhYbv8Nk8eD3/uXiROlpO0Tma7VX
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316026712"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="316026712"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 22:45:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="741433490"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="741433490"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Mar 2023 22:45:13 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1paA1Y-0002ij-28;
        Thu, 09 Mar 2023 06:45:12 +0000
Date:   Thu, 9 Mar 2023 14:44:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [intel-tdx:guest-filter-upstream 5/31] htmldocs:
 Documentation/driver-api/device-authorize.rst:30: WARNING: Missing matching
 underline for section title overline.
Message-ID: <202303091408.0yK4MVg7-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   6bcd8bef8871c6a80cb55b1cbb2651111da10890
commit: d0c26c6546ae5c1271597dc8fa1633456881afab [5/31] driver core: Add support to parse device authorize firmware
reproduce:
        # https://github.com/intel/tdx/commit/d0c26c6546ae5c1271597dc8fa1633456881afab
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout d0c26c6546ae5c1271597dc8fa1633456881afab
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091408.0yK4MVg7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/driver-api/device-authorize.rst:30: WARNING: Missing matching underline for section title overline.

vim +30 Documentation/driver-api/device-authorize.rst

    29	
  > 30	----------------------------------------------------
    31	|             struct da_firmware_hdr               |
    32	|                (type=0, count=2)                 |
    33	----------------------------------------------------
    34	|             struct da_bus_hdr                    |
    35	|              (bus="pci", count=2)                |
    36	----------------------------------------------------
    37	|             struct da_pci_devce_id               |
    38	|                                                  |
    39	----------------------------------------------------
    40	|             struct da_pci_device_id              |
    41	|                                                  |
    42	----------------------------------------------------
    43	|             struct da_bus_hdr                    |
    44	|              (bus="platform", count=2)           |
    45	----------------------------------------------------
    46	|             struct da_bus_device_id              |
    47	|                                                  |
    48	----------------------------------------------------
    49	|             struct da_bus_device_id              |
    50	|                                                  |
    51	----------------------------------------------------
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
