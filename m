Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F09B23BF91
	for <linux-doc@vger.kernel.org>; Sun, 21 Dec 2025 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766320685; cv=none; b=Zo4MN7mMe91o1K1L6vCl1wzEg1joB7j2VeXKuqS+KFYVmffiIsCQmg95BDod1xfzk4SYhZKQ6TzHbaVxAtsHpPqv0cave2nlJj/VUfIwOAW3x2GQmiDC1TymASFo7RusMVRYYWucTBh6aeBu4cejG5pYES61o88jMxr5JuqTeD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766320685; c=relaxed/simple;
	bh=Exm20J/F7QXWjAs2l1Cv+RU/KQ0cszKrykYUgF/vu/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ATq0R4fIJ6CRtKi/KWOcyfwXRCfp6DNySWaFo5ovETwiqrW0Y5DiaNF+DbGMrL+clSWpVC3/2neQq0KME/MnR37wh8syomMfe7E/YAWQWCNG4LdcL/1LpvMjnumJoJwYNSo95zUnleDb37v+w5Om7z868mnfZVqh6tPHIOhkxP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xd8wcGNu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xd8wcGNu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766320683; x=1797856683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Exm20J/F7QXWjAs2l1Cv+RU/KQ0cszKrykYUgF/vu/0=;
  b=Xd8wcGNuEYo0+SVaX/RRoFb112aWaMLSlxDAJu1QjLdEYGdakhVDXweP
   4KJC5GRLDxRW1SVtQer6KeuBVQsuoyKtJ/2WpVuS5yP2y8Rfl6ZV07YWm
   nUP+SgxCg10/iOks1J52n0ZKJ3u54KKXy6xRoo7XDi61XlTRwGBb1GhTh
   kmovNn65JD+CbqB1dcEwNdejqErKXovpyy7kwv1D6zSMFt+5mtccpbZ9c
   nRLaibJjvfC7xXvsTRzsicchTs2fW0SGde9O0jSeDP1srg3FPQipdPYI3
   0BU3EuIXoUeXR/dSQOFMsW2xAP/rmS90YeBbCHn5pGb4kxwHycIM7t6IS
   Q==;
X-CSE-ConnectionGUID: mpVXOuC2TFejP/HmAZ032w==
X-CSE-MsgGUID: 59eBF0vWRx+wm5F0xS/UEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72065207"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72065207"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 04:38:01 -0800
X-CSE-ConnectionGUID: 7jBlt3rqT9uFOFrVaKgwpg==
X-CSE-MsgGUID: aysWff40QmGINTdUv+Miqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199592121"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2025 04:37:59 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXIhB-0000000053Q-3Axy;
	Sun, 21 Dec 2025 12:37:57 +0000
Date: Sun, 21 Dec 2025 13:37:46 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sashal:spec 1/131] htmldocs:
 Documentation/dev-tools/kernel-api-spec.rst: WARNING: document isn't
 included in any toctree [toc.not_included]
Message-ID: <202512211329.2JmvrzuC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: 0255afb0b87746723affbefad17b2caa26d29180 [1/131] kernel/api: introduce kernel API specification framework
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211329.2JmvrzuC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211329.2JmvrzuC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/admin-guide/kernel-api-spec.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/mediatek-mdp.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
--
   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/dev-tools/kernel-api-spec.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/netlink_spec/index.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> MAINTAINERS:30080: WARNING: unknown document: '../admin-guide/kernel-api-spec' [ref.doc]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
