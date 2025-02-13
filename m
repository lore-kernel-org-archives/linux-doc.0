Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7C7274257
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 22:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739486837; cv=none; b=ZFQOGh12IsW0lnnXaXoLPY78+eY1T0eBhHTPxYt/rYzO0FpTnE8pxoD/mZeudIHrGxXuz4xx9rP20zACriSgNik3IjNVLaUIIZFUnUCufE/Z16mHsvGoTwljLhtTeXNvdXRsf3A2j5rbCMPIHI41nCSE48TNPhE8Kr48apkUSTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739486837; c=relaxed/simple;
	bh=jd3zK0O73VvJ9q8T3yi04/lCfi5p05ochW8W4AzVfqM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XQ1GANvIba8vDACUewpomCVaifs9Pq7PAmAopF/MDQ/IEVyk3QGQLA2kEswkb5GyLKu0H23EOOS5438u08D4wmeKOJ4t640AeMFmJpyjyGR/ETf6fr5w2FxCSuy6JWqZlkacUFW22c3X/k3dq5V7ZYH5K5yGWCMPOVn/8yjHTyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lNddyp9Y; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lNddyp9Y"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21f6c90a8ddso42692045ad.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 14:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739486836; x=1740091636; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PeBZHGW/4v8XWLim1qpAbGeBbAKuN/isMOjrQKZ6x9o=;
        b=lNddyp9YUtSkjoGkvm+zgCFC8vAIcGIm5M4oJWQj1sBdmhLrzEkbS+Qx7af4su84MH
         ft/poeZYLBq43pNX92CDKA839VnY68hfVWVaBGkfO4TM708x8WcfQWEXL4Lv9fCw79Wy
         d7GMkDbJpAzyGa+ZwQ2yn+Jy6C9KX+0R2fXAzyWaxySeRn0sugRxJokKkEOycXVRoTY6
         D18CEZuMCHfM8qy/IlRmoCRXJZwIRXLS59qty9/K0cD7Pc/T5jAoBJ3GgLGLQiGl5mQd
         K3sxJwMrVm5NpJ9DHUz9UCrN3Hv4Z0uK4vRQo7wwd7A68qMP2Ipx6j51KaVVQXscaMce
         DMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739486836; x=1740091636;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PeBZHGW/4v8XWLim1qpAbGeBbAKuN/isMOjrQKZ6x9o=;
        b=Qm6wN49ayIiqWvrvm81Ulvd7U8OyTA+wKS7/+XmvG6YHndmq/53N3OaCODXttp09rk
         XgpncbOs8h4aK5RWhb5wQO7hEf4lsoCxw7RLXs2Ypq/7owvcb7m+j24JrZWiElLIIL/V
         hyiAT3PZVF1Os1TdrsOY/OsvBYPkcETKgty3UqcoL0l+sp47Pnp51KHmQigZKAkAh04E
         OHF9oHvnWBTp1tIhD2jaSQ7vNKWS+G6OF0xha8Xat6zan4MUU0mxj4btMHxVS6ouZd9Q
         7InfhuyD2A3vg3U5onkdicEiEq7ddT5SJ3ji9Ys97hv5K+XNwdQXRhEW885sIRZbKzZG
         yGSQ==
X-Forwarded-Encrypted: i=1; AJvYcCViirBbCcJqoyjE+TQakgHI1bTirnzX1iWiuu+I9dy9jiETPDxVWjjPb+M73MAKpFalhewFpoSiHSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnvANW2c1Oz6/g6s2xeiXQ5163zFvP5dNrj0EbF98GWy2kBX3e
	kSAi0vwq2Nx5R+M8JXwlLBBBp2kryH1oM3j+a3L9tHY/TaDh/owN8IpD/Gurjin26RxoiL09hlL
	cVA==
X-Google-Smtp-Source: AGHT+IHfEnz0nPhbgU0f7q7Auc5HNsVT5eJa8wXZ0ZtBNf3PSVTzFb4/Oj/O6W2xc+itT5Ikm9K7oZ7OyHo=
X-Received: from pgvm22.prod.google.com ([2002:a65:62d6:0:b0:ada:4ec0:a7cd])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:512:b0:1e0:ca33:8ccf
 with SMTP id adf61e73a8af0-1ee6b416346mr10537954637.34.1739486836048; Thu, 13
 Feb 2025 14:47:16 -0800 (PST)
Date: Thu, 13 Feb 2025 14:46:45 -0800
In-Reply-To: <20250213224655.1680278-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250213224655.1680278-1-surenb@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250213224655.1680278-9-surenb@google.com>
Subject: [PATCH v10 08/18] mm: move mmap_init_lock() out of the header file
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
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
Changes since v9 [1]:
- Drop inline for mmap_init_lock(), per Lorenzo Stoakes
- Add Reviewed-by, per Lorenzo Stoakes

[1] https://lore.kernel.org/all/20250111042604.3230628-9-surenb@google.com/

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
index 5bf3e407c795..f1af413e5aa4 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1230,6 +1230,12 @@ static void mm_init_uprobes_state(struct mm_struct *mm)
 #endif
 }
 
+static void mmap_init_lock(struct mm_struct *mm)
+{
+	init_rwsem(&mm->mmap_lock);
+	mm_lock_seqcount_init(mm);
+}
+
 static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
 	struct user_namespace *user_ns)
 {
-- 
2.48.1.601.g30ceb7b040-goog

