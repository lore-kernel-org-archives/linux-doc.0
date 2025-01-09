Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BCF18C93C
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 02:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389858; cv=none; b=t7lPzV/Q7w0hBdFLdh/LRBHJMcZqxBEflB++4CzVTXYy5tGEhG6nTznb2gSI+kt+rYQ++my9ciI72fpqs93Srh1kF7ga84Rpqff0Z1S3MVPDn/g+gJvtQ15w4kVsN8YiMPmm3QSJfvdBNZrkkChq4zsJdLZVopPFqMcZSINouww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389858; c=relaxed/simple;
	bh=Qia36dBQMFQkzJ/g+u6JwVjRWXRWMlEMhpHTtKIeCdo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ev2yi27I3I6R9XRF3se1eq67E0TzsiCpBWOd9gR5ajppAqMHiG9szxOSmg9XUR6uI936nceOOq+fc7MxqCeS9FSPrq1s0F1R3sDllkFOQCkpaDCBlZ83vdyH8oh94qn5u5E2BH9s7YrdAOaQWczRRkY3reLo3lh2X5AYQtaN9FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ycwy91v5; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ycwy91v5"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef9b9981f1so1140926a91.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 18:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736389857; x=1736994657; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ff+5kmdnRB8ZntTSRUYdaKZe919gijOnrfCBbK9Q5zw=;
        b=ycwy91v5/8IHr4Mw1Q0ReJ6+i+VLtArgnu8AM5BpjYHOSeqosq0F4QjwWwQgS7N0nO
         WI/VVtoOOP64YwtTc8bsGE8iM2elyfQVz6MgeYomgHF44R0WIyz0ueLX9iNaxZUJcUtm
         CEWVbalwciVoFbNF8MxID+VVPH5pfcDpokUdk9NgLDiYsrPVze34qPvtFL0Kxm6Y9OeD
         DIp68vqLIfeWFoNx3GSZeJQDWcOf4hFg+LbB9nzM4855RSg2VkXn8S0AxIKKmQ19WPbM
         DhuIY4DFNeNZShnmCCcfn5nT2criW9K1DmKq2vFvvpUccH4tGWbIXr9/fWfJi6taAR7c
         6vQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736389857; x=1736994657;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ff+5kmdnRB8ZntTSRUYdaKZe919gijOnrfCBbK9Q5zw=;
        b=rxbIpX3KvsIyaTP//E9TPSEBb4xj+aT1JxptBdyfgPnHKD6yaZ/B5791LZW3hbHv7g
         AI4Y0AseJx8NuQ7j3ksHlldt/Jy8nA0zpzSVUpsRZGs1McBr7kViPi6v9iRfSs1mz1+l
         guh/YLnlZsmH4WZ+d1T9r5wnBs5YKF1G8Sk0OlYCRpvGP3tidH8Skr3CaVmXI5zGIIHg
         1YhTCgPipgBzNqh9cETRnvX8lNnSjFtqHbhQ9WuG0I6ApSeapPstEuI07qGWI47rKbig
         Wwagq1HsH1LERLBxnMB3ebkurDF2OwHp25mV1cMoUOwaojPrHfU50ItfvNGURy0QhwEd
         Y0wA==
X-Forwarded-Encrypted: i=1; AJvYcCXNxYIyyeMrwQtM90J3nih2vwGYKBCJA8nm8QaKuqn6EWUgA8Yg5cQM2AMfG6pc1NvW2og7L6pfdXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVtigj7+7smho7KS5GMbraUpbTMZGbzMKX3NybOY18+HlPsj3v
	wsxz/tL8NpIpe7Rdy1d1CT/XjxiZ2i0Zvm2cUHeYhxpw1Xa0RX87i3Y8KF3fvUjmUUaQZ1Kk72C
	JNw==
X-Google-Smtp-Source: AGHT+IHHneXTiyqKXlP1VpELIhdiUZ7vx0qpWsk0pXxK4l9MO/2MOdaa5NjDmeJ2cE4v/bbSs8TX2rtPRrA=
X-Received: from pfar8.prod.google.com ([2002:a05:6a00:a908:b0:728:2357:646a])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:350d:b0:1e1:b105:87b
 with SMTP id adf61e73a8af0-1e88cfdc0f5mr8799971637.23.1736389856900; Wed, 08
 Jan 2025 18:30:56 -0800 (PST)
Date: Wed,  8 Jan 2025 18:30:22 -0800
In-Reply-To: <20250109023025.2242447-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109023025.2242447-14-surenb@google.com>
Subject: [PATCH v8 13/16] mm: remove extra vma_numab_state_init() call
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
	kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

vma_init() already memset's the whole vm_area_struct to 0, so there is
no need to an additional vma_numab_state_init().

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/mm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ec7c064792ff..aca65cc0a26e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -948,7 +948,6 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
 	vma->vm_mm = mm;
 	vma->vm_ops = &vma_dummy_vm_ops;
 	INIT_LIST_HEAD(&vma->anon_vma_chain);
-	vma_numab_state_init(vma);
 	vma_lock_init(vma, false);
 }
 
-- 
2.47.1.613.gc27f4b7a9f-goog

