Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A14ECAAD4
	for <linux-doc@archiver.kernel.org>; Sat,  3 Sep 2022 14:12:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbiICOMn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Sep 2022 10:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiICOMm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Sep 2022 10:12:42 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FBED58086
        for <linux-doc@vger.kernel.org>; Sat,  3 Sep 2022 07:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662214361; x=1693750361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dVaeM6pcJbQqu5w/lxlvyDNh3khn7nl0R6/9oW0bRZE=;
  b=evmBtxo9ag+Sd3cdABfG8DAms7/rzxr6GXV58rdhD8zfs4cNNLmMLlrQ
   TeKcU09OFIbG203T8+w9ONhdJtY97VmlsP6fczCsCU5mFmvtpDG7vAY9v
   cppCGB0LNS9hnOgs+ZNuqe/5Pimlsf/Y3b8Y03wKZcOd8N1whckeFrXvn
   FISaZZy4GplCCaRNPisvACKHW7kvqeQ7IXdPtMBvULquorYgjCgUV+xKD
   LWnOl4zj/k0Gp6oRh45ZcJ/fuJDGG9geHlVTqzvFoG3JKhzmNuJKMf/Xs
   eSq28z65XFmXH/L0WlD7WU3uOrnPCyT/XhnveMhJXqyEUR/MEDR4NIYoX
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10459"; a="297456320"
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; 
   d="scan'208";a="297456320"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2022 07:12:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; 
   d="scan'208";a="590397403"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Sep 2022 07:12:39 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oUTt1-0001lL-07;
        Sat, 03 Sep 2022 14:12:39 +0000
Date:   Sat, 3 Sep 2022 22:11:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alexey Romanov <avromanov@sberdevices.ru>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org
Subject: [linux-next:master 4372/4736] htmldocs: Warning: mm/zsmalloc.c
 references a file that doesn't exist: Documentation/mm/highmem
Message-ID: <202209032125.RimXO4Nz-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
commit: 40baf1f238b4ff9a8f9556bfae9edef7cf41e34f [4372/4736] zsmalloc: zs_object_copy: replace email link to doc
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=40baf1f238b4ff9a8f9556bfae9edef7cf41e34f
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 40baf1f238b4ff9a8f9556bfae9edef7cf41e34f
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: mm/zsmalloc.c references a file that doesn't exist: Documentation/mm/highmem

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
