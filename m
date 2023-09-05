Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A04CA1006
	for <linux-doc@archiver.kernel.org>; Tue,  5 Sep 2023 19:51:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242110AbjIETvj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Sep 2023 15:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235587AbjIETvh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Sep 2023 15:51:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15BA9CE
        for <linux-doc@vger.kernel.org>; Tue,  5 Sep 2023 12:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693943494; x=1725479494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eFBbE9HzqQzshixjouQ4Gq9jsVJLPT5uB03U4EUQI+o=;
  b=SdcGDrY63zvNJ9gmsrJgp4XLyw1NIfUfQTrnF7IkI35bzDL13PjLt5FC
   U2/TW94Bq29xGeR5u1d4RCF1lSuyQfuO1IXwEVzl4cdpsAhBeUh2IOtBt
   dBQn5g8UWNfjpj6E9WlCua73kE6RMnTeh/3Pl5peClHGFyLKr+9riNyBk
   IPh2OcBWaooIuFLjYShVsroNK5Mp7Qk41TkzywAxh635W50eqNZArAgmq
   BISa+7LmFjIrunK9wihpBcgATYQMICbiE+3WaXs8GaS3IX5wE+D9l9122
   aghd0CdTwupi8jGJRaak9aslGhLFqQPI+wuh6+oG9rR0aGwxKOTLr5uM2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="379607732"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="379607732"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 12:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="717981535"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="717981535"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Sep 2023 12:51:32 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qdc56-000219-0i;
        Tue, 05 Sep 2023 19:51:25 +0000
Date:   Wed, 6 Sep 2023 03:50:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Palmer Dabbelt <palmer@rivosinc.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org
Subject: [linux-next:master 13629/13985] htmldocs:
 Documentation/loongarch/introduction.rst:362: WARNING: duplicate label
 loongarch-references, other instance in
 Documentation/arch/loongarch/introduction.rst
Message-ID: <202309060352.2ZuAeYVF-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c50216cfa084d5eb67dc10e646a3283da1595bb6
commit: 2bf3c0292f35e84a2111e6e83f023c2690b25a71 [13629/13985] Merge patch series "RISC-V: Probe for misaligned access speed"
reproduce: (https://download.01.org/0day-ci/archive/20230906/202309060352.2ZuAeYVF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060352.2ZuAeYVF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/loongarch/introduction.rst:362: WARNING: duplicate label loongarch-references, other instance in Documentation/arch/loongarch/introduction.rst
>> Documentation/translations/zh_CN/loongarch/introduction.rst:325: WARNING: duplicate label loongarch-references-zh_cn, other instance in Documentation/translations/zh_CN/arch/loongarch/introduction.rst
>> Documentation/translations/zh_CN/mips/booting.rst:14: WARNING: duplicate label cn_booting, other instance in Documentation/translations/zh_CN/arch/mips/booting.rst
>> Documentation/translations/zh_CN/mips/ingenic-tcu.rst:15: WARNING: duplicate label cn_ingenic-tcu, other instance in Documentation/translations/zh_CN/arch/mips/ingenic-tcu.rst
>> Documentation/bpf/instruction-set.rst: WARNING: document isn't included in any toctree
>> Documentation/hwmon/smm665.rst: WARNING: document isn't included in any toctree
>> Documentation/loongarch/index.rst: WARNING: document isn't included in any toctree
>> Documentation/mips/index.rst: WARNING: document isn't included in any toctree
>> Documentation/mm/frontswap.rst: WARNING: document isn't included in any toctree
>> Documentation/networking/device_drivers/ethernet/mellanox/mlx5/devlink.rst: WARNING: document isn't included in any toctree
>> Documentation/s390/index.rst: WARNING: document isn't included in any toctree
>> Documentation/translations/zh_CN/mm/frontswap.rst: WARNING: document isn't included in any toctree

vim +362 Documentation/loongarch/introduction.rst

0ea8ce61cb2c48 Huacai Chen 2022-05-31  360  
0ea8ce61cb2c48 Huacai Chen 2022-05-31  361  References
0ea8ce61cb2c48 Huacai Chen 2022-05-31 @362  ==========
0ea8ce61cb2c48 Huacai Chen 2022-05-31  363  

:::::: The code at line 362 was first introduced by commit
:::::: 0ea8ce61cb2c487e818c515f91329fa9972a7155 Documentation: LoongArch: Add basic documentations

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
