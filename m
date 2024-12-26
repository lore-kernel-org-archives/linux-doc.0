Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DB01D14E2
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232846; cv=none; b=NKuUcV0LzddmW6j8wqW0OgzFLb+HSuoFALf39BP9hTtjJfiyS6mKfkZvG7SXvKc7pIuzVRMW+En/w/6KtrVoLBnPS6fCFFqgHSrVnr4u4GG7FGybr8kozye1wC4Zr2MyR4yq6KGMfiPJI00WOY1whMSJy7qEn7Ww1hLNpRJ8rDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232846; c=relaxed/simple;
	bh=p/o5ZGpP7QNevNaCwrDZS9y9Ty/3GQzxxQCTMzyjkLg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QWn51swU5bpyF3cTi5VGyDow7tFAXDZlBEWMSl0c2RM9G1tCA3eOlX6CeTOORp/hhA/0FDiYRZ0J1xCYdmKxpzuxbpajMmdyb/VIXKiZNe3Khz4vcfxtI6+Pcv2o7MfJKBK4FEF90MHP/re4TZV7XTesJdfJEcIRpV+IEKMSaEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MkiC76Vt; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MkiC76Vt"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2164861e1feso82611985ad.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735232844; x=1735837644; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zZzt97suQHoGz3iLHkiBfewFYx04NIJnrpXSSuwtyuU=;
        b=MkiC76VtsdXiWuhgh5zm9EJLqQUGnngy09F9f+kbH8INJugR6HEPwy2e4EMqmv7UJM
         v5cGRCoZ9aMF5j5jSFi45tcN3v8E9xNciP5ntwaK3iYTR/D7Du/+ywDLKUXuvFwWnFIE
         x2uH+kcg2Ko5MGOsWV2PybJkPeAVX70UEYIUXVGR8wwA/S89ucBZ3r2IwOQIgbTVdACV
         gtE+BiQ3lSjw9rOm6i4cSxVWzAexaavRuVkDvdIYVBvHACiJa6+uNegJYIGNyabiKWDZ
         P6gpkrZ2LOSQY8NswY+sGT2K0BLyqLgML9aPBTQlCNoNlx0ilI/e1hF2bo1W16Dlcn3f
         9rEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735232844; x=1735837644;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zZzt97suQHoGz3iLHkiBfewFYx04NIJnrpXSSuwtyuU=;
        b=rtWOUG9LrgzM9eHaZCiXEXsswmYstETM3RPA5PSm2XT/HWUHmwohyXxvOt3pOa1pxb
         NkWgLtvWaR+RhryWRXJsvYgzsnW2tVcYTQcDznYHQNCe6XzgBa6HjrQWb3doOacVp5Ae
         FOppHLg3RCP1giO0mam4mICg1egog3D9dHIKYbQL4OKqJp/plRrfeeY+FRUuH6Hgweam
         2oZAqe8z0gOC6XKbpzLSzW3uI+LVqPalDiUa69igDZrKczW1GarcAwXTGaNPpGBu9QYi
         YzMP2l79EigjXu8xNhO9GVJWZcw3dLkvxKi3KaOYKG07/UYuKb+16cJekgqN7OpPT2NH
         PewA==
X-Forwarded-Encrypted: i=1; AJvYcCWDmrEokxK2qR/o8E2DzcCl/2BTe6FCmQX9H3fb2WrUc1O8ZhA8b2syLnw9RxoZK9mf5Um+6N4vNOU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+15dL69sg/ix6nNLLD4BKY71Jd4ayZiNZW4Sqq8vSM7e3DIhe
	hQKWRTTEyTfOVKof/E9Aa3klDfOaVMYX3BJMLC0HbltHbd7KXZPxnZWOY51A/LyLlQMtg6Ts1aj
	WnQ==
X-Google-Smtp-Source: AGHT+IEAlsKyIxUvD+OjguaAw8zgyVzbZEnVmDfknkzudP9YDfj4nmndYPZJH96mZmFPgzBT4t688/RysUg=
X-Received: from plbkn3.prod.google.com ([2002:a17:903:783:b0:216:5441:d855])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f54e:b0:215:e98c:c5b5
 with SMTP id d9443c01a7336-219e6e8c5c5mr356653565ad.1.1735232843904; Thu, 26
 Dec 2024 09:07:23 -0800 (PST)
Date: Thu, 26 Dec 2024 09:06:57 -0800
In-Reply-To: <20241226170710.1159679-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226170710.1159679-6-surenb@google.com>
Subject: [PATCH v7 05/17] mm: mark vmas detached upon exit
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

When exit_mmap() removes vmas belonging to an exiting task, it does not
mark them as detached since they can't be reached by other tasks and they
will be freed shortly. Once we introduce vma reuse, all vmas will have to
be in detached state before they are freed to ensure vma when reused is
in a consistent state. Add missing vma_mark_detached() before freeing the
vma.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/vma.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/vma.c b/mm/vma.c
index ce113dd8c471..4a3deb6f9662 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -413,9 +413,10 @@ void remove_vma(struct vm_area_struct *vma, bool unreachable)
 	if (vma->vm_file)
 		fput(vma->vm_file);
 	mpol_put(vma_policy(vma));
-	if (unreachable)
+	if (unreachable) {
+		vma_mark_detached(vma);
 		__vm_area_free(vma);
-	else
+	} else
 		vm_area_free(vma);
 }
 
-- 
2.47.1.613.gc27f4b7a9f-goog

