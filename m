Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12E9E776CB
	for <linux-doc@archiver.kernel.org>; Mon,  2 Oct 2023 23:41:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbjJBXlD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Oct 2023 19:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjJBXlC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Oct 2023 19:41:02 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A309B4
        for <linux-doc@vger.kernel.org>; Mon,  2 Oct 2023 16:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696290059; x=1727826059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qsV9GtVBdDCEmOZhGtOho6NKO6Blp+2mG0jTENzL2ZI=;
  b=JHus1exoSqJ8RKd1HasphxbFSpYUhiaV6sYsztZ6R2kgdZX6tX8kiK7u
   kXZPjR2IH5q+sqJUQUfk7EF1XX7bZk+gS1VgdGJEFCNwab4+9NqQcuFye
   yVWokznJgJsVyHCUeSPs75p1tZQ+h5TyUs963IgDShokwvTd/r6DNOlAN
   T8O0RRpl0FKjcefQUnWqiqOoeL2qnbFeHp6ek6fNj40y2SGkDelzz6iEp
   A+lDuzHFbB5I1nUyxY8uRCmqqU78rETJOCM/0fBLQurI7gFrq90Vm+2MN
   e4keCBGjWBgUfEZlfL31uiMemGcOd3/19oKNLlQtWIUvbLB3seaPyUVCl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="469036463"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="469036463"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 16:40:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="1669129"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Oct 2023 16:40:17 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qnSX0-0006WL-2z;
        Mon, 02 Oct 2023 23:40:54 +0000
Date:   Tue, 3 Oct 2023 07:40:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Satish Kumar Nagireddy <satish.nagireddy.nagireddy@xilinx.com>
Cc:     oe-kbuild-all@lists.linux.dev, git@amd.com,
        Michal Simek <monstr@monstr.eu>,
        Hyun Kwon <hyun.kwon@xilinx.com>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 324/1370] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-x412 (if the link has no caption the label must precede a
 section header)
Message-ID: <202310030701.UDDAgW9b-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: ef3a83b17afa47841de0c22696a1da2c8def1ac3 [324/1370] media: v4l2-ioctl: Add YUV444 12bit and 16bit pixel formats
reproduce: (https://download.01.org/0day-ci/archive/20231003/202310030701.UDDAgW9b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310030701.UDDAgW9b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x412 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x416 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x412m (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x416m (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
