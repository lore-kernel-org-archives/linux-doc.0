Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA47C7EE29
	for <linux-doc@archiver.kernel.org>; Sat, 10 Jun 2023 15:57:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233479AbjFJP5t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 10 Jun 2023 11:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231775AbjFJP5s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 10 Jun 2023 11:57:48 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFAA09B
        for <linux-doc@vger.kernel.org>; Sat, 10 Jun 2023 08:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686412667; x=1717948667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v+y/418MuaBoO3fZpIbAeLVvmSI/899QvJacUVsaBkA=;
  b=FxGh5VVUMpBCGp9bgt8SNgBQeI1TGu6nLj8FqAe8yymdudW+htTqSQLJ
   8e6aMr4eL+1uaMxDRa1TlsiPCTNDG8x2kJWjfT8ZK+yzqokINy0SBx4gA
   Tw5MlV1KFmFLQy3AnFOggKb0xtPSEcMwFT0AwnUFsloxL3HjzK1VepWLs
   wVPCVlgGrM9Cc9AYVIGQPnbqJAmQClFf/h4zKHJsU5bC8Tu2kSQr2A65/
   yO35f07WxbW0n0sz5gKp3UTbiuwp6NwOZTr44X/DNbB/ocLc7DbjGhNae
   v80wc82lWoobfpJeanrnlIAoSIMwc2IBQ1XMOB5HVN3y2Qg+XrRgalWz/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="338143857"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="338143857"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 08:57:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="688092488"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="688092488"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Jun 2023 08:57:46 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q80yH-000ABu-1J;
        Sat, 10 Jun 2023 15:57:45 +0000
Date:   Sat, 10 Jun 2023 23:57:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     David Howells <dhowells@redhat.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [dhowells-fs:crypto-krb5 1/19] htmldocs:
 Documentation/crypto/krb5.rst: WARNING: document isn't included in any
 toctree
Message-ID: <202306102318.PMcNQCst-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   5b181cb5852b03279d830e9d98cdc20ae1ca6e8e
commit: 869538ece641e93491db66d965ab576bb551c185 [1/19] crypto/krb5: Add API Documentation
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=869538ece641e93491db66d965ab576bb551c185
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs crypto-krb5
        git checkout 869538ece641e93491db66d965ab576bb551c185
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306102318.PMcNQCst-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/crypto/krb5.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
