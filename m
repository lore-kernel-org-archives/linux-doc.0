Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AAA5A4D8
	for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2024 23:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713310104; cv=none; b=oB+gPqoMNEJZ13/v5JvjmX8cyxlrpH15ByBlmLcwj/Y8JYklPL/45WRrZhTrWlPlFEJLq2b2UALeQYzmraXn/uPbx20EFBqSwkdKXtIBMCiIZmdFObdU0u0y2YIDXwzkzUlGfn0VFtan1UTzKR/7hKmDhRCMaBu5C6fAO0FIEUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713310104; c=relaxed/simple;
	bh=o/m91AAWooHrvd/CwFAuz1XE0KauQ2Ma+s0g0RAhE5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TQ+RX5n0WaDH9oKSHNpPyEUo8jQ80RZy9vV9cjAP/i202KKSAQ0n3UZvZ64k+bvJyqbScDhYJ7Zev1Z9SoCp7R4lMcwUojvR79bBuycx032j1+wNS0islox/URhHAXXpLi1G9vc6hAHLZq6WSzj6Q/kLK+owd96aNUye97rtFJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVeS6rOI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVeS6rOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713310102; x=1744846102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o/m91AAWooHrvd/CwFAuz1XE0KauQ2Ma+s0g0RAhE5Q=;
  b=HVeS6rOI0moXpcILyXYNKGpz5neK2Oqo39b+d2LphqQKpRgy88SNmFVy
   ALe96c+4NmaYQdIiOaAYypReMmiRep9Y9PyY21ZBywzfFMPZ9EpBhO9Nk
   pWGbv7kpws2qP7ddnoYimC45Wvt7ZAQrsDPJoa8H93q3Y9hDsDjsal/mS
   GTOnTSZUYfKQean8qLELNrAHKqYAfF6gMwB+866FniF0S+PRLOOwxjmxa
   nZvtwdZA0E8l9BfaSIjbQaRqbxJpS2yGk/aOPkZajE+vtuFjY1R6eb2LP
   1uGVFqW1+O1IKp4zLcxLOtkpjM516WV7B+O19+ehSWAXIUh7p8qsEgRs0
   w==;
X-CSE-ConnectionGUID: 0hn1ncIRRk29Sjdgy4lJ+w==
X-CSE-MsgGUID: /OXcOmvXTTiobwOUJ/TKPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="26294538"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="26294538"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 16:28:18 -0700
X-CSE-ConnectionGUID: mgev37eXQNC2HMZW779Irg==
X-CSE-MsgGUID: 5qSrHN8eR2e8V4veVIhYZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="22478446"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 16 Apr 2024 16:28:16 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwsDm-0005qA-2B;
	Tue, 16 Apr 2024 23:28:14 +0000
Date: Wed, 17 Apr 2024 07:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>, linux-doc@vger.kernel.org
Subject: [pinchartl:rpi/v6.9/isp/v2 16/24] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/media/uapi/v4l/pixfmt-meta-bcm2835-isp-stats.rst
Message-ID: <202404170711.8Ri744mI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rpi/v6.9/isp/v2
head:   5101294c3b11eb468b977df8b494c4cc4264a582
commit: 3d28ed2a4e36222cb404c08eca65a1cbae14fa50 [16/24] staging: vc04_services: bcm2835-isp: Add a more complex ISP processing component
reproduce: (https://download.01.org/0day-ci/archive/20240417/202404170711.8Ri744mI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404170711.8Ri744mI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
   Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/media/uapi/v4l/pixfmt-meta-bcm2835-isp-stats.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/media/v4l-drivers/bcm2835-isp.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
