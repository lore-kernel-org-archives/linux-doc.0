Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DE72F39B5
	for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 01:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784944425; cv=none; b=MvOHViB6REGexO0mejGoJXkHE71Qa781EbewaNn5jp/Gal+29Dw6C3Xp/xveI7dCu85wS9u430b8CWXKz67WYqaNHpdxJpS5TUPEHoMsMA6G7uN0BN6y3C8hllVLNRN+7Dn+d165R6//ky1/aZmC4rWttUsQ/wIYDEm+ksPiwwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784944425; c=relaxed/simple;
	bh=EVWJkojZO52mkVzCbZmrcB80QNeySjokJV3l7SdAtGk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d/ieR33CJtsBIWreRgCNY+V1lLW1I3VBJZnTGAIB8x8pV5vZpx2wIaIGBbyt19YeLEJIqWR5nFiNm+EVzIdasRg9hKpu0Ue7KJHdtRJI+528TeesIcd0c7xFK8wvVHIJrAstSrJZVmdJzIhRzy3Le6bsc0kqBOJAU9bpG4OFt30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ToSnDa+L; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ToSnDa+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784944423; x=1816480423;
  h=date:from:to:cc:subject:message-id;
  bh=EVWJkojZO52mkVzCbZmrcB80QNeySjokJV3l7SdAtGk=;
  b=ToSnDa+LAuYJ7CqvB1GX6LXH7oP+Y1w3cTTkMhf0ijSOWS2N8MZ62KgO
   PJzIWQPUxjemfdzvEeFC6NKCJxvaQz9+c6D5l8aX0+S65KzxvkKbROtSz
   3up3I4i8Z0iOdNsY+sUoG5W+KK74fhYXWiWdkxFOr3mJvEdpy1EYFBHoZ
   rUgSkjtb66emVkQZls0G+h5yzNnupKk6mbJYG/kVzJ0F0LDiIGzGtQEYT
   ZZ1GF52qDPH/aTpurqZr2WfRxk5rI4M9wrEIvSRw9Q1XTVNxgOnTxuzdJ
   jjC85UEm9vlSbCaAIdLoTIpITLcNU71Dr/JED9JcZi9ThuT/yjfAXx6tv
   w==;
X-CSE-ConnectionGUID: HQDa54TnTYm/RxvmigkkgA==
X-CSE-MsgGUID: beGiY4ITR5mbh152Hg3v5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="85657407"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="85657407"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 18:53:43 -0700
X-CSE-ConnectionGUID: MTWCEHgxTc+FVuuMIwjdMA==
X-CSE-MsgGUID: C63snb3nTUaug66PPwp81A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="259513964"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 24 Jul 2026 18:53:41 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnRa7-0000000015K-0ME8;
	Sat, 25 Jul 2026 01:53:39 +0000
Date: Sat, 25 Jul 2026 03:53:17 +0200
From: kernel test robot <lkp@intel.com>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Warning: MAINTAINERS references a file that
 doesn't exist:
 Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
Message-ID: <202607250303.Vsr3uQ9k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://github.com/intel-lab-lkp/linux/commits/Zhentao-Guo-via-B4-Relay/firmware-meson-sm-Add-video-firmware-loading-SMC-call/20260724-151850
head:   21bdff1f88f29045f82144a2c7c233522fff4249
commit: 9146431a9be1f4fc394bd783b4617b9c948b0505 decoder: Add V4L2 stateless H.264 decoder driver
date:   18 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260725/202607250303.Vsr3uQ9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607250303.Vsr3uQ9k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst references a file that doesn't exist: Documentation/filesystems/gfs2-uevents.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2.rst references a file that doesn't exist: Documentation/filesystems/gfs2.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/arm/xen/enlighten.c references a file that doesn't exist: Documentation/devicetree/bindings/arm/xen.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
