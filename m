Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9594B283CB1
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206083; cv=none; b=Vydkzq/WnfVqtwMlkcK64CLc4I7NO/R09SQp8i4mO/dawJVvyd2ApUVxpNUbYCQJV+wXne22WIpe8ZnJt0C/p2/EC88aty57ILZP2l75XhulfP9H1rv2rNmsnwviL04K4T+l0ZBhOFUHua5ck8cacc4xdLvW8Br2EB5pRKkVScM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206083; c=relaxed/simple;
	bh=04YXqpkFxKXNNmFCqXfL1SWVGPdZx+xH2uylqN1Zjoc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gre1wqBveIH1LMhaHM79WeKghMQJp2VkeOJDBPywpfGG6N0XGzJK0BTQ1RF3DTwVj+8PFdTucNaZA1xqtZXYn6ZMFppkUQSJGq6esagr+wC2YQzjSex3VXdyOR7rII+dqCV6RuBLLQk+jsbaBl0xKOlxkIaK+yOWtV6pdBU/yks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+olLvYk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+olLvYk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206082; x=1806742082;
  h=date:from:to:cc:subject:message-id;
  bh=04YXqpkFxKXNNmFCqXfL1SWVGPdZx+xH2uylqN1Zjoc=;
  b=l+olLvYkijEGWgE50h3rpIUsI0s5Z4SC5kPmvqdbXJrx6Pemj0/qijyE
   bTUsJu3s+8w9ETbktdCu38wMV8Yny/Yt4BVFMhBZAVQoJjCDGSKYsiFxp
   92JYQAiOiUmMSOfbyTQtbuLWGsKkfnozyxwkZqgE0piMAL2E3sW6IoqD0
   kCUZsqeb5wa8RHGpw7/Z2LySHgAPFnwK+rrl6y4wdllfc2TAWZasfgBDR
   ZCNlxQWBwKpPAOwev2XVd3IJ2ZJ3F/eUeF8XCi25Xy8FFMBrAYzo8Q8Jd
   nH7Hn1O+jA5lLxemTI19wg7H+rih2ghm4rRjyRnQj6NwxUXT78RVTAUGw
   g==;
X-CSE-ConnectionGUID: I22ZSaXWRvu9Nx6S8OknAg==
X-CSE-MsgGUID: XJidpjcnRn2mjhQlpj5kjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="87658614"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="87658614"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:48:01 -0700
X-CSE-ConnectionGUID: N2JE3Da+T3648PBP8YIsQQ==
X-CSE-MsgGUID: eqLlDJexSrShgEq9JxDnJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="232014708"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Apr 2026 01:47:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aC5-0000000017X-0pIb;
	Fri, 03 Apr 2026 08:47:57 +0000
Date: Fri, 03 Apr 2026 16:47:21 +0800
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-doc@vger.kernel.org
Subject: [cornelisnetworks:for-upstream_20260402-1611 31/31] Warning:
 drivers/infiniband/hw/hfi2/chip_gen.c:577 This comment starts with '/**', but
 isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202604031658.ZEU8LAvq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20260402-1611
head:   f09b053c0b35d3b9de750922b56cbf341eac7434
commit: f09b053c0b35d3b9de750922b56cbf341eac7434 [31/31] RDMA/hfi2: Modernize mmap to use rdma_user_mmap_entry infrastructure
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260403/202604031658.ZEU8LAvq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031658.ZEU8LAvq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031658.ZEU8LAvq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/infiniband/hw/hfi2/chip_gen.c:577 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Ask cport firmware for the temperature.
--
>> Warning: drivers/infiniband/hw/hfi2/affinity.c:93 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Remove HT/SMT threads from cores in @cpus.
--
>> Warning: drivers/infiniband/hw/hfi2/init.c:969 function parameter 'index' not described in 'allocate_rcd_index'
>> Warning: drivers/infiniband/hw/hfi2/init.c:1984 function parameter 'params' not described in 'hfi2_alloc_devdata'
>> Warning: drivers/infiniband/hw/hfi2/init.c:969 function parameter 'index' not described in 'allocate_rcd_index'
>> Warning: drivers/infiniband/hw/hfi2/init.c:1984 function parameter 'params' not described in 'hfi2_alloc_devdata'
--
>> Warning: drivers/infiniband/hw/hfi2/user_exp_rcv.c:962 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Unprogram TID for @node, updating user TID invalidation events when
--
>> Warning: drivers/infiniband/hw/hfi2/chip.c:8163 function parameter 'ppd' not described in 'set_hdrq_regs'
>> Warning: drivers/infiniband/hw/hfi2/chip.c:10792 function parameter 'ppd' not described in 'hfi2_get_qp_map'
>> Warning: drivers/infiniband/hw/hfi2/chip.c:10836 function parameter 'ppd' not described in 'init_qpmap_table'
>> Warning: drivers/infiniband/hw/hfi2/chip.c:8163 function parameter 'ppd' not described in 'set_hdrq_regs'
>> Warning: drivers/infiniband/hw/hfi2/chip.c:10792 function parameter 'ppd' not described in 'hfi2_get_qp_map'
>> Warning: drivers/infiniband/hw/hfi2/chip.c:10836 function parameter 'ppd' not described in 'init_qpmap_table'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
