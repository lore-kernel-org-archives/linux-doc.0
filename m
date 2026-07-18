Received: from tbjjbihbhdcb.turbo-smtp.net (tbjjbihbhdcb.turbo-smtp.net [199.187.173.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CBF3148B5
	for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 16:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.187.173.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784393797; cv=none; b=DyLmh5BjhMovyheNP1x4ssTinDNUwCjKiidMzm0UXri7feuxCCSY3OE+S3nK6jgN3BN7fozFu+nU7nJDL+SJwBg1rdVUNgdbEcwGJ5dzjdTU7UN+C906bktCHvLCQxgAO5DY4R5IsYtH37FmkwARBx6izfP4OfVzXY6Yv//16HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784393797; c=relaxed/simple;
	bh=+fArK0dWziI0yrfMHXJb8IO2dCKsIao0vXUWAy5DaHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pj/WKU2OX/WlVCdQMvPjnIzzpBf7oD+o2iGMlZl0Yua+1ibBIqwY3wQhTI9u2/G1JgXvJx+JwSEgSsAP1O2D+hjSI1KJ/CtLvMax0Yhnwu6IUdcE5Pei6kJO1nQ6m8Gvt2NuRnMwNuNbdneeIbQRaY+idF8LhysrJmsI/xgZlQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me; spf=pass smtp.mailfrom=yahyatoubali.me; dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b=qTpymYQN; arc=none smtp.client-ip=199.187.173.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b="qTpymYQN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yahyatoubali.me; s=turbo-smtp; x=1784998596; h=Received:
	Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	Content-Transfer-Encoding:Feedback-Id; bh=WMCwa85iHZ89ULQ/eQ5Z1T
	+nFif5nAG0Mg+ADuS0HH4=; b=qTpymYQN86zKkcNIfKW8bqjFeMHiPlz6gnwRbe
	ge/+uVh3dX9LfhFkE9+VmHY43Sm4oQeUqvObsPjeThiboBbBeOXDuAjZUkwxY7Vm
	qpDoT7DIlyPB3t1M5GoU43fR9+Y1vp1RIwZh5hgdBlNo5n7PTBeE+SWraptueUAB
	ta5HM=
Received: (qmail 2893882 invoked from network); 18 Jul 2026 16:56:34 -0000
Received: from 197.145.178.94  by turbo-smtp.com with SMTP; 18 Jul 2026 16:56:33 -0000
X-TurboSMTP-Tracking: 64-018cfb16-00001e63be8269c2e004-004-4288bd4b
From: Yahya Toubali <yahya@yahyatoubali.me>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org (open list:PROC FILESYSTEM), linux-fsdevel@vger.kernel.org (open list:PROC FILESYSTEM), linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Cc: Yahya Toubali <yahya@yahyatoubali.me>
Subject: [PATCH v3] Documentation: proc: fix repeated word 'page'
Date: Sat, 18 Jul 2026 17:56:13 +0100
Message-ID: <20260718165613.1923550-1-yahya@yahyatoubali.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-Id: 26016534

Remove the duplicate 'page' in the sentence describing large page
allocation accounting. The extra word makes the description confusing.

Signed-off-by: Yahya Toubali <yahya@yahyatoubali.me>
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

base-commit: 1229e2e57a5c2980ccd457b9b53ea0eed5a22ab3
-- 
2.55.0


