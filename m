Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9020C43334
	for <linux-doc@archiver.kernel.org>; Mon,  4 Jul 2022 04:46:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiGDEqB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 Jul 2022 00:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiGDEqA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Jul 2022 00:46:00 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF10363BC
        for <linux-doc@vger.kernel.org>; Sun,  3 Jul 2022 21:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656909959; x=1688445959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Ov2bz1oM/y2rUrclJKAmC/wO3avL5+WENiHwk4PWtU=;
  b=DudhQSlyE93OhKmHoUDWpe4ZNUfjqbh2RXtk8b/WOXlN3SYcMvW6L33a
   sh2ABfwwJvf2DRyqlnMTAIKjwYnn6qMUL8pBFw78e5VzT4J2LLeS4tuXX
   33T3Keuw11gMjj1MoViR1dDLFS/JrsAXcqajSM8mLgWAdnKmQwL3aNUy/
   /QDWZBW2vZSBQ6qixSofMyPKewQB4wvMiL5GEKw5Tz0dflF92F+wNG5PN
   LGhK7e6gGEQ9yunva0yJDPf1isiF91frAUnLvT4uOLrmd1aGXBJ7j1q/1
   AsZxcJoQMIjNU9iCi3hW06PTtevvpHRbGpllbhygzHrZNgkBO2lXpWMqM
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="308564619"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="308564619"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2022 21:45:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="919175616"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Jul 2022 21:45:58 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o8Dy9-000HVH-Is;
        Mon, 04 Jul 2022 04:45:57 +0000
Date:   Mon, 4 Jul 2022 12:45:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Rohit Visavalia <rohit.visavalia@xilinx.com>
Cc:     kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
        Michal Simek <monstr@monstr.eu>,
        Vishal Sagar <vishal.sagar@xilinx.com>,
        linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:master 356/605] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-x403 (if the link has no caption the label must precede a
 section header)
Message-ID: <202207041237.hvQzwM9U-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx master
head:   a739ad1c8da292adc265c7043f7028a1002c3fd1
commit: 0cc5e27906b914f5c42935e6cd99e2249f403840 [356/605] media: v4l: Support 3 planar YUV 444 10bpc pixel format in contiguous memory
reproduce: make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x403 (if the link has no caption the label must precede a section header)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
