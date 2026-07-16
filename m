Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C857386575
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 07:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784185469; cv=none; b=QhNMWFK6IN3EmveIfqX/q4eiEmEx2bXaqoCfK1oZcu/k+WhlJvTW0U1I0b2jZ0ZatqI6qaXtRMHwZ68lPF8UDTyx0+qDUvfXaLLa6B4WlK9JV3jlu1YHMSEptD/bV1j2M0UTOjZgehrDimwc7JvNE/s4+qf3Hnyv7+vimNuMmKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784185469; c=relaxed/simple;
	bh=o2nvfTB5ks8yBSN8AtUn4vGS/Ay1sW0cVn4ykxZG5So=;
	h=Date:From:To:Cc:Subject:Message-ID; b=so9eKmVd5tpX7UXcEKlwCZugn/6XCnqe6xxCQG03j1Y9qVm24BXAD6KDhtJTZZXIFyrQj3+XvFL5VwbXf+m88e0iJW7KyioLbtdkRKWeZ00r3ppn37PXKxN1z8SXwl4ervbkbq7J488bKFfbJLD0/NqTtkKwPG3lRbYtGY3SNXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1np8OUl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1np8OUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784185467; x=1815721467;
  h=date:from:to:cc:subject:message-id;
  bh=o2nvfTB5ks8yBSN8AtUn4vGS/Ay1sW0cVn4ykxZG5So=;
  b=B1np8OUl+O78jRWgs3oR2YzYJpNr7a4dFttUWvY2ObJJm/rHKfFJ3JBi
   DWajgJXHeXpuy20hSaMTgOOzy0Z1pnjZpgJGgF47cSz86MlFGIgmP7hYo
   eK89OMoGF8Q8Pcb7SljeuoEBEu88OkD2rhDkyEEeJMhA74Tk1+PF2WFdP
   GTJAYsNEdROztsveunlwDd+Mc2y/9U1ZesmE6oDkN3oC5Ip0woO6rVCeh
   G18Mb8bgpA4CGSO1CTKsQlgA2y2nbRxD2Z1AR33WiL2q5xJFHbt/NIyhN
   tY1ewaJP7kS7nmWkXdQlVAJvinHVxeEzl8UAezlaXgWTi41g3B9K+OPqe
   A==;
X-CSE-ConnectionGUID: 1iic1uL/SrWgXoypnlAG9g==
X-CSE-MsgGUID: vM3GqjyNQgKFw6+mOR4Cng==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102386862"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="102386862"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 00:04:26 -0700
X-CSE-ConnectionGUID: kFNpk3QtTtu0lHlSiJX2yQ==
X-CSE-MsgGUID: jtVKZdUjQ3qodKrZ+eyzMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="294646578"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 16 Jul 2026 00:04:25 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkG8s-000000004VF-3lWc;
	Thu, 16 Jul 2026 07:04:22 +0000
Date: Thu, 16 Jul 2026 09:04:03 +0200
From: kernel test robot <lkp@intel.com>
To: Dave Seddon <dave.seddon.ca@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/admin-guide/sysctl/net.rst:464:
 WARNING: Title underline too short.
Message-ID: <202607160858.yHDU0SH2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://github.com/intel-lab-lkp/linux/commits/Dave-Seddon/net-flow_dissector-gate-BPF-program-lookup-behind-a-static-key/20260716-084819
head:   f64b3df6ea030dea756aeec684e912b5be756369
commit: f1976833abb3facab59bb7c1155abbd1e466dcd0 net: flow_dissector: opt-in fast-path for eth + IPv{4,6} + {TCP,UDP}
date:   6 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260716/202607160858.yHDU0SH2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607160858.yHDU0SH2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ============  ===========================================
   1             automatic adjustment of input current limit
   0             no adjustment of input current limit. This
   helps for more unusual power sources like
   solar modules. [docutils]
>> Documentation/admin-guide/sysctl/net.rst:464: WARNING: Title underline too short.


vim +464 Documentation/admin-guide/sysctl/net.rst

   462	
   463	2. /proc/sys/net/flow_dissector - Flow dissector fast-path per-shape sysctls
 > 464	---------------------------------------------------------------------------
   465	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
