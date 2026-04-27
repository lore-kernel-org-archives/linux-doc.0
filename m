Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B3936D9E7
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 21:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777324612; cv=none; b=B3rqD8jssbzYaDb0Zfnfu4SVTvrmY6DcfQYyobKi72RzTA8qVugToujSTU2VL7k4EendWnJLvGkFXW2xGPirZAo93bNdCWepfliY/1WLfRywCGw5rY4mUDsv3KHTiJ+bZpvLJk/taY1+rrIlQv5vBlSRT7FQhJ4PdfYbPTyTwd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777324612; c=relaxed/simple;
	bh=u+4sSE/wC3DJ8IGUCML/YlVCtl4nbBXifHxr88IqSAk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kDFx4IGXyMXTSLegSnCwZrMda92Wiv8FEG89xFQKpoHC9zXkWrJwvIJkXguPIvPdtG39M5Ztgf+vmQw6Nmenjs3MyLeNlaFdP1PrhmIog8X3eDwQz4UKn5PF56f/ISLeAYTcfZ4RYRwq5T38FEFXHR+ZptPmsbXeI6FHx/t5OBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4Wc6g4C; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4Wc6g4C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777324609; x=1808860609;
  h=date:from:to:cc:subject:message-id;
  bh=u+4sSE/wC3DJ8IGUCML/YlVCtl4nbBXifHxr88IqSAk=;
  b=R4Wc6g4CLNwbfl924nOCo9RKRrNOdM+ADvnvyoPSS9n9RRCu/C/Mjj/b
   BDui+QpFASvUrl5UnMS8RKdDyyXV8h6VnnJWfSO1d6wC0PR4UqAyJPM5C
   HHwHyY3exqmMGi45DYUqt23xe0+rXK7/eHuTJF8uLAb26DfYkWbM8XUAI
   ce5MwpbQR9TBEwWlI/s8v0Ri1I19Ontlg7XSfVh3obtRMP/o86ZkktUpW
   GSAwphFH5y412LVhdwqr40SMxWhNmMbq4E7kGAyB3NakKbUJlbuPfhB1/
   ZtDL4AEpd9c3nyk5/4+J0c2Oti7m0J200DbLtuaFl/f028XwPLoCzOVEa
   Q==;
X-CSE-ConnectionGUID: uHbweZdVTy641OWtmifHMQ==
X-CSE-MsgGUID: zWVpoiZESj2YPA07lH3cYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="89604569"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="89604569"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 14:16:49 -0700
X-CSE-ConnectionGUID: g/KijVH0RNiPtoieZXpecQ==
X-CSE-MsgGUID: zcCED0JuRF+7qnbrDrJGDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="233654290"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 27 Apr 2026 14:16:48 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHTJt-0000000045R-0pBc;
	Mon, 27 Apr 2026 21:16:45 +0000
Date: Mon, 27 Apr 2026 23:16:34 +0200
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neil@brown.name>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/filesystems/api-summary:20:
 ./fs/dcache.c:1910: WARNING: Block quote ends without a blank line;
 unexpected unindent. [docutils]
Message-ID: <202604272309.Nue7qT8A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://github.com/intel-lab-lkp/linux/commits/NeilBrown/VFS-fix-various-typos-in-documentation-for-start_creating-start_removing-etc/20260427-151003
head:   989c95f0a551cdbd2b85117c355692edaee0ce66
commit: 2ae54ee8619822df7b7a2026016dc461c69ec6aa VFS: add d_duplicate()
date:   14 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260427/202604272309.Nue7qT8A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604272309.Nue7qT8A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: ./fs/dcache.c:2884 function parameter 'parent' not described in 'd_alloc_parallel'
   WARNING: ./fs/dcache.c:2884 function parameter 'name' not described in 'd_alloc_parallel'
   WARNING: ./fs/dcache.c:2912 function parameter 'parent' not described in 'd_alloc_noblock'
   WARNING: ./fs/dcache.c:2912 function parameter 'name' not described in 'd_alloc_noblock'
   Documentation/filesystems/api-summary:20: ./fs/dcache.c:1909: ERROR: Unexpected indentation. [docutils]
>> Documentation/filesystems/api-summary:20: ./fs/dcache.c:1910: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:707 struct member 'boot_time_crc_info' not described in 'amdgpu_display_manager'
   WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:707 struct member 'boot_time_crc_info' not described in 'amdgpu_display_manager'
   Documentation/gpu/amdgpu/display/display-manager:47: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:61: ERROR: Unexpected section title.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
