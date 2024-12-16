Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26CB20C47A
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 19:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377088; cv=none; b=ZYg3xqytD+uokrm5rELL2oNZhjpxY9eMiigix/EGv3ZR9twmc2+V2f/vH9QYhJPBlid4ckuFnjfW/2fWTgFsQmV/mmIVaR+iMfTarWjqqaTjBigE46dsY70bWCaNwjtN24RYkOPNln5Q+MaQkp0PPZU0df96KNbk/AWQvcQx/rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377088; c=relaxed/simple;
	bh=J9clzO1R9BBoWjQqCVEG6ERIeffoUB+RtDJCkEdVkoc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fbo2vC2xJl16aelOP3eYvX0YT9j5a2flUsANfnUjn/SW4BvOKD4JdoeMmGF4V3VTzKDFZqSoxVWst0fKEURBzZhgTGFVhr61rV/2Vrbycd99vlpDZyVsevINRKnlLjO2ep5SmrG0GJcRhWJwS87IZ702EO2fVIQsVbkMYBBNTUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oZphh87y; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oZphh87y"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-725e4bee252so3640771b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 11:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734377086; x=1734981886; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nohm0qlZ+D54asZWR+C7SIZfQAywm7JDUn18lM86DfI=;
        b=oZphh87yVjS2yDxJxJ5dwdmfMXTOmuXQL7CldbpyJ0T46KDEi5DU+MaqRbjcf+sNdU
         Z/0/ai0s8vBjLIiaOVWt4BOLD0JpBhmdTgZu/Dv5yFcJYKjaJp2rxsyMyYlj0h1RrHWV
         378mxJczgUisW0KXoxyBKxa47JjGKYRp6WUUN2+4Im7Qp1r/8sH9Gnlo4qbjbrVfDmTy
         a0ONP2Hsug16sKoUCkr4hHiRFE2u2KNCh35ekG1F+paeNKD7kML5vWj8sklds9EtUQGi
         SMnpTRhdCs5fTd985dQt018OcAy4bOBuVUEcLunDRsa8hddYeg4oeGLU6VXnwY7IQuFD
         8jBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734377086; x=1734981886;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nohm0qlZ+D54asZWR+C7SIZfQAywm7JDUn18lM86DfI=;
        b=HLU/IELdXJIfjHd0cwUPZ7pvtI2ZLOAgxNMwKbOvytWf+pO4bZGlDi2P8SuqpPryVh
         JfdTJ9LWIiEiVJzfIVS/hYlIjscYNvsycum1rxF4FG7eST9DGBF96tZ5IFmW/MU8U0Tp
         gomVOzDUAYM7ZIT1PL6bimCrWJJoO/q04ryp4C99BsgZwEXvee+bhp35GJJm0Y0KS8bR
         zPk70Dmk8KIIp8iulknzfa0nIAaA4/4GfnaxjQb1CPo3ZsF5VRrePO5XfClCLMDEC7AH
         udvUvZZM5E4HUvopOBM+wMLmDPJugLE5by/HEz9SPR26rvzuubSsgtGexBsGFLEt1QPH
         SBNw==
X-Forwarded-Encrypted: i=1; AJvYcCUfQwAyLmd0Vde7xPj+jmTY4K0mxLjCCb7g+psWilsSawm+kd0lI31yUHNXyUelammCGkwoWK4u/9I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Pv9rhK5wyYAVNjaVykveqH3eDtIIcBggjQYdfT614x1fxILr
	ypsthnFxHiwv1cyM5KldMxDMGJPrytt2czYNMh2tfp9ybB7s8ryjQ80JW23m/Yz3YnND0Z7gyoD
	AKw==
X-Google-Smtp-Source: AGHT+IF9Nz4fP8YCDWuEvv8HenQUzivi17wIWFTDjOw79pIi9puAuyZi3edh0rN76x0eDFYowMyrfvXvJ/c=
X-Received: from pgiz13.prod.google.com ([2002:a63:c04d:0:b0:7fd:585b:babf])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c88e:b0:1e0:f495:1bd9
 with SMTP id adf61e73a8af0-1e45ab17a26mr1379210637.8.1734377086086; Mon, 16
 Dec 2024 11:24:46 -0800 (PST)
Date: Mon, 16 Dec 2024 11:24:14 -0800
In-Reply-To: <20241216192419.2970941-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216192419.2970941-12-surenb@google.com>
Subject: [PATCH v6 11/16] mm: enforce vma to be in detached state before freeing
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

exit_mmap() frees vmas without detaching them. This will become a problem
when we introduce vma reuse. Ensure that vmas are always detached before
being freed.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 kernel/fork.c |  4 ++++
 mm/vma.c      | 10 ++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 283909d082cb..f1ddfc7b3b48 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -473,6 +473,10 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 
 void __vm_area_free(struct vm_area_struct *vma)
 {
+#ifdef CONFIG_PER_VMA_LOCK
+	/* The vma should be detached while being destroyed. */
+	VM_BUG_ON_VMA(!is_vma_detached(vma), vma);
+#endif
 	vma_numab_state_free(vma);
 	free_anon_vma_name(vma);
 	kmem_cache_free(vm_area_cachep, vma);
diff --git a/mm/vma.c b/mm/vma.c
index fbd7254517d6..0436a7d21e01 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -413,9 +413,15 @@ void remove_vma(struct vm_area_struct *vma, bool unreachable)
 	if (vma->vm_file)
 		fput(vma->vm_file);
 	mpol_put(vma_policy(vma));
-	if (unreachable)
+	if (unreachable) {
+#ifdef CONFIG_PER_VMA_LOCK
+		if (!is_vma_detached(vma)) {
+			vma_start_write(vma);
+			vma_mark_detached(vma);
+		}
+#endif
 		__vm_area_free(vma);
-	else
+	} else
 		vm_area_free(vma);
 }
 
-- 
2.47.1.613.gc27f4b7a9f-goog

