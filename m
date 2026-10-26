Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039786;
	b=S3tSoZc4vZlTUNj1xwEzRkRm4uWRsgjK+2orN/DkBmkXiL/eCWnZq6fwlSaeqtPWI4mW
	 hDTts6RR5E4/IlPNe12WZn4fzFN1nfqtAkbN+6/3j/D/6t/ym9cRpL8B2/WljsHbcsJGa
	 3BiflznA2r18LLIYssyyjZaek5QGZtObKx8vgIi1EwqRn+74O42IcYIFYtrlmwBGuebu4
	 DZuS4+GpXTa3562WTqp/BgeLAI+u4Pw8ie8UA3NaR3ALKKYQQpJYAjTAP7SbbpTDjxROS
	 ZMsbOk7wTgJf4i1rIN4rUylAgOUeROPy+oH+OHkiRItWuBzHsdJnEdQe2tby6x8Vo7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039786;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bP5+Gmdv5dA0v5ZBhT2+2YDOMWtfYNSvLp/3yFK/x8E=;
	b=5ffmVQPxAXiayrhhtRYM92GfzKPCkc570Z780uAc181ZAGDWLTGWOpYK6Umfksuc7Xbq
	 vKkynjhDdNSD8IV8eHSydL60ClX20Rfbm+0rKAp+zJKstCWoQfsya0JUwrnaxyWpa6Ycr
	 kHN9HZv4a/Iy9ePU9XzGwS74k0XEwU7HtoXRDhnNq1MQyx9bOYjkDTb6lYfigg1LvJIq0
	 ICeOsV97rVL6Zz+mzYqewmG5r60ExFVxWuwg923y9s78Z2NueMvC+wZiWrtISQsxtYvEy
	 8yiDbb7whgQTajyh0Czi6vSqnDIY7jlvwC2GTTtSTNFp4AIWHrpCS3z4Zkae4rmgKJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SbstPHZ3;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86BB606A31D
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 18:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C86BB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SbstPHZ3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793039784; x=1824575784;
  h=date:from:to:cc:subject:message-id;
  bh=Gvv6WriyEHtwDo5CEaGiWLRWyD7AzvPA4sAMWzjCCW8=;
  b=SbstPHZ3MeKfwUADGT9Dk60touVEVLzFVg9B1CItfJLwvogJkV6WG/X7
   65UZZbWpm9YFSY4a7uxWNfhxCj4qxeS6madUCaq0AUCMarce1dZNNIhnv
   Te3MvjZrxoX1vGKdA8I98EmQpCmKBMNv8Ln3HS0RkeiBrLtlKlpPnqWvX
   QqAR0I2dq1XojXR4huD/O9+Tb1LHQIv4wDm7TKfvnDmVCLmURtshFiMCe
   jXN31v2yPSt7KxgRuBalc9zEHPlmsAxQGgJDjTkgu7xNoKOOdNL6r49HU
   3R+lNZqqfWHinBbydAOrZmlyh+NLTM6Ny3/riwPoAe/hohrnXXCgujfBK
   A==;
X-CSE-ConnectionGUID: sKGh33zjRwaaol02d1wp6g==
X-CSE-MsgGUID: 1foOTkChSfenSt2uFoI4+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1730449"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1730449"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:36:23 -0700
X-CSE-ConnectionGUID: ceomOWnkRr6/fsa2STDz5Q==
X-CSE-MsgGUID: 1mIsdwh5TUaU/pjMt5V37Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6157989"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 26 Oct 2026 11:36:22 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLPYR-000000004C7-41a5;
	Mon, 26 Oct 2026 18:36:19 +0000
Date: Mon, 26 Oct 2026 19:36:17 +0100
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [pcmoore-lsm:main 1/1] htmldocs: Warning: README.md
 references a file that doesn't exist: Documentation/API/obsolete
Message-ID: <202610261926.8tdOxs5r-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git main
head:   e7295d8301c4d643fec9ff2988ac861c4b0e77f0
commit: e7295d8301c4d643fec9ff2988ac861c4b0e77f0 [1/1] lsm: add a LSM specific README.md and SECURITY.md
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.22.4, Python 3.13.5, on linux)
sphinx: sphinx-build 9.1.1
reproduce: (https://download.01.org/0day-ci/archive/20261026/202610261926.8tdOxs5r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610261926.8tdOxs5r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/translations/zh_CN/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: README.md references a file that doesn't exist: Documentation/API/obsolete
>> Warning: README.md references a file that doesn't exist: Documentation/API/obsolete
>> Warning: README.md references a file that doesn't exist: Documentation/API/obsolete
   Warning: arch/arm/xen/enlighten.c references a file that doesn't exist: Documentation/devicetree/bindings/arm/xen.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
