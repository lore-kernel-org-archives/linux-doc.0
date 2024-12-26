Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CB61D63C7
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232850; cv=none; b=M6yex8zMo/mhZZP/ONx0WFJMhDzug2epLdCSv1MT/O+wTg3hw0yhvtJgpdbq+93MHiK10ig23Pz6ksbLKlKdYiCYALNfj2W2DGOhL+awfmJAijX/jeRnuGsrIoUgimkBqURLvMzOSyizK3/crfWp6UpzkiyC3QIvCthkGeBr2eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232850; c=relaxed/simple;
	bh=x8qaFP1AxURYpa5oiGFQli55lZvdLlf3Vb+7T69X9+M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=COfCbDbq281EXfDIiHinTKX9Ueof5d6F52nGNJpTYp/93iz2TlyLkYL3ZyFuYNWfyC9rgYOs9umZ3xyVjwHq8U4Lw3841pnAkmtI3oQWlywK/sCgTJI6JOWyo0rFnHhFCtEvLRIf50ihRCyHVzbBeaHL+g+ZKQh4oZZib5XKMH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ot1dOOFi; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ot1dOOFi"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2eeeb5b7022so8279891a91.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735232848; x=1735837648; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ykFNL3Q77su3l1hmkCa41V3LHYM0KyunH48W8conCI=;
        b=Ot1dOOFi/jvZcCjPeJTj5e/4frA4ibU3acgE9zm++BszZBGb/ZjsocImg/CGUV5CO8
         Nf0i6kW4RPmBB+TuXbiIq8Q9lyE2+v4asNGs0Uk5rDtO9bHM1YGu40KzXtj5Ht7ERDC+
         B/L6tlRe3frjNZ9HyASSI0j9MSMsdu51HOuZCzaE/9VZl6J0JJQYjGOzEDdDliIGKe/+
         10b5x0BsD/Muc7zMOxNgBRoflAWzgxXH/9zq5DtqSjk1NCiAZ7DIsrJDwjA+qT3wbLfE
         c2yf/cX1DalQlAjJWOKo5actZhpOr1jvlkqNxDWDK8hXV6ed8Y/SA9EgVIR7E5Mk6/yA
         0IBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735232848; x=1735837648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ykFNL3Q77su3l1hmkCa41V3LHYM0KyunH48W8conCI=;
        b=CI8Yjmc0MLNLmUuf6QLBGa1g4F7DBXnjFdoQ/WpvxAeyNGc5PYjRr5PhtXqczBi3NJ
         rh8nik2UqiNooEvz4Xv28CeXefjRhBkXYrAaATUbw0LZyJ31xQsFl0Fufw92n7Cb99cq
         CHybaxEImfJkqc+7h1fGZPQqSheBzQEevsuImEGaGJ3S0VZMqFXNvRH0b6r9Yy1jRCX6
         DZLuOIby2mEGV/+A3QGcp3PEHBNV+CYHfbCS3ZWjzsSCtbRWW2pQ1OwZ8lyLeTRYMkSP
         qCDb57N2ImTCmdrL11VPfR1O+aDucBcsHkf1FbMvThvmxzsA7s0kSVHaQI7M3N8Uiaxh
         PtDA==
X-Forwarded-Encrypted: i=1; AJvYcCUz3bDXnUmw3j2P2WNQvOS9XTUPnZ7Vw/Qzf4+mqmR7mE1VPLDG3cFFAK83f8c/OlDJn4hD0Mx5Qk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVjAgS0nZVb4wp56yO0HREhZdreWz+aCG/DOHcVYQCboTVmd7s
	Nu6yhkJUJ3q3sjEMawMXdJ93PC4gyRDaszN8s1z2COl+UPVb2vVZnwWjd6Ulp1hzLG2PtuE1pZw
	gZg==
X-Google-Smtp-Source: AGHT+IHSckZ6MRPuI2AW+AMmVk8LfVa6FJMQqBAOVn0ohTdOeJ5YmYmLuchDuM88M65uvkUM82mTiq54fW8=
X-Received: from pjvf8.prod.google.com ([2002:a17:90a:da88:b0:2ef:8eb8:e4eb])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2b8e:b0:2ee:49c4:4a7c
 with SMTP id 98e67ed59e1d1-2f452e39845mr35060096a91.18.1735232848030; Thu, 26
 Dec 2024 09:07:28 -0800 (PST)
Date: Thu, 26 Dec 2024 09:06:59 -0800
In-Reply-To: <20241226170710.1159679-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226170710.1159679-8-surenb@google.com>
Subject: [PATCH v7 07/17] types: move struct rcuwait into types.h
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Move rcuwait struct definition into types.h so that rcuwait can be used
without including rcuwait.h which includes other headers. Without this
change mm_types.h can't use rcuwait due to a the following circular
dependency:

mm_types.h -> rcuwait.h -> signal.h -> mm_types.h

Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/rcuwait.h | 13 +------------
 include/linux/types.h   | 12 ++++++++++++
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/linux/rcuwait.h b/include/linux/rcuwait.h
index 27343424225c..9ad134a04b41 100644
--- a/include/linux/rcuwait.h
+++ b/include/linux/rcuwait.h
@@ -4,18 +4,7 @@
 
 #include <linux/rcupdate.h>
 #include <linux/sched/signal.h>
-
-/*
- * rcuwait provides a way of blocking and waking up a single
- * task in an rcu-safe manner.
- *
- * The only time @task is non-nil is when a user is blocked (or
- * checking if it needs to) on a condition, and reset as soon as we
- * know that the condition has succeeded and are awoken.
- */
-struct rcuwait {
-	struct task_struct __rcu *task;
-};
+#include <linux/types.h>
 
 #define __RCUWAIT_INITIALIZER(name)		\
 	{ .task = NULL, }
diff --git a/include/linux/types.h b/include/linux/types.h
index 2d7b9ae8714c..f1356a9a5730 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -248,5 +248,17 @@ typedef void (*swap_func_t)(void *a, void *b, int size);
 typedef int (*cmp_r_func_t)(const void *a, const void *b, const void *priv);
 typedef int (*cmp_func_t)(const void *a, const void *b);
 
+/*
+ * rcuwait provides a way of blocking and waking up a single
+ * task in an rcu-safe manner.
+ *
+ * The only time @task is non-nil is when a user is blocked (or
+ * checking if it needs to) on a condition, and reset as soon as we
+ * know that the condition has succeeded and are awoken.
+ */
+struct rcuwait {
+	struct task_struct __rcu *task;
+};
+
 #endif /*  __ASSEMBLY__ */
 #endif /* _LINUX_TYPES_H */
-- 
2.47.1.613.gc27f4b7a9f-goog

