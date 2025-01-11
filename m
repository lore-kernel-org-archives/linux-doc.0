Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC3718E050
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 04:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736569588; cv=none; b=V7XHgDIEeaDk4nEXFHDnr+SEnsrgF/evcJ40Ir//O1kxNXecKG2R+xVuDLVJmUxO+hzeNPfCMX30LIUbyA9VCEYhXMcFgLVlhMbb3/9yB9noA8dypjZnU3bEbJgr9fIO7JVTl+iythU9Dlh9w5ot7esldU9sfQvBP+ad8Y0sbic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736569588; c=relaxed/simple;
	bh=ZCtusRX0CFLoEEKgeZ6+wWBSV3rTZgAWPuc+3VLvu1s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ISbV/fYcHYxF5TNP2hjUL/2gp9O8DWFLde9ecqNoYZcRF2SwQW9REE0d2cWjTg+ePPJqNRYBTBMk7TsLumZTzCnao2WePaWgJB6++bWsK6IKEdZbyXe39rHXSmxzQ9N12c1HQfNPODJYWdSYCSQxxapnnz40YvAk3KYXyU8uwGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MWApLQIr; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MWApLQIr"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21650d4612eso69048605ad.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 20:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736569585; x=1737174385; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mjOxH5E6F+PRJReyBLOWVSfVgJNT1AsQeggvw/y9xao=;
        b=MWApLQIrbG0VjuKOJBvvSxX44T9C+gxwNiuMvktmFRMt84447XmyAKorz0dCvEyxyw
         R9vk/0CweVDuS9+f3x14RuidKLGMMNKFU7o+4WX0IiskqxLgdt9HxYhjQO0lhcBHI2YJ
         VtLraXDfHuEV4FkLAEkQroMIMaTqhnxje/a4wAMtPnr6uSQwhCJ1j1zJa8fKecGDaviQ
         mse0X43t+kWbIQ7IL82pNljNE3iflQciEYZh9QHu7upGa+PR8lpzmHZpclAPGGxFMc8T
         sfixWu28pAwjRYQfwZIeKPWwpT6azFost0ujLO/yJN69D13P7vgintMf4LtmJ45S94Et
         gJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736569585; x=1737174385;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mjOxH5E6F+PRJReyBLOWVSfVgJNT1AsQeggvw/y9xao=;
        b=hc999yKScjg+DnuteILp1hosPgzXhVPfP39gd1qzZsyvfm6vIKi/SJ4lEpKl+nPW7H
         M6LHaTJbACClcDO2N0Mqgx/aR2yV3fWVh2+bG3JsL9mZcTC4R5Lg8+eT6t0IgexooSmI
         6BgaQZnHQpUw/a2DWl8E0gtTapG0mlxOZ65H47ITg2WsUlF4T3PJbES7zhvsTJRrIX4O
         hNgn/moGSjWT2qDarH5vzu7Jlo5T28SASahhXg0Me+yyOGWx4/7+gxFz/PdqAOeEwj2Y
         iQmy/HejGXpJv/eBnXMPWJAfQ6OdQ25ejhGQ71+GVP+uOIOdGOfBZfVa+3h8CepqE5yt
         cRCA==
X-Forwarded-Encrypted: i=1; AJvYcCUmXb+nb/bOhO3TQeQLt/iAlig60HDT8r9EV3KqfnA/qAQxAwFnKz0ISMeu2nSQMLsDVXSohsolLu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFYqXB7+khbsPgENFGVMKm5eH+N8xxbJOGK2DjNG8yKUcRUbuU
	ynVjogq/bhprhcqBjDweG7ES/O3RuL5kmIPHSev4tByXFP15B2vh6pUYALCkf5kMSfOXUlaOtv6
	caA==
X-Google-Smtp-Source: AGHT+IE0/9yJJ25TvfX89iO9TEsxGGT3C6giF06ZQXBi5U4FgLqynwZmNkiGXRge1CwIKkM+8jgi9u5PJaA=
X-Received: from pfus6.prod.google.com ([2002:a05:6a00:8c6:b0:728:e1a0:2e73])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7e02:b0:1e8:a374:cee6
 with SMTP id adf61e73a8af0-1e8a374d574mr11673994637.6.1736569585095; Fri, 10
 Jan 2025 20:26:25 -0800 (PST)
Date: Fri, 10 Jan 2025 20:25:55 -0800
In-Reply-To: <20250111042604.3230628-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111042604.3230628-9-surenb@google.com>
Subject: [PATCH v9 08/17] mm: move mmap_init_lock() out of the header file
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
	kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

mmap_init_lock() is used only from mm_init() in fork.c, therefore it does
not have to reside in the header file. This move lets us avoid including
additional headers in mmap_lock.h later, when mmap_init_lock() needs to
initialize rcuwait object.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/mmap_lock.h | 6 ------
 kernel/fork.c             | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index 45a21faa3ff6..4706c6769902 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -122,12 +122,6 @@ static inline bool mmap_lock_speculate_retry(struct mm_struct *mm, unsigned int
 
 #endif /* CONFIG_PER_VMA_LOCK */
 
-static inline void mmap_init_lock(struct mm_struct *mm)
-{
-	init_rwsem(&mm->mmap_lock);
-	mm_lock_seqcount_init(mm);
-}
-
 static inline void mmap_write_lock(struct mm_struct *mm)
 {
 	__mmap_lock_trace_start_locking(mm, true);
diff --git a/kernel/fork.c b/kernel/fork.c
index f2f9e7b427ad..d4c75428ccaf 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1219,6 +1219,12 @@ static void mm_init_uprobes_state(struct mm_struct *mm)
 #endif
 }
 
+static inline void mmap_init_lock(struct mm_struct *mm)
+{
+	init_rwsem(&mm->mmap_lock);
+	mm_lock_seqcount_init(mm);
+}
+
 static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
 	struct user_namespace *user_ns)
 {
-- 
2.47.1.613.gc27f4b7a9f-goog

