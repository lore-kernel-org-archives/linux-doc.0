Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7593C3D5648
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 23:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777592505; cv=none; b=QtSYdEz9/XpzkGR1C/SWUoaYqNJ6xRniEC73U+8cUTZ2BkYG32w09+GFOKEBFPCJSG3BtabhPEAbio1cTfDDNAxJ4bt7X53RuGJ/Tjh91tM2HNF6q0hOOCsPbm7q6DjVr3fhyT/BeVwvEwwjdjYlQgkEIG5T44rCT9novJKgvbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777592505; c=relaxed/simple;
	bh=jd2x6vdEU9+Er32nfPL8uxQwfozW4OhVHZbtEFlvhys=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VAVVV4oaHVtPyHurdYT1yyfVRyECskY3KqC0lR6UnikOrKipVceAeLud2KDog5/dHNlh9eQiBrT21FqfKOr/EWqDXWG5HiBUTGcCO3HC7SkyekSiyrljhwFKo0ZbmFtCsGbyV/iaiiv6qSwIkP9vqP1t960hh0DGPCABCtjWWPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqvNGFVM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqvNGFVM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777592504; x=1809128504;
  h=date:from:to:cc:subject:message-id;
  bh=jd2x6vdEU9+Er32nfPL8uxQwfozW4OhVHZbtEFlvhys=;
  b=fqvNGFVMAiUe9pPG4W7LHKfui+sQkyQ3Rf5QvjptFODw5iVO/KwKFynZ
   iDFEHWEcgi1lahWP8TtLTLO7ID4H6C5/+DLLhurlBC/NMtKjxg0xPJm03
   f7oQMRNg1V1BTx5zYnaSKpFreFHveobX+fWhgaOffTMZ87i8exYwrOBzq
   FT2NdK2tUitdxmCbkRO/DIZ3H7WzMVlQI/1yFjdXZq6kYPnRSO+nRuHo9
   FPGTWTQak1phKZhGMsMkC/nZEgKVdHG7sNA932hDxyuaLMckwFLgwlxJX
   D6U0WaZcsikyqfX0BnHNDkrxGg376nfH8rVs+j8+LJLOZpuipNVSR0PIi
   A==;
X-CSE-ConnectionGUID: 45FpPtMNQRGve+JY0ktkBA==
X-CSE-MsgGUID: 2FnffXG0QBeyBWBui4xDwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="101227026"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="101227026"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 16:41:43 -0700
X-CSE-ConnectionGUID: jby3hAI/RA+3MDSESfZMdg==
X-CSE-MsgGUID: oXkS/F4sTAeo9Vio0MmnPA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 30 Apr 2026 16:41:42 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIb0l-000000004vJ-3VsC;
	Thu, 30 Apr 2026 23:41:39 +0000
Date: Fri, 01 May 2026 01:41:02 +0200
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/mm/page_consistency.rst:3: WARNING:
 Title overline too short.
Message-ID: <202605010130.g1LN76K4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://github.com/intel-lab-lkp/linux/commits/Sasha-Levin/mm-add-generic-dual-bitmap-consistency-primitives/20260425-172649
head:   96ac11ea3e2d687dc18b3eb7947de3f47a1b33b7
commit: e7a5777f036f13ed16962d7480548c9c52d624bf Documentation/mm: add page consistency checker documentation
date:   6 days ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260501/202605010130.g1LN76K4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605010130.g1LN76K4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Non-Preserved Properties
   ======================== [docutils]
>> Documentation/mm/page_consistency.rst:3: WARNING: Title overline too short.


vim +3 Documentation/mm/page_consistency.rst

     2	
   > 3	=======================
     4	Page Consistency Checker
     5	=======================
     6	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
