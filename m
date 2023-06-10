Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BE5C7EE29
	for <linux-doc@archiver.kernel.org>; Sat, 10 Jun 2023 21:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbjFJV1I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 10 Jun 2023 17:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjFJV1H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 10 Jun 2023 17:27:07 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F3E1BE8
        for <linux-doc@vger.kernel.org>; Sat, 10 Jun 2023 14:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686432425; x=1717968425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l/aPG70MsqQsdwikSgs+5Lm7I0XVg/RqlQkWmPp0ZjE=;
  b=WpDH97N34kjho59ab04ZcfA6UtiW9LGsLqo1XRj4cwRhxxvuE7RN2c0A
   GpeQ6qHLHFLoyZ+2LHfVnoeEviXukaotQR+Ar+CRULR9XA++yCKbw4M2i
   bPWxmhIJvbq9yzxf7AhyAWzd2GRw83NyG6MOsAz1ySIiPdID54/7cbZpk
   jepkX2vxarmkQVcEKhyCWUiNQx7U9fxlNbkkG1UUEpm3Ao5lBf+l39hzk
   HKzohJO4MowF1b0LkbrTmWcWos2najkXMN0w0F86CTrkL0RXk8dSf+C5e
   C+WvrP+x/Bjzq76gDj9kj3rX5d5Cm5lT72fqs69auVga+a0dNoy2sYyfe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="421399896"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="421399896"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 14:27:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="710737886"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="710737886"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Jun 2023 14:27:03 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q866w-000ARk-2x;
        Sat, 10 Jun 2023 21:27:02 +0000
Date:   Sun, 11 Jun 2023 05:26:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Baoquan He <bhe@redhat.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-doc@vger.kernel.org
Subject: [arm64:for-next/kdump 2/2] htmldocs: Documentation/arm64/kdump.rst:
 WARNING: document isn't included in any toctree
Message-ID: <202306110549.ynH2Juok-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/kdump
head:   03dc0e05407f394d4f8b3da8210013fef91e74ff
commit: 03dc0e05407f394d4f8b3da8210013fef91e74ff [2/2] Documentation: add kdump.rst to present crashkernel reservation on arm64
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=03dc0e05407f394d4f8b3da8210013fef91e74ff
        git remote add arm64 https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
        git fetch --no-tags arm64 for-next/kdump
        git checkout 03dc0e05407f394d4f8b3da8210013fef91e74ff
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110549.ynH2Juok-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/arm64/kdump.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
