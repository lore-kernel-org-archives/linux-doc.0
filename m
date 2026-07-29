Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C35D442B0F
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 09:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317194; cv=none; b=KaiF0hHMYn8RUh3jb2Hga3bKAKsfCZVL+wLVMX5+nLOqVzLIFVharJG02PZA03IzdLSe151VLgHRF6AvTZDZU8IyoSJ9dxZTZ7ei39G8r6ZaEV+VfmsQqKN1gSuKA57q1Z9IzUiND3bAXF9fKlUfzTEzLXHCIFEll++Gxe2EIUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317194; c=relaxed/simple;
	bh=1rRmQk/KaUFvuEkz6NXiGfJHWv77K/BSZzBL5OlAIYA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uFHcMIwXJQALlxGt/CR8FwC8LeIE4LmU7CgEm4WB1BnYUP1G2yq/20q29j9gcPoRHHT7IKZl/A67xXNNPwCv+LcUPU1KTqbT6NibUCDRpVEU7q/a+Nu0EpDLuEAYxAg1LstA66lNgYqI5TxX+OWQL34R0F0GtMxHK93E+S11R/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DZxulavR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZxulavR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785317192; x=1816853192;
  h=date:from:to:cc:subject:message-id;
  bh=1rRmQk/KaUFvuEkz6NXiGfJHWv77K/BSZzBL5OlAIYA=;
  b=DZxulavRL4wN1AqIxf3uzBKl98dEXMZxJUdeyjzvovtxBR4knkY/k81B
   KTv93BHAtUvJ/rfgy6ts7boTqDuZgkAFy0sr5Y3fmJ7UEAmmnttc3Mwfa
   +zSQh8iRhiGCzF1W8dCJ3l2DrbJsC/1wqp13v5lz5nl0YhhmDA4ZEH/fo
   TiXFA84xAHT/U5JRIHH6gYR4t9J7APOSvLVQla/5xPBWbwb26VHg3nnDp
   GPGiGgtgWo9voteY52im//k/O5RZtpiVAvpYFdaSFclKikV1FjnWecpYk
   AtbE3EGNZpZliL0/AuIFLRIdkXnJS7Nhi7Sf+IBAlMIPHheNDfoiR/JPi
   Q==;
X-CSE-ConnectionGUID: b5zs4UQzQ6ysrWsXqfUJog==
X-CSE-MsgGUID: 85qT5HcaSX6ddibdEUHbcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89805970"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="89805970"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 02:26:31 -0700
X-CSE-ConnectionGUID: fjHWQLXGTyuP8CNiAmJrrw==
X-CSE-MsgGUID: lLOPYkZrRciGpDZ1rv1ddw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="260021966"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 29 Jul 2026 02:26:30 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp0YV-0000000027i-3IXx;
	Wed, 29 Jul 2026 09:26:27 +0000
Date: Wed, 29 Jul 2026 11:26:02 +0200
From: kernel test robot <lkp@intel.com>
To: Bharata B Rao <bharata@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/admin-guide/mm/pghot.rst:179:
 WARNING: Block quote ends without a blank line; unexpected unindent.
 [docutils]
Message-ID: <202607291144.LWiDngFA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bharata-B-Rao/mm-migrate-Allow-misplaced-migration-without-VMA/20260728-135111
head:   83ea63839655bef9c4e947bf642457beabf35b77
commit: 83ea63839655bef9c4e947bf642457beabf35b77 x86/mm/ibs: Add runtime controls for IBS memprofiler
date:   27 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260729/202607291144.LWiDngFA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291144.LWiDngFA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   0             no adjustment of input current limit. This
   helps for more unusual power sources like
   solar modules. [docutils]
   Documentation/admin-guide/mm/pghot.rst:90: ERROR: Unexpected indentation. [docutils]
   Documentation/admin-guide/mm/pghot.rst:177: ERROR: Unexpected indentation. [docutils]
>> Documentation/admin-guide/mm/pghot.rst:179: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/admin-guide/mm/pghot.rst:188: ERROR: Unexpected indentation. [docutils]
   Documentation/admin-guide/mm/pghot.rst:189: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/admin-guide/mm/pghot.rst:193: ERROR: Unexpected indentation. [docutils]
   Documentation/admin-guide/mm/pghot.rst:195: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   WARNING: ./block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'


vim +179 Documentation/admin-guide/mm/pghot.rst

   174	
   175	1. **l3miss-only**
   176	   - When 1, only accesses that miss the L3 cache are sampled. It is
   177	     recommended to run the memory profiler with L3 miss filtering
   178	     enabled.
 > 179	   - Default: 1
   180	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
