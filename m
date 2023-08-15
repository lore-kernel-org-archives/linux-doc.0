Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FC6C001DB
	for <linux-doc@archiver.kernel.org>; Tue, 15 Aug 2023 02:38:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234287AbjHOCh5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Aug 2023 22:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234332AbjHOCh1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Aug 2023 22:37:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B595D1737
        for <linux-doc@vger.kernel.org>; Mon, 14 Aug 2023 19:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692067018; x=1723603018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=73BhJCPJjUvH9+B2+NitjAjububX5SyKFLlRA9EA+E8=;
  b=gRWBTPm2hSy6oOxOlocyTcE2KcNVNwF5XpJrhf8w66pAPBU4XUM82gRO
   Ljtr/+ROtslf6LKmVpHz0DuRY1KIM2AZmz30R/kv1DQRJVGWtuVFVVfxc
   COwsgajIh+9ehFluotgL7JgwNSgAYFIP5ldjW8qjHPj2O4ydvpwDgwsXW
   K/QsqiCCQMgxXVilAVxdGfvNGfVsGoHbmLgbIaz4MqkjxM1XNxnW4fZTE
   QOX++TTEBa/0CdF7EQTJo29NuEfcL5oZgNV+48IKliil45lFB8GARgu+1
   HjAOTaJvrAShTE0vOU6X2d4wrXwi+HXjHHKf5jGc9F+OkST8O8M5d0ebI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="352512834"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="352512834"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 19:36:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="980236994"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="980236994"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Aug 2023 19:36:41 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qVjvE-0000bJ-1P;
        Tue, 15 Aug 2023 02:36:40 +0000
Date:   Tue, 15 Aug 2023 10:35:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alexandre Ghiti <alexghiti@rivosinc.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Palmer Dabbelt <palmer@rivosinc.com>,
        Atish Patra <atishp@rivosinc.com>,
        Song Shuai <songshuaishuai@tinylab.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [lwn:docs-next 37/49] htmldocs: Warning:
 Documentation/riscv/boot.rst references a file that doesn't exist:
 Documentation/arm/uefi.rst
Message-ID: <202308151010.JGqiPc9F-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   git://git.lwn.net/linux.git docs-next
head:   90cd0c18573ad0583dec098a586f86d281947eb9
commit: e0bec22f06641e4a7ccd7fb1f8ed4588839b660b [37/49] Documentation: riscv: Add early boot document
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151010.JGqiPc9F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308151010.JGqiPc9F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/riscv/boot.rst references a file that doesn't exist: Documentation/arm/uefi.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
