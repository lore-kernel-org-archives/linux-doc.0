Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27878C05027
	for <linux-doc@archiver.kernel.org>; Thu,  9 Feb 2023 14:20:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbjBIOUw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Feb 2023 09:20:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbjBIOUv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Feb 2023 09:20:51 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17CC85ACDC
        for <linux-doc@vger.kernel.org>; Thu,  9 Feb 2023 06:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675952445; x=1707488445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1aIgKfi7FLPmyt9vn44k+K91rfKCHW0+3TG1PtwWhkE=;
  b=ROcG6EXGcgqK+SpZBsVmdmRPDyhxuXK++RT71BN5X3LYuKOBxIV9wa13
   9TpjmT91+TjqyWY6UZRIoGnXAghlvZWnFw2xpGi4M73Dd50wPKuI9SDNq
   A2g4mu3byn5LkhYPY8o2CoS6Zl7bKae5qxjG3SU69OOeQxoQnu3XjsIcA
   gkBJuhN0Y2i4r4QNca+wxClMeGv6xuMG0IcF+5H0SIYS+XeByXycecgOa
   OLv2KTLWToU8p2XpAZj8U6x9h8AUyZu9mMF35PyPJutUA6Vosz6m0gv6W
   Sa7aTx4X5jyYI8K2gqWrD+sXrtDKzXEfvmCZWo66GVDP13gbOK6SMvvbb
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="416337850"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="416337850"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 06:20:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="617586064"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="617586064"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Feb 2023 06:20:43 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pQ7n0-000578-2r;
        Thu, 09 Feb 2023 14:20:42 +0000
Date:   Thu, 9 Feb 2023 22:20:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: [linux-next:master 11330/11577] spdxcheck:
 Documentation/sphinx/templates/kernel-toc.html: 1:36 Invalid token: #}
Message-ID: <202302092211.54EYDhYH-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20f513df926fac0594a3b65f79d856bd64251861
commit: c404f5d4f0993e9d75a4de5a91280e9cb2419281 [11330/11577] docs: Add more information to the HTML sidebar
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302092211.54EYDhYH-lkp@intel.com/

spdxcheck warnings: (new ones prefixed by >>)
>> Documentation/sphinx/templates/kernel-toc.html: 1:36 Invalid token: #}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
