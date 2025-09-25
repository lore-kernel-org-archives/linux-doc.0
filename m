Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF83D21E091
	for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 16:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758817722; cv=none; b=DBzOG7KEZPFueJhZ9pnqX6aBD8kmRs6Hf1kCiwFXkv0ojSfgWdH687JFpJ+sfmN6Bc+1VaQdaw0INQOE/4RmwHk4k5SybsDoKahKhF14phR5GZHGq2QLCogab+vmw2U2gpUD0iWC1Hj5Bz5aZ+sRQxsVKdSiszk84vVDY/AHUSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758817722; c=relaxed/simple;
	bh=ucV7gX8xfz5WScB2k1Gy2s2JkYDxPtwqUPaVqZIaGTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MAWwGsLo0Q+wHPzKAiPgFwnaKdJ4qkcgF0GXsixtkYMgAGUlVPFsLr4/YQK77JRf230fu/4OuRPLnyDfpExIj00KbDAxBOkckm9YQM0nWCY/a6DEmnaNMj1kDfjNiYAWoY3qKfCIRb3AoJkI7BgZptmOgZ1UjwZlJcernipss8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RmaZuP0W; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RmaZuP0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758817720; x=1790353720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ucV7gX8xfz5WScB2k1Gy2s2JkYDxPtwqUPaVqZIaGTY=;
  b=RmaZuP0WXatqt+0hi73et10hiZIF+PUN3otm7gy1jbaTfqf0GOveOOfA
   ZJoGczzP/cHNY5nGUepe5DrG5dFKdeaKIYHi4CMWMQB61HnNmgnc6cSvx
   iffODvxlgqf0VuMvbMpT0FWhKiaw+EnypgGOVghJ4C6Se9geSBbpBQqTD
   77EuvAtP0N8hTZvWyLlBR2BnN09Zt2sywqzDg+dwENsSff/rPIYYxGF8R
   V4zXHLdUx6vJovNGZiFUjxVMra553qZTjWI2/uYWdTzeXrbCg/66igmeM
   a2sKcXWKCebF17NNNrR/SEO0F8JHIVv8BIB/vTvh+hVmxWdfqGisM+FrN
   Q==;
X-CSE-ConnectionGUID: nAa06HNuQjaup5Bb6e5tbA==
X-CSE-MsgGUID: xaulKvdoQF2pq0Ku0idU+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="60355649"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="60355649"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 09:28:39 -0700
X-CSE-ConnectionGUID: EByHHpsmQEWvbJCYICG5MQ==
X-CSE-MsgGUID: 3HoSZpx+Qiylbed+klJTRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="177767978"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 25 Sep 2025 09:28:38 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1opg-000000004yF-0oaT;
	Thu, 25 Sep 2025 16:28:36 +0000
Date: Thu, 25 Sep 2025 18:27:44 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>,
	linux-doc@vger.kernel.org
Subject: [jgunthorpe:iommu_pt_vtd 3/34] htmldocs:
 Documentation/driver-api/generic_pt.rst:32: WARNING: Literal block expected;
 none found. [docutils]
Message-ID: <202509251829.zcUzDLbw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
head:   24d9e5006c6245cdb220aefbac25ee97bcd36b63
commit: ff9b383d72945d0efde52c71ade75d75ec679289 [3/34] genpt: Add Documentation/ files
reproduce: (https://download.01.org/0day-ci/archive/20250925/202509251829.zcUzDLbw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509251829.zcUzDLbw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/counter.h
   ERROR: Cannot find file ./include/linux/counter.h
   WARNING: No kernel-doc for file ./include/linux/counter.h
   ERROR: Cannot find file ./include/linux/generic_pt/common.h
   WARNING: No kernel-doc for file ./include/linux/generic_pt/common.h
>> Documentation/driver-api/generic_pt.rst:32: WARNING: Literal block expected; none found. [docutils]
>> Documentation/driver-api/generic_pt.rst:33: WARNING: Inline emphasis start-string without end-string. [docutils]
   ERROR: Cannot find file ./include/linux/generic_pt/common.h
   WARNING: No kernel-doc for file ./include/linux/generic_pt/common.h
   ERROR: Cannot find file ./include/linux/gpio/driver.h
   ERROR: Cannot find file ./include/linux/gpio/driver.h
   WARNING: No kernel-doc for file ./include/linux/gpio/driver.h


vim +32 Documentation/driver-api/generic_pt.rst

    31	
  > 32	generic_pt/fmt/iommu_amdv1.c:
  > 33		#include <linux/generic_pt/common.h>
    34		#include "defs_amdv1.h"
    35		#include "../pt_defs.h"
    36		#include "amdv1.h"
    37		#include "../pt_common.h"
    38		#include "../pt_iter.h"
    39		#include "../iommu_pt.h"  /* The IOMMU implementation */
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
