Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29143BC68A
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779185481; cv=none; b=QBer+ycxwm+yJWU4Vc3x0aTS9/vN/EzSbVVv/pXEmEd4cj7HttPpEsce4VY87IsvyQ/HGYhWo2XQYZg6NlmZziFK2pcu1raGbNFn1kpxQHZ3G14VdaZEGeFO0MYlDMmYXeifXukMXZtAbsiR713Uj/h5hTLLDQgXQ8QMqvdIZjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779185481; c=relaxed/simple;
	bh=Kze1V6eFVAX8EJbeGRzRstU4cy+/aZrG49HgYDv7SWU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EChxQD6VwMQpk4buzmUsae/GUHbOFVVNdvwFTlOg1DWJjBL5Xnxw8yb322z1oNRZXZ5/R1cwxNCR4YsunHteporKW5vahgF6FpAdY+B02Orpr+mTy/yZQzF70Vy2mK/vQ/orrDiAQiEvC+7mv3/QahCtQeL/Lpuwrc9ddfHf61g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n60D1xC6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n60D1xC6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779185478; x=1810721478;
  h=date:from:to:cc:subject:message-id;
  bh=Kze1V6eFVAX8EJbeGRzRstU4cy+/aZrG49HgYDv7SWU=;
  b=n60D1xC65UOENZ9HdOvhdN0Tzs9tBkJP0miAA0ShfIxW8LLZcwmFXRzI
   VMLzzX/5YXt0Vyg8zLQPMZhc490o3Ca65PvvwnijW9/RZLvVzbIFP9eA4
   RYL97XaGFwWM9Bi1v13Gf2cQseuDRAwVXQJCNE+qh/MDzCruWqWSf9PTX
   hq8yfEj/m1vS4ra5LUmBSvrGkn8G2shxbiIIR9zUzQjkxbGpPjLmXN6wA
   Gys/hShjdvI+QVvJu+mCpHDcZ3TkbyrcRwmjRZ2NXRzca3b5aNbX3BDqK
   HAS1x0bEG4/tvn8P5jDwyvorkLi4n7TINCa4fQcPJXNGDfYwKa3Oyella
   Q==;
X-CSE-ConnectionGUID: /Qxf0X7aRXaKCUzUHhkwjQ==
X-CSE-MsgGUID: FNTRhFU+SZq2HI57F2OZCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79908610"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79908610"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:11:16 -0700
X-CSE-ConnectionGUID: IwJlpF16TOujDqRY6Gj+cA==
X-CSE-MsgGUID: kT1x1jWPQsmI9T18m9qFow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235479139"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 19 May 2026 03:11:13 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPHPr-00000000A9V-3VmR;
	Tue, 19 May 2026 10:11:11 +0000
Date: Tue, 19 May 2026 12:10:59 +0200
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, linux-doc@vger.kernel.org
Subject: [agd5f:drm-next 36/58] htmldocs:
 Documentation/gpu/amdgpu/display/display-manager:50:
 ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:420: WARNING: Error
 in declarator or parameters
Message-ID: <202605191223.ct8ZUEYU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   99cbcb3453b7d19cab507db9313ada9a38e82d01
commit: 82ffa89fa2803f9288163f538151a45581a88ca2 [36/58] drm/amd/display: Add KUnit test for color helpers
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260519/202605191223.ct8ZUEYU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191223.ct8ZUEYU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   AMD plane color pipeline
   ------------------------ [docutils]
>> Documentation/gpu/amdgpu/display/display-manager:50: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:420: WARNING: Error in declarator or parameters
   Invalid C declaration: Expected identifier in nested name, got keyword: struct [error at 29]
   STATIC_IFN_KUNIT const struct drm_color_lut * __extract_blob_lut (const struct drm_property_blob *blob, uint32_t *size)
   -----------------------------^
   Documentation/gpu/amdgpu/display/display-manager:50: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:437: WARNING: Error in declarator or parameters
   Invalid C declaration: Expected identifier in nested name, got keyword: struct [error at 29]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
