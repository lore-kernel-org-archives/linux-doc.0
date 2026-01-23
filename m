Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C6E21ADCB
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 10:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769165864; cv=none; b=Xlq0Zp9kha8PBCO7Cm5RYz3SmutbXQN4rBacBjyrCL7I5C/2iCuF2Jq1OmVX4uAEcbLuWG7Z0BQRXVXNA46Bwb9sozFEquexhthIWWp36bds84Sn6cL04fTzrkUyQ+XrpkeDIcdmnkzZRp5m2MFgpJ0Bj4YyTvyDhSe4eCKyXHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769165864; c=relaxed/simple;
	bh=PCnn6/ynrPPiLxK7UHGmgM/b0Tx4YPkgeEcbZZIIEtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n+NiLgkNFktq1gGZtXlxhH+/g4G61O6Hu3uKs+VYTPZxJe08Ge+AXHbLyQCnJ00Z2uwpVB7O9D13TEK///Xh3ka+u+HhO0zXl+497utOdQaq5kKCtbEaDLHtHw/9Wfb/3VFy28Ka8RTCDZEHkvkuKl8EE740vtoaJPdefjz0gd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRxUB9CF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRxUB9CF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769165862; x=1800701862;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=PCnn6/ynrPPiLxK7UHGmgM/b0Tx4YPkgeEcbZZIIEtc=;
  b=YRxUB9CFVNGSvbdjmqqA8z22if2lyZr+B+r9PFxs4Yw3sdTklBKkJr2n
   PTALfZBJZH/ZEHgAnL8kkUeP3nm1ZJdzzYbzzpW9Aw/aKVrUfxioaDafh
   GEsCOYH4nHJyMOZgCUTM6PUMPp1rV6NAUgLcS/AXBeZIz1aNoVASL1LpQ
   //WBxflsK17jkEd/JqDS4Uhz/7bFaP0ZivhoQ4JNfkts0v3AIsqTTc6/P
   McMUNt36atGDO4ilkJ7oNfSposBne9IjwmTzG8n6oKCDSbKkiQ9Pw+qvH
   ws26H03HTz2VbUT6ExfpMhYwiaVakrxV+h77RXnsXQGF1/I6qiFs4OmHC
   A==;
X-CSE-ConnectionGUID: 3xuY4nifSmSje1nAIOHApg==
X-CSE-MsgGUID: rhXfTejxThaREr9ufIDMuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="73005970"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="73005970"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 02:57:41 -0800
X-CSE-ConnectionGUID: nKbzjsNmRVqZrJI/fEu3jQ==
X-CSE-MsgGUID: JqLQzAQKSkSE38m+fKmnUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="211122386"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.2])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 02:57:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Passing SPHINXOPTS is broken
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Date: Fri, 23 Jan 2026 12:57:36 +0200
Message-ID: <db84b28d2997a1ce73ca9bc65c33e2d08a90aae8@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


I was trying to get the regular sphinx-build output.

The monster sphinx-build-wrapper thing has this obnoxious and complex
logic of forcing -q unless you specify verbose in SPHINXOPTS. You'd
think those defaults should be specified in the Makefile. But no.

Anyway, setting SPHINXOPTS in the environment or on the make
command-line doesn't work, because Documentation/Makefile overrides it
to empty.


BR,
Jani.

-- 
Jani Nikula, Intel
