Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68440C74A5B
	for <linux-doc@archiver.kernel.org>; Tue, 21 Mar 2023 14:47:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbjCUOri (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Mar 2023 10:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjCUOrh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Mar 2023 10:47:37 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA8F3C7A0
        for <linux-doc@vger.kernel.org>; Tue, 21 Mar 2023 07:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679410056; x=1710946056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rHn0A16eRRdJGsvUnVN5UvEFtbXyk1gSHaxmJe+NpFs=;
  b=L+n6oAxDmAtJaKCPnzfy9fEnuMwqzWIlxriygv37zSzI3npFFwkwFP21
   kIVo/fRbn8Z0jAnLBIl9SJjb2C6AhtRcDBQbkObnUMmj3eIKBViyIbYdm
   6lmls9K7JdvUj/YFusu4suIvq0Md0h2cj8kwXBQ6M0SZc9QOc5GrhUuuy
   cs+8lU6y1ubojhuK/gkLzpx8JiujTrpLjBA6HFVeG8Axo7TjpIYQExE7T
   Q1ivnqe7hZ0J8L5Vw/iKrnwA2tVuIzcLXQ6fKGv2R6/KuhzTLymd2SfQ3
   vdLtTRjOXSsLN3HLu6vORA4mWVD3iYayZF+rrvVfiYcUbCu++F3xANpoK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="401525852"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="401525852"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 07:47:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="927441037"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="927441037"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Mar 2023 07:47:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pedGv-000C1i-3C;
        Tue, 21 Mar 2023 14:47:33 +0000
Date:   Tue, 21 Mar 2023 22:47:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Paul Moore <paul@paul-moore.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org
Subject: [linux-next:master 5032/5297] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/ABI/obsolete/sysfs-selinux-disable
Message-ID: <202303212204.3G5mRatJ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f3594f0204b756638267242e26d9de611435c3ba
commit: f22f9aaf6c3d92ebd5ad9e67acc03afebaaeb289 [5032/5297] selinux: remove the runtime disable functionality
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f22f9aaf6c3d92ebd5ad9e67acc03afebaaeb289
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f22f9aaf6c3d92ebd5ad9e67acc03afebaaeb289
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303212204.3G5mRatJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/obsolete/sysfs-selinux-disable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
