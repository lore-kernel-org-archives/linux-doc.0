Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513B7C8D2
	for <linux-doc@vger.kernel.org>; Sat,  6 Jan 2024 18:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjAHWlNA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704564844; x=1736100844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dxgbiJJPli18abMINfVIkcbSxwzAv3qc+We1IbGMIIs=;
  b=OjAHWlNA7Ass5xgVbi3ebXS1vDwtwZWT59KE+AhBwJauG5y/C4BOFvzU
   FF2qP063Fr9cc4SzhcVPom21qFllAW+anAD25G7uKfVzsclS1CcFBrEpR
   hPg4JSMr8wkQoXv7JRcOHSDGwPi2CX8ktI3EPg2CriBcm6kFrxe+Ci6B8
   rkqZmvjEDIk0e63Xm3bKCG8Qe33BEVuEH3ODb3HXUNkw1hFFcpvNEw75Z
   xEViXWx3l4MA2NF7MTi/bN4TM17+KhLQfYSb22Rgtos1WvJtepJMLnedW
   Gl1dMmOvHp06fd83BPV+8ACGN/guu/1CaU8oWRrOpzzmh8UbaOgCHVwto
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="388126907"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="388126907"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 10:14:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="851406126"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="851406126"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 06 Jan 2024 10:14:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMBBI-0002qe-0C;
	Sat, 06 Jan 2024 18:14:00 +0000
Date: Sun, 7 Jan 2024 02:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 12610/12662] htmldocs: Warning: file
 Documentation/ABI/testing/sysfs-platform-silicom#20:
Message-ID: <202401070202.BQvPxgyp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e2425464bc87159274879ab30f9d4fe624b9fcd2
commit: f24945c77ed4c57b602632b9e3cbf5752e202a6f [12610/12662] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
reproduce: (https://download.01.org/0day-ci/archive/20240107/202401070202.BQvPxgyp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401070202.BQvPxgyp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: file Documentation/ABI/testing/sysfs-platform-silicom#20:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
