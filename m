Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809E6C05027
	for <linux-doc@archiver.kernel.org>; Tue, 14 Feb 2023 14:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233396AbjBNOnP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Feb 2023 09:43:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233413AbjBNOnP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Feb 2023 09:43:15 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF7310251
        for <linux-doc@vger.kernel.org>; Tue, 14 Feb 2023 06:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676385794; x=1707921794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M615769gTPWA/NZSXaBf04s+YjWf9kY/WKFeUsmg/F4=;
  b=ZgbsQrCaiHZVshboRZMp6HIAOxS0sqS5ZG/YgxzZru/g2NIZKqnyis2M
   lJjy0gGOO5ZJTDeOOWJ6oaz1p813ydEbyP/5jysTFDCwSTao8y5XlYnGe
   hika4bxschAlq34rGZwJeSHzfIRKcijuqwWXRMagk+ecVQcrhQGvxF4VG
   WrGfqsQI+wS1D01U8NFmwSF5IxqXiozyOjKzlXK4iu9soc0xKqGDdRyf2
   UpI2qgL0cvMtC3hFCzybqMXvgh9ASXvhgw20c+NwNhMXCVQqpr1UczjZR
   +clT2EBJ+7kFqRYCTPn4XjULY2MaZe1S8ygFbgLemh+JEuReXTenxYTcj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="328885637"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="328885637"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 06:43:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="812056282"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="812056282"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2023 06:43:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pRwWW-0008Zp-13;
        Tue, 14 Feb 2023 14:43:12 +0000
Date:   Tue, 14 Feb 2023 22:42:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dinh Nguyen <dinh.nguyen@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [dinguyen:for_next_hwmon_v2 3/3] htmldocs: Warning:
 Documentation/hwmon/socfpga-hwmon.rst references a file that doesn't exist:
 Documentation/devicetree/bindings/hwmon/socfpga-hwmon.yaml
Message-ID: <202302142258.szK8ryCs-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git for_next_hwmon_v2
head:   2566ec4d530416db5ca072d478087bde75542fd5
commit: 2566ec4d530416db5ca072d478087bde75542fd5 [3/3] hwmon: (socfpga) Add support fo hardware monitoring on SoCFPGA platforms
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git/commit/?id=2566ec4d530416db5ca072d478087bde75542fd5
        git remote add dinguyen https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git
        git fetch --no-tags dinguyen for_next_hwmon_v2
        git checkout 2566ec4d530416db5ca072d478087bde75542fd5
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302142258.szK8ryCs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/hwmon/socfpga-hwmon.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/socfpga-hwmon.yaml
>> Documentation/hwmon/socfpga-hwmon.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.
>> Documentation/hwmon/socfpga-hwmon.rst:3: WARNING: Title underline too short.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
