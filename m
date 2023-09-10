Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D31EEB57D
	for <linux-doc@archiver.kernel.org>; Sun, 10 Sep 2023 15:34:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjIJPeH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 10 Sep 2023 11:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbjIJPeG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 10 Sep 2023 11:34:06 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F122E118
        for <linux-doc@vger.kernel.org>; Sun, 10 Sep 2023 08:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694360041; x=1725896041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UbKlm6gCyssVhZky0AdNZO3KfsbUESXOnh4I9ytAAXE=;
  b=HOl1DXCdLhq0a5FHO/nOGqTF8rIKg2lPa0niByK8hRuSWjrsOkVPJ3Ss
   ORHkeRmbQ0Mhk8O3fwbV2sSREeFTMSBe34m+81GHDbDEcE78GpbJPMCd7
   wlWZJxAiqYJxd/k9JJxqxiqH5ZoyoX8a8wKbplPkgC618ZlI3LsiBiIh8
   3DvfoFLNEgNSz3/asfO92kuwL7rhXOUU2eRdajMfW4uawIfsbwLPVSL4h
   77jRSx8TY+t5YKGmCWGt5/9Jq0VrdmJTV5U6VYF+UrIUiZPzti3PiWt90
   mLm+mcreBu7OKHa6gQyn8iiKqwglbPTs7SM92GcOS4KjbBH48qkD4za6i
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="362949687"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="362949687"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 08:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="746136964"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="746136964"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Sep 2023 08:34:00 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qfMRh-00055m-2u;
        Sun, 10 Sep 2023 15:33:57 +0000
Date:   Sun, 10 Sep 2023 23:33:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [hverkuil-media-tree:hdmi-dbg 11/27] htmldocs:
 Documentation/admin-guide/media/cec.rst:50: WARNING: undefined label:
 extron_da_hd_4k_plus (if the link has no caption the label must precede a
 section header)
Message-ID: <202309102306.O46hkAzJ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   4e36f69879c101236bfb136deb83de210cf43046
commit: 1eb159538ab221d1ffb1002a0cf8585906e75ca0 [11/27] cec/extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver
reproduce: (https://download.01.org/0day-ci/archive/20230910/202309102306.O46hkAzJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309102306.O46hkAzJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/media/cec.rst:50: WARNING: undefined label: extron_da_hd_4k_plus (if the link has no caption the label must precede a section header)

vim +50 Documentation/admin-guide/media/cec.rst

    40	
    41	- Pulse-Eight: the pulse8-cec driver implements the following module option:
    42	  ``persistent_config``: by default this is off, but when set to 1 the driver
    43	  will store the current settings to the device's internal eeprom and restore
    44	  it the next time the device is connected to the USB port.
    45	
    46	- RainShadow Tech. Note: this driver does not support the persistent_config
    47	  module option of the Pulse-Eight driver. The hardware supports it, but I
    48	  have no plans to add this feature. But I accept patches :-)
    49	
  > 50	- Extron DA HD 4K PLUS HDMI Distribution Amplifier. See
    51	  :ref:`extron_da_hd_4k_plus` for more information.
    52	
    53	Miscellaneous:
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
