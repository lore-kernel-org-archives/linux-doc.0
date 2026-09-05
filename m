Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D4243B3D5
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788597649; cv=none; b=ZjeTy3toiiMe4bMQeucr6qZF0CgKz03Lp763/nnhyIK7sEWjt3SnRoZlfs7ikvnmhtLtDhtZNbRokFPTvGlhXcrZyXc4iU4tJF40+mnEJCYPiD/rz/cpNiVae006030cnbgiCmI/OjoKfKfni0aYAME61kLKpDY01PeC5clY9bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788597649; c=relaxed/simple;
	bh=/KeFMMS9CaI0pAmJaLn1N2AFuugw7cjfILmhhBzICqg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=raNLpBXUseahmJFFxYuDoCMCgolUpvl7uCVi8tiPi2dOdMhsgOkB4tSf+AaBc2UFkj+IsUbHoQzizogKxE/YDIgx2hVFCOuIkeb17wN3T7DEVq3Q+K6Q1V443/UKA/PtMXoxLmISnKx6bncEeQmSzR8B9fuZ8A1oYqSf8UYIzYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbi8a6ar; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbi8a6ar"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso15664425e9.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 01:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788597644; x=1789202444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PN4g8RPgZ7jX0xRFxJnWC4F4Ar+p2OrqSGzlc5rvdWw=;
        b=nbi8a6ar4fsOXoucnapC9C6gvS0+seQcqQAz/o2R5ZySw/Pyhiz+Y9Lj8iEt1dhAzS
         l+0/64vw+guqJgDLQrKiFneEDKsu2/awGI5ReasQXUSdB8pUlRpojRMCjQeF+wB4XKvd
         6ruM3nb5o6bj1Q17HCIad6KovOX5H7pUB9Jjg/SNzHlCZhxJizi5ICuW+7QsyDSV83S0
         HTZ2ON/7zqz2/yACnjtxF0JVbiqu9rmhF48Rgtl+nVJ6Ma3jCDmqXI8i1IttbnBcxxUr
         iu6FAR65rf7SIuWX3ma1Ln/Eei0Jg5Zq33nM/5ZvnIMrt5EHCHHmtcP52UzthkG35WIQ
         CjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788597644; x=1789202444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PN4g8RPgZ7jX0xRFxJnWC4F4Ar+p2OrqSGzlc5rvdWw=;
        b=UcCRZVpLZLNfX89jumF8+vECtA+ozOti5TyQUKPcVM7QjbQXM9FKw64T+16u2Ec7Ug
         GFwrTghD5xidCZUE1SWzf+i+s+Mx0OnisrZlxkaDY++pf5RZAdewTl1SPLpKBGiPaqA6
         xYeySpNOT5OOHBjrAYA2WGfx454PcimQnJwrilHMQUtNHSkcatVw8nppAMCGG1kFjQLC
         TvfH8mOrx62mO7fh++GUepi6YUKj/cmJCiWtwrHbn2AxwA6AFXNnZ4klr01xvJFgURuW
         sSy40Y7xAKFWaplrzka8XlEsgcMGRA6ONyNRIrq/aIK1S8aIyJ9NiZhI4jEmWwJqhask
         OG1w==
X-Forwarded-Encrypted: i=1; AKwUvBzWwYykvO9VG9PxRSJB7hmLEXhne79Hsye1KEVosCZNcBV2nqiJzWqH0U2zxwlPQ4AnE6wmxcP1tQc=@vger.kernel.org
X-Gm-Message-State: AFuF++mPhLLpl3yH9zeIYqIbtMXamKT+XzSmRQlBUqethTqFsDfbHE8m
	UmYqtLFVZhHl/hxGyWgv8Rw0AyKg3+qUw1uGtzbWQdiA5tbnvqPmI9/c
X-Gm-Gg: AYBFou3jLaCSvvvUFj1WGJg3owCUUpRbCTwQO4t8YCyPvadqNzUxGv0jVIG9E7FJNql
	DdkT9oQweuqvToMyqMgh+2RBX1+00NFFwvac9NmKI8ZSMrBB10DnO9McVfvRew4WJBx0ZTSUhup
	XDoE2lX+TmXYXed3BE970jeMazwVM80/6zsXBcUdBLsGVlRF7r8jU6ShBONk7dS0m+K230lhzNo
	g+xy3NiEJ4x+JmGzSsQ4g5AYS60fz9TjIl40bEmIIuBD3zXfUSQSy0fFWSakCtic4KvRV41C4I2
	WzFXAstVpZHNaTbLXu6UVyOTmPtiqOJgiOZrqnOAzgMMuS3nM4JM3It/j9M0pZinPT0nTzWOspA
	tWwK+mWdMQuy2TEGYhWSaSCWq1KqsbeoH9pUQMYLBpMd/QrnSEYKfQMluSGvDbvzC1+STT2ALZM
	Q2IUaV+GuqUAiweZ6wO6WoCEX7YwRDG/Nz7NVfEqH7mumRF4eb9jG6HwbcQYoPeU1guQ0gOE/3B
	VbGZpKzyFXv7VG5vyia31TWvD/AeohuLjaN5ayjk5GGO0BEHtdSkdlTIBQt8FbVJ06F8WVuQ0f6
	k44400958KbCV9j9dyJ6mmaJlJfPhg0G+P2prMIu+SyO/nBSMylW9yMNp6IakmVWSHE=
X-Received: by 2002:a05:600c:8b66:b0:49c:fa20:cbfe with SMTP id 5b1f17b1804b1-49cfa20cd6emr90941955e9.21.1788597643770;
        Sat, 05 Sep 2026 01:40:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6158e9sm215544755e9.12.2026.09.05.01.40.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 01:40:43 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-mm@kvack.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH] docs/mm: ksm: Use the renamed ksm structure names
Date: Sat,  5 Sep 2026 10:40:34 +0200
Message-Id: <20260905084034.39521-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Reference section of ksm.rst asks mm/ksm.c for mm_slot, stable_node
and rmap_item. Commit 21fbd59136e0 ("ksm: add the ksm prefix to the
names of the ksm private structures") renamed them to ksm_mm_slot,
ksm_stable_node and ksm_rmap_item. Since then only ksm_scan is rendered
and the three structures are missing from the generated documentation.

Use the current names.

Fixes: 21fbd59136e0 ("ksm: add the ksm prefix to the names of the ksm private structures")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/mm/ksm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/ksm.rst b/Documentation/mm/ksm.rst
index 2b4f72f1f953..5a80573162de 100644
--- a/Documentation/mm/ksm.rst
+++ b/Documentation/mm/ksm.rst
@@ -78,7 +78,7 @@ The frequency of such scans is defined by
 Reference
 ---------
 .. kernel-doc:: mm/ksm.c
-   :functions: mm_slot ksm_scan stable_node rmap_item
+   :functions: ksm_mm_slot ksm_scan ksm_stable_node ksm_rmap_item
 
 --
 Izik Eidus,
-- 
2.53.0

