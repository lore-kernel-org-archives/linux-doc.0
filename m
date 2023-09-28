Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A0DE732FD
	for <linux-doc@archiver.kernel.org>; Thu, 28 Sep 2023 18:13:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbjI1SNE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Sep 2023 14:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbjI1SND (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Sep 2023 14:13:03 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E3519F
        for <linux-doc@vger.kernel.org>; Thu, 28 Sep 2023 11:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695924781; x=1727460781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1tWAxgFFiMGcAesTfnzGfoWFY+0bGYF/ryx7d9One0Y=;
  b=Aoek08ZbX0bkm5Cgfy+X+wexIkDNer7iQz618LKgduocU7aMOZALVYyA
   E2KC5BnA5uayE3dotG8UWSc2EMpU4H4r/PI+lbDxDH5e1wYKukpvrlM++
   NdFzEBc2tOvrkB3kHPsgBVUJ841bERoVi5uD8kqwCOhN+6cd9+xl1yaru
   UEGvNZukvBpVhqTdzTdFo5Fiko7b1xcttZJTSa1dQ+Uon/rEMZqc4OY7l
   uev0H660d4Lq4hUzmcfUAhgk/9o4k3CfG9z2G9T2ZhQl5BbzpIi5Mpl86
   Y3DBhREN2TwEPGq1nudQKYXxNvK1psVvtWf118kA0S64uTc5glSFarths
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="384950872"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="384950872"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 11:12:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="784801674"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="784801674"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 28 Sep 2023 11:12:20 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qlvUo-0001n5-14;
        Thu, 28 Sep 2023 18:12:18 +0000
Date:   Fri, 29 Sep 2023 02:11:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jeffrey Mouroux <jmouroux@xilinx.com>
Cc:     oe-kbuild-all@lists.linux.dev, git@amd.com,
        Michal Simek <monstr@monstr.eu>,
        Satish Kumar Nagireddy <satishna@xilinx.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 278/1370] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-xbgr30 (if the link has no caption the label must precede a
 section header)
Message-ID: <202309290251.y5eh9ClL-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: a7ba2f9bd3a85fe70c52c0bb4b0e791a540012e7 [278/1370] uapi: media: New fourcc codes needed by Xilinx Video IP
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309290251.y5eh9ClL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290251.y5eh9ClL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xbgr30 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xvuy32 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-avuy32 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-vuy24 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xvuy10 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xv20 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xv15 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xv20m (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xv15m (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
