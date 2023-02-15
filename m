Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD72C05027
	for <linux-doc@archiver.kernel.org>; Wed, 15 Feb 2023 02:09:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbjBOCJd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Feb 2023 21:09:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbjBOCJc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Feb 2023 21:09:32 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EE602CC65
        for <linux-doc@vger.kernel.org>; Tue, 14 Feb 2023 18:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676426971; x=1707962971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zP4ttAblnw8iXM07HMhfyGv2UjphiHf+7sruIc6ZC00=;
  b=XAo1PJKBYLso2/VrUI4nTFuka1GQrHpjOWTHW41VKCV8SA90zlpD3wUG
   L9tuwekKy83aQVwyNTgjieIO+5VB8wx0bb6FYUKQJcFWG8IkJH0po9ytu
   oCuCuoRCfgVavcsjYV8JptZ8Pm7DSBIZXQtTagjkec7DDkb9scTW4ImKE
   5kDTPF9ccjeMetCUk3oZoB/lN8RFZ+o1+yokGpjDISfaMpVQXQ3qApnBr
   qmk+Ky+UGJKUGdbr6vECE7xz48KJMJ9q+ut5n0+sxMrt1iJe8SsA/OD6+
   4sMZA9X4RbIXTYiPPs7/kozv1QTf1tZ7QWu7pxukLEea4cPDmsmUFaXUg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="329951276"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="329951276"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 18:09:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="699774245"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="699774245"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Feb 2023 18:09:28 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pS7Ed-0008vQ-1N;
        Wed, 15 Feb 2023 02:09:27 +0000
Date:   Wed, 15 Feb 2023 10:08:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Perry Yuan <perry.yuan@amd.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wyes Karny <wyes.karny@amd.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 9602/12724] htmldocs:
 Documentation/admin-guide/pm/amd-pstate.rst:343: WARNING: duplicate label
 admin-guide/pm/amd-pstate:user space interface in ``sysfs``, other instance
 in Documentation/admin-guide/pm/amd-pstate.rst
Message-ID: <202302151041.0SWs1RHK-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3ebb0ac55efaf1d0fb1b106f852c114e5021f7eb
commit: b9e6a2d47b2565eb450d3ee900fba49cc9b25cbd [9602/12724] Documentation: amd-pstate: introduce new global sysfs attributes
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b9e6a2d47b2565eb450d3ee900fba49cc9b25cbd
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b9e6a2d47b2565eb450d3ee900fba49cc9b25cbd
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302151041.0SWs1RHK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/pm/amd-pstate.rst:343: WARNING: duplicate label admin-guide/pm/amd-pstate:user space interface in ``sysfs``, other instance in Documentation/admin-guide/pm/amd-pstate.rst

vim +343 Documentation/admin-guide/pm/amd-pstate.rst

   340	
   341	
   342	User Space Interface in ``sysfs``
 > 343	=================================
   344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
