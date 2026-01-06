Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DA52E8E12
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 20:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767732659; cv=none; b=LuGK7U2eVAGZlIhxOd1drGYtjuE64TPGCdrjYWSB8r+gmwvLX//mk6Hp9ap2EDfMzpf/v+u4QhWifv7Shr2nkUhYEoJHsZifVPNc7UL6Hc0ls20Je2LhtoaPYyfH8lCxX3fwUvDb9Mz16LvZgnFTxFtT+kiq/Dt5l9Cbp3wZSso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767732659; c=relaxed/simple;
	bh=4aS/irjc/0UjcNZce21ngtGjOsRmQB79kwS9yXfL64M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nrgjXZKS7q/I4WhIhmvt5UlmoXkXmuz9x2GnlTr0Wc2vm66G46UYImEfeM5UmEKtX/4jGC0GFZOSfZvUO9xhr73OEOBf1QBKRdUr13o53mvaLdmKqs+aRYs8SD+v00/fCda/hY65qUm1/sL7ELkCDgW6i358F8jxH3a8H3q3FW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1kIIB51; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1kIIB51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767732655; x=1799268655;
  h=date:from:to:cc:subject:message-id;
  bh=4aS/irjc/0UjcNZce21ngtGjOsRmQB79kwS9yXfL64M=;
  b=J1kIIB51hsavRS2CKNZBF6wKAylKlqqraDTrVxm16PcGwFD7QFcVGdOf
   S59NwdnVYty4R/GCBdoy199kFeDsXohNVfrWMpbo2C/5nTYFJSNe6nVLG
   57GC5x2lGtgfinSvV0JeSGyEGf8+lS6Zm+OGdI1rcAzFSGFRuyd46v0yz
   1670nK55Y6Q/PqmCU+VzpcGS86WpxQLCOrjEfEO7Fv4ex/RQcqyvCQ3qK
   jIEtFXhOhl04T5WcL2sHzh5908cwOPGBpOUWlIN6BmLBrhtcaOFSfpfVv
   odsWraMrMFZzDvGzeEoXvEx0FoKuT67+QLLE1e4/rFxnd8oeFI5T0/PN9
   Q==;
X-CSE-ConnectionGUID: jJ/yha2QSSOOQTME6548Gw==
X-CSE-MsgGUID: 3NmFfdOJSgiJIu6MiQK0UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69177862"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="69177862"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 12:50:54 -0800
X-CSE-ConnectionGUID: nzMD/zzzQCWGdL5Gehr5hA==
X-CSE-MsgGUID: lSYvNpvaQhKsknnwtvw4yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="202510119"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 06 Jan 2026 12:50:53 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdE0s-000000001Mf-0gTP;
	Tue, 06 Jan 2026 20:50:46 +0000
Date: Tue, 06 Jan 2026 21:50:40 +0100
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-doc@vger.kernel.org
Subject: [akpm-mm:mm-nonmm-unstable 105/107] htmldocs: Warning:
 MAINTAINERS references a file that doesn't exist:
 Documentation/core-api/kho/bindings/memblock/*
Message-ID: <202601062108.Zji1qYKz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   bf64790fd7f2a71c84dada79a573d37cb08adbe6
commit: eb740b17afda02cf4df31bf10dd9a1450e5ad158 [105/107] kho/abi: add memblock ABI header
reproduce: (https://download.01.org/0day-ci/archive/20260106/202601062108.Zji1qYKz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601062108.Zji1qYKz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/mediatek-mdp.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/core-api/kho/bindings/memblock/*
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Warning: kernel/liveupdate/luo_core.c references a file that doesn't exist: Documentation/core-api/kho/concepts.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
