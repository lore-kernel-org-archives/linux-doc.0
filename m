Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A1D367F3E
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 07:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042033; cv=none; b=CgzBVfn5neN3QxhRrxxZ+37YB7LzDA2a9cK1qNbnLWf5c3qyQPlFPwZh2Q9KKxHr84dm6OlHR3F/lrUJaDkJ79DbqWedYBC8wzMIxzfLha13xWbSIMPil6zEqesI34QZowGU/F2yjnNQJqW4OX13sUc5XG6WooE6IFt1BnnSS8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042033; c=relaxed/simple;
	bh=s6N1K5gN1Vp6ZxgAgEEGC1mhRtymtwbnZJjPY2GBZ60=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mWYm16mpe+tQdFw+upu6zAAZe+P7vEWWkAJmvbdwG1ptbJYcszLblDTJtkWOn7UNtdQD7ejZFjGLL4qDx1r6cFrzCg53eRb/rRBwvH3SShxEfipQFS2rndi++HY8VA0gn1yUh0doFgbn/UrovVtO6Mw7wOGQDBSFO88lez4D6n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DlW1pogv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlW1pogv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773042030; x=1804578030;
  h=date:from:to:cc:subject:message-id;
  bh=s6N1K5gN1Vp6ZxgAgEEGC1mhRtymtwbnZJjPY2GBZ60=;
  b=DlW1pogvfDNwUTvOu04tBVC8A/Dpe/WKKZaF1E8AohNpwg3tOOml14WB
   LGJxjQVCHuYb3RnB5Gk+HwBPLG32KGEuz/n0xo3Hca5Nm2ah+HnOWYULH
   pYha7si7KIkCkvaLqQSO+HTTPJJ56T6Hpa69uKS5UZb0vloNj0SKVaPyp
   ZrR6spWVzIRt/ES7yUOUiqJzo3w8pDsCFrAF6/1l0bFFtqVxvnXXLsvOv
   C64Df/DArc9pV4HgEwHmb1bAGsIYwUyi9ETnU2wIM1G8lRlEqrjpxX2XR
   YP6cyNjNh796mbKibAFvM/BDrfryvfMvdwX6C+HzYkYrkxclCD0dfUEMm
   Q==;
X-CSE-ConnectionGUID: g3eHd8v3RoKSJFmqFri4gw==
X-CSE-MsgGUID: hyW3tKUVTPqns/8fwHyt2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74136581"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="74136581"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 00:40:29 -0700
X-CSE-ConnectionGUID: qFtH+YsHSUSxjoOQVITYoQ==
X-CSE-MsgGUID: sPhvJFVMR7K2VkGQReNUyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="218814587"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 09 Mar 2026 00:40:28 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzVE1-000000002pR-19jQ;
	Mon, 09 Mar 2026 07:40:25 +0000
Date: Mon, 09 Mar 2026 08:39:46 +0100
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sj:damon/next 139/143] htmldocs:
 Documentation/mm/maintainer-profile.rst: WARNING: document isn't included in
 any toctree [toc.not_included]
Message-ID: <202603090825.WIbGm8S9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   3ea83b53d7252f4231cc33670a6f8b37514055da
commit: 43414b4cb39a85c66e164f34d962e88a143a439a [139/143] Docs/mm: add a maintainer-profile
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260309/202603090825.WIbGm8S9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603090825.WIbGm8S9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:50: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:526: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:166: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:535: ./include/uapi/linux/landlock.h:189: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/core-api/percpu-counter-tree.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> Documentation/mm/maintainer-profile.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
