Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90BE2F12AF
	for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 19:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775849595; cv=none; b=EsqM9HOvmp+qGi0CaVwOycGTzgE/Bo6LUw50099VnWBJpuSNORVVfu4UgnqhCcRNR7SVj0AjAAs9UE5SMWjcfJ8EhSUpT4aqlL0FS83qH/TLTUGUmoJozwH+JkRCc1+P9iXFgd7oDU0qHkgM54zjejvWDPhibez4ygLOWkb+KGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775849595; c=relaxed/simple;
	bh=83DFVDfbTAkMVEKyJxHHXQGOfjBlnMzOb21MQh9T5T8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CqCKhdz/hr6JpGLowVPfOGj7b34bUZ6oPvshwRdFycewdUCpGZWWpUSdV34JSfgDGKxbdUQWrRB8NTK97hmNVxAF4k+ZU5OD7GNTXa6ePHZPyCtWgZdvmBsPRxozyLzTlhlDUbckzcZJeHcDj90hl9NYjeHC0fL3YE4JPkqs8wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h6N2CP9Z; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6N2CP9Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775849594; x=1807385594;
  h=date:from:to:cc:subject:message-id;
  bh=83DFVDfbTAkMVEKyJxHHXQGOfjBlnMzOb21MQh9T5T8=;
  b=h6N2CP9ZUbYX07SbPRfwvyd88XRz6rFfjmbFJYvO/hwKXyk026nmL4KJ
   7rE7oSaWNUmQt0UlHjj6rgKm/BR5Ib8TuNj4Q0ggKnnkzq1hrwXxKsTgl
   VTjIqAf4hjilJf2/EsHoVpc9k+3qxZswpSTOvLbKelzrmGmz/3E2aimoF
   GQ42yEL5TB4Jb9D76lHiJzJ29QGlDowJ+fnMeKv0JXcDBkzIRaFW751VR
   +VWeU2dPY3VeoTJqPt+N4ZcQtp+HOPAIrbMDAgSvqhCbfiaYJMEApNtuq
   AVOPavDW48frU62uJgQ9UUSZ09KMH1MrwzsO+VzcU2sVdqnD2sEVN5/VM
   Q==;
X-CSE-ConnectionGUID: +FubgnG/RyO7VorjbN3nNA==
X-CSE-MsgGUID: aJWzE2roRZ6fyISEsnN+ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="80740392"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="80740392"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 12:33:13 -0700
X-CSE-ConnectionGUID: Ji55n8/GRYuEJTH64BgxCQ==
X-CSE-MsgGUID: l6f3G/jZQR+48+PTQgiiqw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Apr 2026 12:33:12 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBHbJ-00000000AwM-42s3;
	Fri, 10 Apr 2026 19:33:09 +0000
Date: Fri, 10 Apr 2026 21:32:38 +0200
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/scheduler/sched-arch.rst:108:
 WARNING: Block quote ends without a blank line; unexpected unindent.
 [docutils]
Message-ID: <202604102139.zj1yx5qc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/sched-debug-Remove-unused-schedstats/20260410-192441
head:   ab0b22aae278e62b46dd1b9bbc54f81d48eb7922
commit: d4c12cd241b1a892722ed07feb9114c23717202e sched/docs: Document cpu_preferred_mask and Preferred CPU concept
date:   8 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260410/202604102139.zj1yx5qc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102139.zj1yx5qc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Checksumming on output with GSO
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
   Documentation/scheduler/sched-arch.rst:107: ERROR: Unexpected indentation. [docutils]
>> Documentation/scheduler/sched-arch.rst:108: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/userspace-api/landlock:495: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.


vim +108 Documentation/scheduler/sched-arch.rst

   102	
   103	Notes:
   104	1. This feature is available under CONFIG_PARAVIRT.
   105	2. preferred CPUs is same as online CPUs until STEAL_MONITOR is enabled.
   106	3. A task pinned, which can't be moved to preferred CPUs will continue
   107	   to run based on its affinity. But no load balancing happens
 > 108	4. If needed, steal time based governors/arch dependent method
   109	   could be used to cater to different types of cpu numbers.
   110	5. Decision to use/not use is driven by kernel. Hence it shouldn't
   111	   break user affinities. One of the main reason why CPU hotplug
   112	   or Isolated cpuset partitions was not a solution.
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
