Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2B4C6FD1F
	for <linux-doc@archiver.kernel.org>; Sun, 19 Mar 2023 08:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjCSI2I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 19 Mar 2023 04:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjCSI2H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 19 Mar 2023 04:28:07 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9DFF21A3D
        for <linux-doc@vger.kernel.org>; Sun, 19 Mar 2023 01:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679214485; x=1710750485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xUpBKuyCq3zDvKFg5zoxA5YrmdR01ZE/PnMjGtfcNaU=;
  b=MjzhKnL82tqk3gAlTXrUX5k1Liqptn70tmLRxplyDWgamB4q/yKWHM7N
   1sAqzVG3Clx/vuFBsOGWwoX5Jb72QVQM8PBNPea7kbsQsl8+TsExiI4mp
   sk9YP9xlpofJkCD4CIycOn/+RkEU8HVVN9ww0jWcc8aWVaUsQRCj34nDe
   PzInbzyEEgYMcAH8x8xCX5zhFroE8YiVLd3ngT6jdNB9wAI+bDPkxyU2i
   CtyvfiDGwWXGOqmq9Ot64PL3fBWqDr3Lir6QzTtJmW1//ydJFWN/hc3D5
   vqu/CUSzMJ1fqllDrK2lcEllGRA+GwqnlxbR7w6cqZ8Je4wuATBzx/TBx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="340849621"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="340849621"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 01:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="674014013"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="674014013"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Mar 2023 01:28:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pdoOZ-000ASs-14;
        Sun, 19 Mar 2023 08:28:03 +0000
Date:   Sun, 19 Mar 2023 16:27:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     oe-kbuild-all@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>,
        linux-doc@vger.kernel.org
Subject: [lunn:v6.2.0-net-next-phy-leds 2/28] htmldocs:
 Documentation/leds/leds-class.rst:217: WARNING: Inline emphasis start-string
 without end-string.
Message-ID: <202303191637.XhbORWKz-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/lunn/linux.git v6.2.0-net-next-phy-leds
head:   8a9b1a5ad5dd0e48585009020088a2ee5bdd6688
commit: d4ee8e7089227062d16b95302ae0532f578bc205 [2/28] leds: add function to configure hardware controlled LED
reproduce:
        # https://github.com/lunn/linux/commit/d4ee8e7089227062d16b95302ae0532f578bc205
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v6.2.0-net-next-phy-leds
        git checkout d4ee8e7089227062d16b95302ae0532f578bc205
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303191637.XhbORWKz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/leds/leds-class.rst:217: WARNING: Inline emphasis start-string without end-string.

vim +217 Documentation/leds/leds-class.rst

   216	
 > 217	- struct led_classdev *led_cdev
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
