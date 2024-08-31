Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652F4171092
	for <linux-doc@vger.kernel.org>; Sat, 31 Aug 2024 11:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725103985; cv=none; b=czgknCiqwlAaCjDwOfjmxX2r2lymYreuw1Cl071FFO1BMH/bcXnoWNTXD+za9ZkzkDCr3W0vdOhk65c+0ZsKPof4slBJOieYqFk/SGJ+VRe4/455oLifyFxDrFOE0/XRLk+riC/71yYSEasDgtyRtqo2jesogfYo+unKLrczZj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725103985; c=relaxed/simple;
	bh=jj9Vp976niRDnareIAZjr8PaQoO1NluWTTen20cykOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cvj24JJR/wrk4S9fgu/IMTjMDAnm68lDRrX0iUANVe/g+qHrhGCLTfLoXK+T2eCcLNr+d4Z2kTFxUGMP6/2QwkLXJjEHytkVF++KvmEIjKniRObTDnOtobCERcKRnniNRlDJPEjIK4OK/UbnqUZIb3Jyqqnh3Rc4dBsLCrQSvS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZnFRLiL/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZnFRLiL/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725103983; x=1756639983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jj9Vp976niRDnareIAZjr8PaQoO1NluWTTen20cykOg=;
  b=ZnFRLiL/WEeyIFJvsJl8fUjMrF1oOKaaK+JL6txZNnZl9DhHtEEH369P
   8IjLqEPd0UviiMA/leiuRk8iY3GVYFYYL/52evTqvL03qlWvUWIdPGBTf
   7ii+OG7K/jqO77Pl2+WGBUkDU2WklVhTy4gelGph/xR2kNfBAy0x98jIh
   H+yonutnl/ozNrG0QAL4v0WY62A9BFq5UyD+URHp+Ic64VjlwHNjYTO7k
   rscJKz1/1ntX3jYizzgGIuJcqw4J+IsmMitzBIjT9s7RcauscBTPsd/Jh
   Hz4RXs+RO4H22VBxKdwd4x+DChnSbZMviwgBSNhyAPD5HQWJcsHr77kbZ
   w==;
X-CSE-ConnectionGUID: cQdy99neRk+u83Z2tdc7FQ==
X-CSE-MsgGUID: ZkHw2JyYQKi/1nRwjBHibw==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="13309735"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="13309735"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 04:33:03 -0700
X-CSE-ConnectionGUID: TgT16vksQVKDRClb9UEsPA==
X-CSE-MsgGUID: sXsRxjuBTrO/IOqNzb3UrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="64158485"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Aug 2024 04:33:02 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skMLj-0002gg-2G;
	Sat, 31 Aug 2024 11:32:59 +0000
Date: Sat, 31 Aug 2024 19:32:46 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [morse:mpam/abmc/v6 76/162] htmldocs: Warning: fs/resctrl/Kconfig
 references a file that doesn't exist: file:Documentation/fs/resctrl.rst
Message-ID: <202408311914.xjS4eyEd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/abmc/v6
head:   1c2b259a9b6b7795f994cc351031c4ac166b1496
commit: 2132c4b5412b53caf5b353ae75e463adbc36a2e5 [76/162] x86,fs/resctrl: Move resctrl.rst to live under Documentation/filesystems
reproduce: (https://download.01.org/0day-ci/archive/20240831/202408311914.xjS4eyEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311914.xjS4eyEd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/fs/resctrl*
   Warning: arch/x86/kernel/cpu/resctrl/monitor.c references a file that doesn't exist: Documentation/arch/x86/resctrl.rst
>> Warning: fs/resctrl/Kconfig references a file that doesn't exist: file:Documentation/fs/resctrl.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
