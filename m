Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AD4C001DC
	for <linux-doc@archiver.kernel.org>; Sun, 30 Jul 2023 02:41:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjG3ClV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 29 Jul 2023 22:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjG3ClU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 29 Jul 2023 22:41:20 -0400
Received: from mgamail.intel.com (unknown [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B932D47
        for <linux-doc@vger.kernel.org>; Sat, 29 Jul 2023 19:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690684879; x=1722220879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RmYgOheYjkXeEL862g7Z9+9Blgug4nWQ+pMTSXLKyiY=;
  b=l0izPQj+VInV72AdtWMkOgiw5h/MnYJoLioUeGufnaV6uORwVSXirsLT
   rMwkbfa+SzKaEnKKMCE78Sg09tqgT+mpY260s+bwnbl0s8tAot4oD9Ztp
   8Fxe1cfyl1BsYwdHAnSNabV0aV/KACpJ1T2+a5d1DcsLbTiT687tOioHY
   m00qVSEyC0+rMwlU2q8bXLsPU727H7CbXelvcq4KEaQ0pTToas/tWi/3+
   Z+zdSsjSBXWi/hAyx0eIgc8aWxO2NA/VD3mffTah0+cyQOnbWzJsIT3EF
   +weUmV/e5j5MlHS8PAAJc1YI+vj41Cu7Fl7Dzv7NiB5ps7pfs9rCx1rIj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="353713944"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="353713944"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 19:41:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="797827633"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="797827633"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jul 2023 19:41:18 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPwMv-0004Oh-0V;
        Sun, 30 Jul 2023 02:41:17 +0000
Date:   Sun, 30 Jul 2023 10:40:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Isaku Yamahata <isaku.yamahata@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [intel-tdx:kvm-upstream-workaround 176/343] htmldocs: Warning:
 Documentation/virt/kvm/api.rst references a file that doesn't exist:
 Documentation/virt/kvm/intel-tdx.rst
Message-ID: <202307301041.5uBQLHbI-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   76c1c9e7f4012a2878b2fdf292245aa685c34b2d
commit: 50cc7dad735ecfd67d019002a1aa851f2df06038 [176/343] Documentation/virt/kvm: Document on Trust Domain Extensions(TDX)
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307301041.5uBQLHbI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307301041.5uBQLHbI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/virt/kvm/intel-tdx.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
