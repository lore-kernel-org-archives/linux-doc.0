Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB858C05027
	for <linux-doc@archiver.kernel.org>; Sun, 12 Feb 2023 14:56:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjBLO4t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 12 Feb 2023 09:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjBLO4s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 12 Feb 2023 09:56:48 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCAA7A85
        for <linux-doc@vger.kernel.org>; Sun, 12 Feb 2023 06:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676213807; x=1707749807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yFNinxfcD9dDDlRx3ob1v4ZBndSVc6C/xhSprT6FREQ=;
  b=Q9kDuA07kR7uMvvaDjeEu90e3GdEtZb7zFHzKkOn4xhNw3Tt9rqxSkp2
   6pi6Oj9wqxa8r3faMCpeTZkmkXB576dxcCKOvOBC1a0bY/wte06TPQ9Ym
   AwXCl0acjh7zgnjxW5PWjTiKSVK5ZNXMQwfdtfdMsDJb2zKzqbA6C4Yxb
   gfTtwafY+5sFu66AP8D5FRg1H0u8z/97nAZM62DesqF9W/PgyICyojLSg
   jHLkJFKrUgIm0q3vckWteR65QQMGn6iAG70NjwJ2L8MMIWtbyHiMr+oQG
   fFqFDlzJv4viXXhC/FUwfuU4F89SSU6Nvojq24YoshZp4q4RhH535p6wH
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="311081745"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="311081745"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 06:56:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="757294000"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="757294000"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Feb 2023 06:56:45 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pRDmX-0007Fp-0C;
        Sun, 12 Feb 2023 14:56:45 +0000
Date:   Sun, 12 Feb 2023 22:56:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/admin-guide/thermal/intel_powerclamp.rst:328: WARNING: Inline
 emphasis start-string without end-string.
Message-ID: <202302122247.N4S791c4-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/bleeding-edge
head:   a6f8eedce38d194452c40540af6cc9cc2a035133
commit: ebf519710218814cf827adbf9111af081344c969 thermal: intel: powerclamp: Add two module parameters
date:   3 days ago
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/commit/?id=ebf519710218814cf827adbf9111af081344c969
        git remote add thermal git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git
        git fetch --no-tags thermal thermal/bleeding-edge
        git checkout ebf519710218814cf827adbf9111af081344c969
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302122247.N4S791c4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/thermal/intel_powerclamp.rst:328: WARNING: Inline emphasis start-string without end-string.

vim +328 Documentation/admin-guide/thermal/intel_powerclamp.rst

   326	
   327	``cpumask`` (RW)
 > 328		A bit mask of CPUs to inject idle. The format of the bitmask is same as
   329		used in other subsystems like in /proc/irq/*/smp_affinity. The mask is
   330		comma separated 32 bit groups. Each CPU is one bit. For example for a 256
   331		CPU system the full mask is:
   332		ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
   333	
   334		The rightmost mask is for CPU 0-32.
   335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
