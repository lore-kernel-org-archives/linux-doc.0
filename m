Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6471684AE
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 02:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389844; cv=none; b=uAgy5nJGHW5qYPDu+nQnvLqY7KLeIIhOolefcF7tHSxUHtlNxeg/yM+LZHVgAHPsM9e8bUYcajLWz2mbzSmD5FbTx+sGsyQWUMQEdKerGRfSZIF9ng9BGy0dTFvJadORjWPK+1DlnwWYTwh+2Umaz/3myqZWYlCm0c8d9RVNoyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389844; c=relaxed/simple;
	bh=G5eaEd7sNymn18hH96NTtB8QopbMIDFHamvLccfcHqs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Rz7dQWgXNwdaLgmGK4R9H5RqNbWwo0e5Hj4bCBZSH5ppuwYfb4FGAPnNuw/8viFzAqVB9R3mF2Qx6+3K51DAXKlVnshnnDtcZfwYLVw4GR2ydQhoHzfPp75C4fezF8iwGPdBzwq1fAH+X6kNkpnsGpabXsO26CXejPt5c651hkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gzlQ2wA+; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gzlQ2wA+"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2167141e00eso6070905ad.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 18:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736389842; x=1736994642; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cA6SN2b+VepEpqi6xeamEUXAYwuTlZjCipcGUs+0HQY=;
        b=gzlQ2wA+IwR4TinVWgr9NB1QX6fV+8M8oWZZskr/nNytnq2TybPCirzZ1Gnmbl71UT
         8RbXF6qDD2WJj7JPLv19tt2qal+kuhf2ObAZQvwYJERW+dXx0/lgj2RyVd9u5KigX2gV
         WqOCWkJX1XCpLYZigiVJLIjV3eMPRTI/wkwhFvjkIw8MJZ8siPwwbTc71LM+8WNGblOv
         G4GpYKPGlGxWQYqirUhIDxe7ajYFR/R+4ae32y610CWxlTMsiW/Uxp2R4xRWJwE78uYF
         BWVipcXKxVW0Z4PoFgVXMkySC3TFQ48ZAQz1BSYYdliWwqgaMMrTuTDROxU32KL2j22y
         3lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736389842; x=1736994642;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cA6SN2b+VepEpqi6xeamEUXAYwuTlZjCipcGUs+0HQY=;
        b=PLLbwggfntF2v2doVb/FxZ5GjjFWR0wiWTWmox9thrq8nZxglVCvqPrzt/n76cuFIS
         4y7UoolAW7X/GrnqGe+AFGJ6qsrstNgdqpTakXcGNjzcv/IMrlXIapUzu2rZ6EJ1ZfEy
         /jYZYnl4A061xx3DB2+rb53STY5ZZRPlCv0D3NIhgsICMadLlfVt3Wv7K3mrlX3WL2LE
         /0BlpqBEoZpmeZvRFeHO+3kRkiu6AhdCeAFeC3C8DPaIhtkMpqS/htyC3SYe96ccf58A
         y01LZKuGZzIMDUw7Q0+g7M2tdZ07ii2OV1+pzanBcPLij5mJndfd9bBI3LYISb+B2ViQ
         YCmA==
X-Forwarded-Encrypted: i=1; AJvYcCWHL2c+ELaI5ET5W/xdV2X+46UIlxXP5dptGDaesD7hPjQ4noP3YDIdDP1NEHq1alYTczauen6w3eQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+I1pumx14fTMWobnrzpjDhoGlIuoAc/siBNFVRzdtAIfiy0rV
	fi0Wph+hAiD0pUPNJgkwX726Bb4b8yPVhczbAxIzlqFCv2/kcP4VdYd4QCNp5zCEIgKtn/ateaK
	xPQ==
X-Google-Smtp-Source: AGHT+IEzXiHq8FNMI7G+fgWP1KpPrFXIPUQsCePye9PY3Gn0PCmDCaiyOC9LF6jJI5g/L9SJ03+t7trrpGQ=
X-Received: from pgcz11.prod.google.com ([2002:a63:7e0b:0:b0:7fd:56a7:26a8])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ec85:b0:215:6fcd:6cd1
 with SMTP id d9443c01a7336-21a83f43ae6mr56359725ad.7.1736389841928; Wed, 08
 Jan 2025 18:30:41 -0800 (PST)
Date: Wed,  8 Jan 2025 18:30:15 -0800
In-Reply-To: <20250109023025.2242447-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109023025.2242447-7-surenb@google.com>
Subject: [PATCH v8 06/16] types: move struct rcuwait into types.h
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

