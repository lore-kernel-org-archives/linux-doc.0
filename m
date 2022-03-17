Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBA4C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 23:22:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiCQXXv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Mar 2022 19:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiCQXXv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Mar 2022 19:23:51 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F619292DB5
        for <linux-doc@vger.kernel.org>; Thu, 17 Mar 2022 16:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647559354; x=1679095354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jc6u+e+/nsrFbaWcKXUa8+O304oMT8khbWT99XecSuo=;
  b=nxBOYAJojLBYU8UYrWLcrAzUT5hk4MOVh0bTDLFGDuAlWoTLMOBdiIsb
   I3aR2Z5q8+AIU693YW1Ml7ITLnklrQZJiW2pJuJ0mAmKFKwYfL8CQLeBp
   Nqa3eIo9zNy9W+4rHjhlerJzBM9VML+fy1E+8BCu647KmxbkcsE7Ihiwg
   INCulCd6hjtbSn7lgMjou46EGNUpnhLk+CkWlXEg2DKyXsu+EwGi+vvSO
   uWQbdTmgeP4tJkGyqCwBHRFldS5tnaXmEjnLu8+qZc03g6Xxdqzh3sX7g
   pUge170VtJK1sc/+tMChl47JYyigkq5DzphnGJBw4VW4atxCTDIDR8c62
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="343439632"
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; 
   d="scan'208";a="343439632"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2022 16:22:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; 
   d="scan'208";a="715227477"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Mar 2022 16:22:32 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nUzRw-000EDW-3S; Thu, 17 Mar 2022 23:22:32 +0000
Date:   Fri, 18 Mar 2022 07:22:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Christoph Hellwig <hch@lst.de>, linux-doc@vger.kernel.org
Subject: [linux-next:master 11519/13392] htmldocs:
 Documentation/driver-api/nvdimm/nvdimm.rst:146: (SEVERE/4) Title level
 inconsistent:
Message-ID: <202203180707.vLUjjmqY-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   97add482e9033a9386baa8824fbea34d0cbfe663
commit: f8669f1d6a86a6b17104ceca9340ded280307ac1 [11519/13392] nvdimm/blk: Delete the block-aperture window driver
reproduce: make htmldocs

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Documentation/driver-api/nvdimm/nvdimm.rst:146: (SEVERE/4) Title level inconsistent:

vim +146 Documentation/driver-api/nvdimm/nvdimm.rst

   145	
 > 146	PMEM-REGIONs, Atomic Sectors, and DAX
   147	^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   148	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
