Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6EC66B5B
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 12:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706617230; cv=none; b=n+8/PzzrfVlLmrPDZqGfEHc9GIO93Z/G+lS8zQw6M1GoAOZNe0GvL0LUEl641p5vpefp/+571hG7w/5Gy2c1o+bkKblLZbbjTfOLPPwLkea8G53k1M2rgIvZW3RVUeFYrRml1nZokuSw1ouDOPBQ1PhrAQh9THq99hj0zwPvzCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706617230; c=relaxed/simple;
	bh=x/Bwe35UcFZ432cEebDSrm3xLEhA/N0F6oSsq85Cvwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mzl7bElD6ogrpdYns13xz20FyZ24WZdwjDkJoDWpG9/fd/PgGWkvMLRDGVGZF37CPanF2CquJtvOAgvK8idNPK6cwkPsG/f77n+Q0TDXpEbLjAU2nTsvAzi721nkE6Q3Tv9c2nLKiJR20J2fplplGUZU16JXYe41BqWKD9/UySs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFbk19mZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFbk19mZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706617228; x=1738153228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x/Bwe35UcFZ432cEebDSrm3xLEhA/N0F6oSsq85Cvwk=;
  b=XFbk19mZTZd4+xs+a1tOWmdSmLQ9enFnAZ1gTGF+dQF93Pb81U0LjXxL
   oQizA863DCP2q16xYRbOM7s6e+wkV23Wd0pJhtIohnNvrIH8mRd9h0RNO
   NWBtKvpkabHYuBk6xZy3dtdsMyARwqzqCFGS/pT2FeuFCXsvhEQV91++p
   ZS6ViZaKoJZCInUrsl4KI35Wzm3rqg3TKp8hwnrTYSgzcVPCrBnFAHxuh
   qz1b1F75IysxEIgOiEAg3YnHadWiYGJAMcluHCAOTMaE6lGizubmD4AgY
   rlGfS9w1h1M9Bv5MuIcRE3gyrSLMB/eJTENn5QV09FN2Esa3xlpUCgKrb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="24738610"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="24738610"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 04:20:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="961258705"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="961258705"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 30 Jan 2024 04:20:25 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUn5l-0000Gw-2Z;
	Tue, 30 Jan 2024 12:19:54 +0000
Date: Tue, 30 Jan 2024 20:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 2643/2827] htmldocs: Warning:
 Documentation/gpu/amdgpu/display/display-contributing.rst references a file
 that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
Message-ID: <202401302044.TYqzwNmq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   41d66f96d0f15a0a2ad6fa2208f6bac1a66cbd52
commit: ba162ae749a5526025a6f1061bfcbb301a6adb65 [2643/2827] Documentation/gpu: Introduce a simple contribution list for display code
reproduce: (https://download.01.org/0day-ci/archive/20240130/202401302044.TYqzwNmq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401302044.TYqzwNmq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
