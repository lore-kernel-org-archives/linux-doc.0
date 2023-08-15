Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2248DC001B0
	for <linux-doc@archiver.kernel.org>; Tue, 15 Aug 2023 01:23:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbjHOBXM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Aug 2023 21:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233905AbjHOBXC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Aug 2023 21:23:02 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7FB1715
        for <linux-doc@vger.kernel.org>; Mon, 14 Aug 2023 18:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692062581; x=1723598581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=REaBBHhkgXG/mtEL5hEC9exD3qT9WXKU6/2HfxMAcFM=;
  b=UH+3FD5tMzNh3T3thxYRIUY5B/Vi/i5jj1yiHQFaq6SHcUqlEpxV7Uzw
   YGikNvTfDSJW3dm8a3dWycwQaoDkxWQ4Vh3Cc7/QA3nXRgqUGmmHyTm+V
   yA5pNLW88Lc4EKM7zjleJilrDNH8ujtQuZqivehUjgtrSYfp9g9e9Kduz
   f4NxvhZzRcuCWj2QemAUf0T35iCgDIB8jMb1L3nKhk/gymzjgULMhPu5Y
   UoxSidfwqAW0flv0pjgDgNuecfwhluW+a70txCs4tFHAfe+xPjZLlpuOV
   vVqQAnpKCqzk1J1O0LUFLMvG9awG48A89NFVrvsI1i6LB3/0XwEAzabFv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="369648970"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="369648970"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 18:23:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="710549074"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="710549074"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Aug 2023 18:22:59 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qVilu-0000Yx-27;
        Tue, 15 Aug 2023 01:22:58 +0000
Date:   Tue, 15 Aug 2023 09:22:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Yunsheng Lin <linyunsheng@huawei.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [linyunsheng:net-next-pp_frag_v6-0813 9/10] htmldocs:
 Documentation/networking/page_pool:59:
 ./include/net/page_pool/helpers.h:119: WARNING: Inline strong start-string
 without end-string.
Message-ID: <202308150949.hadiQeCS-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/gestionlin/linux.git net-next-pp_frag_v6-0813
head:   128629caa623079399595594b3034d162c68487d
commit: 46a32d32ec6ffbe80f9c4d41ed9e4e0938eadeed [9/10] page_pool: update document about frag API
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150949.hadiQeCS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150949.hadiQeCS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/networking/page_pool:59: ./include/net/page_pool/helpers.h:119: WARNING: Inline strong start-string without end-string.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
