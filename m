Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1C224634F
	for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2024 17:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733936460; cv=none; b=t4Qc7/nSs9ecc4XRSnRoQ5JnJhS3QnYLt9jNfS6U8bE6K8J1huJ/rK/+dCP6Y6KVLZHWYFzYeCzAJTps/1xu+doMdLXIKXNCf2Ym8cMi+IledouibouPK4W04IIDNfi4NrP1PSIXXwQK4TitkcMVPU0YQeFvhCvSsCtAMM29PIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733936460; c=relaxed/simple;
	bh=B2sRIu+XnZuTeAjXW4x8wJh4gUlYpUujlvC+LJUIei0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CpsDSmn9vbOUw5PEz0QbXydnbDt2Zy3TuVeee9vA+9R4Vq7ogrF92+W249cD8wYvzn4/TvPa4iQWt2wW8i4As39u4hUAvz82AB4Ti9VHsjhkBDs+vr2B2y/WEm1RPYs4+fZaviyWaZxEwE4vksYyJ1WW183Ewt3ccsQd7wjioVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QJGbhKeR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QJGbhKeR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361f796586so8817085e9.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2024 09:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733936456; x=1734541256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/HyPQF1lbC/2X66nKlz9IG/RYEBhoNWgSBjs8SKK7a8=;
        b=QJGbhKeR81fk4bd0gnjTvlEbPTnAXhAzIYSES4HfcKyXHN1sjUU8Od2sDXRMdiN3sO
         w8/MAsFpR+wUTDQuD/SGbKmm8QRdERdDCrxjE2RKsIhMnoaEXP0kyyjjdVI5X8Nw2U/9
         uV63PUaqJ+oaSubbG9eiB4gD6CxEqIx5vP/HMbsOrwA+UlYBW4VSBFOF+XB5pZ/fp/Ok
         qJNx6NPDHD90Xn8DU+LjJf2nxzOT2aOB0gH/5y7F/eJUu/JeJQysd57IAywOYtj6mLD/
         cQBTcc3aly5uMDLsMxG34+xsU9bAN6PYFfGd5CvGzb7UzJBg2diV3je9Q9BrB20Y65vG
         5Vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733936456; x=1734541256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HyPQF1lbC/2X66nKlz9IG/RYEBhoNWgSBjs8SKK7a8=;
        b=eNp4OykYIF0ts5sBo1Ed2xKmGt2vfzNdAipRK/y9quxaqW171rFO4291HhY07ZL5zg
         pe/qczAHAbM1IFMQdDolfEgLUjVr8tCdfHFPzVQm3SeVjHxb5NatSljECTnw7fJliABv
         YqDbwHsoGUb1JD4s5YC9yKxGWkYwMaeFU6p7uAx08Z3TQIXll309Du/h7ekZ/pbXwWRg
         Kj1HJ6hJhkIqlw6/CZ02E7WoQEvKenzALqqQsm9Dpr9wNyiiBDgYf7WdbPzzTQVfv61S
         fTFVOAY438J7aO0L3B+4L6/irSSWUWoNEyT/V8YEtJzjXLn0YT37OVmuoA22glMuU3ro
         X2ZA==
X-Gm-Message-State: AOJu0YxOzZ0VQ4/g2VlwskWImWGD0OuGBFebes8ktFc4X8qH6E/sieB3
	T4tPHtIAmWQzoWxdO73L/CPjMcGJNAP8/KNHauaOvtuFOkt4tr56CRaEQWSVJ+xL9saa7TD7/wk
	j
X-Gm-Gg: ASbGncuiK0OpSLknGmEPcVQ9EL7bh14ddB5AYY07lG/ryU9Vnx4H4bGZXT0hDD0+0ib
	Y4xgqXjFoL/1oW31APJCvjzepGiQRjkmB27JXxsM6dA4tDDiWPZIkzcbj5uoJB5w/TOUPwPWKC3
	yGUxZbgFRCczCaGtK2nprtrI2k34KhpH4GfxGx4OrHDDejEvHPbbiMabwwirRI7gLMHZderjxpo
	SFHcAiDtH1YZ3TVav7loJHHOi4/A8QPwC1YWjFSat9T3X7v4kAUzQS6
X-Google-Smtp-Source: AGHT+IE+PH8kQNKr4K63S3Fg+sNQObK7n1xFImaHq5etBibCIiT8JmgSKVK+KNbJor5JCoeWXzVFGQ==
X-Received: by 2002:a5d:5983:0:b0:386:3903:86eb with SMTP id ffacd0b85a97d-3864ce97148mr3155156f8f.23.1733936455548;
        Wed, 11 Dec 2024 09:00:55 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824cab97sm1667458f8f.62.2024.12.11.09.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 09:00:55 -0800 (PST)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Frederic Weisbecker <fweisbecker@suse.com>
Subject: [PATCH] Documentation: sched/RT: Update paragraphs about RT bandwidth control
Date: Wed, 11 Dec 2024 18:00:52 +0100
Message-ID: <20241211170052.2449581-1-mkoutny@suse.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This has slightly changed with the introduction of fair_server.
Update the most relevant parts.

Link: https://lore.kernel.org/r/Z0c8S8i3qt7SEU14@jlelli-thinkpadt14gen4.remote.csb/
Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 Documentation/scheduler/sched-deadline.rst | 13 +++++++------
 Documentation/scheduler/sched-rt-group.rst |  8 ++++----
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/Documentation/scheduler/sched-deadline.rst b/Documentation/scheduler/sched-deadline.rst
index 22838ed8e13aa..a727827b8dd52 100644
--- a/Documentation/scheduler/sched-deadline.rst
+++ b/Documentation/scheduler/sched-deadline.rst
@@ -591,12 +591,13 @@ Deadline Task Scheduling
 
  The system wide settings are configured under the /proc virtual file system.
 
- For now the -rt knobs are used for -deadline admission control and the
- -deadline runtime is accounted against the -rt runtime. We realize that this
- isn't entirely desirable; however, it is better to have a small interface for
- now, and be able to change it easily later. The ideal situation (see 5.) is to
- run -rt tasks from a -deadline server; in which case the -rt bandwidth is a
- direct subset of dl_bw.
+ For now the -rt knobs are used for -deadline admission control and with
+ CONFIG_RT_GROUP_SCHED the -deadline runtime is accounted against the (root)
+ -rt runtime. With !CONFIG_RT_GROUP_SCHED the knob only serves for the -dl
+ admission control. We realize that this isn't entirely desirable; however, it
+ is better to have a small interface for now, and be able to change it easily
+ later. The ideal situation (see 5.) is to run -rt tasks from a -deadline
+ server; in which case the -rt bandwidth is a direct subset of dl_bw.
 
  This means that, for a root_domain comprising M CPUs, -deadline tasks
  can be created while the sum of their bandwidths stays below:
diff --git a/Documentation/scheduler/sched-rt-group.rst b/Documentation/scheduler/sched-rt-group.rst
index d685609ed3d7a..80b05a3009ea2 100644
--- a/Documentation/scheduler/sched-rt-group.rst
+++ b/Documentation/scheduler/sched-rt-group.rst
@@ -92,10 +92,10 @@ The system wide settings are configured under the /proc virtual file system:
 /proc/sys/kernel/sched_rt_runtime_us:
   A global limit on how much time real-time scheduling may use. This is always
   less or equal to the period_us, as it denotes the time allocated from the
-  period_us for the real-time tasks. Even without CONFIG_RT_GROUP_SCHED enabled,
-  this will limit time reserved to real-time processes. With
-  CONFIG_RT_GROUP_SCHED=y it signifies the total bandwidth available to all
-  real-time groups.
+  period_us for the real-time tasks. Without CONFIG_RT_GROUP_SCHED enabled,
+  this only serves for admission control of deadline tasks. With
+  CONFIG_RT_GROUP_SCHED=y it also signifies the total bandwidth available to
+  all real-time groups.
 
   * Time is specified in us because the interface is s32. This gives an
     operating range from 1us to about 35 minutes.
-- 
2.47.0

