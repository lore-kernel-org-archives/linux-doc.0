Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C0D1D9A7E
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232864; cv=none; b=JDZrMSd64501+Wq3g31JixHRFeanQGj/Um65KGsI9DTJKzMyR0nWry25p7tfFF5nrcTLayXZm7zMAlpPjcqqHnfErmERdIIDaj8Lt5xwnO9oeVUuHl9KnBEHe4sjkg85/xgjLUPnsqfZqrFInO8DEH4PZFaLidWhEghKcM22wkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232864; c=relaxed/simple;
	bh=781aAxZ/24MB/3vE078I5aUf0emZuPaLzhnQ4izvt6k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ITGKEsjTMPNC1k2qjkIAJPUBA5lN9FciiJvi0zeXVoqP8RDowPoLUjhM3iytft2U9EcEFVvHKUz8Awmqvtx9TwU84QQGOpizCsDcTpA/ijtr4DsATW2KMito8eYahs8YcxCFgl30PEVBH3RfsmjDHg7GuTzGJztAvJCSh2OnKBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gd1aMOaP; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gd1aMOaP"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2166d99341eso84112775ad.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735232862; x=1735837662; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xUsbn4qH8t1xPQtCnq4fSt0rQiZva/B8CbRLcxSWyZc=;
        b=Gd1aMOaPROu5E5NbLsaMDGhWgi/F+OHwUjaQ70teGv+1oAvn2ST7GZRtAVlYEoLRo+
         2rpksYuG6tkFu9/cWhJStW3Ay8PzwyDQvzKzMFQvTsh0SPCMvk2b8Ow9ScxQe+zknxGH
         gIgokNGnUDBpEETcl/ZmOZ+Eq8PF0n6PsMlCyDcpSyjs51f75ZcjJB5V+7KHiF6dSz8A
         jXWGflG48fri/3uP0vdj7AqZJPX4sbnVKvnY5OP1pIlLwQV/pTNiICE+ZpeRQCV4H4Lr
         KnsMPhyeY6GuDxtpBrFYkAk4/ABDSNJhWtaH4wWW0zvXXxGgF0J3/IF7vC+mk659LXDs
         rrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735232862; x=1735837662;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUsbn4qH8t1xPQtCnq4fSt0rQiZva/B8CbRLcxSWyZc=;
        b=A4MLp51Q0wFDl+zx3BP4ne/iZibQu9xFu//izhitXt9NxrlqogjPQdZsNfjd5Rd9Jh
         q320yWM+rwgOJK5fAabzA6+hilzWDu6Kc0nZgSzn2CY758TiLDmLVoCJiSiIdPj8h6e/
         M+NpdB7ykUp+wmSi6nWlzdl+owZMWcPfwq77Oj4P59nxPMhbNck/8OUS4a/+snHe6qch
         DKoaQoAHE1u/WiXHhbjJ5GADxooUYUPrjVnPxA9FCdoUGWL6BWUR7QufPTmzSIer6hTL
         HQpdwbwiNUuidGYMTIoJMutDR/1KUQd4kSl13VJsZf1aLDQ6YuEsJMXy/5DISV9bkPIr
         GQ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJdWzHzkt/UbTQcUQC8pq+cMms1Y6KngdxLVZX3XXbPT/7dOQAsKpufqcG1VXWxbKBNEJmd7K82yM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfRICgdLpGqmXosFbkSIfcsZ3Yac7akCJt/6k1ghmkG1AVJrO5
	b9oKBVL/P9QogSlE5c6SgJ5COh6w1qUbRAeP040yS5ZddxsM1poeDIf0dR16rcMtu9n2DlMaNN+
	tdQ==
X-Google-Smtp-Source: AGHT+IHO9Ln0yzQuO/gGPJ05vT5Etg8K56O3yhDTNfimuOaarwxAJxZRy61wRjd4sM0SxPCpRMWjAjCVTBo=
X-Received: from plbkz8.prod.google.com ([2002:a17:902:f9c8:b0:216:69eb:bd08])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:dad1:b0:216:725c:a137
 with SMTP id d9443c01a7336-219e6ebc7dfmr279213785ad.28.1735232862238; Thu, 26
 Dec 2024 09:07:42 -0800 (PST)
Date: Thu, 26 Dec 2024 09:07:06 -0800
In-Reply-To: <20241226170710.1159679-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226170710.1159679-15-surenb@google.com>
Subject: [PATCH v7 14/17] mm: remove extra vma_numab_state_init() call
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

vma_init() already memset's the whole vm_area_struct to 0, so there is
no need to an additional vma_numab_state_init().

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 99f4720d7e51..40bbe815df11 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -947,7 +947,6 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	vma->vm_mm = mm;
 	vma->vm_ops = &vma_dummy_vm_ops;
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
-	vma_numab_state_init(vma);
 	vma_lockdep_init(vma);
 	vma_init_lock(vma, false);
 }
-- 
2.47.1.613.gc27f4b7a9f-goog

