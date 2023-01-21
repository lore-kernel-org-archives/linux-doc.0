Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB9FC004D4
	for <linux-doc@archiver.kernel.org>; Sat, 21 Jan 2023 17:41:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjAURll (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 21 Jan 2023 12:41:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjAURll (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 21 Jan 2023 12:41:41 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869B4CDCE
        for <linux-doc@vger.kernel.org>; Sat, 21 Jan 2023 09:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674322900; x=1705858900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bZbzLBRSYHALctzAHZ0CNb5mY62MyzVCgbG2fg+bYig=;
  b=P6hRTfOCCWBfqv3hcCDUaPbDfdm8OlW6c23+8E7LCj5z7Z4u5mg5MDx+
   dFOoqSD10j2qq+jyLVXR+cbwS2rSYeNTx84LqU9bcLzr74Hli6s/90Ch3
   2EmbTB6E3BUwMIFQZJqvU4rqsmKnc44+wiyZSujZbaUqtI2FS+Zv7mIZF
   GdwRslv74epszinZueCuQNw9DgsrDN6hsMOCQ8oRmhYZm19/cGVGv1NKs
   4ueFQiPtQel2736hb8QtcLG9bFl1w4aVOhQ+CkeCplR7E0/hXsgnCipDX
   l+PRCM+f1Mbe83UNzZktmI1e56h37qiDh+pmoeNoE3bo8y4JZhPDjFCfK
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="388167994"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="388167994"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 09:41:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="729472795"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="729472795"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jan 2023 09:41:38 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pJHs1-0004KA-0n;
        Sat, 21 Jan 2023 17:41:37 +0000
Date:   Sun, 22 Jan 2023 01:41:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Gustavo Sousa <gustavo.sousa@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        linux-doc@vger.kernel.org
Subject: [drm-intel:drm-intel-gt-next 1/2] htmldocs:
 Documentation/gpu/i915:64: ./drivers/gpu/drm/i915/gt/intel_workarounds.c:32:
 WARNING: Inline emphasis start-string without end-string.
Message-ID: <202301220116.qlw4dHOC-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   git://anongit.freedesktop.org/drm-intel drm-intel-gt-next
head:   8d7eb8ed3f83f248e01a4f548d9c500a950a2c2d
commit: 0c3064cf33fbfa8a25871d847e715f33b64f323e [1/2] drm/i915/doc: Document where to implement register workarounds
reproduce:
        git remote add drm-intel git://anongit.freedesktop.org/drm-intel
        git fetch --no-tags drm-intel drm-intel-gt-next
        git checkout 0c3064cf33fbfa8a25871d847e715f33b64f323e
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/gpu/i915:64: ./drivers/gpu/drm/i915/gt/intel_workarounds.c:32: WARNING: Inline emphasis start-string without end-string.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
