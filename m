Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F10C77B6E
	for <linux-doc@archiver.kernel.org>; Mon, 10 Apr 2023 02:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjDJC2G (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 9 Apr 2023 22:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjDJC2F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Apr 2023 22:28:05 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED8C8269A
        for <linux-doc@vger.kernel.org>; Sun,  9 Apr 2023 19:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681093684; x=1712629684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EjOmyNjwv7deSwbM+hWUaXmedxB8gZSoYSkOsjZnLDU=;
  b=UDw7ofb3ypzivW9V6+MKEHBaeZYb2IYsJGf4Ob4P/fURdlk7OzhGmN5R
   peku7Dat3d0/VU/zVAEzGw+4X0IddE+mY5pir0xXoFEfNlx7XCCn6TIcZ
   I0kgyKFSJcW78i74MrwzSGAU0aKA0enPN4xxtVkhqRXCq84H6+GHHADxx
   rVrLzUzep5ZA3zoCpRRq+nxGqm119uDV8fMUK00z0wEJeh/yoquen2h7+
   QKWuAoaalaUHhkbOXqHhIrIX0RMI1Uz3lxMjIXC5rfzxm0/rFdTidUuUt
   MjqN6c7LBs1GLbr8XQcqFLqI69MF6hrebqtLA9JQMOnh1Qu8u3hnXzEX0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="322907006"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="322907006"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 19:28:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="757323331"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="757323331"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Apr 2023 19:28:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1plhGF-000Uwt-0O;
        Mon, 10 Apr 2023 02:28:03 +0000
Date:   Mon, 10 Apr 2023 10:27:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hector Martin <marcan@marcan.st>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [asahilinux:bits/005-maintainers 2/3] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/spi/apple,spi.yaml
Message-ID: <202304101025.Vpjnwodr-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/AsahiLinux/linux bits/005-maintainers
head:   332d1bd2c6f629438bc0e1e9a2c657a98159831a
commit: 9cf611bacc5136da75a47371082efa566cbcc866 [2/3] MAINTAINERS: Add apple-spi driver & binding files
reproduce:
        # https://github.com/AsahiLinux/linux/commit/9cf611bacc5136da75a47371082efa566cbcc866
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/005-maintainers
        git checkout 9cf611bacc5136da75a47371082efa566cbcc866
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304101025.Vpjnwodr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/spi/apple,spi.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
