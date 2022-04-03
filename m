Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136CAC433EF
	for <linux-doc@archiver.kernel.org>; Sun,  3 Apr 2022 02:57:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbiDCC7O (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 2 Apr 2022 22:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbiDCC7O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 2 Apr 2022 22:59:14 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61EA938BE5
        for <linux-doc@vger.kernel.org>; Sat,  2 Apr 2022 19:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648954641; x=1680490641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IQwPXp5HGTzECEamiXyW0U17LALjYA2aFLTh93mES3c=;
  b=hjjbc3GdH5vDaNvfXVxGB9emorzgPWU+PMEA8C13alx4kVAhcWFANgrO
   HOwFsYHWkXDtDwAyVwx22hy40XWQ+mrnRwIhGSJ145Z3cAKEgJeXVDsfa
   G6PRqqvesfCU4gVO+zrCEdHDvPXoQTLkzRmNfrzX7jKvF+3YPCz0l0KhN
   4UR/ioGpXF/2psXnxMtM8w03C1cFdXmi1hPKx5FO9LtAcEfceWsSFbZ4j
   99hRHMvqa10XWQJTQg5qcyl0pkoR4N3nVlyAo4oMsmmeb84IkB02UgOBa
   KxXfC/6RlowcW4YkDonNWLMJqeDTLOShgUPAY+bt+W47EGBv7eojt0+PR
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10305"; a="247861871"
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="247861871"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2022 19:57:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="548259914"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 02 Apr 2022 19:57:19 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1naqQY-0000fZ-Ed;
        Sun, 03 Apr 2022 02:57:18 +0000
Date:   Sun, 3 Apr 2022 10:57:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
        arm@kernel.org, linux-doc@vger.kernel.org
Subject: [soc:multiplatform-misc-5.18 1/13]
 arch/arm/mach-versatile/spc.c:231: warning: This comment starts with '/**',
 but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202204031026.4ogKxt89-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git multiplatform-misc-5.18
head:   9e48eacd8cb623d8638d06d0f3c523d5222e2e82
commit: 57aa73aeafb7e2cacc9c89b4ff69306136c77a82 [1/13] ARM: versatile: move integrator/realview/vexpress to versatile
config: arm-defconfig (https://download.01.org/0day-ci/archive/20220403/202204031026.4ogKxt89-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=57aa73aeafb7e2cacc9c89b4ff69306136c77a82
        git remote add soc https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
        git fetch --no-tags soc multiplatform-misc-5.18
        git checkout 57aa73aeafb7e2cacc9c89b4ff69306136c77a82
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-versatile/spc.c:231: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * ve_spc_cpu_in_wfi(u32 cpu, u32 cluster)


vim +231 arch/arm/mach-versatile/spc.c

33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  229  
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  230  /**
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25 @231   * ve_spc_cpu_in_wfi(u32 cpu, u32 cluster)
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  232   *
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  233   * @cpu: mpidr[7:0] bitfield describing CPU affinity level within cluster
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  234   * @cluster: mpidr[15:8] bitfield describing cluster affinity level
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  235   *
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  236   * @return: non-zero if and only if the specified CPU is in WFI
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  237   *
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  238   * Take care when interpreting the result of this function: a CPU might
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  239   * be in WFI temporarily due to idle, and is not necessarily safely
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  240   * parked.
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  241   */
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  242  int ve_spc_cpu_in_wfi(u32 cpu, u32 cluster)
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  243  {
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  244  	int ret;
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  245  	u32 mask = standbywfi_cpu_mask(cpu, cluster);
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  246  
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  247  	if (cluster >= MAX_CLUSTERS)
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  248  		return 1;
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  249  
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  250  	ret = readl_relaxed(info->baseaddr + STANDBYWFI_STAT);
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  251  
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  252  	pr_debug("%s: PCFGREG[0x%X] = 0x%08X, mask = 0x%X\n",
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  253  		 __func__, STANDBYWFI_STAT, ret, mask);
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  254  
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  255  	return ret & mask;
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  256  }
33cb667a00f841 arch/arm/mach-vexpress/spc.c Dave Martin 2013-11-25  257  

:::::: The code at line 231 was first introduced by commit
:::::: 33cb667a00f841fa036ad79f1aaaf7d6380c971d ARM: vexpress/TC2: Implement MCPM power_down_finish()

:::::: TO: Dave Martin <Dave.Martin@arm.com>
:::::: CC: Olof Johansson <olof@lixom.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
