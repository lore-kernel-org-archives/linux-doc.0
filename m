Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D922E75428
	for <linux-doc@archiver.kernel.org>; Tue,  3 Oct 2023 07:00:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239443AbjJCHA4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Oct 2023 03:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239323AbjJCHAq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Oct 2023 03:00:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9A43AAE
        for <linux-doc@vger.kernel.org>; Mon,  2 Oct 2023 23:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696316364; x=1727852364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HN4xSqNS0cx+dE5Q1u8rBM3waf4jA83+rCeWiG8Javs=;
  b=eyj4+WH1h/Rjr6BJw8DDG9EuSfYNopzrF646NwZqa8OQRHhVuPtIjB6G
   2q2dlw7YRAWNZt+TRF7txB6qcd1c84HDBXrZazdd2kk9Jmr3+V+TI5ftx
   qdspxSQD4gO8TULWLNb+6giLmtik5vR36/9Pl3SDVxcnPENxnBd5NzaOu
   GyqMcCnCohZ7JHEeWcO2YorlB3Y7Er5XhOLllq4Cs30QWPHkjEzqlzgnQ
   GJVNfMaLrn0Kyjvi/ZDMK+pYCiM8fDZKjOD/Rv5Fy/6qp5OhcHIfyM7An
   qO3bEEFqGyM1yKPVJ2AUoS9GOA22RXA08AvwfSEaZhYMla2bT20S1fgE1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367858745"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="367858745"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 23:56:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="841231870"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="841231870"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Oct 2023 23:56:47 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qnZKm-0006rB-1i;
        Tue, 03 Oct 2023 06:56:44 +0000
Date:   Tue, 3 Oct 2023 14:56:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dylan Yip <dylan.yip@xilinx.com>
Cc:     oe-kbuild-all@lists.linux.dev, git@amd.com,
        Michal Simek <monstr@monstr.eu>,
        Hyun Kwon <hyun.kwon@xilinx.com>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 327/1370] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-ctrl-type-hdr (if the link has no caption the label must precede a
 section header)
Message-ID: <202310031449.v2qCCrkV-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 069efbe2c5d8a75c562c2704167eb09ffe785d32 [327/1370] media: videodev2.h: Add control type for HDR
reproduce: (https://download.01.org/0day-ci/archive/20231003/202310031449.v2qCCrkV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310031449.v2qCCrkV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ctrl-type-hdr (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
