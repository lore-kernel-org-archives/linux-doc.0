Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54BB3D6CCA
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 07:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534903; cv=none; b=GK9DllXHK1HyvQqBTw+yMJOcOR0yOHZrVl1YJR8QGYI4EzrVRt7VD5bOsrXFuTj00fEoHdsER8SEkDCs/5DeF53GdAJie7/CH66z2cqunykngOYW+rMNsmf9RWkkoKDYLhgdbGpxhR4H+v0mnbPT3OFht3KcOvOAPEOYcxJOKJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534903; c=relaxed/simple;
	bh=NhcLqxcpLm0J/32RdPm/m9AhEToFc0PuMiDWubonxQs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h9V9ecp43QxBxuc0O83a364tcP8LbJYO7emhWYFCvE2CGWOS79cZaCeqVtPQ5yLcjwo/v+8+BTqJUJH83FH5wQWGfzRkJ46gU1ch72cxBUoTayVG2sBjYpGsReElpX3Om2Fn4i0KSR4wUoLqCSFd5uSsxgPTTvKrFcMoHMB31zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHjC4bAw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHjC4bAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777534898; x=1809070898;
  h=date:from:to:cc:subject:message-id;
  bh=NhcLqxcpLm0J/32RdPm/m9AhEToFc0PuMiDWubonxQs=;
  b=bHjC4bAwpdZnuesRWs816MG73xeX9OxrxEjJBRPOkXYUTYQ5EW32Khek
   csVSrJo+jc0tJDvoslyYw3IiXfNTmF2ZqBJnfiFHduPySI4itL1Rwe5Mc
   EwLhSUpxhOOkJjA/mNiyosLFToTO7wmWrI/lfbG6s+t+5QlEg1u623Ccu
   MZkSY6j2uQNcb3Yf8ie70MBmSdbH3NAVZRdBCDevVgBPi308PmPeH72VS
   FQQiOpNu75CrgAyIJPlF2HvF5b7t78WL8tfTqfDH9gCiMulFXVb9USivW
   /4oF/l3ARHp9dbqyIwwj5abboIlJMkvSmlxcdi/04iYwkunCghOP/OP7q
   Q==;
X-CSE-ConnectionGUID: DZ9LeKHLTdebrii2hDy9RA==
X-CSE-MsgGUID: 4RjFegWqRk+nlNvVl3aHsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="88790268"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="88790268"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 00:41:35 -0700
X-CSE-ConnectionGUID: uAid3E/GTze7qPkw8iwzfQ==
X-CSE-MsgGUID: SLf8sj4VSSqhXoQNPfvF/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="258088621"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 30 Apr 2026 00:41:33 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIM1b-000000004lt-14fF;
	Thu, 30 Apr 2026 07:41:31 +0000
Date: Thu, 30 Apr 2026 09:41:24 +0200
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/networking/device_drivers/ethernet/index.rst:10: WARNING:
 toctree contains reference to nonexisting document
 'networking/device_drivers/ethernet/smsc/smc9' [toc.not_readable]
Message-ID: <202604300931.XuSzPxr8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andrew-Lunn/drivers-net-3com-3c509-Remove-this-driver/20260424-104110
head:   9223eb1499a6a614ff3744386dc2b772907adc68
commit: f80ee3d33b3345eebf1de83dd20d95a37b32f15d drivers: net: smsc: smc91c92: Remove this driver
date:   6 days ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260430/202604300931.XuSzPxr8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300931.XuSzPxr8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Non-Preserved Properties
   ======================== [docutils]
   Documentation/networking/device_drivers/ethernet/index.rst:10: WARNING: toctree contains reference to nonexisting document 'networking/device_drivers/ethernet/3com/3c509' [toc.not_readable]
>> Documentation/networking/device_drivers/ethernet/index.rst:10: WARNING: toctree contains reference to nonexisting document 'networking/device_drivers/ethernet/smsc/smc9' [toc.not_readable]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:48: ERROR: Unexpected section title.


vim +10 Documentation/networking/device_drivers/ethernet/index.rst

132db93572821e Jakub Kicinski 2020-06-26   7  
132db93572821e Jakub Kicinski 2020-06-26   8  Contents:
132db93572821e Jakub Kicinski 2020-06-26   9  
132db93572821e Jakub Kicinski 2020-06-26 @10  .. toctree::

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
