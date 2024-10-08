Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF2A2B9A2
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 04:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728363398; cv=none; b=pECDR7Et1gFR8BGrscPLSzAKUxFN9FRQOP6Tpu5LAYGo5JEb5MV0YOueDH7m52tGWrFOhpVsx43BmUPN7ICGm0uv5OGs5F7dmR8TPxshXoIvf+Wh5Svz3VkQR3Sjby2hitAVDejPua6dd4JQB94quDyrAHSWeBmct1K2twrwhYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728363398; c=relaxed/simple;
	bh=bIwUsWAaVG68f7YrGqUZ+qczlVf2YXskoKAb2wBB+8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tndq0hzpG6jm2K0QZ+/+sme1VQKDEzbw77H6WQEUpizQVGtwTJOHY1iBROetfmnVLsy+oh8f7Gj0DYm8kuxxtOh2oOTCQ5y/U+gIQ/fX0fVXPEJAljfXUwb104MjA4oPy3UCIRqW63mkWvM0n0CZ5oLxmnZkY4OcTy3mEOvHIjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFaj06Gz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFaj06Gz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728363397; x=1759899397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bIwUsWAaVG68f7YrGqUZ+qczlVf2YXskoKAb2wBB+8o=;
  b=AFaj06GztB43zuT2W0/R0I+DnSNPSTNsy9LfVlPijqFdR43KFz6mXI5M
   Ye1NtlOH/DlO+BJ8Gkd1RRlNy0eyA1O5ITX2Is5eB7/rQC4UJ7zXKlFEH
   ZUaBQ2SyxHQAL0w96jALALQMeoJYo5YX4Em4mnkoqjfKRE6fyVZYcsQuM
   a8MoZ/0N4bLKLHzB3mMH0GCeUlWgpJWTaHYApgtigcRKKoA4KsGXAjkzt
   i/nD4KN1N0jDCD9mAbiiBydlvj7OsvbZKkTJ/kqud0a7NbN9Vi3qXP6l+
   nENMtNwvp2jZoJAi/+8fCwPNtLXk8NIo/jJdRLIVwDMJRnjHiDm+7R+B3
   Q==;
X-CSE-ConnectionGUID: 0jzCGZazRFOCat8maCPJ+A==
X-CSE-MsgGUID: YD7M8zSxSg6DjaFVqooy0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27415239"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="27415239"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 21:56:36 -0700
X-CSE-ConnectionGUID: RSLP3RfRQteYgRnDngDtMQ==
X-CSE-MsgGUID: sKbDJhRcRbe5ITHCwv98pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="75268331"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Oct 2024 21:56:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy2Gu-0005um-0y;
	Tue, 08 Oct 2024 04:56:32 +0000
Date: Tue, 8 Oct 2024 12:56:12 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [morse:mpam/snapshot/v6.12-rc1 118/132]
 drivers/platform/arm64/mpam/mpam_resctrl.c:33: warning: This comment starts
 with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202410081205.fWnQWzOX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.12-rc1
head:   4d17b37b670795954fd7a70c8ec83fb705a5e2ad
commit: 314b33cc62a7bde4630377feb15d2fb6cac0b4f2 [118/132] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241008/202410081205.fWnQWzOX-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410081205.fWnQWzOX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410081205.fWnQWzOX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/arm64/mpam/mpam_resctrl.c:33: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * The classes we've picked to map to resctrl events.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +33 drivers/platform/arm64/mpam/mpam_resctrl.c

80cb7de1ff47de James Morse 2019-06-11  31  
2fbb5c77e41e1d James Morse 2024-05-16  32  /**
2fbb5c77e41e1d James Morse 2024-05-16 @33   * The classes we've picked to map to resctrl events.
2fbb5c77e41e1d James Morse 2024-05-16  34   * Resctrl believes all the worlds a Xeon, and these are all on the L3. This
2fbb5c77e41e1d James Morse 2024-05-16  35   * array lets us find the actual class backing the event counters. e.g.
2fbb5c77e41e1d James Morse 2024-05-16  36   * the only memory bandwith counters may be on the memory controller, but to
2fbb5c77e41e1d James Morse 2024-05-16  37   * make use of them, we pretend they are on L3.
2fbb5c77e41e1d James Morse 2024-05-16  38   * Class pointer may be NULL.
2fbb5c77e41e1d James Morse 2024-05-16  39   */
2fbb5c77e41e1d James Morse 2024-05-16  40  static struct mpam_class *mpam_resctrl_counters[QOS_NUM_EVENTS];
2fbb5c77e41e1d James Morse 2024-05-16  41  

:::::: The code at line 33 was first introduced by commit
:::::: 2fbb5c77e41e1d69f15a17b6a4b6ae7e5e492d4f untested: arm_mpam: resctrl: Add support for csu counters

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: James Morse <james.morse@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
