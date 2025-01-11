Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F0A18F2D4
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 04:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736569589; cv=none; b=aYsPuKR80EOokEyWh0Y5sVpTvLtgojaRJztpj1FlGbiTmv6irGqxeEl7iMBCWrXFsWa/R0Jndx8TJKj8MZrxFk83Ja2H15soacDlTMGZLcKp7tjV4Uc4inyCAhjGiAUGk3NA8FqI2AmdJLdD1OyyVjEvvQvqrO/K4kP50fUCZuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736569589; c=relaxed/simple;
	bh=eQsx0wmiGJe2BPbUDGY56ZA9e41HJdyZq2H2i9aUEHc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IvTdmPj+edWxC9lMSP7TiD1dcl4/pHLHWYjdhJnrcHTzTPoZurxZISEl5KTNf6hBWQomreVSMgRMuLp7lOa5x62Le5brpfZigfmInICKog3SaWgDnYnOl/ClVTFjop+W+fQZxi9le30AqjpVLM/zb3O46PJQam3KkjVtQdSIiEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0fkdha4o; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0fkdha4o"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-216387ddda8so52048895ad.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 20:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736569587; x=1737174387; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=STfGBHDxpr+nljSTXZBRe7awpLRa2H0ex1QXNY89OAU=;
        b=0fkdha4ooLEZdL2cx+3mi+R+ImG0GzjT4b6hoC6qR/Y8loJFg8Ajqji7QGUSoinbGz
         DJPobaNCjUSd644wsH4bROv204ucTpO8nI9vfUPefjCGV8Yejj589JQE9L7iHqT/0kVy
         6aIdBuvtmPsY35baYHAGWiIG2nmZzCvp29kQhA4Azz/ywR9gRNiXKlVs+zIrdJy/AXSt
         H3GONMEMlnGstwPnJGdIdJZ7u57a0515Ax6VqhABWZ84QQVKQiMYjmDsM9drGnPRbfwF
         a2tX4tarp4cbznUio2QW63FEbUlqt6qQqYi56QfJMJLXaT+fqPXM6JE2z+zVRqz1rLUr
         RuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736569587; x=1737174387;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STfGBHDxpr+nljSTXZBRe7awpLRa2H0ex1QXNY89OAU=;
        b=sLxGxRJq1Kjq3e4bd/n1ZF2A9LKnEV/h+LPk07GwFC9nglDACp7A8kJmMT+vs0NRyp
         0Cout57MQsCR8vGPUIS3whPg9BtkBKStPawc3Y1PXNF9rPzslM958jNANup+DO3HrZY0
         CSf8SjWwzoQASMM7uL0w+z8LWOP4dL+T8VhrIyrvwNhgsK5ywWIZK/GXkV0Be11hgAr1
         BpkMo5s+Pc6NRZ6zG9b2hS8KiABA2/2ip0UKbfyS4OYWVnUoEBUUASR27IDQ2JMpP5pL
         q8h6DHsXhk8iBqLenMJndS+LUsoS6acAaQuUpCZxJ38HqyxKRzOqo6s+k5FSW1T5Zf6H
         t4VQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6KJrPmdWW0u9QyzVoZX4FC+/icZhs0OK6Gi68LE4O7Y2U7cOF+gF8LJPRHjWVJZfC3alNzU7TNVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YylsvTJEyCiZfeI/bieJHhPlRHqf/bMClSRuFqd7vt9u4K+sMCq
	R8zUKcLft4pl0Dji7C5V/x8QlxwYPBx/4ShZtc0wWScdn72AT0U77dGOlUqiL2ETn1D+erogZ0u
	+hA==
X-Google-Smtp-Source: AGHT+IHvoBVJY80+e+qdsj3aPRMB2UfI+za8DGuxRrXd9nOwFJGkON2pj+F8zNabSAnJMgvKZtfO1mpbjyw=
X-Received: from pfbkp5.prod.google.com ([2002:a05:6a00:4645:b0:725:e6a0:55ea])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1489:b0:728:eb32:356c
 with SMTP id d2e1a72fcca58-72d21f459dbmr17649276b3a.11.1736569587302; Fri, 10
 Jan 2025 20:26:27 -0800 (PST)
Date: Fri, 10 Jan 2025 20:25:56 -0800
In-Reply-To: <20250111042604.3230628-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111042604.3230628-10-surenb@google.com>
Subject: [PATCH v9 09/17] mm: uninline the main body of vma_start_write()
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

vma_start_write() is used in many places and will grow in size very soon.
It is not used in performance critical paths and uninlining it should
limit the future code size growth.
No functional changes.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/mm.h | 12 +++---------
 mm/memory.c        | 14 ++++++++++++++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index cbb4e3dbbaed..3432756d95e6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -787,6 +787,8 @@ static bool __is_vma_write_locked(struct vm_area_struct *vma, unsigned int *mm_l
 	return (vma->vm_lock_seq == *mm_lock_seq);
 }
 
+void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq);
+
 /*
  * Begin writing to a VMA.
  * Exclude concurrent readers under the per-VMA lock until the currently
@@ -799,15 +801,7 @@ static inline void vma_start_write(struct vm_area_struct *vma)
 	if (__is_vma_write_locked(vma, &mm_lock_seq))
 		return;
 
-	down_write(&vma->vm_lock.lock);
-	/*
-	 * We should use WRITE_ONCE() here because we can have concurrent reads
-	 * from the early lockless pessimistic check in vma_start_read().
-	 * We don't really care about the correctness of that early check, but
-	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
-	 */
-	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
-	up_write(&vma->vm_lock.lock);
+	__vma_start_write(vma, mm_lock_seq);
 }
 
 static inline void vma_assert_write_locked(struct vm_area_struct *vma)
diff --git a/mm/memory.c b/mm/memory.c
index d0dee2282325..236fdecd44d6 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6328,6 +6328,20 @@ struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
 #endif
 
 #ifdef CONFIG_PER_VMA_LOCK
+void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
+{
+	down_write(&vma->vm_lock.lock);
+	/*
+	 * We should use WRITE_ONCE() here because we can have concurrent reads
+	 * from the early lockless pessimistic check in vma_start_read().
+	 * We don't really care about the correctness of that early check, but
+	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
+	 */
+	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
+	up_write(&vma->vm_lock.lock);
+}
+EXPORT_SYMBOL_GPL(__vma_start_write);
+
 /*
  * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
  * stable and not isolated. If the VMA is not found or is being modified the
-- 
2.47.1.613.gc27f4b7a9f-goog

