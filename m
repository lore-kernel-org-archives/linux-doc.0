Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29033318ED2
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 11:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956828; cv=none; b=gJENj7Q30v1OQwzp6L4RsWxBOgYHxfbbiPcaamOQedvWQOkgxGIoLTVUK8RqnoOnHzGYjXhSwrZzmWDjIr7aICJYxdhUZgmlu+9uFEY9j4Rm8kV6Hkn6GVC5eNs5PIXpGHeZhZbwv7sbZsw4oNW4t7cg4xNn5xweRsAjJHj/BgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956828; c=relaxed/simple;
	bh=xSNBRqcWhfb0no9WUOtEN7TNeW9DVtPQytFhhHC7u14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gkz6HZtTPfNgVJ0MCVfv5v3ABRc6nHPCT78j9NHH0XzZI7IshY1+bXx0oP2PyHTN8HFrhI74EKv/bsXCATp5lOGPtqQXH9stEhWS6rwYYzxtAcOPwz672pHdW5FCUTPGzxoq/gU1ClJLDeg6TMD12QkoLslesc5Tz5ffbY4KCys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h5ltZJ4Z; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h5ltZJ4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767956827; x=1799492827;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=xSNBRqcWhfb0no9WUOtEN7TNeW9DVtPQytFhhHC7u14=;
  b=h5ltZJ4ZSz+ydz63fvNUFaVpEpN8aJBg8LdxQwR55XsiRF6JPSleJA7+
   SZft93bggbz9a/GQQIqn+KbtnPNE5alHGO+ft+5li4/0BpQug+UraMdMU
   c8BmsZwmcz4o1raQeqppwqW9qAodEvio7plNc7PKumHAxmsY90puq1184
   hs4ZQ2Vhr2sLNoc8oJ8C2RJF951/Duzp1vhtlgu/QBAC9E/Wb5lAbJ0Vw
   PGT/QmgsCLje0ge5/cCHULk693Y81TcloqniU/GDq+9dxg7PYkChK7AM4
   oC3B1HNyI4Ihwhx5f4e+tjPJD680pFhBkiOhSDnLBcXjbGC0H0b5eXVCQ
   g==;
X-CSE-ConnectionGUID: 1/ZVOOhISeG60AsNs3M4xw==
X-CSE-MsgGUID: brt8fYFkRcyuSmjPFvIE4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="56891466"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="56891466"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 03:07:07 -0800
X-CSE-ConnectionGUID: ce3N/KoNRSOfL5uMMbYyMA==
X-CSE-MsgGUID: SDJlXZAVTiiWFXMLKDVIAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203875459"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.143])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 03:07:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: kernel-doc -Werror regression
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Date: Fri, 09 Jan 2026 13:07:02 +0200
Message-ID: <98717d6e2d2505c253f511ea78968b5adb079a7e@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Mauro, Jon -

It seems to me with the kernel-doc conversion from perl to python we've
lost a huge amount of -Werror handling. AFAICS none of the warnings from
kdoc_parser.py using emit_msg() lead to a non-zero exit status from
kernel-doc.


BR,
Jani.

-- 
Jani Nikula, Intel
