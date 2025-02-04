Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F0A19E83E
	for <linux-doc@vger.kernel.org>; Tue,  4 Feb 2025 20:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738702558; cv=none; b=dlz4buG5cqqxeVFOQRqkOqW2qpuoxyg2+d3aVByXp5v92+rid0Ab7SS/cbDFKRVq9vVfHSwjrY08j6zazqi8Jf78rzyTnzQCp71m8my/FSHWGcd82Jxt0Me2T38TaGd/arrZjxFyrfIoao/zWoMUaS2lo07o/2wl0ZQYoOr8Pro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738702558; c=relaxed/simple;
	bh=8oEf8qwiHn4c6DHrX8VRyDnK55omGj6neT8qp2DlucI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BBhKRE//RkOyW03YZBKYTi5Yf/9AluQFgSaBdvqMu41dVaoXs51IprfhuvzMMrzcDebAW0WfspK2LHPw4wD0k47tU0LxJ7lWhaF1ZSKj09kgMbZhl/frEPonYLZExEhWuS3s30MeTh6SCtBbMP7RmDlTY4v24+UPd+DvaBVtte8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBPPMa09; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBPPMa09"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738702556; x=1770238556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8oEf8qwiHn4c6DHrX8VRyDnK55omGj6neT8qp2DlucI=;
  b=BBPPMa09oHKACQ5Jb1dRnRXw0Uc6M/XQGNP0xhhtBUlMxotEas5OZWO8
   QpymAWbGeEl4Y+hlTsnWpxZ7J79TW57dBgdx4m4OCiMYvs8S/1V2lnctU
   fZD/aiqAYObch8HiuiK7YSKSLxy7YfJdUIkBT2ux9sYbByD8fWVjaLlDF
   utURDf9DfX6sU9EM7+tIhK/TmOOYkFTk+myX0RHVHggFG92vKGC92d8ei
   veJqoitxlTp8Mb1pQqgsViaoOoQrmc0Eu0Eqn/8Py3z3XbLIELafbynSz
   1COTKKrGx7jKKGJe4YemFjxZ3jwjydk+aJJxnEmtIaoOTPyrip80E1L1G
   A==;
X-CSE-ConnectionGUID: rsO+41KXSyePEEyeDsG/TA==
X-CSE-MsgGUID: a3fItX3rTy2UOA4QggHmDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56785473"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="56785473"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 12:55:55 -0800
X-CSE-ConnectionGUID: BelPQhWnTgaJMTR3qwEA7Q==
X-CSE-MsgGUID: oMM3Ylt8R2mDZntFd/DoQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141580519"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Feb 2025 12:55:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfPxY-000t0F-0e;
	Tue, 04 Feb 2025 20:55:52 +0000
Date: Wed, 5 Feb 2025 04:55:18 +0800
From: kernel test robot <lkp@intel.com>
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, Yanteng Si <si.yanteng@linux.dev>,
	Alex Shi <alexs@kernel.org>
Subject: [lwn:docs-next 9/11] htmldocs: Warning:
 Documentation/translations/zh_CN/security/credentials.rst references a file
 that doesn't exist: Documentation/translations/zh_CN/security/keys/*
Message-ID: <202502050403.uFwUnStI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.lwn.net/linux.git docs-next
head:   e8bcda12176c47f2ce6c5104955845d028a640e8
commit: f5c7cc77acf5abebc5aec4f4236954c23f29e09b [9/11] docs/zh_CN: Add security credentials Chinese translation
reproduce: (https://download.01.org/0day-ci/archive/20250205/202502050403.uFwUnStI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050403.uFwUnStI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: Documentation/translations/zh_CN/security/credentials.rst references a file that doesn't exist: Documentation/translations/zh_CN/security/keys/*
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
