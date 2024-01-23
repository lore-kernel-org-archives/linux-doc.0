Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76D66281F
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 16:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706026949; cv=none; b=TaFKdMZ9O0dBSbgqQIHRdY119AuCBBr5s1KshAEG9kvnk4fFmg68oGbGTZPCzVdaE0aMlU4AjJEwq6OnVO3O5AqVrsGM0xh27TGkpvQjgqp12ipyPGZYpGswdKBV4dCxd4+sz4l4YJ2f7dIbt6aeOVA4GX5JNVNOFFMv6PWluMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706026949; c=relaxed/simple;
	bh=UUwGt4oUVgILrxaLSo7X4krtBWksyhTPT4cKPjSUg98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uGURCcwUiAjRG7AbIrptfhc0Vdo1hPRGTRTLsUXraOGOWXR0XM+ZatsjQLbAWVmlP6KqGV6kZ82XnSCKH7X0pPSg5haKeSLa6CMAklOJWBTy0YNQeOm6sfHPCHywpCsHmGKgDvtFJOBvBtxUkXbeuGzHuBooWGj0oGKTwkU7RPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXoUdMbM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXoUdMbM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706026948; x=1737562948;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UUwGt4oUVgILrxaLSo7X4krtBWksyhTPT4cKPjSUg98=;
  b=hXoUdMbM3hBASWhiaa+IpBaCpBBWuDPh3nsiwifirKast7l68Mj4NDUV
   Rnd4NtmOBdYvCLzMpWRJNa1iJsO+EOqgJPijwDJlbSSw6x6hrTYaP30IF
   /Soj+g6I5K/o/PmOkwyTQ73VG03aUS7YQ/fqDdmtTu35AXbKCGZkjAUQe
   Cc/fC8iJfN0e5D1bV5u4yE5lPH98MwWFOposjAyV3Z1sZ4vpjWBFt5J2q
   wZi1F6wWziwvMRsaasAMoPzarzf79bzj0pOfDXubdj68UGfrA8sxrVKIk
   6nizGWx0MGLVFxZC4v4CeKY4pSiHdA1/bkj5gl3O66xQLR4ACbjSE0nBe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="23041062"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208,217";a="23041062"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 08:22:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208,217";a="1640320"
Received: from hkhushk-mobl1.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com) ([10.246.112.60])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 08:22:25 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Cc: gustavo.sousa@intel.com
Subject: [PATCH] docs/sphinx: Fix TOC scroll hack for the home page
Date: Tue, 23 Jan 2024 13:21:58 -0300
Message-ID: <20240123162157.61819-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When on the documentation home page, there won't be any ".current"
element since no entry from the TOC was selected yet. That results in a
javascript error. Fix that by only trying to set the scrollTop if we
have matches for current entries.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 Documentation/sphinx/templates/kernel-toc.html | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/templates/kernel-toc.html b/Documentation/sphinx/templates/kernel-toc.html
index b58efa99df52..41f1efbe64bb 100644
--- a/Documentation/sphinx/templates/kernel-toc.html
+++ b/Documentation/sphinx/templates/kernel-toc.html
@@ -12,5 +12,7 @@
 <script type="text/javascript"> <!--
   var sbar = document.getElementsByClassName("sphinxsidebar")[0];
   let currents = document.getElementsByClassName("current")
-  sbar.scrollTop = currents[currents.length - 1].offsetTop;
+  if (currents.length) {
+    sbar.scrollTop = currents[currents.length - 1].offsetTop;
+  }
   --> </script>
-- 
2.43.0

