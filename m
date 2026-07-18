Received: from tbjjbihbhdcb.turbo-smtp.net (tbjjbihbhdcb.turbo-smtp.net [199.187.173.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AA63CE0A2
	for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.187.173.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784385628; cv=none; b=qFh24yRYaWsVQpKePfFZwlJ+KVQc3YfzKAw6o24vKK1OvI1+sKlNcmCTNjgMUBsP80TjWmn1j1ol4asy7XVlHq8csLUVre0QmKOZnvj+MUwUrjqJ3NuOSTi3sAVJucXp1KF1Z6TNHx/doysr8KsEeUspLN//c1nKC56lTyJMj8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784385628; c=relaxed/simple;
	bh=ItUYIFk0+rvV3snyKEspscVaO+KwaQYRqr4hrQpJcKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X2N/cva3YMtaK8Sn95XhgZY/g3VD1lmWcLK+sn/l2G8D6/JW6K4kykL/LfX3UWFQhWRPOHNWmI3gpDNAidg2Tc5XWBfdv9MXgqf2aUAp41MVSYZz/3s+v8MahX82K6jeTOQZBfh8kyr7UzCzs3wEEBkf3KvN9Z2FApVZtVxA+RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yahyatoubali.me; spf=pass smtp.mailfrom=yahyatoubali.me; dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b=v/B4l5uS; arc=none smtp.client-ip=199.187.173.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b="v/B4l5uS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yahyatoubali.me; s=turbo-smtp; x=1784990425; h=Received:
	Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	Content-Transfer-Encoding:Feedback-Id; bh=vEeF+OU2yW79y/rJDbAEm/
	sVuXUekZuChROsOLkb8Qo=; b=v/B4l5uSh+SN28AvFoELhJyBqbrwYa+tIDEMmg
	xv1sK+hyo+VXzVuSuz4ISOdwgOwXh+zY1HiTRF6rJy5sHwMphSRJQJzU7xBlAtxy
	9Zz+w6FJgTNsBnri0KLQBtkc3n/4eDxLKODjKaBHpvImaVGuDmBsqeJTducfHKZm
	houZ0=
Received: (qmail 1927029 invoked from network); 18 Jul 2026 14:40:24 -0000
Received: from 105.76.9.106  by turbo-smtp.com with SMTP; 18 Jul 2026 14:40:22 -0000
X-TurboSMTP-Tracking: 64-018cfb16-00001e639f572ac2c006-006-4288bd4b
From: Yahya Toubali <yahya@yahyatoubali.me>
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org (open list:CONTROL GROUP (CGROUP)), linux-doc@vger.kernel.org (open list:DOCUMENTATION), linux-kernel@vger.kernel.org (open list)
Cc: Yahya Toubali <yahya@yahyatoubali.me>
Subject: [PATCH 2/5] Documentation: admin-guide: fix trailing whitespace in cgroup-v2.rst
Date: Sat, 18 Jul 2026 15:40:02 +0100
Message-ID: <20260718144002.1880516-1-yahya@yahyatoubali.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-Id: 26016534

Remove trailing spaces on lines 1335 and 2197.
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


