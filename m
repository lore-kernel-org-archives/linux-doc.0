Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691922DA756
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763144512; cv=none; b=FiD25/6bG+QqSTdv8MOuhLuzG9KorqSFID5nNbP1irjy9I4vlpMdFMK93KX6CQI4U1lO+x7+K1dOB3vVsWHzIbG0L0NzjgDeAy/5w1B6jURsPbjXrdcxJc6Pg7H0ccX6VPoGw4E2EIpPWerBCL3hN4nEcOaYyzREvJrCqVtEYIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763144512; c=relaxed/simple;
	bh=85KX9yDDVB8BnTWHIncxzE+cW+QLAcnQO6w4iKZbAzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ppn0JuhyM2ZnScY0lf3z6FucLdC7IuSKX4nz5sG8r0Pa53/XDYHZ7AtPa6u/9i5brVwGDv66HC9FXWefU7xz73kUsk0oXGVqeaxHnFnk853CaLv0t1P1c1ffhxStNrbGSBuhC+qujR2rJp1G4+2zPu1QV9/8j2JtumiQN905rDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q9vhOsyU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q9vhOsyU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477775d3728so23537635e9.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 10:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763144509; x=1763749309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3tD+YD9/ORK0rticjPEQ4CUY27QdrfXjzBGevzpz0k=;
        b=Q9vhOsyUpNq0mpROxcQEM5wCDWUXIJycpB6T51mhSWn7uw9UUXFNy8LjfZW4s52KHc
         a3sNYXN7+Oat0onFmHNUh2/zv3vy0UtpVLbgbD7AZAEm+J68DHwRrSOca18DsvvSGxS7
         TH3lp98BPWGEp/kFX0TAElcr2wGuCF1pFl5zmzziP8SwkWipY5r8hXXQDm07WyJwS79W
         5rYMZWM1QCNNMdLse2ZfF5PlSAMQzy9iqcNCOCUbfPy00ucXCrynd6ut13Hzfv7vbWBF
         f4qYg1iH8syi8vlXhBWMNitvhvvSDcVlx5wf2kvmRKAvANOLRD/OjuebF72XKp663hoX
         UN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763144509; x=1763749309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v3tD+YD9/ORK0rticjPEQ4CUY27QdrfXjzBGevzpz0k=;
        b=Ioonrz4Wp9/acc+52yhzYucq77nYJ3f5XMamXYPai12tUYq77NZoHcMDjZm9WqhwYA
         czvRP3kRXy7bYWGVdNR+EwiArhrmBM1FJdaYcp3iYu+vIM4jTT8EndWXfbzWg7f7rYnw
         bK/I1lMtZOiUMG2HcYzuWi4XqEbcdGq6k/5JPcYu6rtzXLAEK5jnJcwomAqw33DB9n4I
         7mC8s124oGah54Qy3shkC83aMtwi3DEWaYS90u0UrciQN+7kp4FFngKIvq2LyjJGzcp0
         Y7l0bnI6zwEmRN3cAuQ/+0VnBRe0eY5ARFp+oWMLzdQzbphM1r8go4ATlHAN5AtirmDO
         Ks5w==
X-Forwarded-Encrypted: i=1; AJvYcCW/bnOBrWJSwhHTUV3BwOZP2dBv42ykDYU7t1c8lqZrCv5ESqu9S5E8dZ5dRyW3wf1GH9KnIqp5aIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjKQN8R36EGczp+BqLThVHJt6/jNpKmIOYliyBJrU3M4Lgvyy9
	+Uv4reI5aRoQCYHd4vymUaUJW/GNYOuI5M5kyqZWbTjuccDxmD0eVqaYdBoyKFhiMQ7StxZ92RM
	H9Soh
X-Gm-Gg: ASbGnctGus5/Q+y3ejEwLjESWEPUHzXS6PsXDnQ1TubG/JafLE8t502QbKedaWg/5rD
	hwzMr/93Ky8hw+Vy2Syld0VMCSg1l3r5TFKMKpxPYEwgPOWasL01GuTL7JpCMfpdcMfbMcr8sLZ
	BhLB4SJIGHo0H3jOv2VWR+oPJis8XZzy7Eu4LjQw7zprffwkgKFoHLkh/kyY0IN36vwifIJingC
	xkHw1jr0KLVUb3J5cZBg0AA/I2dQPsiBkI1SEOZHJVkSvY4tLpLyA69GS4q1QDEVdhY69FBsQ0K
	H7YBDDRm1XcZdjER0uOd5reemcU/jeIKy11OWbBPgalp+iFvKNetlKCcTJAqBjs0DVbD6ATnI4r
	HkUMffDHuyR1OTpTRHXH6o5PdzYz6csqyJoJa0Qnt1+A0OwZE4NDsayOGpkXA74gEyGcU+XB+6R
	OL3GHWh9HBHDORRc76r8Sp3zsLRUYzNUE=
X-Google-Smtp-Source: AGHT+IH14BxpFJRrNC0c0vgpnxrKVwMjdnmZHfxSy/H6uvy0JbyViL8DLlAC5JCnJMGGUJ1o8L4QxQ==
X-Received: by 2002:a05:600c:a43:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-4778fea84e4mr40741745e9.32.1763144508727;
        Fri, 14 Nov 2025 10:21:48 -0800 (PST)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2bcf9sm163601805e9.3.2025.11.14.10.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 10:21:48 -0800 (PST)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Natalie Vock <natalie.vock@gmx.de>,
	Maarten Lankhorst <dev@lankhorst.se>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 1/3] docs: cgroup: Explain reclaim protection target
Date: Fri, 14 Nov 2025 19:21:25 +0100
Message-ID: <20251114182130.1549832-2-mkoutny@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114182130.1549832-1-mkoutny@suse.com>
References: <20251114182130.1549832-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The protection target is necessary to understand how effective reclaim
protection applies in the hierarchy.

Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 0e6c67ac585a0..97a9f8a046c5f 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -53,7 +53,8 @@ v1 is available under :ref:`Documentation/admin-guide/cgroup-v1/index.rst <cgrou
      5-2. Memory
        5-2-1. Memory Interface Files
        5-2-2. Usage Guidelines
-       5-2-3. Memory Ownership
+       5-2-3. Reclaim Protection
+       5-2-4. Memory Ownership
      5-3. IO
        5-3-1. IO Interface Files
        5-3-2. Writeback
@@ -1317,7 +1318,7 @@ PAGE_SIZE multiple when read back.
 	smaller overages.
 
 	Effective min boundary is limited by memory.min values of
-	all ancestor cgroups. If there is memory.min overcommitment
+	ancestor cgroups. If there is memory.min overcommitment
 	(child cgroup or cgroups are requiring more protected memory
 	than parent will allow), then each child cgroup will get
 	the part of parent's protection proportional to its
@@ -1343,7 +1344,7 @@ PAGE_SIZE multiple when read back.
 	smaller overages.
 
 	Effective low boundary is limited by memory.low values of
-	all ancestor cgroups. If there is memory.low overcommitment
+	ancestor cgroups. If there is memory.low overcommitment
 	(child cgroup or cgroups are requiring more protected memory
 	than parent will allow), then each child cgroup will get
 	the part of parent's protection proportional to its
@@ -1934,6 +1935,23 @@ memory - is necessary to determine whether a workload needs more
 memory; unfortunately, memory pressure monitoring mechanism isn't
 implemented yet.
 
+Reclaim Protection
+~~~~~~~~~~~~~~~~~~
+
+The protection configured with "memory.low" or "memory.min" applies relatively
+to the target of the reclaim (i.e. any of memory cgroup limits, proactive
+memory.reclaim or global reclaim apparently located in the root cgroup).
+The protection value configured for B applies unchanged to the reclaim
+targeting A (i.e. caused by competition with the sibling E)::
+
+		root - ... - A - B - C
+		              \    ` D
+		               ` E
+
+When the reclaim targets ancestors of A, the effective protection of B is
+capped by the protection value configured for A (and any other intermediate
+ancestors between A and the target).
+
 
 Memory Ownership
 ~~~~~~~~~~~~~~~~
-- 
2.51.1

