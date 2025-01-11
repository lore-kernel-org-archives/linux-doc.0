Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C771865E2
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 04:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736569583; cv=none; b=UDJ3PytAgVKSoqHqH5LZ7BDxXzP+SVVok4LxbBAuvMrvCcL7QAU0TyRvq49nB+wC4rPRO1BlfcqxAirjsxw0/fRm0dWPHlH80LnAbHIjto/ZmXfXCCdg/ty7wYrWlBefHRbLwLPgfx39ZP+r0augdxRbe2NwLnk6qtjhL+Hv3ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736569583; c=relaxed/simple;
	bh=G5eaEd7sNymn18hH96NTtB8QopbMIDFHamvLccfcHqs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WsiSIyBaeHdMBdbyyfSp26e17AAJUJqAkMeO05aP35P4ch6ZbBHpUFg3915Ef7dboGsN4W/8rV0OrX2zmF7MLhl14JByMVuwlTkDFkCj348ASo5aOtTKJgQ1yODVSBZxMXWjYGDxHSqP24E6OAMCBcbmumIQmEFWnSsggMwJkI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A4L5Gcxa; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A4L5Gcxa"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2163c2f32fdso69609275ad.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 20:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736569581; x=1737174381; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cA6SN2b+VepEpqi6xeamEUXAYwuTlZjCipcGUs+0HQY=;
        b=A4L5Gcxa4TxBMuyXMVM/gJdxU/Dz7Tmvd3dCwbkN6KNqwizU9xQXppOKnE0CoBMhTu
         U1XUq1lctoQEpzqZ/Tqwq/8nZE/skG4hIi/tuWJWoeQ+78NzaKTDE991MN3W1zDKX3iJ
         qU6yh/FGQvwRAr28DSFHZwgWKm+M5jdm/j93ry+PLStTyJJnZZ8UL4MO+QrKTNw4uu9B
         Rqd5suB2ToEb9sguaGmfXpkQM5z1qha5SD1Xsx+EG/1AygW9tNQFd4uue6KprhSQk1Gb
         F0HP9fztQK7uP0rK7nAikS/vIE0pa+3ipsmZb3H8cQQF6z04uAGBpMJqz3usWNBPW43I
         NFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736569581; x=1737174381;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cA6SN2b+VepEpqi6xeamEUXAYwuTlZjCipcGUs+0HQY=;
        b=VAV/U5ezxfjkUBEj0DhQsuMgrzFiDmYI7Dcv20UEZ5nczdTmvOec1+9bunvENFzjX9
         s1afFDQweus4qMFzYg5OnZR0obZEARtX/i+Cc3bVPec+7XUmCzEHJlGcGGuOqEoQojx3
         M7Cbm8qKVkCSo80GF2YXOgclUjbSyB7ZF2IawH0iFuyHkeoiYErcVhCm1zUl+NohY+J3
         zhk5Q51S66PEvFq3P3kmCL19Ui/JsSM9tyjnNUkZK8kWW3WL5ua/EiblVquBSlvrYUGS
         dH+v337n6il8sMLZZGyOBzXDnWc4bz3LuYg1nr9QB7KWirDvZRbumWs0s9ttLo3Ku5yD
         bT0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyLLa4JamyvP3LlBP4C1b35oJW2zG6um/9KlSn1Kq/kxgxTZ1ZNAxdt14sAPqZYG7ktMk6nZaaJsE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+APu/hA7uT0rLklP3tKO6UuWioQwVhbjfA8d1VbXvZkfRKzeG
	YkyMZOFmoaruvtSIhmwOWj/JwWGST4ro9sI4u8m8B2BgxO91RTWeNcCimAQpxqeVX3PftlEvLp7
	yAA==
X-Google-Smtp-Source: AGHT+IE6ZciFE4COCcZoptuRqP9Xdk4NScDBFayFFXNBfZ/aDS6ipS+1cA/rJiTwDEgWxrdwV/9h4u1KDQw=
X-Received: from pfbko22.prod.google.com ([2002:a05:6a00:4616:b0:72a:a111:742a])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d043:b0:1e0:d4f4:5b39
 with SMTP id adf61e73a8af0-1e88d1d5dfcmr24841946637.24.1736569580885; Fri, 10
 Jan 2025 20:26:20 -0800 (PST)
Date: Fri, 10 Jan 2025 20:25:53 -0800
In-Reply-To: <20250111042604.3230628-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111042604.3230628-7-surenb@google.com>
Subject: [PATCH v9 06/17] types: move struct rcuwait into types.h
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com, 
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>
Content-Type: text/plain; charset="UTF-8"

Move rcuwait struct definition into types.h so that rcuwait can be used
without including rcuwait.h which includes other headers. Without this
change mm_types.h can't use rcuwait due to a the following circular
dependency:

mm_types.h -> rcuwait.h -> signal.h -> mm_types.h

Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Acked-by: Davidlohr Bueso <dave@stgolabs.net>
Acked-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
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

