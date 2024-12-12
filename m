Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732FD13F43A
	for <linux-doc@vger.kernel.org>; Thu, 12 Dec 2024 03:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733975855; cv=none; b=GxwtYMjAEQ+Qd1d3FKuCgkuh93DafwxKqD81cOL/3tq/1Y1Pm1xwWnuSLETLMFlC3z1XQgcUmkHFOAIVS7vVe+oLiNmhlTOl+0b3HPuXc5UuBrMighkZ6B0N/BAyIl4yLdw6TMI/9bex0ES/GtYMG1GDuglT68kgIdPafJadGtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733975855; c=relaxed/simple;
	bh=avMpD592FGSIqWpnDK8lZI/BfHdGwNE1wij+bKUI/hk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=De8tr+cj9mNJsfm5kcXHm5u6V8GQA2bX38Jbks9IeNbkybvC80++2wv3uNyUGwFVSf+nJhIGLW+BjZjld4iPjyb+hFRkIOa18aXmYqNdeSRndImTAvzJDxYyXIMGIqOImb45kN1iJ030jniwpVacXPW+04QUdnN7Jv/JVzTkf38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfAk5grW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfAk5grW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733975853; x=1765511853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=avMpD592FGSIqWpnDK8lZI/BfHdGwNE1wij+bKUI/hk=;
  b=XfAk5grWd7LLHQLYmYKfqvf9zmpaw2pGYBA75EnQSEHJ5tetXaePFkGP
   iJGXY5Er6G9bvqB1CbzOAfSbeUytVYukBFSln70zkD6aFzixQMMoVlfk1
   SkDPZrgHejXRpytUfsnYM66ALZk//brErFJ7CZ2y+eQKwty+1gINmY/BQ
   7q4yhT3zUu0G2/umVoGnzndi6MouN3j/9l+U7vIQMJ0BTxwwx3UxhXSaZ
   fFIMFEirNXwXt4oxQeDw8ICerV0ojEJ2HxwO4huN2ILS+xSeHUeJu0o/3
   e53WqbyVRocqRIb+Mly7Bbil5oRLI4KuUaac8uusr+/iMkPgmcLFn6G6M
   g==;
X-CSE-ConnectionGUID: pVmQ6fiORg+4T+CqAtozxQ==
X-CSE-MsgGUID: N4ceSfS1TASKKeQLMBCQkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="59775535"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="59775535"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 19:57:33 -0800
X-CSE-ConnectionGUID: SyfjpiAYSwuUo10Q1tWRgQ==
X-CSE-MsgGUID: ymsTvsHtRO2xh1apqd/ZsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96530181"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Dec 2024 19:57:32 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLaKP-0007PZ-0m;
	Thu, 12 Dec 2024 03:57:29 +0000
Date: Thu, 12 Dec 2024 11:57:22 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [ambarus:acpm-v4-upstream 3/10] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/mailbox/samsung,exynos.yaml
Message-ID: <202412121157.66Uo82V3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day acpm-v4-upstream
head:   a7e0ce0f6a033307db912fc77b1bbb7c3e1df757
commit: 26c389f00b6244f87b078f93a9403c8549c53505 [3/10] MAINTAINERS: add entry for Samsung Exynos mailbox driver
reproduce: (https://download.01.org/0day-ci/archive/20241212/202412121157.66Uo82V3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121157.66Uo82V3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mailbox/samsung,exynos.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
