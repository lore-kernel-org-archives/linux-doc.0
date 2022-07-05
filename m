Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4140FC43334
	for <linux-doc@archiver.kernel.org>; Tue,  5 Jul 2022 11:00:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbiGELAW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Jul 2022 07:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232929AbiGEK7x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Jul 2022 06:59:53 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD3A15FE9
        for <linux-doc@vger.kernel.org>; Tue,  5 Jul 2022 03:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657018782; x=1688554782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KYWlWkjveNrW7gDbXiSGvO86pasbzhISrFt4H0Bpgpw=;
  b=iXjMIkXAiGEzcmlTwKT/MzQUz7jzDUhL7lu9wj9Y64IRNfvUt7/BuOkL
   Wd/ogLEnlHmbmpOGsJHZRC48cHW8nr6KisN1f5nVODfduUT4pITt059LQ
   EU7mqUPNURoy+rzDZ1Xdujkzb4R8vf87Caw99FmKCBPcteqO1juesTaR3
   2LA8SjaOtVKowZnRRzEwTrbrk1Xh923CaRZI1RSBrRiuKc+A2BzdvrgF7
   GiXDvrom5bjYxuiijuOJDeoKABsTDZNAcdkRwBeBBp6Fsl0W2f78OlOXa
   aDsaVLuIJrvHRIOgX5Kbth4byRRkS2kZ3f92gN+gjKNP5Fyz7e07ABQUM
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="280875711"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
   d="scan'208";a="280875711"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 03:59:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
   d="scan'208";a="719687262"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Jul 2022 03:59:40 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o8gHL-000J0l-Md;
        Tue, 05 Jul 2022 10:59:39 +0000
Date:   Tue, 5 Jul 2022 18:58:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Frank Li <Frank.Li@nxp.com>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Jon Mason <jdmason@kudzu.us>, linux-doc@vger.kernel.org
Subject: [linux-next:master 3587/7896] htmldocs:
 Documentation/PCI/endpoint/pci-vntb-function.rst:82: WARNING: Unexpected
 indentation.
Message-ID: <202207051821.3f0eRIsL-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2a2aa3f05338270aecbe2492fda910d6c17e0102
commit: 0c4b285d9636cc850f55151fa6a250dd131e5192 [3587/7896] Documentation: PCI: Add specification for the PCI vNTB function device
reproduce: make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/PCI/endpoint/pci-vntb-function.rst:82: WARNING: Unexpected indentation.
>> Documentation/PCI/endpoint/pci-vntb-howto.rst:131: WARNING: Title underline too short.

vim +82 Documentation/PCI/endpoint/pci-vntb-function.rst

    60	
    61	  It is appended after Config region.
    62	
    63	  +--------------------------------------------------+ Base
    64	  |                                                  |
    65	  |                                                  |
    66	  |                                                  |
    67	  |          Common Config Register                  |
    68	  |                                                  |
    69	  |                                                  |
    70	  |                                                  |
    71	  +-----------------------+--------------------------+ Base + span_offset
    72	  |                       |                          |
    73	  |    Peer Span Space    |    Span Space            |
    74	  |                       |                          |
    75	  |                       |                          |
    76	  +-----------------------+--------------------------+ Base + span_offset
    77	  |                       |                          |      + span_count * 4
    78	  |                       |                          |
    79	  |     Span Space        |   Peer Span Space        |
    80	  |                       |                          |
    81	  +-----------------------+--------------------------+
  > 82	        Virtual PCI             Pcie Endpoint
    83	        NTB Driver               NTB Driver
    84	
    85	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
