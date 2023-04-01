Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11045C6FD1D
	for <linux-doc@archiver.kernel.org>; Sat,  1 Apr 2023 06:59:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232163AbjDAG7a (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 1 Apr 2023 02:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbjDAG7a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 1 Apr 2023 02:59:30 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52A81A470
        for <linux-doc@vger.kernel.org>; Fri, 31 Mar 2023 23:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680332368; x=1711868368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PMXe2iN70hx/zxIuvJrNcRar4+/wnhcOjl1pyngv4JU=;
  b=KFNyYqPABMKV2EJ2kOVBorOlW94Jy08rjSDbY/Yo5W4DhqsduSLSOFUN
   TfvQQ4nT5tQ2LIKqZqpgrvIzgY/rsU9vAhq1uYs/Tst2LkTgTKJjDgNAn
   yjdgtQXRH7ySlxS0XJZ76140YIruxlIXqKgoHyfDUX1EVMd//hICwAXPH
   bO/lijWwsD5YtO2w7Ef2gRBd1qXlfjnaLEuhGsrUSvMjnGrP5cbCrZL8U
   /L6bu4PjWDL/4IUeIq9eBpGVCVnUhsUPxgfkXXYXvTc9NyOki+JFAKSoV
   R9MwGVqqboGELFtBtdVhR2fMhQvsWSAaK/fb0upXstpe3iOZkcABYJWzw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="339123384"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="339123384"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 23:59:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="715698542"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="715698542"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 31 Mar 2023 23:59:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1piVCo-000Ma3-0a;
        Sat, 01 Apr 2023 06:59:18 +0000
Date:   Sat, 1 Apr 2023 14:58:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Borislav Petkov (AMD)" <bp@alien8.de>
Cc:     oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org
Subject: [linux-next:master 8321/8375] htmldocs: Warning: arch/x86/Kconfig
 references a file that doesn't exist: Documentation/x86/shstk.rst
Message-ID: <202304011449.XFV6lLwh-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4b0f4525dc4fe8af17b3daefe585f0c2eb0fe0a5
commit: 3a5762993f9278880487d2dccfa964f09f6a1021 [8321/8375] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3a5762993f9278880487d2dccfa964f09f6a1021
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3a5762993f9278880487d2dccfa964f09f6a1021
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304011449.XFV6lLwh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/shstk.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
