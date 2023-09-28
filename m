Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A75E732D8
	for <linux-doc@archiver.kernel.org>; Thu, 28 Sep 2023 13:52:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232286AbjI1Nwc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Sep 2023 09:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231902AbjI1Nwc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Sep 2023 09:52:32 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94A495
        for <linux-doc@vger.kernel.org>; Thu, 28 Sep 2023 06:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695909148; x=1727445148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4US4cF/QGpAbLr9htCWoP6qqhOhpwvEAcb6whsWP2A0=;
  b=eklPx8RGuj1C310wKjakGdBLUuJJnvBVWE5ESkECTDazPA3hkXHqY61P
   u8QJlJZsKjt5uVcCiNSU9/VbS/curBs2DFMKFyBkzYiAbNreM7B6eISyj
   l5RaJ+CyOeAqBvFKTfV3kWTIe0Va1hc8+EMUsCQiCIL+pRuZaix2KtxIG
   IDggvWQbNbTFqRTvkOPqLv10tKkbrX81sO5fMFyQ9dNIp65wPoOrnJ/Jv
   dZPiQg5kVfoGq+dTdYDs5Yfht9DCN3lqBBNZrF3eYlA1EsZP0TFveX+du
   C0F+/StE+99Malb00zw1Egv/0/pM6k0ivH+SHM8oqsBbctJSgK+lFxw2s
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="468352279"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="468352279"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 06:52:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="893034517"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="893034517"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2023 06:51:17 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qlrRJ-0001Vv-1G;
        Thu, 28 Sep 2023 13:52:25 +0000
Date:   Thu, 28 Sep 2023 21:51:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [arnd-playground:randconfig-6.7-next 161/306]
 drivers/pci/hotplug/yenta_socket.c:2816: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202309282119.UoamFUFV-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7-next
head:   a126cc9f2f87fe0931a7bf053665560587086082
commit: efad45b3891cfcffef6767f1ec1ab16185787eb5 [161/306] pci: hotplug: move cardbus code from drivers/pcmcia
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230928/202309282119.UoamFUFV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309282119.UoamFUFV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309282119.UoamFUFV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/hotplug/yenta_socket.c:2816: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * EnE specific part. EnE bridges are register compatible with TI bridges but


vim +2816 drivers/pci/hotplug/yenta_socket.c

eb0a90b4970d66 drivers/pcmcia/yenta_socket.c Dominik Brodowski 2005-07-12  2813  
eb0a90b4970d66 drivers/pcmcia/yenta_socket.c Dominik Brodowski 2005-07-12  2814  
6541da46604098 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2815  /**
6541da46604098 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23 @2816   * EnE specific part. EnE bridges are register compatible with TI bridges but
6541da46604098 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2817   * have their own test registers and more important their own little problems.
6541da46604098 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2818   * Some fixup code to make everybody happy (TM).
6541da46604098 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2819   */
6541da46604098 drivers/pcmcia/yenta_socket.c Arnd Bergmann     2023-02-23  2820  

:::::: The code at line 2816 was first introduced by commit
:::::: 6541da46604098055a014521b08f183d90f2e546 yenta_socket: copy pccard core code into driver

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
