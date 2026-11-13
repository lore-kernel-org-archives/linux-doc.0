Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794609116;
	b=Z0q3NaHrU3MAGRIiJUsiMKNZtcraSCWIoNMpBzU4sBcQsf/fbQTnyJh6GWDYBAbOVGm1
	 9/TdqYDNRii5kWPtdbwd9ZcM/h5Xsc77CpxeI8XIggBiKlenQ3l0MkrzPzh5nlQgcGZwv
	 aaoBGDRsYeP3qUnBtgDbxqjKycBLi+jh7Z/TjGuxs65q++EkIxMSsKVuE/m6nzRryEE3E
	 GcfgUM0Q/5Ohgb/6wypXeTDWhuUzd9SKhfQ07xNFj3rSQw5fQZ6I5yMn8VgGMCb/Jja78
	 S9kt2HCoFKgq9oaoDs2rBi0bLVVvVWXOdlaZHcd8Con3JMac7CYW/cKK/R3tdvS7b+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609116;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=82ruNYLNUYqy0uXp7jwnJdZMdHWvu4VqnB+ED4+mYA0=;
	b=0AiyeCDTv3IDpYCsPkmBWRl7VHtYBakHAFZF46GBIEBniCn2v3lQoTo6V66X+MVdAlqP
	 q6VthfJMOwLCqeu5EZgopLqN8YaqmThQzaozHUO7gt/47KfvQNoI6cthf2nU1mMkZmfQ0
	 Jzx21gvteXVfR3S2OktgYY3Ismsnp6NWtm2thULdKoVaGUNV3y7y5k4ic7CFLMXMEXQfa
	 Ys5oRRJnkevOz1TtDEe/juQvaBkE91NDzwyE2klvBZQ+5MkDpIgfeiFP+lC9kHwUlTfQ5
	 B7UtiBXwpJVgoki6+uDww2B1rluedQeH1mm2DgDEG26y9DIORs8B2jdJFwigCIBvmhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LodaeUWl;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DBD606A8A0
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 22:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DBD606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LodaeUWl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794609114; x=1826145114;
  h=date:from:to:cc:subject:message-id;
  bh=0HfjS5cKDxvBrSr9aGGse4slSbjGwKf7nE82cF1nU5Y=;
  b=LodaeUWlu+l64qG3vQBonMwtY1w2VMJKz2nHnDo+VUKGl0CG/du6gvps
   krusGCAwJZpTBW+sVTNOdorLQkiTbah1ZQKYFZL4DWnTFfl/eQM8uiDpD
   c2Sj4K5aqMqKPnhnLUKNuH6EGjVnRDkasTyRRzqKkNl6SfjyiBdFKCCbI
   OlZVYQlee7xnbSeAN1qtjaXeoHKp5a0dXmczx8qQoHWdAf1ji842OEKfI
   jaYaeyfmDj1PB3Gq43lU8+kiDKZay2WR/UE3/GjIOqTd4lQaYcm8oHQT8
   lf2R+6TiJbP3rphmAfaVcra4sF4dJ1KKfz2aboYACbg56rIHa+3md9yjE
   Q==;
X-CSE-ConnectionGUID: 3qcBZMQyTIyuAo55R1Fxjw==
X-CSE-MsgGUID: uTJlI5KIQtWGnMX+8XT7nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3302250"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3302250"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 14:31:54 -0800
X-CSE-ConnectionGUID: sMUIvGX0QQ68GsfPaj7YxQ==
X-CSE-MsgGUID: 78Km2C/WQv25j277Q4W0hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="10754296"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 13 Nov 2026 14:31:52 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRzoE-000000001Lh-0fvT;
	Fri, 13 Nov 2026 22:31:50 +0000
Date: Fri, 13 Nov 2026 23:30:54 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [jpirko-mlxsw:wip_attestation_all_2 13/68] htmldocs:
 Warning: Documentation/driver-api/ctlv.rst references a file that doesn't
 exist: Documentation/ctlv/abi/ctlv-example.yaml
Message-ID: <202611132336.GeL4R4SU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: ed1bb20e593812e25f641db240eca762a6a2dca9 [13/68] Documentation: ctlv: Describe how to write a family
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261113/202611132336.GeL4R4SU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611132336.GeL4R4SU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/driver-api/ctlv.rst references a file that doesn't exist: Documentation/ctlv/specs/ctlv-example.yaml
>> Warning: Documentation/driver-api/ctlv.rst references a file that doesn't exist: Documentation/ctlv/abi/ctlv-example.yaml
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst references a file that doesn't exist: Documentation/filesystems/gfs2-glocks.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
