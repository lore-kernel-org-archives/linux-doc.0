Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF14BC05027
	for <linux-doc@archiver.kernel.org>; Sat, 21 Jan 2023 01:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjAUBhm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Jan 2023 20:37:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjAUBhl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Jan 2023 20:37:41 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E9151428
        for <linux-doc@vger.kernel.org>; Fri, 20 Jan 2023 17:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674265060; x=1705801060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7J6PTzudqg7wBuBvyxU2FxVSRCociPR/AF9fyR8o6G8=;
  b=JGgoQ863GJda1qtMElUor5Z/leEha1HAlHS0CUZg5edmrOjZ+bIkK9zf
   6Dtwq0IC4LgzuAXqmm4DfWPUl+6LW8exQtu22zrAEZhlfZEaENd0pnQnV
   Dgts1fvhD13VIa/IZezgS/xbLu3V26m8mWkJQPHp61dgBCBmawGllFXxZ
   VPtjhn8BgtC4u2tRQ0tHSVWyS2g+MKBPVSx5ed9jrOtIx3/gajMJl2i0w
   5Fyplb9KB7BbUmjWoVjnPKOjL6a0btso9w/5Ihdv2zIAEn9l96t+KflHz
   939nZ2tyEwyLnx0r/OLpNj2DM7sO+M056hFLi4MzfX5R0FMLn9R6dk4S5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="327016380"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="327016380"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 17:37:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="989594953"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="989594953"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jan 2023 17:37:38 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pJ2p8-0003EE-0w;
        Sat, 21 Jan 2023 01:37:38 +0000
Date:   Sat, 21 Jan 2023 09:37:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mao Jinlong <quic_jinlmao@quicinc.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-doc@vger.kernel.org
Subject: [coresight:next 28/28] htmldocs:
 Documentation/trace/coresight/coresight-tpda.rst:3: WARNING: Title overline
 too short.
Message-ID: <202301210955.zYxDrLgv-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git next
head:   758d638667d474ff6b0a9052a8298f04c7ddf62f
commit: 758d638667d474ff6b0a9052a8298f04c7ddf62f [28/28] Documentation: trace: Add documentation for TPDM and TPDA
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git/commit/?id=758d638667d474ff6b0a9052a8298f04c7ddf62f
        git remote add coresight https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git
        git fetch --no-tags coresight next
        git checkout 758d638667d474ff6b0a9052a8298f04c7ddf62f
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/trace/coresight/coresight-tpda.rst:3: WARNING: Title overline too short.
>> Documentation/trace/coresight/coresight-tpdm.rst:3: WARNING: Title overline too short.
>> Documentation/trace/coresight/coresight-tpdm.rst:43: WARNING: Document may not end with a transition.

vim +3 Documentation/trace/coresight/coresight-tpda.rst

     2	
   > 3	==============================
     4	The trace performance monitoring and diagnostics aggregator(TPDA).
     5	==============================
     6	
     7	    :Author:   Jinlong Mao <quic_jinlmao@quicinc.com>
     8	    :Date:     January 2023
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
