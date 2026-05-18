Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F2D38BF7A
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 19:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131524; cv=none; b=SArsjmoAcnSuZ3sCaa8mj2qHg2lGtjT993nO1Vasx2M1oEkqTFJIsMvNt5Mj3RSKO1S3etdC4S0mzZr9WwX82xHzKMcx4aZ+wemoyn4AUBnCObMQZ4A9f2atgY6GdnpIvBPu2LS4/5VYhXw82SAFDqMfZMVpTHOqKW+qgShNlzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131524; c=relaxed/simple;
	bh=SYNaiWE+6z74HiqRR6DYEYa5dSi13wZDsECVnOFu4jw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IxqGR0B/rDVd/012/iTWMxF8npefrDoN8rk4GuaSi0KS0nVo2Pnx094XFQ4bv+ZZQmFBGKfbB/HVWvqQ7mEvEs4qtmbiOxdJ9cMpIK6b8CXTiuYNfIJB34OE0SyK9QwXy3hyyJAlhbddYo2JdKyGuw2OpgpjrrOaOu/jyxON8qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CytAJZEK; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CytAJZEK"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d75312379so2450429f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 12:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779131521; x=1779736321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HdgjcDSkJV3GKfKlbUQSZ57rr2po/MRqPRPN+0UqD+s=;
        b=CytAJZEKDXb8AiCURCFhMP6ILmnhIPNxirAAjlk0vjgjY1Ohe3ATvZJKXc41myjXnt
         uAvyylo59syhC3u/mc7PS85vNPB26YesU4HZLvqeVdpgNt6TPvh4vDhQYup8S8yjNaZF
         LtOtK5nuTFrwMXyo/UaymxRfZcRbxEkUs/LUqmVTmsZMJqvctdl80lf5KZh2cYwgdUdr
         X5BvzKrrxRta1wQ7cK8LLHLXhHgNMsj9wGvyNgvilaRJcnk/hbR4MDs8Igtx1szhwk0S
         OOvF1LNoy2o4GJ+gJ5rMjDJj2IXZxOFLHHIx5bumxW32FqrDHigXNWylqQctzT+9L98U
         qUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131521; x=1779736321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdgjcDSkJV3GKfKlbUQSZ57rr2po/MRqPRPN+0UqD+s=;
        b=ofJTCF/MAkaeh+mOqQq76eM+Cj+mj4rB9FpRXNt+24VC3STUj1JDQTdg9VKZ11HdJe
         2GULQgS+yVQUr3p34dSuFpnNhdZowcEp0EtoEgqg2u5WQlyxmKKOd0+F+ctx9GgnF5Ue
         gzLdERF+44NVApzYOuiBKV7ElZzm9l5nyrv9GGa/vkXnekGKU4dcIBoMpmwGCzz/4sAz
         SwGWFipAlFdReUpj+vfJw7yo8rKPth2TpB8ZxOuVQ0fhUoOWcf2McYHIz9E78+twUeP1
         QwSeC+vw2FYlzge+1UMTiIAfR8f3HAI9AMDYulWSNk5hHjpCXe9wuqey7vOQ0GWyu0ca
         FpiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cN1fT2USPF6jv1sxZFP6W7ye4RiVinoE+mTqOh+VdrWUj1nw+2CzZ/ngoMZhF0qXUJfUFdVo1HVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW/5uHPJWBXql2cMpfbzzHRjrrObKu2o84phl5IGSF/ZvjHhVp
	XM7hszGt/4MHNozOdcKAXyT/PFV37F/JENfG9G5+eOZqC4l10y5OUkA8
X-Gm-Gg: Acq92OHk0nbz65JNKcjUhgGbsKlth628nP4THMXOoHognJcGzNIjP+8AHMtNQhz7PGC
	4erJ7reKyUPXycbaTFYPcjhAnffjPtsL7xRTE8IB7QDTL2ICj2OclP/JzVPJ1ipsUXQACXIw7uj
	zrwXo/7h7nszcnKSXyU8QTNrpqXj5ilxlB9zXIQU/Un+vY0hiV1BrNnABWCLzILSoy4opUOOYXu
	4LX1OVlxX6Elca6YqO1WgOPdTbu0NYL6KJ4xdbNRxeQ63uc/QyWbNSguSUmJX78d96MMER/BtuX
	A8oAlbS29SyErK1X2xeCJ3rq5c3C7KWmdFKfKhvncmpaO0cd+Glge6ntFW5nkIohAKGhTaxffux
	vUX4IwJTWXsenzrzrzOfxd9MNZgUjLAcWas1dIk6bKnJAcrtXYRniPi/2p4JXoKGc2uwYWi5gaw
	pnclF16mEXDX8Vl44Dp7RN5UDgbxB1pmTNQTjhNDKwjP0/k5XgoUw=
X-Received: by 2002:a05:600d:644f:10b0:48e:9134:6ae7 with SMTP id 5b1f17b1804b1-48fd62d9be0mr228420795e9.0.1779131520505;
        Mon, 18 May 2026 12:12:00 -0700 (PDT)
Received: from mshcherba-RedmiBook-16.. ([188.163.115.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm40043167f8f.34.2026.05.18.12.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:12:00 -0700 (PDT)
From: Maksym Shcherba <mshcherba2000@gmail.com>
X-Google-Original-From: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
Subject: [PATCH 1/6] mm/damon: fix missing parens in macro arguments
Date: Mon, 18 May 2026 22:09:27 +0300
Message-Id: <20260518190932.42270-1-maksym.shcherba@lnu.edu.ua>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DAMON iterator macros do not wrap their pointer arguments with
parentheses. This can cause build failures when the argument is a
complex expression due to operator precedence issues.

Add missing parentheses around the arguments in the following macros
to prevent potential build failures:
- damon_for_each_region()
- damon_for_each_region_from()
- damon_for_each_region_safe()
- damos_for_each_quota_goal()

Assisted-by: Antigravity:Gemini-3.1-Pro
Signed-off-by: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
---
 include/linux/damon.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 4d4f031bcb45..32f2318ac77f 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -902,13 +902,13 @@ static inline unsigned long damon_sz_region(struct damon_region *r)
 
 
 #define damon_for_each_region(r, t) \
-	list_for_each_entry(r, &t->regions_list, list)
+	list_for_each_entry(r, &(t)->regions_list, list)
 
 #define damon_for_each_region_from(r, t) \
-	list_for_each_entry_from(r, &t->regions_list, list)
+	list_for_each_entry_from(r, &(t)->regions_list, list)
 
 #define damon_for_each_region_safe(r, next, t) \
-	list_for_each_entry_safe(r, next, &t->regions_list, list)
+	list_for_each_entry_safe(r, next, &(t)->regions_list, list)
 
 #define damon_for_each_target(t, ctx) \
 	list_for_each_entry(t, &(ctx)->adaptive_targets, list)
@@ -923,7 +923,7 @@ static inline unsigned long damon_sz_region(struct damon_region *r)
 	list_for_each_entry_safe(s, next, &(ctx)->schemes, list)
 
 #define damos_for_each_quota_goal(goal, quota) \
-	list_for_each_entry(goal, &quota->goals, list)
+	list_for_each_entry(goal, &(quota)->goals, list)
 
 #define damos_for_each_quota_goal_safe(goal, next, quota) \
 	list_for_each_entry_safe(goal, next, &(quota)->goals, list)
-- 
2.43.0

