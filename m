Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC23C001DF
	for <linux-doc@archiver.kernel.org>; Thu,  3 Aug 2023 21:54:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjHCVx7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Aug 2023 17:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbjHCVx6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Aug 2023 17:53:58 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E5A3ABB
        for <linux-doc@vger.kernel.org>; Thu,  3 Aug 2023 14:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691099632; x=1722635632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F0EnU0XHNIoo4Lv8X9OzvOsM5FmLWlsmXOwCphhKAEk=;
  b=kzis2ZZOP/UQeweVsaB6ZTU57WkKR6VpgaIf6WNX8eaeUylE4vBD9Ze7
   rWLK4KKlNXssV+jN5V/GYNeJKBqHbhH5gR9mlLCRIxhxcLFzrn6zzVCi9
   c17cO/qOFzu5EZwU276fdAv/lcvqZjis32d5BJI1/JUzRl15G0BA0wqQh
   H5Rr2h2g/wiNe2/NBuUHtEIaOA/ehEl+LIoPt9HJK+D5Rkz8QtuaKusEx
   CwP+6ZOhjId4Q6pxJ2NdB4fBkMSg50ZZtDa9rDOJfR43chKiDv8dKrcvn
   F9DX9jpsltiVpLlNX2LkgJvSHenSRN97Vun7iVJVNh3I5vm95/Xzk30JD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="367469743"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="367469743"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 14:53:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="843781848"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="843781848"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2023 14:53:51 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qRgGU-0002NN-1H;
        Thu, 03 Aug 2023 21:53:50 +0000
Date:   Fri, 4 Aug 2023 05:53:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Isaku Yamahata <isaku.yamahata@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [intel-tdx:kvm-upstream-workaround 176/346] htmldocs: Warning:
 Documentation/virt/kvm/api.rst references a file that doesn't exist:
 Documentation/virt/kvm/intel-tdx.rst
Message-ID: <202308040545.Ds02CCWB-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   c06084048271278d3508f534479b356f49f619ce
commit: 8afe6d84c0b5a93750cf48feb4b843896f291650 [176/346] Documentation/virt/kvm: Document on Trust Domain Extensions(TDX)
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040545.Ds02CCWB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040545.Ds02CCWB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/virt/kvm/intel-tdx.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
