Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB9DE71D2A
	for <linux-doc@archiver.kernel.org>; Fri, 29 Sep 2023 13:00:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbjI2NAS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Sep 2023 09:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233105AbjI2NAQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Sep 2023 09:00:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E9B1B1
        for <linux-doc@vger.kernel.org>; Fri, 29 Sep 2023 06:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695992413; x=1727528413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1nKjcckU2/fUNIse7MyXfxQgTHsvL2qGDBAzXLJDEjc=;
  b=Vpvy2n72U7uZRUt59LNeAPIxghktdNuPH5zOE0L7QLk+BwxWf9e76j9E
   lXkpRM6tc9sn9CU8skv98lecxgMRmXxfZO02kcZaNWQe4A/1NynxtjAsN
   Ch6miDoT3f7sacBsDVnRMr66nnr+kEo+D43D7udVMtkIZRJ5QqGDB0VBd
   oLbmav7ApM5aAEAqfvyJDM5eKEwU+yfaf6BpVCfciqYT7j0YqxzylBATL
   crpPfQ2PfmPYlinPzhovZtbzj1CwrRkfwT3SEnvEM+txhCFCCQDyeqWzV
   NKSYQJgW8giNcfmcsgiON2FtycSKXyeh93Arb94Xg8tBusQ47pBn2ISBa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="361670551"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="361670551"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 05:59:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="785082594"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="785082594"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Sep 2023 05:59:06 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qmD5E-0002rt-2T;
        Fri, 29 Sep 2023 12:59:04 +0000
Date:   Fri, 29 Sep 2023 20:58:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Rohit Visavalia <rohit.visavalia@xilinx.com>
Cc:     oe-kbuild-all@lists.linux.dev, git@amd.com,
        Michal Simek <monstr@monstr.eu>,
        Vishal Sagar <vishal.sagar@xilinx.com>,
        linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 306/1370] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-x403 (if the link has no caption the label must precede a
 section header)
Message-ID: <202309292034.zKKGoqzo-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 00ea8c0b88977daedb8118d93fbba1d1f48e9350 [306/1370] media: v4l: Support 3 planar YUV 444 10bpc pixel format in contiguous memory
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309292034.zKKGoqzo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309292034.zKKGoqzo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x403 (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
