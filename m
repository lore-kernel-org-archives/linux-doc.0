Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FECE7734F
	for <linux-doc@archiver.kernel.org>; Sat, 30 Sep 2023 03:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233927AbjI3DYe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Sep 2023 23:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233069AbjI3DYd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Sep 2023 23:24:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3016B4
        for <linux-doc@vger.kernel.org>; Fri, 29 Sep 2023 20:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696044271; x=1727580271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W8HHYvT332j4l89t1ZkSX8h5kBDnzMGsRynZ+NRII9s=;
  b=DApJ8vtjfY6cHwsOIGko2bHkDeYG7g1Q3zjz8xZSg0Sx/8pxVsoxF78G
   6myS3tOgqyZMGwP2mVUaeiaxgrFsRg4Cq1JczdjdE+a2Sb9ybVElKFwWs
   d3p1JkGRq95IhHd0qpJlSEHHQqeEoYrrdxrAw9pAkAXYyiV0qsu/9prRh
   6MzJuTgw1Sn16Q1SKbfhSNdWZX1ILYxGsfxM2TiNy0MzUpqu3rfwSGyOU
   gkDNBME4/TDFL+hjndKBl2Cyd8auIS6jZSUqOxZyE/pbvX/b2uf6Ecnvt
   h0U0LjVFgcOlQkJ30K493142sOlb7tM7/LhAlGgVGLEZGutGwNgDn95Ll
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="3993163"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="3993163"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 20:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="815778210"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="815778210"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Sep 2023 20:24:28 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qmQag-0003e4-0z;
        Sat, 30 Sep 2023 03:24:26 +0000
Date:   Sat, 30 Sep 2023 11:23:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Vishal Sagar <vishal.sagar@xilinx.com>
Cc:     oe-kbuild-all@lists.linux.dev, git@amd.com,
        Michal Simek <monstr@monstr.eu>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Satish Kumar Nagireddy <satish.nagireddy.nagireddy@xilinx.com>,
        linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 321/1370] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-xbgr40 (if the link has no caption the label must precede a
 section header)
Message-ID: <202309301129.rHZssS56-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: fb23910633505804236adb15bdcc2eecbca8d08a [321/1370] media: v4l2-ioctl: Add 12 and 16 bpc RGB pixel formats
reproduce: (https://download.01.org/0day-ci/archive/20230930/202309301129.rHZssS56-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301129.rHZssS56-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xbgr40 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-bgr48 (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
