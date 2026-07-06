Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21792459C5;
	Mon,  6 Jul 2026 05:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.90.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783314410; cv=none; b=ILzq3BOCgPz0WS2E0Iphisqo0Ff6hVyYBl7usA1a2jMQowHkJTMtoRKkOPnH/6HRHccnHLjzetOJRxyw5E3gGsrTIFxOb6NOVDE0/Q5ZRktK3iBRaNT4NjWttZle/f09D4DZExQ90kh8M2+hGdN7a+GD1EllKc2Bu4DzBoKC0js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783314410; c=relaxed/simple;
	bh=5lEG25gpWK2qINDdzcO8/gLY1vOhbdurY6B83rUorpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IJ/MmwpjTNton+jbOasX1l7B8f30YCpYL2lrA9LOmOpj3Z9oNA+Hz+WPr7pOqxESBYIKx7u0F5xajsOfxYhLijvFWTe5LuYaelBIkMmPDtXirXb7gbTWdQskTvgou+2bnAE7E52QmN/3ShwsG/9tt0sfWsQON5sTDZ/OSXcUffk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=XKYVdE/S; arc=none smtp.client-ip=207.54.90.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="XKYVdE/S"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783314409; x=1814850409;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5lEG25gpWK2qINDdzcO8/gLY1vOhbdurY6B83rUorpQ=;
  b=XKYVdE/SDvM4VFsT2iN3XgZS80Aafc7XbQ4KHaJFFghJ9o4upK70X0Ie
   7zg9rQuUu3UxslCwRuQ92qSiYZb69BkQZs8WAShHRI3JSC/fumm5xpdku
   7kAjnvOI4LFLpYMlXCVGhKmnq4vNBKpC9a/7TuOOeopRtb05wm7WQ8q6O
   OCxz2b4gSLJRdXhJ0pjm8NG8TbzRA6CE/OBLJ0lDpY5gUgYdzDp0B2opi
   NMChYbrPNZi5S2sTRUvN8c85ZpgeJq7eTzslRW7BbAHU1R9J2uXwbdXLo
   yIxNBzHhD0gzxS6c6DpPkFDIYEQGqYrwQ9gwVuD6UUJuN3U5JUJKkRMv5
   w==;
X-CSE-ConnectionGUID: l3Q8DcAdQY2/2EmwSyEtzg==
X-CSE-MsgGUID: 50cDZf4HRl+LB7bpoNNC0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="246402189"
X-IronPort-AV: E=Sophos;i="6.25,149,1779116400"; 
   d="scan'208";a="246402189"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 14:05:39 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4E6781C000A9;
	Mon,  6 Jul 2026 05:05:39 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 076CB101D698;
	Mon,  6 Jul 2026 05:05:39 +0000 (UTC)
Received: from whale.soft.fujitsu.com (unknown [10.125.16.33])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 2CEC7826FDE;
	Mon,  6 Jul 2026 05:05:35 +0000 (UTC)
From: Iwata Koki <iwata.koki@fujitsu.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Matthew Garrett <matthew.garrett@nebula.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	iwata.koki@fujitsu.com
Subject: [PATCH] Documentation: admin-guide: fix a doc for efi_no_storage_paranoia the "5KB" instead of the "50%"
Date: Mon,  6 Jul 2026 14:05:34 +0900
Message-ID: <20260706050534.1653916-1-iwata.koki@fujitsu.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation for 'efi_no_storage_paranoia' incorrectly states
the kernel cannot use "more than 50%" of the EFI variable storage.

This percentage-based explanation has been outdated since commit
f8b8404337de ("Modify UEFI anti-bricking code") introduced a fixed 5KB
minimum reserve threshold (EFI_MIN_RESERVE) in
arch/x86/platform/efi/quirks.c. At that time, the documentation was not
updated to reflect this change.

Update the documentation to reflect the "5KB" instead of the "50%".

Fixes: f8b8404337de ("Modify UEFI anti-bricking code")
Signed-off-by: Koki Iwata <iwata.koki@fujitsu.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22..3f75969a679b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1614,10 +1614,17 @@ Kernel parameters
 			on all PCI bridges while in the EFI boot stub
 
 	efi_no_storage_paranoia [EFI,X86,EARLY]
-			Using this parameter you can use more than 50% of
-			your efi variable storage. Use this parameter only if
-			you are really sure that your UEFI does sane gc and
-			fulfills the spec otherwise your board may brick.
+			The kernel reserves 5KB of EFI variable storage for
+			safety, because some UEFI implementation may fail to
+			boot if there's insufficient space in the EFI variable
+			storage.
+
+			Using this parameter, you can use the 5KB reservation
+			in the EFI variable storage.
+
+			However, Use this parameter only if you are really
+			sure that your UEFI does sane gc and fulfills the spec
+			otherwise your board may brick.
 
 	efivar_ssdt=	[EFI; X86] Name of an EFI variable that contains an SSDT
 			that is to be dynamically loaded by Linux. If there are
-- 
2.52.0

