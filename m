Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1AA4C98
	for <linux-doc@vger.kernel.org>; Sat,  6 Sep 2025 08:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757147597; cv=none; b=erxfNGykTvbxRZl1+SueY1oqfhMeAAZ1XSXfihVuw2Vn8FAM4ipC8taBO6sXD8sW7SLyr9uO9eWTfyO8PkdOYhFCNtKEF7ZqgWypqVFfjx0o5cFjTC7VeQcuQ7HREsE4nTXMWvuAeT+1Lhq4jTLWk/UcoYV75/7n1LHEspZUNc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757147597; c=relaxed/simple;
	bh=fBCgQ9+Esjb03hqSkMbtVgmbhJSrvSN5rMOZIFLecCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oj4FalJYwvpBWZFBuP4tSqgSkK+HRKgRKBlgwL/ZUy1rAcmPc3Ex8K/UA3AJO/xAy9IQv5j7rCKafTaGNwO14AxNI9iWDG7NT8WhYWjrKWpogWHYMoSvuLUo9BB1SP5b1a+dG93Yugoa/fzCH0nl7KISfW2xbyD+9X9p7gdhci0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCkqrHNV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCkqrHNV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757147596; x=1788683596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fBCgQ9+Esjb03hqSkMbtVgmbhJSrvSN5rMOZIFLecCA=;
  b=nCkqrHNVNoX/o+hAwiOldsdfGnDhch2pG0sW04B4dptdqiAnNoNfZDuT
   viRfTBZmAJ8W2Amw1D1EmIjYhrnNioxcKCH+9LgE2fmtDFP2Lk7eaiPTk
   GaElqcapWMSKv/NRcG96MKtYNEdjRRfwmzz05DvuaUMjq5wF/O+XMfuPI
   MlAL6tVFLYBstX7cYIegnL5kwpY2ZMRY2mdjrF3CUfD51v0Ex+2Sisyix
   3DhNRT+R/Pv5BEOhKtSP4usa/20jBlsRY428y5CwnETfZ3RWm7TdtaNkN
   n/TUZL8FxTpyzMJILgnahwHw9QuVl0bnPjQQCNKYweNVDP0DmsgXE6mQ1
   g==;
X-CSE-ConnectionGUID: eYi134WWSLeWo4jjAxK68A==
X-CSE-MsgGUID: iuGJdU07TYetbjDHtLaS+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59407641"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59407641"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 01:33:16 -0700
X-CSE-ConnectionGUID: LvB4lU6ZTZKfSy0ULtCbiA==
X-CSE-MsgGUID: 9RDaaRPjR9ejrPX6d4ISyw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 06 Sep 2025 01:33:15 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuoMC-00049P-2U;
	Sat, 06 Sep 2025 08:33:12 +0000
Date: Sat, 6 Sep 2025 10:32:59 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [jgunthorpe:pcie_switch_groups 5/12] htmldocs:
 Documentation/driver-api/pci/pci:19: ./drivers/pci/search.c:611: WARNING:
 Block quote ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202509061043.HTW4fby7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux pcie_switch_groups
head:   b07d062a257fab9b08dc1b6708ada05aa90d4cf8
commit: c99c2800fa7ff067b894e473bf60473ca4b7ee4c [5/12] PCI: Add pci_reachable_set()
reproduce: (https://download.01.org/0day-ci/archive/20250906/202509061043.HTW4fby7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509061043.HTW4fby7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/pwm.h
   ERROR: Cannot find file ./include/linux/mtd/rawnand.h
   ERROR: Cannot find file ./include/linux/mtd/rawnand.h
   WARNING: No kernel-doc for file ./include/linux/mtd/rawnand.h
   Documentation/driver-api/pci/pci:19: ./drivers/pci/search.c:610: ERROR: Unexpected indentation. [docutils]
>> Documentation/driver-api/pci/pci:19: ./drivers/pci/search.c:611: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   ERROR: Cannot find file ./include/linux/pm.h
   WARNING: No kernel-doc for file ./include/linux/pm.h
   ERROR: Cannot find file ./include/linux/pwrseq/provider.h
   ERROR: Cannot find file ./include/linux/pwrseq/provider.h
   WARNING: No kernel-doc for file ./include/linux/pwrseq/provider.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
