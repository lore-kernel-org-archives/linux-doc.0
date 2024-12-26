Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A201D86E4
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232854; cv=none; b=E6H9FcmYRgdbv9KQaiX/vPgB5jwu1sHYmPAKbiy0BCGDunpEw1SOhxNSPjjzyc4Brs+0rf3dYbzvrZkk4ytZOdORQjhqfTMHpqPmHYIYX8Mubg5uY2VKC37n97/1W4lC6erXlkrORrr8cbCUHHsrmNj2cWIyCSu3nbQdVFHCSYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232854; c=relaxed/simple;
	bh=eVQ3VVggh8kVNxQAQ6vf7aEf20tCEfNHXPz3nGbyC34=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T+aJmJXaUa7+3rmJGqY6X6hZCVbzZ6jyvDOiRihCPz6COxd139Y2ijRf5hkjiHxGkotpmzzYkiRFDlTbIuifk7jV7Fh3iRQptwf9LAhm8boVEZqftM/gNrZkI23MXaqqHZmLj2P15k3rJ0dgFD+4KJpV9lu7yJIVkbYVXd3RFUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=isj/PPJZ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="isj/PPJZ"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2166a1a5cc4so77353595ad.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735232852; x=1735837652; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3UFX636acVjy8McvbWwNjOMeHy5jkJa1vw72jY/LAWg=;
        b=isj/PPJZ2b1nSCRYbvKE/9CiqUanOR8d4bs21E+B2n7F/aYEM31Q+xbtHaigPkaNps
         FRn9QUVz20Op5fcuLgKcXUgUY821+JwQxpJsTaB0RdeThUeZrDWGondHB5xyeOWGFxF2
         d4LCSxEYAZkRiY23pm3l55Dqcx+YShycEZkjdv1NJSBL9knRWHrf9RI+pyqvkqU0yUW6
         rKN5NwWhHQ63TXUae+zu7B5+MU5Nu10nt2DI6+YHwCOuA5CerE6Y8LLhCmeRn7rDYw4j
         ExApa8YxUpeYwx4gjkUP62+waHZEDx/dZK2VmUCT5/har3hM4dVRWLAwsZ/qXd27RFAy
         qNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735232852; x=1735837652;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UFX636acVjy8McvbWwNjOMeHy5jkJa1vw72jY/LAWg=;
        b=BKBmomYJndq4ZS/CPRJte4jcILBsbplfBLte9CaLaxyhHpXFtzj4/NTVRkri/dLuQR
         jLvkuqWIvjguaY8e7IM79AYegnAoiLiGATGUc9e5fcfOCYQvO1wXR2gZ8ItvtF+YJxX+
         VyxOQw+mo0lvhoOeSeEkpt51LFcFa2UnkDZOTmrSGBAV9TvaFwco5t49Fg7ot5V27NLS
         ew8lXphKFatEG/iyFJKWVAdCQTmc+ew74Yf8ECrGXpaKxHrU5kaIJpwdHKb1DYuplYug
         tq7mqghmwRmexSsLeagSE0ttLpu283e/fv7qe9nVnMGZGU2DjkwazoWtGicyIUHowh8v
         WAqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+ft8nsF5liU92sXsc0/YTC632o+nQ3kTodHMHstcCMSJOpnnTsq4NzjbMi5KyaG9vFPCPWTSGXBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS491Uv25PI8o88INlH91iI3Q/6j3AejzzOkhu4yTkeLOa0F6u
	9lrNJfh4U9p8L8NdNKa/4eBCFVPNryW57ZKqGvFTFa8RXTgEUs8JCgVdaoCw28QWQtXkJ8lyNAi
	NIQ==
X-Google-Smtp-Source: AGHT+IE+Il4aaMscBOZzUniftz3cly+CPDHxMUs/tHLaE2nxYIYJF6s9V97DoMW87H97O8rFF+TQEZN/e8w=
X-Received: from plsp1.prod.google.com ([2002:a17:902:bd01:b0:212:5134:8485])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2cc:b0:216:5867:976a
 with SMTP id d9443c01a7336-219e6f1176fmr305791325ad.45.1735232851873; Thu, 26
 Dec 2024 09:07:31 -0800 (PST)
Date: Thu, 26 Dec 2024 09:07:01 -0800
In-Reply-To: <20241226170710.1159679-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226170710.1159679-10-surenb@google.com>
Subject: [PATCH v7 09/17] mm: move mmap_init_lock() out of the header file
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

mmap_init_lock() is used only from mm_init() in fork.c, therefore it does
not have to reside in the header file. This move lets us avoid including
additional headers in mmap_lock.h later, when mmap_init_lock() needs to
initialize rcuwait object.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
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

