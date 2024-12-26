Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBB61D517E
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232848; cv=none; b=duBfSDlclqNCHvUnmd/ITLn3gSnEJmIm/isaDYsNiW4PvMVxU/D+YST7VBolBvRAnG8rPRrr5aO308sQiz5EG7lcrXzC5yfX3Zu8jaVgoEYiT6JGmuGLdRwcbpAz4GFnh6wGrzu1uW6tKLRe1BbPZJ4gq3hUoQ6QntLF1QlHqaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232848; c=relaxed/simple;
	bh=7fZMRb/YbbjOi0MmTg3pGeQUEUL0PmuVszXd/0QvBig=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bDzFhZ7n8WHu+Bxi5n2+4mGj3iWKTlSj0XkWT7E725mExXFZ/E1uHWAmLZ8gSAQKLVSFST5UbUUfENvo6yGRJMh2Q0Wjcg4KyskWgb2QmDDq+3V7Sp7cE8fY5+dJ+m7U1CuMkKZysRuA1XM7XjuYjRkiyBsKG39and2qfekt5oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kzunHBQV; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kzunHBQV"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2162259a5dcso144834555ad.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735232846; x=1735837646; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g5ywt//znwFKMBkiU95FpNYi4gj0LeYvCae6lfTb4Ek=;
        b=kzunHBQVkRfVFNXbgQGUT5jPyCC20z7B7knCDh1wwFgMhNvqSl/guiaZyHb8fjFSSL
         uBNpcikpRGLZ6Su2H+yv32SsgS5q0Z/GGOpXB5mk7c/zF8jdHQaW5rumOR8puU3e7/IL
         32G309NInGCrqG/pALwo1E5QKAgE1AWhAYyp/dTew7LT/Br9QYehYqZ5PVeo7yLMgQEZ
         b1pJPQCNVEPxCYJfTSj0Zh65YGiJLHT4fl01sfd3RJ6kivy0xQOgxlB9kxlinCKRQjI1
         bu1B6SBcqYwaj9o+qK5HnKOjebrkr55dSOX8mOpTqHxeKayhwLSZei2zA6vCJYpm5wKi
         Adig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735232846; x=1735837646;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g5ywt//znwFKMBkiU95FpNYi4gj0LeYvCae6lfTb4Ek=;
        b=vG07TePepFeZNoX04diM4yhP8yvCDs+ZOnr0LGSONsmXmJNdk9mmCZ8U+ovO4SNVbV
         REXwZ1OiX1cBJlCiAygxltX0ykSy7pUgriM2+jVD135L5eE77AqfVZhj6fihhpYkjWY4
         mqSgfZbpvZJ7ofOP1852EpTDPrgDXyiBVFBP7Z0fQe1pf/32vZ9DOe+WiF6dj2CwYnqS
         VB9LKUhAChs521uV9VOFxBEnR+MdmExaQMSKEMZsnQptUJG2jGWDu8s26XMb8UaLT+vX
         nDi9n/TG0YDVzn0jd0vMiFUhMqZLGMzAVp2958jivemSJMaFM4/rtMYThoTa5DJHR+l1
         VrRg==
X-Forwarded-Encrypted: i=1; AJvYcCX3YYIR4LujCYNlvJ7OzwKkJEqUdQOEvzMmhpE7fuM00ipcBB3/ioR+9QOwMKKd6aowmTjahOK+l68=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHLbpwUM9DYqHoaVCbhhviQVz5Pwvf78r7mqdTXUTAvAvEPUHx
	yCNeQpYYtK/ppcT/FEEnWvyENVXjgX9GazeyTxvKFETzlvybktYVkDvNb7fxk2Ht7bHl7s3m0YY
	FpA==
X-Google-Smtp-Source: AGHT+IE/h3it9ewL3ohy9Py+t9rkxMgblJxIK9ZNryUZhJOqjESQSzvwpTa/5zazFY30vveAdTUiPRQAGfg=
X-Received: from pgjs19.prod.google.com ([2002:a63:f053:0:b0:800:502a:791c])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d589:b0:216:45b9:439b
 with SMTP id d9443c01a7336-219e6f28486mr336700685ad.50.1735232845994; Thu, 26
 Dec 2024 09:07:25 -0800 (PST)
Date: Thu, 26 Dec 2024 09:06:58 -0800
In-Reply-To: <20241226170710.1159679-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226170710.1159679-7-surenb@google.com>
Subject: [PATCH v7 06/17] mm/nommu: fix the last places where vma is not
 locked before being attached
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

nommu configuration has two places where vma gets attached to the vma tree
without write-locking it. Add the missing locks to ensure vma is always
locked before it's attached.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/nommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/nommu.c b/mm/nommu.c
index 72c8c505836c..1754e84e5758 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -1189,6 +1189,7 @@ unsigned long do_mmap(struct file *file,
 		goto error_just_free;
 
 	setup_vma_to_mm(vma, current->mm);
+	vma_start_write(vma);
 	current->mm->map_count++;
 	/* add the VMA to the tree */
 	vma_iter_store(&vmi, vma, true);
@@ -1356,6 +1357,7 @@ static int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
 
 	setup_vma_to_mm(vma, mm);
 	setup_vma_to_mm(new, mm);
+	vma_start_write(new);
 	vma_iter_store(vmi, new, true);
 	mm->map_count++;
 	return 0;
-- 
2.47.1.613.gc27f4b7a9f-goog

