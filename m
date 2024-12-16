Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA9020ADE4
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377080; cv=none; b=ngF2viACJUMIPvYSrGPLcIHXdlc7CtjzhxWQGwXTPWIaUAmI3JQbpm/o7t6a78S240kQbOMF3MEKmXbZiDhiyLhcSWs4gLEm4m2D7+Rat7gRHzblj1+UzSUdtLLlOl0TxZoNkIxjl3AEIdUbN7nlPIgrCPM+Do1YR7MITFy19FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377080; c=relaxed/simple;
	bh=UPkBiQCnTHMVc7aRHLgwfaCDlFkcN0QzJjPCmja7pxs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ti0woS5ChlbQyLoqspS2FZ+v7Jzf+tR0zx0BwDkAEbDWMbtZAhujJPy9H89uwF1HOirgogmKMk3HRJV+t/eY9DHQ1wDupIiL68fDL8B5yyStcOjHh/xGs8sJxnENdRYs0/PQ4T1XO/PbgHcR4Gehy7EHOH80WKcJWOFmwDlo9/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r7iDGO8O; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r7iDGO8O"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21650d4612eso57861305ad.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 11:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734377078; x=1734981878; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V23hsekxf1oBAjhtCt33Ew0gdChPa6B6f0O6pWk1TGI=;
        b=r7iDGO8OxOk1nCb7sQbu4njndA3P3nKUXetv+8DO0ODk/H8RX/ImnPJ4RqUwRNui9R
         48H7YoX3bZuR6eSUFFVEA3XRhqz/qKDpG0MSsC2FDvlgX8YAz0pbVH8NbSlvNb9JtBHs
         yUj5AGWCukUevS3OoiRvZ1trk5DGUi5wpzY++0Ke02rvHGm9KQevRimIfkPO2ytYKsbG
         bh0orfMvK8nyj8Owf7C0Ol/u0kw+LlBcm1zcasz2Xyf7Ls9FkQTH5QVPvbIuHnF1VlWO
         H8sL/9LrLyXEWCcfJdS5Q61e6CMkayKhA0leE14A5diNA2YHTEC5l+FVVHgo20/gDGNu
         a17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734377078; x=1734981878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V23hsekxf1oBAjhtCt33Ew0gdChPa6B6f0O6pWk1TGI=;
        b=WixV7QPLJ3EUCJARWsMKFRrlWVxGngqBEUc1D3+h4TYFm2571c5oEWUajneKrQ1yin
         lsKV3gzEqQ6Moh/UzXgMdhak6ohCqUwqXRVR4BacwWbvm1soQWOkxmtL1GXBan/k+ZZv
         k2+CN0BFL7JzRLwrGYljq6PM86lfAdrYzOXwDE33qnalHSayaS5hy4m7HP2coBhDFL+o
         OQi+U3Ny7xw9WMjDRNMDkVhCYFlZdt153pufRUZUj34R/aSAwSDJcJ70t/zmxe2YK+kd
         Oj/FdqGv7PAXt3VN2zFGgGkDSAzwmGC/8/TCNKkCkVeF1BwAPkPAADvaE/29xTrMWUXt
         yRLg==
X-Forwarded-Encrypted: i=1; AJvYcCXi7VyPr6lYL16Bo5ELlaDkcrk9Nz9/EQnMrNueSHTUttuo5sxFvO74tplvHYnMEyikHtB3D/sI7CE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIU/76HpXINB144lAkzFZzmwjWB46BJslCQyyC40wMI/dCC66J
	pgx5pT7oc2xcR/UWnwxdYYRDYTD7UHkjWG9M74L8EYvDE3vkXqB8yeko51yuJpt+b6CCYlL9/ez
	l2A==
X-Google-Smtp-Source: AGHT+IGOYBhQK/OMn61IKHhYYRKFLZqMwRmmFqwVG/Z+7upwVvTEn0G50CkD9wYvokG+WIRwbcBuoK+avFE=
X-Received: from pjboi5.prod.google.com ([2002:a17:90b:3a05:b0:2ee:53fe:d0fc])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cec9:b0:215:4450:54fb
 with SMTP id d9443c01a7336-21892a5c02fmr173665245ad.55.1734377077933; Mon, 16
 Dec 2024 11:24:37 -0800 (PST)
Date: Mon, 16 Dec 2024 11:24:10 -0800
In-Reply-To: <20241216192419.2970941-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216192419.2970941-8-surenb@google.com>
Subject: [PATCH v6 07/16] mm: move mmap_init_lock() out of the header file
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
index 57dc5b935f79..8cb19c23e892 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1224,6 +1224,12 @@ static void mm_init_uprobes_state(struct mm_struct *mm)
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

