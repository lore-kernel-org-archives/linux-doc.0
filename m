Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEBF259C
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 03:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736219061; cv=none; b=jziqCJ9Qf0p0esWhLxUQ+sw0djVi+WTsmDb+Q162BmxIvl16t9N//ExPRz0f158ioreBUOhlWUbAnWQ8H9gpFn5+njT6FwVIHbr19PZgwH9+VY3gUYLNyS9nnECQieZwdFymPgZD6eZJfpNhEj40052wPQl8YYj5N8+7dL3V4rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736219061; c=relaxed/simple;
	bh=Ykl3RyAW56WdEAFD/U2edYxOYIjSXhzYmIoUcN/WSfg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jsdVuhQ0xTNhOm5yKHEVbjhYNgtjWjVJUk1thRZ75FIgeGUHy+rQ2NERZ/QeB7VA9+zzNum9CDnTfWIu2LL/JEKX5cDxLnhl06Fk0+tJNdToes27hBGNLyyyrqUI7y1rwqC2r0YpJdfHtV+caqYI903d1BXucyGdrICvdht7/bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DPM9J3Qc; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DPM9J3Qc"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef7fbd99a6so21091062a91.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Jan 2025 19:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736219059; x=1736823859; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IAKugViAv2vyxsDo1uwcQZx4rpptnMiInyJAyrim7q0=;
        b=DPM9J3Qcy8ekSZALt73PKvoBAW+hBCbuH9v5AJkjJvVY96liLr3S/EieF67uUzIvwX
         mlJMYYU5uaz09KXJB+tpT4iDjIwBnmeR5v6Ehxx+dJyi6IYVWoy/SkIYg9wg/3GlUcZh
         izKLFra+OfYIUrkRHbS8XenSfTwBmCS3cVXs6/PtNQq7Z2IcdbD7XpXhwxRVnY1fk3Hb
         F+UbupPgthQ6ZVGoiVTFgDQuvLz+75AMpI/3hbP1836HOCwl889aE2j2sV4bto/bglpc
         EBDJkq5UhpRdYaJCXAErDRdOa3dh2JeBaA40pggMqALNRtCJiCqTPu/PZYhY6CP/8/L9
         QXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736219059; x=1736823859;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IAKugViAv2vyxsDo1uwcQZx4rpptnMiInyJAyrim7q0=;
        b=CRdKz50mH2pNVbGyDeY2wSUGWxAF5bzSVVpEYPk897yr8gUQiKx1qj6zHV07vM8rUY
         fAZ2gvcPSkjv5TZWiBQWeJXnMnh82EY1kzMOUS8EPt6+MEcsfq4LPM001Nsr5imu2hPO
         SXP0eVxKtqHMxg79WbxLtNn2HGHsbaquv15kDgJ92B65rwD7Qayy6hu2IWXSJZGoUw2+
         Cetiz4DrHBS21/esbQdtc8ZAC+1QWIn30EKU7D7VSzjTtCCyGtH5uFQKRLGU+RZ/OiIU
         1nu5PCds1pRbI4JR8xrRb+28f55UBvo56dhKVnag+b2wL1RiPw36Oerdo000MF2qS+jL
         2JXw==
X-Forwarded-Encrypted: i=1; AJvYcCWqQJXwqIxaiG0eMHQD8Gsh9h5cMSw6Ohq+ZHHQD410paZMmfrDOrL8BBUZDHmKrR5E39BYRU73Zx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhUF7oy/Ny6MxgAPQ+qNgiVSXjMODQcS/P1Qq9q01HEFQtfzrM
	1kVN1ljr7UQx0g235XsJdUuPaHuwfERKO5TGA+h57p2Rl8eyVSO4p+P8nANesC9HCT58xcooCL4
	SFA==
X-Google-Smtp-Source: AGHT+IEg95xZ0xDmICag3aY02ywplEVuehknTygKn8G6rDFUwwaEkm+rFMld7kyFOrds6elBt2izNVcIS9o=
X-Received: from pfms15.prod.google.com ([2002:aa7:828f:0:b0:72a:bcc3:4c9a])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:78aa:b0:1e1:ae82:5657
 with SMTP id adf61e73a8af0-1e5e080282fmr90631848637.34.1736219059615; Mon, 06
 Jan 2025 19:04:19 -0800 (PST)
Date: Mon,  6 Jan 2025 19:04:15 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250107030415.721474-1-surenb@google.com>
Subject: [PATCH 1/1] mm: remove extra check for VMA_LOCK_OFFSET when
 read-locking a vma
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: richard.weiyang@gmail.com, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Since we limit vm_refcnt at VMA_REF_LIMIT and it's smaller than
VMA_LOCK_OFFSET, there is no need to check again if VMA_LOCK_OFFSET bit
is set. Remove the extra check and add a clarifying comment.

Fixes: e8f32ff00a66 ("mm: replace vm_lock and detached flag with a reference count")
Suggested-by: Wei Yang <richard.weiyang@gmail.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
Applies over mm-unstable

 include/linux/mm.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 486638d22fc6..b5f262fc7dc5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -747,7 +747,11 @@ static inline bool vma_start_read(struct mm_struct *mm, struct vm_area_struct *v
 
 
 	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
-	/* Limit at VMA_REF_LIMIT to leave one count for a writer */
+	/*
+	 * Limit at VMA_REF_LIMIT to leave one count for a writer.
+	 * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited() will fail
+	 * because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
+	 */
 	if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &oldcnt,
 						      VMA_REF_LIMIT))) {
 		rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
@@ -766,8 +770,7 @@ static inline bool vma_start_read(struct mm_struct *mm, struct vm_area_struct *v
 	 * after it has been unlocked.
 	 * This pairs with RELEASE semantics in vma_end_write_all().
 	 */
-	if (unlikely(oldcnt & VMA_LOCK_OFFSET ||
-		     vma->vm_lock_seq == raw_read_seqcount(&mm->mm_lock_seq))) {
+	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&mm->mm_lock_seq))) {
 		vma_refcount_put(vma);
 		return false;
 	}

base-commit: f349e79bfbf3abfade8011797ff6d0d47b67dab7
-- 
2.47.1.613.gc27f4b7a9f-goog

