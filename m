Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CDB33F8C4
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 04:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785471367; cv=none; b=nh5zSgtJkhlbBFX/8iz2fXgBZT9NqFQrDJtsIRGJwSGDgZ89FBPu0hYDlbvTx6UGrXYnxdB7VSXAsMnuByjAIQuUBSpYh74bZ/bFHOwzWpvBc/U+MGRpvRwBf2K6uS3o51cViAo3BXUwOf7xjBvthzdJ55I1TMqg8fE4VgYsjiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785471367; c=relaxed/simple;
	bh=LsxkVPRtkZTaPU/USRjB/LRcV1a719dtaCqmcGV7r4o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hP2HjHyhq1MPGr3p2wOMxSw3GCCMyJNvbsc9Tq87cVFVujWDSszU733kXGzoxR5wM5gB4BSxoFV1ZEsB2ZyK/nTb1BdwlVeRYLzPPOGNHUqytHj0BYfGtOXpiIF7qRKdSI2Mip8s3Z7JulH0MP+CbMAXOE8Npmu/AZ/rLGv4MVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPKMq2d/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPKMq2d/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785471361; x=1817007361;
  h=date:from:to:cc:subject:message-id;
  bh=LsxkVPRtkZTaPU/USRjB/LRcV1a719dtaCqmcGV7r4o=;
  b=KPKMq2d/a23hBMSVLZwolkhhu7venF2JVGUvj6D6VGhcYtkIBTIC7CF9
   5Go7D4nrstaz1f/MsUx7fazP/YssoggiRsSUpTUmDDQYX9F7NeiWozciC
   L5BUT68/OpMraNXbRe3CdF2FMXrbJq8tsFR4rN4KZ1Eoltb0rGwb/3IQw
   P9u0xZqMFZRn9Iu0A/miiWLznqJnsN1OeZxFdpH87qCQgiWMcO0W9C97y
   5spLt4qX8JZHi0di+lJN56UaWOqKkDyPRr8qlfWACKhrQIRxcdHu2/S/v
   dkXkU684TRepTHC0mX0KVKcuQbH3jEF0ciR0KwB1ZmSjnWJFsQoBC2kx5
   A==;
X-CSE-ConnectionGUID: bBSRUkbES3C2WvE2VQ7NCw==
X-CSE-MsgGUID: cAe+ZBnLRwy7LOviiUoVRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="85863148"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="85863148"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 21:15:57 -0700
X-CSE-ConnectionGUID: 4IFtjd3TRUyV/XhB4MblRA==
X-CSE-MsgGUID: BqP3YaHTSNCrq5O4amOblQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="265542220"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jul 2026 21:15:56 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpef2-000000002Vu-3PCt;
	Fri, 31 Jul 2026 04:15:52 +0000
Date: Fri, 31 Jul 2026 06:15:36 +0200
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [mcgrof:blk-iobuf-pool-v5-premap 13/14] htmldocs:
 Documentation/block/iobuf-premapped.rst:3: WARNING: Title overline too short.
Message-ID: <202607310621.ad6YfVnw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v5-premap
head:   798d9d9ed550e23049025d753032582e1f289d78
commit: 53c4f015ffc5b28880d0b68c36d99a86f9814743 [13/14] Documentation: block: describe the premapped pool-buffer design
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260731/202607310621.ad6YfVnw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310621.ad6YfVnw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ============  ===========================================
   1             automatic adjustment of input current limit
   0             no adjustment of input current limit. This
   helps for more unusual power sources like
   solar modules. [docutils]
>> Documentation/block/iobuf-premapped.rst:3: WARNING: Title overline too short.


vim +3 Documentation/block/iobuf-premapped.rst

     2	
   > 3	==================================================
     4	Premapped pool buffers and the NVMe command ceiling
     5	==================================================
     6	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
