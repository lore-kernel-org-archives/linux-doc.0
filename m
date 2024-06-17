Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B675194C94
	for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 23:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718666515; cv=none; b=lMyRBT05BmV9ZMwPk4booaBxABK0yaLyFBiuz0SGff5t1xvSUTStTOrU5C4RGnlF31ZdIrU4rkKGCLXzFeyqIMTmcjJIaz1vOgIGgdWonreDwQIkMF+p24A+aNrSsR4Q/GQDwxnIjvcRgKsIjyPLBaZcq5V2GzLxfjMhukipEtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718666515; c=relaxed/simple;
	bh=e4YsGue7MvX6V+ZHi1zOMgjV1Sdv/0GmYugoXmqIDVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nsaf9cTwlEEGVWZ9G9y9aUZHFoxg7nCM34FkyBlM69fJzNyHaFY2WBCHSBYzFryC/AUYg2byG5RjTcvJGALVvIso7eE/R3vBxoGu2IQIhQKj8Iq6TLmo7Nnw+13CtlhECYcH5ZMJEmEK4PJUKN64uX2laRY707sXtdXtwEhKgEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kery6Ndb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kery6Ndb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718666515; x=1750202515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e4YsGue7MvX6V+ZHi1zOMgjV1Sdv/0GmYugoXmqIDVY=;
  b=Kery6NdbkR6beCA2T42VXEoG3zIV1CUI63W6/cM6DPRBSENlPap6jqJz
   uWO9T3fEb8cF4zsDx7OzwecNRej890uiuo8cmBJjhTUphoi7uvlyWx7GN
   GcX8pwnTTo2RA5tOFnslp9dPWLf2BbkdVRXA+/r0AHOyJg91fJDjeJtzq
   RJxAd2CgUx3yvhaHMk7QjfYgQagRpOmPTYPe3Kt4zUUU0wka4VOUBjP5N
   VemKGcipL7UdEbrjOyAVv03mQqAgRGzSYF7k6moZNGGV8e8edKr1yJUwB
   ha9iO+WfMwp3Ae9nwOzLIKesz7KaMgroNF0hNqborTCNd6Yxgw/Mu8jV1
   A==;
X-CSE-ConnectionGUID: k7L8PmYASIK/0N35p9UNFA==
X-CSE-MsgGUID: B2FdN7pYRTWzO2p79O7Bwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="32986413"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="32986413"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 16:21:54 -0700
X-CSE-ConnectionGUID: fS66fLkSTv6E/qDE9OqgRw==
X-CSE-MsgGUID: 2yUqfaj7Qha2R1GaNLP3QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="41450413"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jun 2024 16:21:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJLfa-0004zt-12;
	Mon, 17 Jun 2024 23:21:50 +0000
Date: Tue, 18 Jun 2024 07:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>, linux-doc@vger.kernel.org
Subject: [linux-next:master 6562/6646] htmldocs: Warning:
 Documentation/filesystems/xfs-online-fsck-design.rst references a file that
 doesn't exist: Documentation/filesystems/xfs-self-describing-metadata.rst
Message-ID: <202406180707.m8now1UT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   76db4c64526c5e8ba0f56ad3d890dce8f9b00bbc
commit: 6a78339fd55f0149a0893dcbdc11fe5326177c07 [6562/6646] Merge branch 'for-linux-next' of https://gitlab.freedesktop.org/drm/i915/kernel
reproduce: (https://download.01.org/0day-ci/archive/20240618/202406180707.m8now1UT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180707.m8now1UT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>> Warning: Documentation/filesystems/xfs-online-fsck-design.rst references a file that doesn't exist: Documentation/filesystems/xfs-self-describing-metadata.rst
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
