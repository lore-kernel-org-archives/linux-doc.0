Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F48834D382
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 11:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238737; cv=none; b=vDIWJlMSAnrq2yrtwQYqFYPCGhow9p5LmIrllb5aAMvMYJ8GnGe70shXosFaAZpEiv2Zjuq/jOkNUuTWWELfULWuiHnnpVRc81rDq5QtXBThIraE8VINltXEvJgMkkJnJue9FmmYrVWJk76xCmck7epOE88Kl2Yk3R2XwRSwNw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238737; c=relaxed/simple;
	bh=9i4UXkiTi0qzlvvx1XqvxQArJ4VEq6Gv23WLkgfeHzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uLaLGd9RLPEQbE0zkkE/PqpKoGK+EkmIPSKtNTYJ+C3pjEkf+8eTjA69U3+blR6RV4uH6SGH1ORg7vCSKEvOuCze3IHTKQWnPDMM0NvPcZcI6enTXrwaG4XMLZLrQCEeeWgQdiWC/Ogbzt1LhqKvUmRSYs6vI/ESOoTQwDFq6pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ubti8Old; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ubti8Old"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778238735; x=1809774735;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9i4UXkiTi0qzlvvx1XqvxQArJ4VEq6Gv23WLkgfeHzI=;
  b=Ubti8Old5uR8mDb3Dk0+hMINzsiCzVpbfgwZCEn4FAAL7NC1w/vM3qGu
   4w9WpSYs+qKnFEhbOgEcDs3iuRFPU5VTqQVadjhj896DWLKfDQ8eAmpp1
   BNjFmciIE6ctDM+/52foFjiY6ozp7/fARYssne8Oqmsfnurz/ruq8mpRt
   ss1rSJ6vC5Fu5WMabelBU3FUQH5raaw8hMvPXkg9vtjZADbiLsV2Oxxba
   yyM2nw1EO1rGoCcU991i2Ohts+wHodPh660ZdCk++WCpEhoSINiCeSicu
   eR1yy2dwCHyegtCBzuLqdf1MF95BTmpjHUhyDze8eWW7HTu8OU1UQ4snb
   w==;
X-CSE-ConnectionGUID: tNnxFqzoR7OOh8/KhpYlFg==
X-CSE-MsgGUID: kRqg4M5NRiKy/5/kaGqnaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79245737"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="79245737"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 04:12:14 -0700
X-CSE-ConnectionGUID: aj/9XFvpQyGBk0CnKExNvw==
X-CSE-MsgGUID: iKDiAKcIRYWGNQ4TtDydQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="230341304"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.40])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 04:12:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/3] Documentation/gpu: tables of contents cleanups and fixes
Date: Fri,  8 May 2026 14:12:06 +0300
Message-ID: <cover.1778238671.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit

Make the GPU documentation slightly easier to navigate.

Jani Nikula (3):
  Documentation/gpu: limit main toctree depth to 2
  Documentation/gpu: add some tables of contents to large documents
  Documentation/gpu/rfc: fix toctree

 Documentation/gpu/driver-uapi.rst     |  2 ++
 Documentation/gpu/drm-internals.rst   |  2 ++
 Documentation/gpu/drm-kms-helpers.rst |  2 ++
 Documentation/gpu/drm-kms.rst         |  2 ++
 Documentation/gpu/drm-mm.rst          |  2 ++
 Documentation/gpu/drm-ras.rst         |  2 ++
 Documentation/gpu/drm-uapi.rst        |  4 +++-
 Documentation/gpu/drm-usage-stats.rst |  2 ++
 Documentation/gpu/index.rst           |  1 +
 Documentation/gpu/introduction.rst    |  2 ++
 Documentation/gpu/rfc/index.rst       | 26 ++++++--------------------
 11 files changed, 26 insertions(+), 21 deletions(-)

-- 
2.47.3

