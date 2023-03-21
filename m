Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF63C6FD1D
	for <linux-doc@archiver.kernel.org>; Tue, 21 Mar 2023 17:42:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbjCURmv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Mar 2023 13:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbjCURmt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Mar 2023 13:42:49 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0509C252BF
        for <linux-doc@vger.kernel.org>; Tue, 21 Mar 2023 10:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679420566; x=1710956566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gi7aFEpzlosOKusmrmkkhq7J9cvv+LEhNzbbQpQ9OlI=;
  b=EH6eWYs6nB2tcJj3DyZTXVyrX/fGVnqZyein3Djt4cfkYGxzOSfA2K+n
   ZzA20QvzeYf6jX4lOshPwkgJVN9GuwYMDMkZUiDIrmAsckebOP1qtKZUV
   JidfSD95yyNbqu4F3Pa8jEEIqhT5S9Z9hFwylcQIVD4Kz4i+Uq1C3cRim
   M33D4DdhhjkK1U5sX9qp58jbd1bIzL/AtNBg2xe0LLHXkpN6IpdFNruiM
   YhcMNco2XYasT1J7/Xk+yoWu/bOfPKo1CVHaEuQ93f4XJL61dFVYcB/12
   eBoyH7HohZI8vK7XU8QMFRNQzOMxq67QeThsCFz/gMoAymQTMA+XkzJZn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366750107"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="366750107"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 10:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792192848"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="792192848"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2023 10:42:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1peg0Q-000CDR-1Y;
        Tue, 21 Mar 2023 17:42:42 +0000
Date:   Wed, 22 Mar 2023 01:42:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc:     oe-kbuild-all@lists.linux.dev, Rob Clark <robdclark@chromium.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-doc@vger.kernel.org
Subject: [drm-msm:msm-next-external-fixes 1/7] htmldocs:
 Documentation/gpu/automated_testing.rst: WARNING: document isn't included in
 any toctree
Message-ID: <202303220144.u436oUpr-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next-external-fixes
head:   c19e7f34333932c31586d745ff6b55020cc50ce7
commit: 3fb933e2de673deb97a53287612d7afdb1980465 [1/7] drm: Add initial ci/ subdirectory
reproduce:
        git remote add drm-msm https://gitlab.freedesktop.org/drm/msm.git
        git fetch --no-tags drm-msm msm-next-external-fixes
        git checkout 3fb933e2de673deb97a53287612d7afdb1980465
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220144.u436oUpr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/automated_testing.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
