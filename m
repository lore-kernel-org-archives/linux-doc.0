Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EA7FCz0R"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC21195
	for <linux-doc@vger.kernel.org>; Tue, 21 Nov 2023 18:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700621121; x=1732157121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+SRKTY82F5RwG3K6X109BY32eywlj2KI1nBKJq1iZnY=;
  b=EA7FCz0RL15j/jaQSHw8omANQZSupQSXbbe9ojpLN5yymT3G2Iu9P+fr
   5wcNg2sk9z2juCup2UmwVzjaqUnyskVHoiPrDuFUdBnJ9aDuFWloI+PID
   N6WwZWXcQiX+23OPx0w8wL/kRzIN+Cy1lNG2gu0rbBFhpT+XkVsuNLHkI
   UKYMGGqq436Qb12nAwc/or2HjSYjiEvlLv/T7s+7L6g/JIKiq27MmvANA
   ipyw/zCQkxoI7PfEoEiR/FYpS2wrPAwsx1W1jcVOHaEoI5RbWqN7E1bY2
   b+dlGmnGBs5J9go8BORLc6ugoiDNVCTictRbeAWaqEEuWk9YjaCIWR1yB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="372142829"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="372142829"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 18:45:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="760300438"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="760300438"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Nov 2023 18:45:19 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5dDQ-0008ZA-0e;
	Wed, 22 Nov 2023 02:44:42 +0000
Date: Wed, 22 Nov 2023 10:36:36 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>, linux-doc@vger.kernel.org
Subject: [asahilinux:bits/200-dcp 126/145]
 drivers/mux/apple-display-crossbar.c:22: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202311221053.cOjeBbia-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   e3a82f03cd81edb4608ab6dde0e073ac91e2fdb8
commit: 592b58213f6556b76911d71b22f1d1de1e1a88ac [126/145] mux: apple dp crossbar: Support t602x DP cross bar variant
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231122/202311221053.cOjeBbia-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221053.cOjeBbia-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221053.cOjeBbia-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mux/apple-display-crossbar.c:22: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * T602x register interface is cleary different so most of the nemes below are
   drivers/mux/apple-display-crossbar.c:44: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * T8013, T600x, T8112 dp crossbar registers.


vim +22 drivers/mux/apple-display-crossbar.c

    20	
    21	/**
  > 22	 * T602x register interface is cleary different so most of the nemes below are
    23	 * probly wrong.
    24	 */
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
