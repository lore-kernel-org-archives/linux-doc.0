Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7995AC7EE25
	for <linux-doc@archiver.kernel.org>; Thu,  8 Jun 2023 23:06:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbjFHXGz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jun 2023 19:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236269AbjFHXGy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Jun 2023 19:06:54 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67CB830C3
        for <linux-doc@vger.kernel.org>; Thu,  8 Jun 2023 16:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686265609; x=1717801609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vl9G1QSuA7ilJ+TglaAeFYIzhthc8BU1twBHAkS5g5w=;
  b=GfYxrD8TKVNEivN6LLOj5u//u/cCZ2vkfaPD8T9StfInkCPQ4nhWyK0X
   n8/WOSuQCZDVJzomDU0/E6fjxzr4zRUPgRZRJY8jlpUA+N2dDjFMosnJs
   G9CeC6SnQO3UWiDYnTLf3ljtTZFa+w6tYdPKXO7ZzMawW9knXLlHopQd/
   StTUAZo7tsYg6pJitkpEyVNLQlJGqYyeG0Q4C1/1DDY1heX0Zf/5GCARi
   2WL8YzEPWx57zqwLFjeOIaJeA4/kO0dVLEeAltDVrka1r/p6qmHFwb8qK
   1YBPwlhAeGJ1tulzXP0IYiF24X9CMClH4K5zWboe/m2TrG51tVg2MTzxX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="356342163"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="356342163"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 16:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="834391281"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="834391281"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Jun 2023 16:06:47 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q7OiM-0008KS-1I;
        Thu, 08 Jun 2023 23:06:46 +0000
Date:   Fri, 9 Jun 2023 07:06:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Stanley.Yang" <Stanley.Yang@amd.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Alex Deucher <alexander.deucher@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        linux-doc@vger.kernel.org
Subject: [agd5f:drm-next 834/865]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c:76: warning: This comment
 starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202306090615.QR4VmYLN-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   11007d9259632b46afa565cba971de53b889c7cc
commit: 4a4cbe5d13827db793b3f4523553a5dee39fe6a4 [834/865] drm/amdgpu: Add support EEPROM table v2.1
config: csky-buildonly-randconfig-r006-20230608 (https://download.01.org/0day-ci/archive/20230609/202306090615.QR4VmYLN-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 4a4cbe5d13827db793b3f4523553a5dee39fe6a4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090615.QR4VmYLN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c:76: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * EEPROM Table structure v1
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c:98: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * EEPROM Table structrue v2.1


vim +76 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c

    74	
    75	/**
  > 76	 * EEPROM Table structure v1
    77	 * ---------------------------------
    78	 * |                               |
    79	 * |     EEPROM TABLE HEADER       |
    80	 * |      ( size 20 Bytes )        |
    81	 * |                               |
    82	 * ---------------------------------
    83	 * |                               |
    84	 * |    BAD PAGE RECORD AREA       |
    85	 * |                               |
    86	 * ---------------------------------
    87	 */
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
