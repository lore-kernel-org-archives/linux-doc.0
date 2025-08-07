Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F7D224234
	for <linux-doc@vger.kernel.org>; Thu,  7 Aug 2025 11:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754566702; cv=none; b=TXYD+Oy29WFSwLmSGT0GEOPGNpsRO7m7TsE+ou7owJ34ftHyTcbTtlySn/HyCKX/IpyHXinxHguR48r3VAauHriExqRONCw5JtbmmF0sLoIzCR9MUnOM0o9BI7feu6FklpaMQUo001xuR6Ubduu3WN0SHDSbJBkHubjAmiZ2trQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754566702; c=relaxed/simple;
	bh=OnpuHxcRP0MqRNhkIVoUCARNsxKdoBdpO7WmC9x8uC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DTK4RJxNTSeOaOTcAl8iwk0sCYv/N968DPBU56ERIhsmpPBKAoWH+Z4CGVI2gsFkzkNa/WQv3B8dUPYM+d2+ickbu6c6EzOV+XHSi5Yx6SwtHv+H+ytTnUsxWSoQ6PCrKHWAOSkmzPmaC8tfJH/jNkD/hVY9OABD7QWtMNmKIEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dzf/Sc48; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dzf/Sc48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754566702; x=1786102702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OnpuHxcRP0MqRNhkIVoUCARNsxKdoBdpO7WmC9x8uC4=;
  b=Dzf/Sc48DmGHAfXl5OZgUwQvjB37rHsJ0DOVyc37NNOKT/RbBIOBDEVG
   VhNtLbHE2QqX7M7Snfmt4nRtf+XHBAR92drNCKSbZnkcspP2xNY9jwSe2
   jx/ufI9OmhGJGXYDF7E5LH280DXxIslHsjUhW5VPACMgnXdCrJmgL5QBL
   kfa7lWtBbunucR2lf2LX5bH6a2ug1YcbDYHZgIeB8E0igYUfhsm8xazMl
   mrC/1ogDsUmnvGUmgiQ13GtPEJp7SSjBsymuLQmbRcm7GBz1DkrfCeNiI
   K83RziOMlPdrtaAZjdldE7dcqr3lG/n/HRlxakIB6u9cD4dE2Umvyo24h
   g==;
X-CSE-ConnectionGUID: KiMH94NXQ+uoAiThHSIYqQ==
X-CSE-MsgGUID: ukDq1IpZS3Wbcehm3O/7zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56980005"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56980005"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 04:38:21 -0700
X-CSE-ConnectionGUID: mywK3cxEQuCLQOoePbFgpw==
X-CSE-MsgGUID: VFrFxdL3TcSy4BZTd3GzLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="170298312"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 07 Aug 2025 04:38:19 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujywr-0002RT-0a;
	Thu, 07 Aug 2025 11:38:17 +0000
Date: Thu, 7 Aug 2025 13:37:36 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 93/801] htmldocs: Warning:
 Documentation/devicetree/bindings/clock/ti/ti,dra7-apll-clock.yaml
 references a file that doesn't exist:
 Documentation/devicetree/bindings/clock/ti/dpll.txt
Message-ID: <202508071323.bhhfvuoN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 49e69d839ca051f7cce4e3fc36dd12abf908e537 [93/801] dt-bindings: clock: Convert ti/ti,omap3-dpll-clock to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20250807/202508071323.bhhfvuoN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071323.bhhfvuoN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,quadfs.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,flexgen.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-pll.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen.txt
>> Warning: Documentation/devicetree/bindings/clock/ti/ti,dra7-apll-clock.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/dpll.txt
   Warning: Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/keystone-gate.txt
   Warning: Documentation/devicetree/bindings/thermal/armada-thermal.txt references a file that doesn't exist: Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
