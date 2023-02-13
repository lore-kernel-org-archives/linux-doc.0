Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD10C636CC
	for <linux-doc@archiver.kernel.org>; Mon, 13 Feb 2023 17:13:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbjBMRNb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Feb 2023 12:13:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbjBMRNa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Feb 2023 12:13:30 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95AB61C5B4
        for <linux-doc@vger.kernel.org>; Mon, 13 Feb 2023 09:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676308409; x=1707844409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aOO10J6xTaBNmX6fAfXz+Prk9hzfMzoBr6mgZ1kDj58=;
  b=eRS0+z5q59odmO4RWfthyoO9Z/j6eBWYdP5duCF0jrcHcG2drzXUe7Hs
   SNLqEvfaUMf7+KR85RDxGnAFT99lKTv27Ilhg+aIX8aE+lG/K2eJpJlQx
   vm87DjMTHRi4uTYNueWISPF4QCeADQ+4iw/FS+lt4QLGKQlXeeWLDH38M
   KAV7XbWlI2I3wUAKVW65CncB/fiW5s7FAAlYnYPB26X2O9KD68utQAi2n
   +JMxf7IVQuFOxP/fg05DZnZuLYlNImyV6/bNX916PJBr+Oz8VhkuoqEvx
   /IMvDt5idh/TLPh7I3NKvGXdJh4G4pZQmgKJb5apGPIv0nSf0wC9j/C/V
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="358349176"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="358349176"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 09:13:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="699228324"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="699228324"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Feb 2023 09:13:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pRcOM-0007td-2x;
        Mon, 13 Feb 2023 17:13:26 +0000
Date:   Tue, 14 Feb 2023 01:12:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Rohit Visavalia <rohit.visavalia@xilinx.com>
Cc:     oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>,
        Vishal Sagar <vishal.sagar@xilinx.com>,
        linux-doc@vger.kernel.org
Subject: [pinchartl-media:muxed/2022.2/base 356/740] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-x403 (if the link has no caption the label must precede a
 section header)
Message-ID: <202302140118.EgMYWphI-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Rohit,

FYI, the error/warning still remains.

tree:   git://linuxtv.org/pinchartl/media.git muxed/2022.2/base
head:   e26621179c3b1834a1bb17e9a38e47238ac63bf5
commit: 0cc5e27906b914f5c42935e6cd99e2249f403840 [356/740] media: v4l: Support 3 planar YUV 444 10bpc pixel format in contiguous memory
reproduce:
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2022.2/base
        git checkout 0cc5e27906b914f5c42935e6cd99e2249f403840
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302140118.EgMYWphI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x403 (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
