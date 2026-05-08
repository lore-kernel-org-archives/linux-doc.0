Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593053264D2
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238741; cv=none; b=oeep5B3JywrM6lv0AuMdKR5LcJhDRjAGhYaws9mT35ViWyxyEK0gVxYc7LwKkQR0cRiX3KeUmiT+1HDr6oOtd24eu1WZ5CHTMKXKltGF/ABm1xfbv1WtS6guepqZ064eWngpTp9ySy8XSS+QUbml7tyOIsrfI6tuT+t6CG5UxHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238741; c=relaxed/simple;
	bh=oRo1t6H5phFSson0CEzoZnbQp92RHRKh3Yz4chDwGdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o2VrcbqZHKIULaaJy8sTjqJehe//bseXszhY1V2dfwoUmaYPjnjrfl81SDTmFzowfCMdX4dQyjtMEAFc/SN0wtkiBLJyjgRofx93sHIUtrm8sun//pulFLbwCY64Pdy1tlhSJGPZM+LIzKdacBGlrafJTBLe2Zpq/oXyEEx4lXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljI+SRTg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljI+SRTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778238740; x=1809774740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oRo1t6H5phFSson0CEzoZnbQp92RHRKh3Yz4chDwGdw=;
  b=ljI+SRTgZ5Zd9NON+BfbMrZUQwc1dBh+N0s5eY5Potinw1pPhkSivpXl
   D3inZpbaDlUzVtysMw2kamMUiVLBp9A2mPL2NU8MnUi2M4PzeJw7qXwER
   mX+FdKcwZkkyX4DChoSM7vzXoLz4OLdMwN1CdJY9fy/2mfGPQp/LXmJm5
   1v3E7ANseSOrHXG996g1zUj7hAjH5H2P41St50H9m80+bfWvR65c5C0PH
   rSAs5KNsVjNXu5gSgxkJc7r1OU/tSWMiYgwafGyzwv8TABfykh6qBor7c
   +OU80CKiXOPiFblLBQeYzWt97F1yNPGX/T1dcJ4agY5BByyqtcfCzdbVW
   A==;
X-CSE-ConnectionGUID: 9BMwRQFFQ+GrO+qp7qGh5w==
X-CSE-MsgGUID: ZER/KHstTHyQb2y7+bwnkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79311803"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="79311803"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 04:12:19 -0700
X-CSE-ConnectionGUID: RTBn6kNURuKcmCJPIOcl2w==
X-CSE-MsgGUID: IkKln8MsQ5+60NkdDnH0sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="236867126"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.40])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 04:12:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Cc: jani.nikula@intel.com
Subject: [PATCH 1/3] Documentation/gpu: limit main toctree depth to 2
Date: Fri,  8 May 2026 14:12:07 +0300
Message-ID: <cddd2d11c104132801510e3ab4e4b9ef3ea9cb6d.1778238671.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778238671.git.jani.nikula@intel.com>
References: <cover.1778238671.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit

The main GPU documentation toctree has no limit to the toctree depth,
which means the main GPU index page recursively includes all the
headings in all of GPU documentation in the single table of
contents. This makes getting any kind of overview of the documentation
really difficult.

Limit the main toctree depth to 2 i.e. show at most two levels of
headings.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/gpu/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index 5d708a106b3f..65bf3b26e4f4 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -3,6 +3,7 @@ GPU Driver Developer's Guide
 ============================
 
 .. toctree::
+   :maxdepth: 2
 
    introduction
    drm-internals
-- 
2.47.3

