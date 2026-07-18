Received: from tbjjbihbhdcb.turbo-smtp.net (tbjjbihbhdcb.turbo-smtp.net [199.187.173.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B370339708
	for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 15:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.187.173.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784387977; cv=none; b=flsdbwA3jleqr2M9ScXQn96N/ybG62Xt0f07OSP6CIAuuZGInNcn6eSEhebi9DoJnueg8VKkJPXqMnkViTFe5CTwOdIz3HjZeINs5wKijTrnNtPbadmSAwSzzWSXLWUoQihiJbdw1KcmT2K5FXgzYhXB8etabLL+5qWFiA27vHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784387977; c=relaxed/simple;
	bh=nfoHQZKsSe7OTFV/EmQA6dHzUn7csK5Qmse/FwLKt24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UtX4jT5eSL8+6LcnzLAaCS5HECyZp8b4DDqOU5uovZGOvcbI0LgVZ8N+Z6wzcUbQt3bCw9dsJa4HrMOy+YqL/uwACni69xdNPLsGS+8cDY73vOykgDxSfKlTfUFx/AGzonNKUeMZEZDUtI0me7QYb9FMAVmrHtRCfqykFe8pOyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yahyatoubali.me; spf=pass smtp.mailfrom=yahyatoubali.me; dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b=W0/FW/Li; arc=none smtp.client-ip=199.187.173.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b="W0/FW/Li"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yahyatoubali.me; s=turbo-smtp; x=1784992775; h=Received:
	Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	Content-Transfer-Encoding:Feedback-Id; bh=mydz+hMWv4OPYB49xQz7uJ
	aRhTr8PCzEcSJzgX4E7zY=; b=W0/FW/Lik8i0z7SAL39YuHl1gpXK/FE4+oCQX0
	dbBo9KWiAZuQ8wYghFYoZxiwzBd0NlbqYGXsU6t8uZGBIbrq57liw123bIo9N5zp
	wxNPa5oS3p9CYcIFK8EO5N0aIfqfTOHT3TkcXR2j3NQZZc2Oa4om2wUjw7RdpbOy
	MAZFo=
Received: (qmail 2203275 invoked from network); 18 Jul 2026 15:19:34 -0000
Received: from 105.76.9.106  by turbo-smtp.com with SMTP; 18 Jul 2026 15:19:33 -0000
X-TurboSMTP-Tracking: 64-018cfb16-00001e63a84e6602c004-004-4288bd4b
From: Yahya Toubali <yahya@yahyatoubali.me>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org (open list:PROC FILESYSTEM), linux-fsdevel@vger.kernel.org (open list:PROC FILESYSTEM), linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Cc: Yahya Toubali <yahya@yahyatoubali.me>
Subject: [PATCH 1/5] Documentation: proc: fix repeated word 'page'
Date: Sat, 18 Jul 2026 16:19:07 +0100
Message-ID: <20260718151913.1892547-1-yahya@yahyatoubali.me>
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
-- 
2.55.0


