Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2585C2063FD
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 20:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748377590; cv=none; b=mKiQ8KPgO7529FPFJyiqJPW0epoGsvOKTUFrpRcW1JgTNfDAKtxCHjoCngSrEWqKMKkYTt9gQwCMcsqtvF3zzPL32TpURhDowoowHlEuxVoE0cnMFSZ2PYBuhCNK5pncr+xgxch51pf00qq8AAkKNQnxtloQqwZynG0sbDLCdjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748377590; c=relaxed/simple;
	bh=UK2TN1iKafmXVsu8Q1PE+l5zVPEYJTlA5I+kUDW7Fww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YksLe4nNOYLOjnefT5GOc3ks/lI70Da3LEryh1aPmtmdZc2HrXUPQtZpqKhzqAaYhYACFDWHz+CU5Hrcjm2+LfA7SVZbAMWW1fNcg0l1D+hHoYHUK/EeKF05EmdvYxwZOEOv3hjPzlrpYTaYZIm3jpWnRlX41K+JoLBxow96v68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9d8HsyB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9d8HsyB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748377589; x=1779913589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UK2TN1iKafmXVsu8Q1PE+l5zVPEYJTlA5I+kUDW7Fww=;
  b=G9d8HsyB5Rj5cTUWP+QUbdSp8SHG6TXGOBa+jamCI0kvofYGEZda35jK
   xUEID/CHGEScQdD/2Z60Wtn9fRolDpA1qSFVfSeC1J1zDsoMND3Vr9qSK
   kondZTTUQqMNBjApof+Lvo5Rr5Tl2cbne2EWmoRjTot4hB3smORB+70Bt
   phbUpnD8LksJIItP8Pdk1m+pXwEp0bz5lv/F2KI8KHiR2+6Uj0pFH2pR+
   ir1MzCpColhKyKZ5lQaeV5AqWTgwFBH3ca+hxsWLDCTRZTad1ulpsR4N/
   wleGfQeuIL5I4yNQ29LKy15al9BoT0yDUPCywKImKy3YCSCsuBMWGQm5z
   A==;
X-CSE-ConnectionGUID: Mqov57Z1QYS/4TwbXLjDvA==
X-CSE-MsgGUID: NFeujEcEQDCEQiN9I3PHfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="67801384"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="67801384"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 13:26:29 -0700
X-CSE-ConnectionGUID: C21PSXacTi+8h7FsY+/Uog==
X-CSE-MsgGUID: aJAu5SM2TJK2rJZzAqSyzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="147994114"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 May 2025 13:26:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK0sT-000Uz6-1S;
	Tue, 27 May 2025 20:26:25 +0000
Date: Wed, 28 May 2025 04:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [linuxsecuritymodule:main 2/2] htmldocs: Warning: README.md
 references a file that doesn't exist: Documentation/API/obsolete
Message-ID: <202505280424.wFE07KgP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/LinuxSecurityModule/kernel main
head:   fed0449b38a2791712e8c3cd0fe08cb50de2e86d
commit: fed0449b38a2791712e8c3cd0fe08cb50de2e86d [2/2] lsm: work in progress deprecation guidance for README.md
reproduce: (https://download.01.org/0day-ci/archive/20250528/202505280424.wFE07KgP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280424.wFE07KgP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
>> Warning: README.md references a file that doesn't exist: Documentation/API/obsolete
>> Warning: README.md references a file that doesn't exist: Documentation/API/obsolete
>> Warning: README.md references a file that doesn't exist: Documentation/API/obsolete
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1798: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'htmldocs' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
