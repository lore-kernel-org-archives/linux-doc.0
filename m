Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4987AC433DB
	for <linux-doc@archiver.kernel.org>; Sat, 13 Mar 2021 11:17:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BF9964F1D
	for <linux-doc@archiver.kernel.org>; Sat, 13 Mar 2021 11:17:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbhCMLQh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 13 Mar 2021 06:16:37 -0500
Received: from mga11.intel.com ([192.55.52.93]:18345 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230349AbhCMLQG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 13 Mar 2021 06:16:06 -0500
IronPort-SDR: G3vNXAJcSHo22kG6Dzi9NI4Mx8q64KyJJAmSP57FM7i685mJkLsTaYoRQhdm5xqe6pAs/YP+yz
 +PjlJVwUulEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="185575409"
X-IronPort-AV: E=Sophos;i="5.81,245,1610438400"; 
   d="gz'50?scan'50,208,50";a="185575409"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2021 03:16:05 -0800
IronPort-SDR: rN77P1UJiUWMn3sLCcvmZg0v4k6ax7th8FTnTSfDlM7rQGYC4l+37nWmFuv214AsfkzU6WE0pe
 UR5eoB7tyZbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,245,1610438400"; 
   d="gz'50?scan'50,208,50";a="448885538"
Received: from lkp-server02.sh.intel.com (HELO ce64c092ff93) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Mar 2021 03:16:02 -0800
Received: from kbuild by ce64c092ff93 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lL2FV-0001zo-Gl; Sat, 13 Mar 2021 11:16:01 +0000
Date:   Sat, 13 Mar 2021 19:15:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org
Cc:     kbuild-all@lists.01.org
Subject: Re: [PATCH v2 1/3] riscv: Move kernel mapping outside of linear
 mapping
Message-ID: <202103131935.epyMAI3S-lkp@intel.com>
References: <20210313092509.4918-2-alex@ghiti.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <20210313092509.4918-2-alex@ghiti.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexandre,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on lwn/docs-next]
[also build test ERROR on linus/master v5.12-rc2 next-20210312]
[cannot apply to soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alexandre-Ghiti/Move-kernel-mapping-outside-the-linear-mapping/20210313-173049
base:   git://git.lwn.net/linux-2.6 docs-next
config: riscv-nommu_k210_defconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/78f684d0ab9dfe75ab40951ce9edd835b6658209
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alexandre-Ghiti/Move-kernel-mapping-outside-the-linear-mapping/20210313-173049
        git checkout 78f684d0ab9dfe75ab40951ce9edd835b6658209
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=riscv 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/riscv/kernel/setup.c: In function 'setup_arch':
>> arch/riscv/kernel/setup.c:269:2: error: implicit declaration of function 'protect_kernel_linear_mapping_text_rodata' [-Werror=implicit-function-declaration]
     269 |  protect_kernel_linear_mapping_text_rodata();
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/protect_kernel_linear_mapping_text_rodata +269 arch/riscv/kernel/setup.c

   235	
   236	void __init setup_arch(char **cmdline_p)
   237	{
   238		parse_dtb();
   239		init_mm.start_code = (unsigned long) _stext;
   240		init_mm.end_code   = (unsigned long) _etext;
   241		init_mm.end_data   = (unsigned long) _edata;
   242		init_mm.brk        = (unsigned long) _end;
   243	
   244		*cmdline_p = boot_command_line;
   245	
   246		early_ioremap_setup();
   247		jump_label_init();
   248		parse_early_param();
   249	
   250		efi_init();
   251		setup_bootmem();
   252		paging_init();
   253		init_resources();
   254	#if IS_ENABLED(CONFIG_BUILTIN_DTB)
   255		unflatten_and_copy_device_tree();
   256	#else
   257		if (early_init_dt_verify(__va(dtb_early_pa)))
   258			unflatten_device_tree();
   259		else
   260			pr_err("No DTB found in kernel mappings\n");
   261	#endif
   262		misc_mem_init();
   263	
   264		sbi_init();
   265	
   266		if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
   267			protect_kernel_text_data();
   268	
 > 269		protect_kernel_linear_mapping_text_rodata();
   270	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--tThc/1wpZn/ma/RB
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--tThc/1wpZn/ma/RB--
