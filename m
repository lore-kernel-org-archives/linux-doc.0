Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12FF1F931
	for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 00:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732061324; cv=none; b=jYtlCs/oH+Nl09GQapZUGv11m8OhPGVHBqZNXbfdNJjz7CxKsR44+Ei4+bvRzQ7+9Lq4dPfqQgRzS8hvtdRuB9oBHCxuhhZy0TDsy2+kw3iQ+2G9Xa1W4FCcobJQJIGB+7Sas6FG2o7NIb2fHEcBp90LQ3MaqWrEBve2BG1e9tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732061324; c=relaxed/simple;
	bh=vW4Z0ZGOmtEV/XeePxhUsVUAClcMrrgx+7r+mI7C7D0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K86HFWb28HmjK0MJoSk/1iKPaheA+UkYzcNG+r32zQq+NaoOaETFe/DEdjhm6a5Pq/pmkCDYEgkJXnnYvFmIZ7MUL19W+Xlcluv7hTBIkkjYx3KIoPgv1wAlw1R0CF5CTl+bitLW+xd+oUNRyUXfpd734pBrerhyPbaMEA+Kt6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gJD3VnaY; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gJD3VnaY"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e3891b4a68bso4049103276.2
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2024 16:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732061322; x=1732666122; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TVe9xIxnbmkl7SmN6iZyRrlBkQz17Arq0DLY4ssSJic=;
        b=gJD3VnaYnVawoNE8Xx9TrM/3Q9d8A2AdSK6iNEbwfzFGu2+aJjUdiJ07oRLqeEmstG
         wcu0TawGIqXgabGgRtMR6p5Nw6Z9+FOrQ21UbOKF4ZopO87eg/K+7/uZbCK1eHWYdpo4
         3pBWtj9vvfeYpr6IBQToHs0+Pz77FZF3JzgmhRPSyaCpOoeCP6h080WV10AF054bgzix
         g44aCtUln3eYVyjELG1KHpc8kNV5ilXqjrS82Uh5Q4KdBIWF3XAda7L8EgVFhcPQhQ3w
         rfUWzZqGoXtajeQyxiUu9W/5DxkxpRAbNGQGWz9Mgcf0lzmmz5ivvlRNQ7YHggEhaanG
         jZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732061322; x=1732666122;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TVe9xIxnbmkl7SmN6iZyRrlBkQz17Arq0DLY4ssSJic=;
        b=Sd5K/gGjNwidGopQ0rqcwbe+dp3jNlmZQWGoCE2JUI1WqzAWuW8PsBF5EQe1nfcKCu
         fjKgv87VepmikOT7Hpkh3VtrOZ2sMTtGxT5Y0Yc3NiQhD3xvd8ki3Kg4Knh05T0fZIxn
         zG+d605iFkloy8hzXGHpoc3y7BmJJzubpuuo8f1EfacJwq/8Fp5VSaXgDq1Boz8J7Ghf
         /s+jb/0hTQZLiMPu6YQOX64nAXJsRRPjm0vpzqlEHCwT6LWcnlWM4yt2MiELN++OB6KC
         WXobpHvAL5dcU0UWO0RV7to6OP3fAURS1jZBX7tg5OZPHem17fkSYMQHeJrXedt1lWe7
         LZUg==
X-Forwarded-Encrypted: i=1; AJvYcCXgdAY0tZjxFf5tUYWtv/nXc7s1TqF3LdWWLFq9SUXfId+i+XWqAO9uNJx9Iw09fJjzFK7nP4+3KwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/HLuYaVLCrBR8l+irKe5VtrspZERPQMGgz8CDl0kSvLQ64oYK
	Rlj+3s/1kT/aiB8Js6IRl9VG3PKWRbGh2rNR8YpR2pgOOY9xmpvvmuypSirT2jL6bxWXwYZ34Kg
	M5g==
X-Google-Smtp-Source: AGHT+IFNThkOcHUKsCtTkSyc+T5kvPSN7H0YRbmdu7qNTw5Do0Nv7SXuJL8X2fZ3WwFBn19KFwdE3O6n0sE=
X-Received: from surenb-desktop.mtv.corp.google.com ([2a00:79e0:2e3f:8:af45:bbc1:fc75:e695])
 (user=surenb job=sendgmr) by 2002:a25:aa50:0:b0:e2b:da82:f695 with SMTP id
 3f1490d57ef6-e38cb5f8230mr276276.6.1732061321895; Tue, 19 Nov 2024 16:08:41
 -0800 (PST)
Date: Tue, 19 Nov 2024 16:08:26 -0800
In-Reply-To: <20241120000826.335387-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241120000826.335387-1-surenb@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241120000826.335387-6-surenb@google.com>
Subject: [PATCH v4 5/5] docs/mm: document latest changes to vm_lock
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org, liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, 
	oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com, 
	peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, 
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	minchan@google.com, jannh@google.com, shakeel.butt@linux.dev, 
	souravpanda@google.com, pasha.tatashin@soleen.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Change the documentation to reflect that vm_lock is integrated into vma.
Document newly introduced vma_start_read_locked{_nested} functions.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 Documentation/mm/process_addrs.rst | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
index 1bf7ad010fc0..a18450b6496d 100644
--- a/Documentation/mm/process_addrs.rst
+++ b/Documentation/mm/process_addrs.rst
@@ -686,7 +686,11 @@ calls :c:func:`!rcu_read_lock` to ensure that the VMA is looked up in an RCU
 critical section, then attempts to VMA lock it via :c:func:`!vma_start_read`,
 before releasing the RCU lock via :c:func:`!rcu_read_unlock`.
 
-VMA read locks hold the read lock on the :c:member:`!vma->vm_lock` semaphore for
+In cases when the user already holds mmap read lock, :c:func:`!vma_start_read_locked`
+and :c:func:`!vma_start_read_locked_nested` can be used. These functions always
+succeed in acquiring VMA read lock.
+
+VMA read locks hold the read lock on the :c:member:`!vma.vm_lock` semaphore for
 their duration and the caller of :c:func:`!lock_vma_under_rcu` must release it
 via :c:func:`!vma_end_read`.
 
@@ -750,7 +754,7 @@ keep VMAs locked across entirely separate write operations. It also maintains
 correct lock ordering.
 
 Each time a VMA read lock is acquired, we acquire a read lock on the
-:c:member:`!vma->vm_lock` read/write semaphore and hold it, while checking that
+:c:member:`!vma.vm_lock` read/write semaphore and hold it, while checking that
 the sequence count of the VMA does not match that of the mm.
 
 If it does, the read lock fails. If it does not, we hold the lock, excluding
@@ -760,7 +764,7 @@ Importantly, maple tree operations performed in :c:func:`!lock_vma_under_rcu`
 are also RCU safe, so the whole read lock operation is guaranteed to function
 correctly.
 
-On the write side, we acquire a write lock on the :c:member:`!vma->vm_lock`
+On the write side, we acquire a write lock on the :c:member:`!vma.vm_lock`
 read/write semaphore, before setting the VMA's sequence number under this lock,
 also simultaneously holding the mmap write lock.
 
-- 
2.47.0.338.g60cca15819-goog

