Received: from tbjjbihbhdcb.turbo-smtp.net (tbjjbihbhdcb.turbo-smtp.net [199.187.173.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB253D5221
	for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 15:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.187.173.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784387981; cv=none; b=FnUEsDzxplW9DvUFlgpGIu0mh8117xSd7L6zVN+szg1Q7IHyHElvfxGyptz2pA8dywLcdpKwjOJj70/nVUr4lxMazn4Ikq/2YSrMF/wXMsoSRqD7uHiza3zZbFOGHGiAy67s2L/CQYEcFm/3uMIJg+p6NAONhO9mlSNFR+kISNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784387981; c=relaxed/simple;
	bh=u4TmYmgg3ogWaairOru6yrWLetG7MAyZNJeqZxm0jo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MsTHRP8bYy/LbYIpBIC6J+MJ6zhdea5R262ByVKy4m4m5c7tT7HAMJ3eWVeu7iBmtgqZ8jRKpyuIJPZ8kypwaGt13n7DvzEk2MmuuDAwfISN0uE06V4EAKFLCdYfpgUJbuqivvy9lUhyTEJSCFlj/m/ayLVYmFHE5iowDyi+mAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yahyatoubali.me; spf=pass smtp.mailfrom=yahyatoubali.me; dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b=Tp921Sbn; arc=none smtp.client-ip=199.187.173.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b="Tp921Sbn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yahyatoubali.me; s=turbo-smtp; x=1784992779; h=Received:
	Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	References:MIME-Version:Content-Transfer-Encoding:Feedback-Id;
	bh=wq7IpL/hJ1ZgAwVvjpnIjJbMFf986942JKTBhleZonM=; b=Tp921SbnklpXC
	b2K/iYcBvesYfNBf/gpJnup2Zm0PNdFKK08sE08ggqidwbzLptlxp205q5k1ujkS
	m/Py+RtLFySbu4BLvNuSnawPzZqFQ2THikwHInHENVt7hQZlxWk/A2P1cAJZls6y
	OQO7aFl7JCFN3S5a8sAL81kDmzKcDE=
Received: (qmail 2203697 invoked from network); 18 Jul 2026 15:19:37 -0000
Received: from 105.76.9.106  by turbo-smtp.com with SMTP; 18 Jul 2026 15:19:36 -0000
X-TurboSMTP-Tracking: 64-018cfb16-00001e63a851e042c006-006-4288bd4b
From: Yahya Toubali <yahya@yahyatoubali.me>
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org (open list:CONTROL GROUP (CGROUP)), linux-doc@vger.kernel.org (open list:DOCUMENTATION), linux-kernel@vger.kernel.org (open list)
Cc: Yahya Toubali <yahya@yahyatoubali.me>
Subject: [PATCH 2/5] Documentation: admin-guide: fix trailing whitespace in cgroup-v2.rst
Date: Sat, 18 Jul 2026 16:19:08 +0100
Message-ID: <20260718151913.1892547-2-yahya@yahyatoubali.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260718151913.1892547-1-yahya@yahyatoubali.me>
References: <20260718151913.1892547-1-yahya@yahyatoubali.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-Id: 26016534

Remove trailing spaces on lines 1335 and 2197.

Signed-off-by: Yahya Toubali <yahya@yahyatoubali.me>
---
 Documentation/admin-guide/cgroup-v2.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 14b8c571c0d1..f15a613fed6a 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1,4 +1,5 @@
 .. _cgroup-v2:
+.. SPDX-License-Identifier: GPL-2.0
 
 ================
 Control Group v2
@@ -1332,7 +1333,7 @@ PAGE_SIZE multiple when read back.
 	cgroup is within its effective low boundary, the cgroup's
 	memory won't be reclaimed unless there is no reclaimable
 	memory available in unprotected cgroups.
-	Above the effective low	boundary (or 
+	Above the effective low	boundary (or
 	effective min boundary if it is higher), pages are reclaimed
 	proportionally to the overage, reducing reclaim pressure for
 	smaller overages.
@@ -2194,7 +2195,7 @@ of the two is enforced.
 
 cgroup writeback requires explicit support from the underlying
 filesystem.  Currently, cgroup writeback is implemented on ext2, ext4,
-btrfs, f2fs, and xfs.  On other filesystems, all writeback IOs are 
+btrfs, f2fs, and xfs.  On other filesystems, all writeback IOs are
 attributed to the root cgroup.
 
 There are inherent differences in memory and writeback management
-- 
2.55.0


