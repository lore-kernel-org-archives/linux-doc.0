Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F82F1D47B4
	for <linux-doc@vger.kernel.org>; Thu,  7 Aug 2025 13:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754573134; cv=none; b=NE5bPGvloDCre8BFFMOFra9JFLzx9wmoBqoZxU3A6jv6Iu3O+CYQ7VpPUE7c/3p3VOhZdNLD2qizuxNeaTUQ5baHeHFBpviqziP+52dBY1TGcJ4C1AHzIeFxeD7A7RyDcDv4bxG1q1aO2MrUOmSnVTbys/YHBwU36JNzhuv9YJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754573134; c=relaxed/simple;
	bh=FcNNnq7BZtpAy/zNN2cgAbA47ZdEUJjhepeSsU323X0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uV68/ffQUtnzb4DGvP4PdyqrkgjWHssOwyihOc5yEQhYq3/F6gBGmM2yYFUCT9yKvLH/f7cpXL6VWn5qS7Yk37YDXJtHuTN8rMVKYmW23w522U9PCFlZtoHL5TVEmWz1MFk5uEwwA3tLjjj3zsolUx6G56RTstkIZKHG9L55Z28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPzk8l7K; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPzk8l7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754573133; x=1786109133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FcNNnq7BZtpAy/zNN2cgAbA47ZdEUJjhepeSsU323X0=;
  b=KPzk8l7KbAWDDCtbn9b87CJZfNL1rRZq33sf/C4oEZBWDXGEzL9oKQOW
   dXJcK9B7psVuu8l2ApguHFgadM62KZvP3LwflSwfb+FZBCvRa5coownMZ
   PRLXIrsSRGiKuRpb+4MVmxW2WlZtSK18WuImmeUb+b/dp4Ou3glCkrA/V
   r5Co7jv48hlG/fPGLEYwOPTWEj9HyfARZz1+Y4JtbgX7vQtkwm3Eej3/c
   Gr+gDwxbGHVYp+DiP6RUni8LmCiD3ShZM1Z5K1LY1MuM18gwhY6lt4RvQ
   9Oni+ek1dANNEuhUh81Jr399GEmLATalKAafDYn4Tt+h2dHF6MuDYUKih
   Q==;
X-CSE-ConnectionGUID: 6Q3oQHykSq2tB8iQc5sKpQ==
X-CSE-MsgGUID: urLCXQppTp2S6XRoDqvfvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67498747"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="67498747"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 06:25:27 -0700
X-CSE-ConnectionGUID: e0YeLDFBTemRMGKHTBJ7Wg==
X-CSE-MsgGUID: gUCZP2ZSTa+NsVNgqTG99w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="195898119"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2025 06:25:26 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk0cV-0002Sl-2Y;
	Thu, 07 Aug 2025 13:25:23 +0000
Date: Thu, 7 Aug 2025 15:25:15 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 125/801] htmldocs: Warning:
 Documentation/devicetree/bindings/display/tilcdc/ti,am33xx-tilcdc.yaml
 references a file that doesn't exist:
 Documentation/devicetree/bindings/display/tilcdc/panel.txt
Message-ID: <202508071557.L50LZbYL-lkp@intel.com>
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
commit: cd334a0c897fc7a7e780e9e6d091871159b77eb2 [125/801] dt-bindings: display: Convert tilcdc/ti,am33xx-tilcdc to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20250807/202508071557.L50LZbYL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071557.L50LZbYL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,quadfs.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,flexgen.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-pll.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen.txt
   Warning: Documentation/devicetree/bindings/clock/ti/ti,dra7-apll-clock.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/dpll.txt
>> Warning: Documentation/devicetree/bindings/display/tilcdc/ti,am33xx-tilcdc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/tilcdc/panel.txt
   Warning: Documentation/devicetree/bindings/pinctrl/marvell,armada-37xx-pinctrl.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/keystone-gate.txt
   Warning: Documentation/devicetree/bindings/thermal/armada-thermal.txt references a file that doesn't exist: Documentation/devicetree/bindings/arm/marvell/ap80x-system-controller.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
