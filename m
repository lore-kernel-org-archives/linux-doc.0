Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA3A33D6E6
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 18:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763662979; cv=none; b=Y2dbyDzd7HbBy0qB5thRdlwfP/juWdn1lNVhHpAppTVgt2/SPPFN4f1TtGz8hn3maEJSMxh2S3qMeKYIaHzYT6SYsNL3anFAEmsfgbYmXmkIJZJjID8SWPMA3LXgbU5b56qO3kxAywjNA+FHp6GWgTIKnhfG8ElVJVh9VPhxDxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763662979; c=relaxed/simple;
	bh=5N6LnLhkiIKWwgy2xV95l1/pjg5tlmmnYjClYqbsdus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ottQ2l81CNEM8rJArApUaFUL2lefZQoLvGxcgWP/cFYkFmJYXfhUCWBeTccHKNyN0DV9als5dgIxAyb2w4R/FTw9OY++3BFS6YESUHtJsLyf1RfjxVtb/3Mvjyye7MI8y0fYfDC25tG36i1S9s0WoH3qgliGKcqYmtBljzIlf3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjMtw7nk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjMtw7nk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763662977; x=1795198977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5N6LnLhkiIKWwgy2xV95l1/pjg5tlmmnYjClYqbsdus=;
  b=VjMtw7nkJJrsyDWquxJBBq/iaFyedspaFs8TpqOCgNIypqSBsWDtREBV
   vNJpe0iKeqq9iw9yjyoJvIZIju/B6MPRc/7czAysaLmgQf2243zgAoFuI
   GsmwQ2fFcUSo9vk+Llr8S5OL4hArJizswE+FUCtbUfM+fBLItVXFewnZj
   w6/SvIiA2Xc1uxqHL8U5NAoa+SMdSEKngh4/ky2dwUHqwMqYRGcXC/a7L
   z2BvnMN1s8S+Uq8fkHLQbc9yCG1ON6F9mAtzAVvzmpsHXhJvLGYIAzVN5
   Su+71LMtcCRFvrGok8D6S50TDAo/VzUmMggKJ1P1Q6X2Hl2Aup41Lk0sL
   Q==;
X-CSE-ConnectionGUID: yTSkfRloREW4ICSM0QvAow==
X-CSE-MsgGUID: yuOfouwNSYOBA6nE8tSfPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64753722"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="64753722"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 10:22:57 -0800
X-CSE-ConnectionGUID: 0gmuas9CQi2k/NI/ayvoag==
X-CSE-MsgGUID: rSTL+rxHS5Gpn5Z3TH9lSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="222100351"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2025 10:22:56 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vM9Iz-000000001Vz-0BDM;
	Thu, 20 Nov 2025 18:22:53 +0000
Date: Thu, 20 Nov 2025 19:22:27 +0100
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [linkinjeon-ntfs:ntfs-next 12/12] htmldocs:
 Documentation/filesystems/ntfsplus.rst: WARNING: document isn't included in
 any toctree [toc.not_included]
Message-ID: <202511201916.CZMd9Lqg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   0a9cc0550bdfdf98654865de47197d09935c8e0c
commit: 0a9cc0550bdfdf98654865de47197d09935c8e0c [12/12] ntfsplus: add v2 changes
reproduce: (https://download.01.org/0day-ci/archive/20251120/202511201916.CZMd9Lqg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201916.CZMd9Lqg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/filesystems/ntfsplus.rst: WARNING: document isn't included in any toctree [toc.not_included]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
