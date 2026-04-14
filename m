Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0333EC2FC
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776181986; cv=none; b=KV4GrrACQVPiZtHU/vRiuuXPE0U5DZnc0h9NkuVQK4OMiPimbs2+zpFxoKnOlarEthL/ziP4dgqTRmxEajfGhASx746jS978q1+fhF98rcirqlNd0ECE9kGJYZ4ZUeNjyE5zAOZCS37t7u5SwaU/V6RtnHIRm7ahGA9Ev+UToxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776181986; c=relaxed/simple;
	bh=kW6vz8CNfrhFX1nrQy3EsZ433Nz5IeVf8h4zujlHDoA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JM5fI/bp77QaFJKuQESAjj6Oce2kdFjU97AN6BDrzhrZBcqSaadpw8WsQI/IvpzLZE0umVTTlkXSogM+YknT5am/etpKxQtcOcvs9T/ORkagqfbsOrvrCQu/rOHo8rcylx81QttRA0s+w4COwOVl0QRDX8m17gkPiLny83mRUjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRgw6+T3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRgw6+T3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776181985; x=1807717985;
  h=date:from:to:cc:subject:message-id;
  bh=kW6vz8CNfrhFX1nrQy3EsZ433Nz5IeVf8h4zujlHDoA=;
  b=SRgw6+T3b1AWFUVQMB1W7cJS1v24k58dMFQplUyrjE1RsnT//X8kSvYD
   JxBUDQIdvVVaFGbFgi8jCOfb9zXKPLaSDu1Wy6mGdYnx52IdflJb2u0Vu
   b4S3o4YW3JM49QDZ9ZFeKsALRpW/4Xm6GRTYyBtSiZBKMy4QzfQhfI/N/
   66oDV4lsprItjdHwlMa3HSsazUCcxgOTbfRpfYXSO6OpJuvWssR+82AwU
   EJQDLC3baCfqYefCK/lEni3CG9OG+D0ybz//4zsIl9g/DJzD35m98YgHd
   b8xlM45CexuGSBflXpx5OF8M5c3P3MWU2l2cX5plcqCQIIgPXqsrffa7V
   Q==;
X-CSE-ConnectionGUID: p7YFDJCzQjafUHBT+fCC3g==
X-CSE-MsgGUID: X7zFPvKeTRu8d5AS96mmNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76849421"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76849421"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 08:53:05 -0700
X-CSE-ConnectionGUID: EKnFJCxPSL+BqyW/JF8H4A==
X-CSE-MsgGUID: qta4zjYeTMOTnVHddtSq9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="231884663"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 14 Apr 2026 08:53:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCg4T-000000000RX-0ryK;
	Tue, 14 Apr 2026 15:53:01 +0000
Date: Tue, 14 Apr 2026 17:52:48 +0200
From: kernel test robot <lkp@intel.com>
To: Dev Jain <dev.jain@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/core-api/mm-api:104:
 ./include/linux/mm_inline.h:577: WARNING: Inline emphasis start-string
 without end-string. [docutils]
Message-ID: <202604141701.JY7pVkau-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Hi Dev,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/Dev-Jain/mm-rmap-initialize-nr_pages-to-1-at-loop-start-in-try_to_unmap_one/20260414-033035
head:   77dacfde3a6afac7fa3c015671d2452b524b37ad
commit: 1202b576c2e876c8cab1c41f1816a3c15bdf79d3 mm/memory: Batch set uffd-wp markers during zapping
date:   20 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260414/202604141701.JY7pVkau-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604141701.JY7pVkau-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/core-api/kref:328: ./include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
   int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)
   --------------------------------------------------------------------------------------------^
   WARNING: ./include/linux/mm_inline.h:591 function parameter 'pte' not described in 'install_uffd_wp_ptes_if_needed'
   WARNING: ./include/linux/mm_inline.h:591 function parameter 'pte' not described in 'install_uffd_wp_ptes_if_needed'
>> Documentation/core-api/mm-api:104: ./include/linux/mm_inline.h:577: WARNING: Inline emphasis start-string without end-string. [docutils]
   WARNING: ./include/crypto/skcipher.h:166 struct member 'SKCIPHER_ALG_COMMON' not described in 'skcipher_alg'
   Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:440.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:457.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
