Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2A9CE79A9
	for <linux-doc@archiver.kernel.org>; Tue, 19 Sep 2023 23:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233554AbjISXlk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Sep 2023 19:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233527AbjISXlj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Sep 2023 19:41:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 081A69D
        for <linux-doc@vger.kernel.org>; Tue, 19 Sep 2023 16:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695166894; x=1726702894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zNBWr9foiNfXhebnoHHh6GT05WQjH4UOl5viBJ9NIic=;
  b=PwaHur22Efp8TeBloOy3KpGu4RP2zxzuiLTtWLqr+v5mhPfpTKKU76fX
   PEg86tnk2UGiPKDrJnZEjcELSEOsoC5aAjS+ehunf+vdkSI2O7krQtYFH
   kiPiH0mjS08I0wNtiSQropqy/MWdH9hpVpF9HnJdi4781v9Gcn3snIzCT
   X3td0lsAqleK2imp4gSNR6McxO5diX2lPIQ3vvKHPYdy2zLQRU3Xa9bhw
   LEKOD6u7fA+Nvfms/S8K/R7a2wwBcVECCJgBDLkEqlOZhjywJwsrUhKMs
   reGBVfdqbuHYZ4Se7e4hNaQj9bMr8djh9QhsrvsAraP4igK43EIa4bli5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="359467956"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="359467956"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="749668991"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="749668991"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 19 Sep 2023 16:41:32 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qikLS-00084S-1i;
        Tue, 19 Sep 2023 23:41:30 +0000
Date:   Wed, 20 Sep 2023 07:41:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Isaku Yamahata <isaku.yamahata@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [intel-tdx:kvm-upstream-next 213/323] htmldocs:
 Documentation/ABI/testing/sysfs-firmware-tdx:2: WARNING: Unexpected
 indentation.
Message-ID: <202309200746.BuqC05iz-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   f879e04c0619fde5c8eecb51a64da52a5ad4908e
commit: 3ace9076b7188b245eaad0691ea5d8efcbcaae9a [213/323] x86/virt/tdx: Export TD config params of TDX module via sysfs
reproduce: (https://download.01.org/0day-ci/archive/20230920/202309200746.BuqC05iz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200746.BuqC05iz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-firmware-tdx:2: WARNING: Unexpected indentation.

vim +2 Documentation/ABI/testing/sysfs-firmware-tdx

   > 2	Date:           March 2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
