Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC0BECAAD8
	for <linux-doc@archiver.kernel.org>; Tue, 20 Sep 2022 05:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbiITFwd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Sep 2022 01:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbiITFwS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Sep 2022 01:52:18 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D065B7B7
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 22:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663653127; x=1695189127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fjE6KCmLak4Mf7cY3g8UZO9WjW8ZEyuDFaRNg8NZ4Ko=;
  b=HfEtN2uqSbSUFgZ74PTC2tmLM43qRuOLAsqBfqvLI57crwEiZ85kEzER
   VFDQV/9UbEhngfXHpBwmUJMGL06P9S5Kzkv0SqxQc3WCtzTXnvCElwsZL
   rpKNiLf/1HXiyrPrybxjT0ZHwqLltPQi2MB74l8gYaV2r1yXwVaVq/Xl1
   Lhup14oFTGHk4o2wwyIzhgqM3fEjU8k4RuKI32B/uJCw+d+FJG/cKD1Js
   eOnbInl5xt68HqID7xz4mcPcRDPOWHQkBgfur8rWAdouPR9xBKHhJMI0U
   vsbPe9uKstRvgDwHZUAhP5IAzGxuBZNLEGOjmRGIpthGPd+MnTjP13Uh2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="298329513"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="298329513"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 22:52:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="596382255"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Sep 2022 22:52:04 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oaWAu-0002W8-0Z;
        Tue, 20 Sep 2022 05:52:04 +0000
Date:   Tue, 20 Sep 2022 13:51:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org
Subject: [linux-next:master 7291/7934] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
Message-ID: <202209201326.sY9kHOLm-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c9ca5b1597e3222177ba2a94658f78fa5ef4f58
commit: 358d2861cbdf9dd57e39e744169bb8a6a1e420af [7291/7934] Merge branch 'at91-next' of git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=358d2861cbdf9dd57e39e744169bb8a6a1e420af
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 358d2861cbdf9dd57e39e744169bb8a6a1e420af
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/clock/microchip,mpfs.yaml

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
