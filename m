Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC1C1DF736
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 00:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766450052; cv=none; b=SiHXs5nTJlhTThZuWJfJv299PL65leIJ9PsKmHSO7lRh4/4Uu0gT2N10/d+KoZJ+AJ7HNsSrnRhO8+YBGByOxdZcKwMoAko3kvGRbvuaKtDCmgoNnszazBG6Czj6D4qugQwLXCYFE3M0UgAzCxNHIVyLPxngHYD1ac2oqYv4z18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766450052; c=relaxed/simple;
	bh=FKklEHyeI/njf60Igo29V9POwCT98B5Ns21zj+AF4wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G0SYztSHSGwUShIP1oVlmCj3Gf1sP/BE0ZF2JTrbAGZmcthZKmZyllSainkysBmiLJOZO3OuDsl46R54wLIjpj8hR0N4IxpsYFCL2oQTp/D3tSnS0nfR5B/cwgTTis9LUaZvX9Xgri5vjm98ACqImhbZ8V0ydIGaHOM5YTz//l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMFPzbzR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMFPzbzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766450051; x=1797986051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FKklEHyeI/njf60Igo29V9POwCT98B5Ns21zj+AF4wQ=;
  b=OMFPzbzRyeRWNlPTxS+7N3VKNE+98MbiPsjo1zPSN4yxQnC5czp194QS
   2IdD3w0M+5hj5bhqSJglFaWnY2Mk5/zhKcJaPRsT7cIrDawfely8awt1z
   9cFh0na58pMH7pLYL2zxS9dhLJRvR5Dd6oNCR6JVjrDcYdXzplSj4pIyH
   RJ2MZ1knXCCWDtuBK825X3vDHSbA7U2jwKygCBrBBNETl5bk2qmQ3a7cN
   SgklDGOkW/u1RjPKxEQbNWBarisIUY7n5f7CinWIjIq+oTnHpAWiyimdC
   AwZxbRv0r75G2tPeeOP9EgSjiuMI9sEFBHi+nSl+95GEZHL5m81sXXalP
   A==;
X-CSE-ConnectionGUID: Qo+Sl2zbT+mFmhf47c8Zag==
X-CSE-MsgGUID: DHL/vHHGRrS/phhmV5mBBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79755973"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="79755973"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 16:33:29 -0800
X-CSE-ConnectionGUID: lj/fqBRPT1GKAvbGkui9cA==
X-CSE-MsgGUID: 5Gout/c5SsSiJIZDd37BUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199303883"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2025 16:33:29 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXqL8-000000005g8-05b3;
	Tue, 23 Dec 2025 00:33:26 +0000
Date: Tue, 23 Dec 2025 01:32:26 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sashal:spec 76/131] htmldocs:
 Documentation/core-api/kernel-api:304: ./kernel/acct.c:306: WARNING: Block
 quote ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202512230159.BhWPpHr4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: e272cfa94fbbaa41a1ef6f26105a0d4d3e4d8cbb [76/131] kernel/api: add API specification for sys_acct
reproduce: (https://download.01.org/0day-ci/archive/20251223/202512230159.BhWPpHr4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230159.BhWPpHr4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/math64.h
   ERROR: Cannot find file ./include/linux/kfifo.h
   ERROR: Cannot find file ./include/linux/kfifo.h
   WARNING: No kernel-doc for file ./include/linux/kfifo.h
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:301: ERROR: Unexpected indentation. [docutils]
>> Documentation/core-api/kernel-api:304: ./kernel/acct.c:306: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:355: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:440: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:452: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:463: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:474: ERROR: Unexpected indentation. [docutils]
--
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:530: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:540: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:549: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:553: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/kernel-api:304: ./kernel/acct.c:555: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/core-api/kernel-api:304: ./kernel/acct.c:557: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   ERROR: Cannot find file ./include/linux/bio.h
   WARNING: No kernel-doc for file ./include/linux/bio.h
   ERROR: Cannot find file ./include/linux/clk.h
   ERROR: Cannot find file ./include/linux/clk.h
   WARNING: No kernel-doc for file ./include/linux/clk.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
