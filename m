Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAF241735A
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092377; cv=none; b=rZDlM/SFf3Lyoy/QwN1pHIj3k3q97Wo5d8EcwKWbcAXZyZDbPAogtB1ik6dnIhRNOC7Bk5zpbj/+5iBb/QqDWL0b9Pw7G7A57hoyQVfJxhW3lNOwAo3fXm/lEiv/A1koNOryeCjeDamVcLU9Zw5kL59LIrKMbfnl0XR7FNEyI+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092377; c=relaxed/simple;
	bh=q72dfMto2H9k5CgU07ACQMAWpo99WoFvfPSY3fgiiYw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V+GAgGtDZLyboan7wLBnJuBPL5knWwdYpcG4k8XtLOsQtDe88n4zLk/vjHCdJFY3iLiA4X/gDTJAX8Rj7em0cKEFXBMoKYlMFPDfoJJGs5chgDcqQG661S4pefBDVh3M93H8FDnluIx8jf+Cw4UjzmMmyjJaBttqwzY6HtkocMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8a3lNum; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8a3lNum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092376; x=1814628376;
  h=date:from:to:cc:subject:message-id;
  bh=q72dfMto2H9k5CgU07ACQMAWpo99WoFvfPSY3fgiiYw=;
  b=m8a3lNumUcXgkPxCeznRxuQ3Aedqh/mcpOONpJfDy6+fAN2kAI3QHmiM
   VyuXfZrOo2vQjkrr0YrMFph2fTnlmtpSuomBlxPidyuNheJLGX9lj7WaG
   8Aye3BgnTIYXOhzBri+AdZaSKcUlNmAfZOO/U88kgQTl9n4/PqJGt3f8P
   uWfSS97njenRKB/U0w1GjtCuV+hK2lhp+Gy+R3aQa/eJqdi4/W+wWTkb0
   ip40ekOlLS1/4uO3/+T27RUUYDZdS+98Gz88fkCwi6AH2qfGNHBpWduc7
   lnn6MvLjqcrEFEUfyGF7sh7FuN3mEuP5WuMcsCaR9Wm1fABvj/++GCCO4
   w==;
X-CSE-ConnectionGUID: UkxMSjksRtWCYsZKcrjWEQ==
X-CSE-MsgGUID: DY6vE6WyRj2Ceb059kEk6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="95352296"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="95352296"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:16 -0700
X-CSE-ConnectionGUID: V9Tk0trdT+SPpPHcIYznIw==
X-CSE-MsgGUID: T7yzDAksR/eNvMNAaGr/+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="257466981"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 03 Jul 2026 08:26:14 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wffmN-000000001XV-3qJZ;
	Fri, 03 Jul 2026 15:26:11 +0000
Date: Fri, 03 Jul 2026 17:26:08 +0200
From: kernel test robot <lkp@intel.com>
To: Eduard Bostina <egbostina@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-doc@vger.kernel.org
Subject: [krzk-w1:w1-next 2/3] htmldocs: Warning:
 Documentation/w1/masters/omap-hdq.rst references a file that doesn't exist:
 Documentation/devicetree/bindings/w1/omap-hdq.txt
Message-ID: <202607031709.owfUeGBJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-w1.git w1-next
head:   487eca6535cab91944ade06a155e9d789591a1e5
commit: e89bccb295a8880493693e69e091a3668dc0c279 [2/3] dt-bindings: w1: Convert HDQ One Wire to DT schema
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260703/202607031709.owfUeGBJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031709.owfUeGBJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst references a file that doesn't exist: Documentation/filesystems/gfs2-uevents.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2.rst references a file that doesn't exist: Documentation/filesystems/gfs2.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
>> Warning: Documentation/w1/masters/omap-hdq.rst references a file that doesn't exist: Documentation/devicetree/bindings/w1/omap-hdq.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
