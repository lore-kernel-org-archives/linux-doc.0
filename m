Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1992C77B60
	for <linux-doc@archiver.kernel.org>; Sun, 30 Apr 2023 13:27:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjD3N13 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 30 Apr 2023 09:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjD3N12 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 30 Apr 2023 09:27:28 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53CF173E
        for <linux-doc@vger.kernel.org>; Sun, 30 Apr 2023 06:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682861247; x=1714397247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XofC74Ap5B0v7tVY0cYTcavAFRiZYubZBMJ5LcA0oJQ=;
  b=epHHhj6p84GazBPtOsjKe9sHf1NOQdShutJQ5uad+NTiF8WvNne63jrc
   2bR6/C2QIK24aYtPzYFCDRudQryg/ModPqSqRkiacio/qWMeskFpSsbws
   /a+kO8G7PnZjzIkXW65rcwEX7pzdsgiv2LS58mg8x4H4HR7xJys7Smjw4
   oeBVlWLV5hFfR3BmaoRgpSG9gkCgofAwTUmn/sbnY4OBNbIkEXICgVbDx
   Pyxf9NLPIkBQLQDp7Hb3pn7CWQCY7T5VsbakKkmB8FJW33PpHtHyRVyLC
   l0VCO0Nfc0IVWajr36spi8X4WaWgMEfj0HO30/brVNsiHV77m3UhtaSkK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="348064474"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="348064474"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 06:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="695503384"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="695503384"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Apr 2023 06:27:26 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pt75J-0001f3-0o;
        Sun, 30 Apr 2023 13:27:25 +0000
Date:   Sun, 30 Apr 2023 21:26:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Isaku Yamahata <isaku.yamahata@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [intel-tdx:kvm-upstream-workaround 59/338] htmldocs:
 Documentation/ABI/testing/sysfs-firmware-tdx:2: WARNING: Unexpected
 indentation.
Message-ID: <202304302142.pMntaRx9-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   abaa3072a8763b7a6276df61d205bf33eb2f31a5
commit: f87c5d4e1ce057414738d7f1ec7d0a6897906d2e [59/338] x86/virt/tdx: Export TD config params of TDX module via sysfs
reproduce:
        # https://github.com/intel/tdx/commit/f87c5d4e1ce057414738d7f1ec7d0a6897906d2e
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout f87c5d4e1ce057414738d7f1ec7d0a6897906d2e
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304302142.pMntaRx9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-firmware-tdx:2: WARNING: Unexpected indentation.

vim +2 Documentation/ABI/testing/sysfs-firmware-tdx

   > 2	Date:           March 2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
