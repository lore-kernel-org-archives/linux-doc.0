Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F108539CCF7
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 09:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119192; cv=none; b=BHhm3h6UHticdxXUSXHWvaPuy1bbjFCc0gA3M2Iwp35OjLqvMpQ9rLHVPda+hjn2Ixa6pQYLvIfe3TzR8RxM4hYfrO7SrBNsUIjfWpEtr7Co/VH9YdI89Br+4rzCDoP8AeEm64eTfeI0WY7DsfoqdUpaBBDV5Yz2Nd+niOk9cD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119192; c=relaxed/simple;
	bh=6rBjPK/I7X3vwpA6qZcH1Ev3QIQZLeRynwWrmlMQvbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=adbhHWDlMiY1ig3VjwuJKuXCUTr4kOxtCBK+jkXNIHXmZyXF/A1qa6qHsYNNH9ZQYHn+EJaj0EA2xkFPrh7KmuEcMeTOGFikU6rOv3fcnubfRtpUS/wKOPe8NUYb7oszcn3pVGs1cqKrLmINJlT43eLdYulvLP3IIQ5V4TzLr94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8NfKtpI; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8NfKtpI"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2db18e5cb56so7898195ad.0
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 02:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789119190; x=1789723990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAcmOIW8HA+7kl8XVa6QZ4uq4EOd1NfVDauZVHSY2CM=;
        b=W8NfKtpIfFQvUVFvc9gePhZkfBYPL0FARiFDMj3/qc/KC0nM//4jFMF3J0D7CNLVkQ
         4H+CmbxOY99XbS9PmLT3g4SpOLM960luCfToqqB6xKDGz21j84suC8IKAp/UGwmKHOmW
         Ep74BBTfpTmizrYQ5TMlYMsOK5hnqZbui8W7kr1bXrUfPv9wn5C7mnWg3EBglQjYxavR
         UjpH/k7i0hr864gic0pYySRMS0iIdy1daKSJ7NdLDfsQx61e5AzcgTWUK2xFQDKbVY+v
         tc0qh9ZoXR/s2EaXizmeHaf5acycZomJJ6vcFEAKhuEMiOqyC+AHMkzlJTGSF6XGY+ge
         eK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789119190; x=1789723990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAcmOIW8HA+7kl8XVa6QZ4uq4EOd1NfVDauZVHSY2CM=;
        b=nyzut/X1MrS2LqkK2tdTsUDQf8IOvNXFyrZPJvWvg2iEuMYmQv5DJnEr8eJMhVQVVr
         5AIYzShjtFrcttzSBuaAGe3MaQ1Xy+sZudaDpkouKTGPF8WXu+9AL+WTG7HJ56l0WekV
         0xEqn2FAlbmJiXjvv57WYZ4XzKVkdNtUpaFjRU2eiPJtuVsOWITbKs5xNIYVdier0EcK
         qqEFSelZ1h6eatXnYcSunHnLfhNB1jgsyIeAAY/Lt5tQ87/Zu+nAx98+Y9tFw31vzC6x
         X330HU2KaNagrkjHGQcZ9RH1eae84NJHybKqJMIDzZM9RJmXupGqKPCuH8ghDeBLthKz
         HI4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzcX8hF/qAXRug6uoloZzjtyWo9rSyKo2WN7Gvks4fs8qzK30T0XDOqb8HEhrFs5UVaxpAFi8B2owQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mh3VKn57aGuSmWgsiZaTpIcIJOr5oMkE0/HkfMJIUCq0ZGNnoL
	4V8KC0HiypEcyNT7nuJhxJFPefF0OzVWg2qdBLtR6DXVEq688a0p4iDt
X-Gm-Gg: AYBFou1fYBIvgIWctP9hd+WZ+H2HCVZCk1hXXAOt8t4JnVIPtlerBIk199lQKSKailZ
	FP1Iu9ze5AhDu03APwnR+rKPHGHE3kdwlLqa4LNqHXsNb7iwUWdltoDTpaZc2t5907JEMfJKczM
	UUrVnJZB3YS0lzRojNh46ls/RblGPeI/8bliMqCE24ygOpJTvHr6ex3/I/x9ASJEUaob5g23Fe2
	jfI3oD3p8qRZYAZa7gZEl2te67okr6b7ytVVdt9bvNVWkhxWb/I/HBGpPM44m82hXfibXKNnnFi
	qDZQQERDMUjW4B0ba/3P4gLu+s3GjHYn12KspEHDWUalznsbh3Olx+Wci8Z+pbevSyP2OKIOZQR
	I+isHtjJ4hg2K+1ULINasrgYCGxjFyQggwH5sJhHMKj5mQxnaBhHzrHQ46vG3CA6kedTQXQO0ca
	z0khyJrp3ZqO/KVVxjwzZjcCVaPZq9rPxwhjkOy4S2azUTiqxW9BhSHvnNYtD1U+oDb2gT62LCv
	e1x
X-Received: by 2002:a17:902:ce0f:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2dd2a332876mr79572945ad.14.1789119189892;
        Fri, 11 Sep 2026 02:33:09 -0700 (PDT)
Received: from celestia ([2402:1980:885b:4183:b098:c1b9:7033:be8a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfcefb6sm8530975ad.56.2026.09.11.02.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:33:09 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: 
Cc: Liew Rui Yan <aethernet65535@gmail.com>,
	SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Docs/mm/damon/design: fix typos in temporal auto-tuning algorithm section
Date: Fri, 11 Sep 2026 17:32:58 +0800
Message-ID: <20260911093314.156875-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct incorrect references of "quota" to "goal" in the temporal
auto-tuning algorithm description and fix the square bracket formatting.

Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---
 Documentation/mm/damon/design.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index aac84de261aa..9e027d56258c 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -693,8 +693,8 @@ There are two such tuning algorithms that users can select as they need.
   This is the default selection.  If unsure, use this.
 - ``temporal``: More straightforward algorithm.  Tries to achieve the goal as
   fast as possible, using maximum allowed quota, but only for a temporal short
-  time.  When the quota is under-achieved, this algorithm keeps tuning quota to
-  a maximum allowed one.  Once the quota is [over]-achieved, this sets the
+  time.  When the goal is under-achieved, this algorithm keeps tuning quota to
+  a maximum allowed one.  Once the goal is [over-]achieved, this sets the
   quota zero.  Useful for deterministic control required environments.
 
 The goal can be specified with five parameters, namely ``target_metric``,
-- 
2.55.0

