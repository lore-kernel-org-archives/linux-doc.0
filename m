Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794786414;
	b=t8frTvcWJsyEVFnaO6OlaykaaOPryZW88stZEHFkaJI3VI6VFLyHT+5NGBtjcIc88TM0
	 tZAPZjxNNbtGM962gIz8efEHzl0QPQnr4qwuXs4MkG4JIFgc+BUup55AOjxwd0PF8LQ87
	 sWzoU25JjuxLCdi7BPen2Emv3u2LETRGGUlsRx9vsTbMd4xTVxugbWAgd3Uofvq/RmQQ3
	 R7Y5hYid/YKTx/aq9/8+/41kHZGGWwPZ1IC4E4fm1Xm2jPxltn057v2UOu/ZBLStwu3d5
	 KQnVZBozcYyxA9/gd9q6gh6WOXZt87HDqi3U/zH6fP8plgVaADJEQTZCV78zQP3HfEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794786414;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ePUowuBb0DdqfYiegRy2ETDVG3POlwYyegshLEywBOI=;
	b=XsmibFL7/7TP/wgZ7yP/CtKJhJJT8A7vHVcmpZnP+YU9E9RZUB8Nyn8pAPy5Sayvb5R8
	 aB5pz9k+/CFWnUHBFt7s2mR4LSNDRV7IWF8pm80loT8NynTgyqfatsKNjghdNX7vk3XAs
	 Bynu9ax7pSaz/WPZMYVYFhkBuIMEb9JRv0/TyiDRoEoRoeSQFD7Ck1PJ+WChMa8/0KlVE
	 GCIdOLDPEgVOqT0sOuXK2wCbLqvlzz6dc4woQkw0dGPDM39MFY3zecTwWKFDqJu32volS
	 ekD4tD1jUQEMQoVW90af2NE8ej+h9KA7RXlytYcj28AR/klhz/Lkx/3en8C02KH3tdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O26j4NoW;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDC8606A323
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 23:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BDC8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O26j4NoW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794786411; x=1826322411;
  h=date:from:to:cc:subject:message-id;
  bh=6kie41xxi1Gn+QaFsyUgxjSE9NoeHofFVhI08Nqm4LY=;
  b=O26j4NoWwwynC/raSfnTOVP+OPCdnQptTmvbvyPU3ZtqQMQXWa5x0kEB
   NuVvp4v5LYc2iHxNINhrDFTwX/SIQuwpmjTj285LobBbw4plkloITWkRq
   rj3BuiRxOv+hISr/269N5piK3DC0xjD4kiiLyY6rcazQf6BbNdeF3SuhY
   Mf4s5LZcOKbRTzV4+h1+MpxoFK6psilaDVsb0d0QJ4lOJzWXIegKFcvR9
   JB2qy/4lDWE0oCqUPnlHy6oymVhF7W8IIPU2rn81KjYVQohTP0xod1+iJ
   EVcZ4DJFzaxkv4AqSoB/oBvHtFhIwQVYAl5i857RLR8+QJr/bc4wQ+g+O
   A==;
X-CSE-ConnectionGUID: UUlPRyTuTZ6d4KCqRz5uYQ==
X-CSE-MsgGUID: 8NWXcFCMQ2OE1tZ/0SwjOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3423678"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3423678"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 15:46:51 -0800
X-CSE-ConnectionGUID: tnpXwqabQyeZDPp8rJofLw==
X-CSE-MsgGUID: bwrIcH9YQ0SCE+Aesj3Umw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9326619"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 15 Nov 2026 15:46:49 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSjvq-000000002Vj-3tAh;
	Sun, 15 Nov 2026 23:46:46 +0000
Date: Mon, 16 Nov 2026 00:46:44 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sashal-linus-next:linus-next 46/46] htmldocs: Warning:
 merge-report.html references a file that doesn't exist:
 Documentation/core-api/assoc_array.rst
Message-ID: <202611160011.kjg0BMbW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git linus-next
head:   8655c5c695f6fb347dd1a025b9d4e7a7a4a0e0f0
commit: 8655c5c695f6fb347dd1a025b9d4e7a7a4a0e0f0 [46/46] Add merge report for 2026-11-15 (20 interventions)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261116/202611160011.kjg0BMbW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611160011.kjg0BMbW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/arm/xen/enlighten.c references a file that doesn't exist: Documentation/devicetree/bindings/arm/xen.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
>> Warning: merge-report.html references a file that doesn't exist: Documentation/core-api/assoc_array.rst
>> Warning: merge-report.html references a file that doesn't exist: Documentation/core-api/assoc_array.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
