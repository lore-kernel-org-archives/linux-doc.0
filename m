Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83160257851;
	Sat, 22 Nov 2025 21:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763846912; cv=none; b=HWVCeecTCLZwVEmNVwfJB1/vWJ715w+ivad0eQ7FI1J1rFSfso9MthlBzxaTeMd4Y3Z43Rpc161uVSt1buAR8JQUdwDmB/P81PhFB9pzc4kxkeK4I4RlGzndi0/5fmhu2loIjmHey88qk2tuaHjyjZWNPluKCMH7wmwTFCsUBAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763846912; c=relaxed/simple;
	bh=O7bJcChPkT7xMOVHD6IAp5F4GI3Zzx+LfHPbPi4iXN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I6sFrhdgq0fUz5BfsPe0Lm7+9qptK7s7+fYYA9SKu1fu36xZKj0RYHNVfUZQsewmKyqfr3I4dFNaogUmq7oBw3NBNs3x40PsEOZ0qHo/Zx2cj3ET9qn6gUpa4loa8Hc5CJpZ76gIm5no/pOGIQ/y9VfzEJSY+lTlf3eKi5htFBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5F9A02BA973;
	Sat, 22 Nov 2025 22:19:27 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 3Il8KscnqSO8; Sat, 22 Nov 2025 22:19:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 196282BA979;
	Sat, 22 Nov 2025 22:19:26 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uSCWT8cKas0p; Sat, 22 Nov 2025 22:19:25 +0100 (CET)
Received: from nailgun.corp.sigma-star.at (85-127-105-34.dsl.dynamic.surfer.at [85.127.105.34])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id 5146F2BA973;
	Sat, 22 Nov 2025 22:19:25 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	mhocko@suse.com,
	surenb@google.com,
	rppt@kernel.org,
	vbabka@suse.cz,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	david@kernel.org,
	akpm@linux-foundation.org,
	Richard Weinberger <richard@nod.at>,
	Vladimir Davydov <vdavydov@virtuozzo.com>,
	Konstantin Khlebnikov <koct9i@gmail.com>,
	Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] pagemap: Update BUDDY flag documentation
Date: Sat, 22 Nov 2025 22:19:20 +0100
Message-ID: <20251122211920.3410371-1-richard@nod.at>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Since v4.6 the BUDDY flag is set for _all_ pages in the block
and no longer just for the first one.
This change was introduced by:
commit 832fc1de01ae ("/proc/kpageflags: return KPF_BUDDY for "tail" buddy=
 pages")

Strictly speaking, this was an ABI change, but as nobody has noticed
since 2016, let's just update the documentation.

Cc: Vladimir Davydov <vdavydov@virtuozzo.com>>
Cc: Konstantin Khlebnikov <koct9i@gmail.com>
Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 Documentation/admin-guide/mm/pagemap.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/adm=
in-guide/mm/pagemap.rst
index e60e9211fd9b2..c57e61b5d8aa8 100644
--- a/Documentation/admin-guide/mm/pagemap.rst
+++ b/Documentation/admin-guide/mm/pagemap.rst
@@ -115,7 +115,8 @@ Short descriptions to the page flags
     A free memory block managed by the buddy system allocator.
     The buddy system organizes free memory in blocks of various orders.
     An order N block has 2^N physically contiguous pages, with the BUDDY=
 flag
-    set for and _only_ for the first page.
+    set for all pages.
+    Before 4.6 only the first page of the block had the flag set.
 15 - COMPOUND_HEAD
     A compound page with order N consists of 2^N physically contiguous p=
ages.
     A compound page with order 2 takes the form of "HTTT", where H donat=
es its
--=20
2.51.0

