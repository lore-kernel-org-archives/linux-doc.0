Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9CAC636CC
	for <linux-doc@archiver.kernel.org>; Mon, 13 Feb 2023 12:14:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjBMMOj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Feb 2023 07:14:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbjBMMOi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Feb 2023 07:14:38 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2FE7D88
        for <linux-doc@vger.kernel.org>; Mon, 13 Feb 2023 04:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676290457; x=1707826457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3+cYlxdOn+Owc6eMvLKv4UVZ8FIneUY+Q///CYhch2I=;
  b=mVQo8CPQfUl8VZy2Hc95/9suPiYtomn5Jv1/lqtaDmVuHWPKZeOWJuFR
   D3kheEDAuHrqdTGmRsrKXIMRWrZdfD+arM9M8IutySrk4yb+L6HDGzPTn
   RhsGtohFC/Ox5QPr8qiztvmeiKShR4S1a9UdRgagkKztQ3h8mRnriTKpo
   bPo4ZpfPgdfk+6fehnpk063ML6ktgTsVrPjZEC8hSOwrJLdMn0Xpcde9o
   dVUnXjmgifdqerZO8s1v3sixPCT59yl5qtoDFw1M0qaumbevARuWTE9pS
   m8tvD6dIj7ySl+txovHe7wtuEtfiWHaZwCL4D9bjhBp4gITqcCHtMSoVV
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="329505628"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="329505628"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 04:13:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="699165188"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="699165188"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Feb 2023 04:13:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pRXhs-0007jB-1G;
        Mon, 13 Feb 2023 12:13:16 +0000
Date:   Mon, 13 Feb 2023 20:12:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Michal Simek <monstr@monstr.eu>
Cc:     oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [pinchartl-media:muxed/2022.2/base 330/740] htmldocs: Warning:
 arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that
 doesn't exist: Documentation/hwmon/pmbus
Message-ID: <202302132059.8WPN05ke-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   git://linuxtv.org/pinchartl/media.git muxed/2022.2/base
head:   e26621179c3b1834a1bb17e9a38e47238ac63bf5
commit: b7bab5d0244b4621df07ce2102cc305644e298e1 [330/740] arm64: zynqmp: Add all missing dt files for Xilinx boards
reproduce:
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2022.2/base
        git checkout b7bab5d0244b4621df07ce2102cc305644e298e1
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302132059.8WPN05ke-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
