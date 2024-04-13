Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65111C6AE
	for <linux-doc@vger.kernel.org>; Sat, 13 Apr 2024 06:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712988153; cv=none; b=lFnijiBciWCf3W2M5h6f5WPha7+sDyVzWcPQFqVt5AoeM4I9yN9NENk2CQ9flipjW7IotJW3DCdde/48G8LEI/RRgi5l4R/LYH4EJ3qzqfhxNlswy7SbhoFOBMW5jwiODejRVDYfZaqK+5L8C3vJ3C42va0+iF4lJFBo0e9YgB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712988153; c=relaxed/simple;
	bh=s65iWLby/RoPW/0IJikH5gpmyX/LEx/wicQbFr4ubJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=llJQbfIKzM0YrJB28NtCMcgWEbfhIu/s1dOT+WljafPElxmWisrrRV1etw096QRl4S+wU/BVBJVW7q6gLinkMMmWLEkEWCYDL3gdCo5hTl+3uGFQinLng0Dr6OPntKjt3/x28a9QvDrcFhe+J+XF6zqj1nOQB0TdiuCk69Gcf/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0z8DIZV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0z8DIZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712988151; x=1744524151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s65iWLby/RoPW/0IJikH5gpmyX/LEx/wicQbFr4ubJM=;
  b=d0z8DIZVcPKT6A0TJTWJD++Hdyp9gnpEU98Gsk8vTwbYcqba94jomlpU
   khFR6W+4lzOZ1DBhH9GyLxTsusaXc68D4Wve/aC8dpdo9F9u8F8mht6Pd
   +IdSEXX2//oxmVZ4PKIgpc4spvxlPK8xtTOT8WxDjuNpsUzXNMaRpXlrb
   rw+JZR+NrAcL8KNUIC6f3yi93ksk7To9h5cL1xhVfB5GSRbw1TXObSfWI
   uRvCdCvzV7P8HX2MA/JfS6z3R87Xr3XITa0V2xkjg8CJbIHh4c4p8+6E6
   w98CDBKS4r2ZZ6CDsmvdbdmGnTJ7gDkafw2fVejwe4T6qpf5hNIsj5Tyv
   w==;
X-CSE-ConnectionGUID: g/HQfGtMTzyjk8NIgsiYnw==
X-CSE-MsgGUID: ur7z7tXiQ26ZSA9Id1o6XA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19869839"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="19869839"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 23:02:30 -0700
X-CSE-ConnectionGUID: FA6RmnIcTMCcDimUTeGKYQ==
X-CSE-MsgGUID: 6197AvshSP2GyBJgn5JZIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="26225963"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 12 Apr 2024 23:02:28 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvWT4-0001vI-1N;
	Sat, 13 Apr 2024 06:02:26 +0000
Date: Sat, 13 Apr 2024 14:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: Tim Schumacher <timschumi@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ard Biesheuvel <ardb@kernel.org>, linux-doc@vger.kernel.org
Subject: [linux-next:master 2072/6010] htmldocs: Warning:
 Documentation/filesystems/efivarfs.rst references a file that doesn't exist:
 Documentation/ABI/stable/sysfs-firmware-efi-vars
Message-ID: <202404131335.BmnybEIK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ed46da14b9b9b2ad4edb3b0c545b6dbe5c00d39
commit: cbb404e464d2350a1fc3c73237a6334f59bd58a2 [2072/6010] Documentation: Mark the 'efivars' sysfs interface as removed
reproduce: (https://download.01.org/0day-ci/archive/20240413/202404131335.BmnybEIK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131335.BmnybEIK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
>> Warning: Documentation/filesystems/efivarfs.rst references a file that doesn't exist: Documentation/ABI/stable/sysfs-firmware-efi-vars
   Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
