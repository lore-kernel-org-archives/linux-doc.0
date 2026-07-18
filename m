Received: from tbjjbihbhdcb.turbo-smtp.net (tbjjbihbhdcb.turbo-smtp.net [199.187.173.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3855C3AFB18
	for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 14:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.187.173.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784386001; cv=none; b=hUhNGPqh+suVfJ5mrQcySwkFofTSGwWI1OgozNFooPwnljk0OuH5fIsSLVvKbVGVYX15NJRLjU9ZLeNa6OHtyYR3/vURZnCdW0J+1sNC5LfpTsaDbroDadFBh68JHbpzBlnxT5yxExG+b+5xm1XPhFEATDDBisBxOY+vGpDMs7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784386001; c=relaxed/simple;
	bh=PqhBgI8OSsv9MtDJm8hSr4iuefhdx+/0OMqjlkiX1DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ya7ffT3AgK9zKG4CKhUCRJN8NJL+4N4zcLx5hgR3pl2fC7pxWheg3VJDLDHPlKXMDx1ufxaqvZgpnSFoK2uymRJ5L1t2eN+ATX5KclC92jgLUsEdxSLN2E8x/m4bFKhE370V9AtMAdJ2Xqga5b3Hi9eFWLGlRWywoDzr06a+q+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yahyatoubali.me; spf=pass smtp.mailfrom=yahyatoubali.me; dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b=nbJe/Zya; arc=none smtp.client-ip=199.187.173.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b="nbJe/Zya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yahyatoubali.me; s=turbo-smtp; x=1784990799; h=Received:
	Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	Content-Transfer-Encoding:Feedback-Id; bh=v85NYeDe3+EvhfPy23qFOi
	D+XADAkxo9z05r9kM4Eyw=; b=nbJe/Zya6xhJzCZizwBKc2l2lgKv4GV92mTXER
	iF4vrpX/ofakG4+8i5s1DbtgVZ58AkRx7N5Lmp0VAI+spl1976POaZjIDYuH7QQd
	odrvPy55QPbm1se5QpNSqKlgXJxBpY/bNiG/Wk+48uiXMoCDsEXIEwOQQMhbOa/7
	yNmt0=
Received: (qmail 1923429 invoked from network); 18 Jul 2026 14:39:58 -0000
Received: from 105.76.9.106  by turbo-smtp.com with SMTP; 18 Jul 2026 14:39:57 -0000
X-TurboSMTP-Tracking: 64-018cfb16-00001e639f3e7a02c004-004-4288bd4b
From: Yahya Toubali <yahya@yahyatoubali.me>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org (open list:PROC FILESYSTEM), linux-fsdevel@vger.kernel.org (open list:PROC FILESYSTEM), linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Cc: Yahya Toubali <yahya@yahyatoubali.me>
Subject: [PATCH 1/5] Documentation: proc: fix repeated word 'page'
Date: Sat, 18 Jul 2026 15:39:36 +0100
Message-ID: <20260718143937.1880391-1-yahya@yahyatoubali.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-Id: 26016534

Remove duplicate 'page' in the large allocation accounting description.
---
 Documentation/filesystems/proc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 2ccd5b2dfdd3..d22ac0addd42 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -513,7 +513,7 @@ In some kernel configurations, the semantics of pages part of a larger
 allocation (e.g., THP) can differ: a page is accounted as "private" if all
 pages part of the corresponding large allocation are *certainly* mapped in the
 same process, even if the page is mapped multiple times in that process. A
-page is accounted as "shared" if any page page of the larger allocation
+page is accounted as "shared" if any page of the larger allocation
 is *maybe* mapped in a different process. In some cases, a large allocation
 might be treated as "maybe mapped by multiple processes" even though this
 is no longer the case.
-- 
2.55.0


