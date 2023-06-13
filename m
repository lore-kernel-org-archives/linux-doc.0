Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46236EB64D7
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jun 2023 21:48:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbjFMVs3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Jun 2023 17:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjFMVs1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Jun 2023 17:48:27 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB1C1BC7
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 14:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686692906; x=1718228906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0wgOieI/cYvfDquGZwmNO9r/9UvAT9qAMFt6hKsxZNk=;
  b=eNmpxudXIs7PzH7F6UTQQ1lM50ADtQR/ktFw1NLPpZORUCzhB0KtjR5m
   lZsD/Bk0Mgwh7BtJcvjfaaxmK/55Vfa3yJfAKm+H/G/0do00wN0ElXFES
   KxHOhV7USl8/8p9Q5dY8+NEsP0YUxmtuugdFN7YbdqeGc2n5aK6+G0v9u
   djbPxpiK/wIYox0Q4DTuOOwm1Xx/2MlwehsE6LQgP4eqxNTvQYPgy7PXZ
   CUE+w+QPtUYSAIkvw+64/tVfFtLsVorODoHQ+67o7Xmnr+BonzBqAE/Mc
   Y1Nw5oaBuDhk6Bb/JXZ5VB6aGc3uErpeEft9/grjBbTWZDyKf6eU3yE4R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="338812702"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="338812702"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 14:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="741602675"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="741602675"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Jun 2023 14:48:24 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q9BsF-0001om-2w;
        Tue, 13 Jun 2023 21:48:23 +0000
Date:   Wed, 14 Jun 2023 05:47:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Shay Drory <shayd@nvidia.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Saeed Mahameed <saeedm@nvidia.com>,
        Moshe Shemesh <moshe@nvidia.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 8191/9385] htmldocs:
 Documentation/networking/device_drivers/ethernet/mellanox/mlx5/switchdev.rst:57:
 WARNING: Unexpected indentation.
Message-ID: <202306140505.ZTBob65w-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1f6ce8392d6ff486af5ca96df9ded5882c4b6977
commit: e71383fb9cd15a28d6c01d2c165a96f1c0bcf418 [8191/9385] net/mlx5: Light probe local SFs
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e71383fb9cd15a28d6c01d2c165a96f1c0bcf418
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e71383fb9cd15a28d6c01d2c165a96f1c0bcf418
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306140505.ZTBob65w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/networking/device_drivers/ethernet/mellanox/mlx5/switchdev.rst:57: WARNING: Unexpected indentation.
>> Documentation/networking/device_drivers/ethernet/mellanox/mlx5/switchdev.rst:66: WARNING: undefined label: documentation/networking/devlink/devlink-params.rst (if the link has no caption the label must precede a section header)

vim +57 Documentation/networking/device_drivers/ethernet/mellanox/mlx5/switchdev.rst

    52	
    53	Usage example:
    54	Create SF:
    55	$ devlink port add pci/0000:08:00.0 flavour pcisf pfnum 0 sfnum 11
    56	$ devlink port function set pci/0000:08:00.0/32768 \
  > 57	               hw_addr 00:00:00:00:00:11 state active
    58	
    59	Enable ETH auxiliary device:
    60	$ devlink dev param set auxiliary/mlx5_core.sf.1 \
    61	              name enable_eth value true cmode driverinit
    62	
    63	Now, in order to fully probe the SF, use devlink reload:
    64	$ devlink dev reload auxiliary/mlx5_core.sf.1
    65	
  > 66	mlx5 supports ETH,rdma and vdpa (vnet) auxiliary devices devlink params (see :ref:`Documentation/networking/devlink/devlink-params.rst`)
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
