Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175E51925AA
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 04:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736569599; cv=none; b=rlwixtM5AD762hx7ahqE9ci8ER4lLyOoClBNY2L8MDzT6h4Z2E3iWW3CHHX/1tbvBQPay0seC7lxES55te+gbhY9zVcshPESKitviFVR1oGZr3KKr8fdksx5JLclUUgssJ+hjVCmyVQU0cNgXhZ/0fJL6i91Vz6CllPABPqS5wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736569599; c=relaxed/simple;
	bh=jp7pOqpxTLEwDi4KhwTXe5XULMuBvlLG6ZH7BUTpMUM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g+UagiupVHwlo00lvG9SVqIaN/wV7aevF1lbGiqLu197BTy51TilwPBzdLsyOFdF3CQWdR1YCf5x0Qdz4IH8uLX3/H6JGI53HgQaiin+CnbocNeLV6Dfic9pq0Ybwgcz3HcfTpaKWpivS818E4UJhDBveGWSB7z5x3Cw+1pWXmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PFg5avya; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PFg5avya"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ee5616e986so6890933a91.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 20:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736569597; x=1737174397; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rrfyWeUIr/I0BTq+qLIV8uWpeFqy3I6BsfgqMyH93Tk=;
        b=PFg5avyanzOtoFqkch7x+afqpznGP0h2/Vv1F2EegFTkOc7hTz7tFXMY2HbKkfpenS
         H9hF71X8zZXf0ZsLgSuWthI7tJukxRwGbEqJ0qa1DfFRqrYQnrx5fRLVsPly1sdp/tlF
         LceKTrLXMgRX+LwTx1y15U31CPD1GA6yicw3zRgxvWfihxzLq46zJ1nK3v06WUQq6LjU
         d9IRtfUboIreyEDBhoWS2z6lMLZQXUyrcMZN1eXWJfwNrbQrm3PgMarvXXuf6IZGfOZw
         Eqisyqex5X6nnPZOQjB6+b7YrDW8ndlhLfZAgycb2cp1scYMw/kCfIGDV95bm3TAYnsc
         cqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736569597; x=1737174397;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rrfyWeUIr/I0BTq+qLIV8uWpeFqy3I6BsfgqMyH93Tk=;
        b=mk9MfY9A4KZnnHk3ouoFipZ49geIES+yCKFMiinn0o79yMQT5yklR452ahTH0OYs+s
         ibGuGljWA9sjKInf2pKMvsgPMp/VWp+Q6X2QH/CPMf0JMNLqAB+h3BumCYsWXnURS5Sn
         +Bd4v0Y2ddVsE/+C5QxUgURYeQeS3RzNu6f2dbCOReuL8beLXRuUydylCnbnAB048i6M
         KZ71Apjjiy0GwT+Sqa2W8osvGcTkbDITtb3tjy9mulaDOC2UcM2cLTWBwJ7oXdx4kH1D
         gCn1+OCiqaEuBWt8JweaVWUnaqwVyp63H+IlVQl5bjFejRxBwmTWHsWYvxZgKwqVoFtG
         jqaA==
X-Forwarded-Encrypted: i=1; AJvYcCUVeYGfTulRKSvlBVSvd3kSUq0+Zhq/T+jhh0uq6rwj6ix7IWcQEyHV2C+eO/II1WnN3+2AOEJfPQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj9D2oIvZrRgd8jqr36Zmk/AhlrYzJ/oQ8yvvEm2TgivGswWzU
	xVnSiVGFOMKbEcBdQNFl/gNvgolJTsDXDMcizpi8AaasDGk5pPdtkBHMc2Edy6aUcUSOhDAKWe1
	j9w==
X-Google-Smtp-Source: AGHT+IF0cO5xMxR+CmFlng0UtVrY7zpuViy4m8fCuGIIjG6w6sySt0yQzGg7F/vXZQnVto/CKon38/Om3JE=
X-Received: from pjz13.prod.google.com ([2002:a17:90b:56cd:b0:2ef:7af4:5e8e])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3a10:b0:2ee:f1e3:fd21
 with SMTP id 98e67ed59e1d1-2f5490c20f3mr19186046a91.25.1736569597473; Fri, 10
 Jan 2025 20:26:37 -0800 (PST)
Date: Fri, 10 Jan 2025 20:26:01 -0800
In-Reply-To: <20250111042604.3230628-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111042604.3230628-15-surenb@google.com>
Subject: [PATCH v9 14/17] mm: remove extra vma_numab_state_init() call
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

vma_init() already memset's the whole vm_area_struct to 0, so there is
no need to an additional vma_numab_state_init().

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/mm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index a99b11ee1f66..c8da64b114d1 100644
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

