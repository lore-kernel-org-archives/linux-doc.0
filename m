Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B83C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  6 Apr 2022 13:11:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbiDFNNx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Apr 2022 09:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233910AbiDFNN2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Apr 2022 09:13:28 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B312A4EDC0
        for <linux-doc@vger.kernel.org>; Tue,  5 Apr 2022 20:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649214229; x=1680750229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cj9f5X51nG0qgyWme5lawnU3VPcWQN4Wn6alVZfWYqw=;
  b=hMe7db5tYD7NgZuIpHRWzS0is+fW56lAfjzfgKqaj02RdiG7kJ9k4JRb
   QIMoDKfmgosJkz/BL6j3pPFKX75L7I84J1R7RN1PBr/KaE+4X0jsayXir
   Y5hrWccQ8BnHvDucfhv38OM1ERuWjCFH+/7QNQK2rUtP/VUgnfFEYLzOM
   VAoSsDdQnV0KBAJ/ygfvvVw6I3fKi3F3k5FFUpGjbbsFYKF9Nqu5etmvr
   VGtf8jsJLZQXfWwUr9v5UeESbxR6I9WLnwhVYIcQoK/MAjgcsm1zyeS7R
   wtLlI36UVZNr0+kw7WjYl7WEuoXU3RTmhz8nCQsdfqRS2jnFjKzdqAJ/M
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="240869155"
X-IronPort-AV: E=Sophos;i="5.90,238,1643702400"; 
   d="scan'208";a="240869155"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 20:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,238,1643702400"; 
   d="scan'208";a="549349966"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 05 Apr 2022 20:03:46 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nbvxR-00040T-Oj;
        Wed, 06 Apr 2022 03:03:45 +0000
Date:   Wed, 6 Apr 2022 11:02:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
        arm@kernel.org, linux-doc@vger.kernel.org
Subject: [soc:multiplatform-misc-5.18 6/13]
 arch/arm/mach-versatile/spc.c:231: warning: This comment starts with '/**',
 but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202204061141.27Z9PAjf-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git multiplatform-misc-5.18
head:   a2677c00b0f03b8cad961f785941ca257f454df3
commit: 09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8 [6/13] ARM: dove: multiplatform support
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20220406/202204061141.27Z9PAjf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8
        git remote add soc https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
        git fetch --no-tags soc multiplatform-misc-5.18
        git checkout 09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8
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
