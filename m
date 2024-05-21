Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA171DFE8
	for <linux-doc@vger.kernel.org>; Tue, 21 May 2024 19:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716320293; cv=none; b=P8oNSl/d3aaIiZti/Qs57tTTm7V8+b4oSJ06RWfmogwnWtYm+Ey/sKJT4LiQ7G9V2X/ZkSEsx8DiY3JFT/2a0qOjOLxqNx6sPo4SQD1GG+bqRuE5eyRPyIZ2ZNjO/C8/IJ/suhPgnQag//Jln9Al0x2sZQn6F7nZN8/aANzHKIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716320293; c=relaxed/simple;
	bh=iLPJt2TwQU3B/DlvYr/JW9eFE8+9b5ci7up542C0oJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BztTB1kWYvuh5BxbUDMRvVWrBMwzgi1qIRnulRdyZACbEi3LY6uAElOCzJ7VUTPhaIgMVDKKLYEEG3XSgpy9DoJ/BnmWfDrv8OGsBYX6favGa5kcKyiSyprYvxMDfJuzTUBuMCsZI1LWF6hx9iGdi7LP3LlCeMFbfIFYlU+tCjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VoMoYGsx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoMoYGsx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716320292; x=1747856292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iLPJt2TwQU3B/DlvYr/JW9eFE8+9b5ci7up542C0oJg=;
  b=VoMoYGsxmiAH2p8H/eisEjMh/a+jvyuAmD2+hSuNKf2TspxP4HjJSaDi
   R2QHwe00SK3yiTN2x8WayEiH0ot0r3Te26Y7aJ8/8J+uYkrzcFRKl2EEg
   R/L9q20Pf28mPhqvTZSoA9RTcrvBL+QU+Qd2FGVS2RUIuxm5ThVi9DnGg
   pTUM/2SgHLRa1n7AQOxyHqqFjAswFcOFp9Uo8hnonCD7RuXuzcHGxu7Du
   5K7C7+mEiFQLHNJH50HnVOCuTzYGXSEvKPpOz/0zPn83qgyucPL2mlxXY
   D4ouwI/WZqrFlqiRlqU0VjIf+trhd9fEMq269iofsBOdGsTwMOAL0dyhh
   A==;
X-CSE-ConnectionGUID: MoEb1ttlScGgfoVxH0iPeA==
X-CSE-MsgGUID: tdCsl2IlTYyZlsBtnbnrYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12379146"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="12379146"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 12:38:11 -0700
X-CSE-ConnectionGUID: JVrsu/U5Tnu6LEm17AxmvA==
X-CSE-MsgGUID: 1dg+mD/AQ4ygPswkJgW4TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="37526598"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 May 2024 12:38:10 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9VJF-0000fJ-2A;
	Tue, 21 May 2024 19:38:06 +0000
Date: Wed, 22 May 2024 03:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [bristot:sample/dummy_rv 2/4] htmldocs: Warning:
 kernel/trace/rv/Kconfig references a file that doesn't exist:
 Documentation/trace/rv/dummy.rst
Message-ID: <202405220346.RrISr9rY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/bristot/linux sample/dummy_rv
head:   497867198313321f90ae76cec6409a9886e2eea9
commit: d8d34b4e3daad9943c806c7cf5273e1594837167 [2/4] rv/monitors: Add dummy monitor
reproduce: (https://download.01.org/0day-ci/archive/20240522/202405220346.RrISr9rY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405220346.RrISr9rY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
   Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
>> Warning: kernel/trace/rv/Kconfig references a file that doesn't exist: Documentation/trace/rv/dummy.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
