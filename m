Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A583E271285
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 22:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739486834; cv=none; b=tI0egMWLHqI9OiDNs1MsUq0lnMAlsxJRn/bXPZh6jBb8jGsX666VkjZ9VYr3PdupW5CQ/sBpCaMkj1mrg8xaaqu8q3FSgyPMevVNdYmushmwya4m3jhKxKw/mDKygdUxogimLJJ/0iNNvU3oX3UGquyR9UV3LdUHN/0EAwQD72o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739486834; c=relaxed/simple;
	bh=8Njh8fZrPvZrNtKwBc51MD6ktP5kHik3Z5tjuwiDAWI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YG/7n88vyzM76JjS2BomEsnieAwspC22l2D5Eoueflj7EbnlcdnQ8/s6m0xEtZZiK7I+weWwOXXRltuQ+nHV07B0MQ4XXcVr/TMFZ8KrTd7un4b3o6I3vxafn4H3yhcyk9TGxalBwfXVbDmvCQ+tkfvfNa2xUmLq/ubW4p0YV9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s+bvfVUv; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s+bvfVUv"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21f6cd48c56so21400395ad.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 14:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739486832; x=1740091632; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f967rAL9Gs1nAaqEwqbs3/KxJ+f7SIc9ekPyYd69/e8=;
        b=s+bvfVUvgOWtFpnu14BOSzEiPG0kIYIzScBGcOYe3kTw+dg7dsui4vqngb3xVAohOO
         Q9cwgcFFFR5x1iEpV/1CpTwDhE/I15zNDeWD8xsl3jFLHjbZRpZX4mkE817bJRVCkoEV
         mjr1tNkGkVge5EkfDz8z5KrCxbDDcDf2jQktO5lo5KIduWOfkbRI0/1lRhrSSOiNos8g
         /xlAjcwYiPRZDyp5jp0gx1rKZIlgGCrC/Vj16Eo6g+e6wbhNzTMIGanj7H4lLMbZXuuc
         efBKGKIfVntD69uf699/Hvw+VdxczLIa1x+wSYVT1UkbGxCIdPB3+byWCbom6AApotQI
         0FAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739486832; x=1740091632;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f967rAL9Gs1nAaqEwqbs3/KxJ+f7SIc9ekPyYd69/e8=;
        b=h1ka+43cONvRc9QEkRu1AltKQHqcF+1rHlEQsoZ7I6NOvDK3DtM3QP7s/k44k3brr0
         5nbWuhVLmqUG5wnjniqirxofm5OQu3eDNKOn1YV2Z0KuJvt5/dCyhNbYP+7iI87c5iXA
         wwYaYXRkDnP/uNKgKncKZhCNlAdv9JbafHKAj8inRyYPfPRJtIc9KzFykl+9fHdtStdZ
         4LIqR4owwKvOhf8FHB2H4uyU1ZBoOvzj3hYhDSk9R5P98gEp6wGNydgb5L+b6dynBYXJ
         ZejwWUbT7aoka6WU2bDONeudo51WdwqvY+2WNJAO/vDDbjWExUfFjF5HnF5jgTzBAXW7
         tJSA==
X-Forwarded-Encrypted: i=1; AJvYcCUWQheeyKHMHkO60+brpZBJhOyQ6n95351DrUO3hPuPYbA2C8KrKb1X4cMvs5cEhzPKmRnt0TEPj/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf+ZCAxQ2TtmPbU45yzy2wuvnXamvtBn6Cv1BFA6dSBMl3ibvN
	Zzob7S0c9HmNM1fnsr5i4MorBPIW8AtKppLCbV8cwCKH0ldSGPmxieeMQUl/uBhtj5YS0dHfqE4
	ILA==
X-Google-Smtp-Source: AGHT+IGSWz7GU9dfI59mEnX3KWjK84PY7XxuIsdno4nvi5XjdZpP5t6KXvINYXrYmtHx9RdlsY/1nSR1Ez8=
X-Received: from pgy35.prod.google.com ([2002:a63:1863:0:b0:ad5:5841:9f23])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3a94:b0:1ee:6b2f:1a2a
 with SMTP id adf61e73a8af0-1ee6b2f1d52mr9549965637.15.1739486832181; Thu, 13
 Feb 2025 14:47:12 -0800 (PST)
Date: Thu, 13 Feb 2025 14:46:43 -0800
In-Reply-To: <20250213224655.1680278-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250213224655.1680278-1-surenb@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250213224655.1680278-7-surenb@google.com>
Subject: [PATCH v10 06/18] types: move struct rcuwait into types.h
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
Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
Changes since v9 [1]:
- Add Acked-by, per Lorenzo Stoakes

[1] https://lore.kernel.org/all/20250111042604.3230628-7-surenb@google.com/

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
index 1c509ce8f7f6..a3d2182c2686 100644
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
2.48.1.601.g30ceb7b040-goog

