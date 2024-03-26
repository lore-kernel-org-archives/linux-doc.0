Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F247113E889
	for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 23:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711494908; cv=none; b=fL1ijBQaRBD0+BM1+ptwt85rNtg32VkSNaNnfX5gLSzmyjd0ktJL2WKVidtQT9gV9vBvPRAZbsBTpx/vGDUbn2euizKlqjBnGhp6cIsZUhvJ9CZeJi1N46l4egsAXoaDv6Zf/SwMtNxWD2CDRGngYPtCMukUeb0nEUAyUIfLL4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711494908; c=relaxed/simple;
	bh=HbJgaS7gzZEz1vcQZs5xP6L0oBbDSnuM2uCN/FSokC8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PzXy8j/ZtI5gNFNzKYah2/bCbQtvKbZQ0NT7r7wXc40Koops4pf6r7KKVmyi385I4PVNgGiwye/gNqPvUTIYDVrYIjYNMwxfMMDlSH4/olsUB6C1BohBoFaxJZLUlVcgFAkK+eUzjQ3qYTpWbj+W3ikVp93U/TGEJ4vjoO+kTdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dxIOQJOi; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dxIOQJOi"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dcc4563611cso8767343276.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 16:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711494906; x=1712099706; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8+F+6usxqDQhF/mNYRky7Fdiwo1Edv3mXCHc/EHtaoE=;
        b=dxIOQJOiDuB+UbNPSzKPL9+ViSXOVFVV7KnXIwfo4FAJqk1zJtnBL3XSps+ornbGlz
         80i0r9sgavlBPC9nHFR8klwcTBsMs6Y8DmpZRdt74XiIDWsUEZWm7lOaBCQqX2j84f2M
         zWl544Vh/SLfbIR3qFRMUH6wvRTo5VP0+vNh+qj5db6zooAcP4aMpMxna/CsPwNYBd0H
         dG9Wa84IsIzMTohScwIlJIqjdSTiIpAzdm6Ah+/Lxz0tuKiBJqUSH0WjYzGCZWa1G9fp
         JY/h6LQ1FGP5E76aG4P7PqmcDRCjaGPGnVyaX8sNGj2Un8Q+xUF2u9em8D/2/+wONfqc
         8fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711494906; x=1712099706;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+F+6usxqDQhF/mNYRky7Fdiwo1Edv3mXCHc/EHtaoE=;
        b=ESDs5ZoBZpfPNDt6m7CPzMs9NCs/Wg8T/djSwPIGVtw2haU7+kEuHYtAfMY2MnR52a
         zzaQ22HivcfDJQ/moDkHwgzeJWf5BqifHFhDmPuA/iK0J+6zks3Ltr+cx6kUR8LiMNEi
         0zxAfzgy0JiPMaR6Pz5wLkp1YoyXVjcCmU7JrJ4+vf6Uflpsx+kciL3i/XP7gfqRAXnP
         5ugWmvf+T2CBui5y4fyFdti/x0nKjQLqnpmihdlVMnZp9faDaRtOpAX5zaeSt+fwI1to
         HDi5qiq+llF2ObQJZ9qewBvybnscLYAP/Ff8PJlTGbtyDA2Kz3JXh0qnCjWsxvCHbZYn
         NQUw==
X-Forwarded-Encrypted: i=1; AJvYcCW9jS8rNtnkOvH1mm7FBkhYNV/6VeXM4EL2SH94CO914GnHe8+RIHweMxbHszkkMTfFYdibSsdmHyDLYR70uLo9MQ5OSKu/K3sG
X-Gm-Message-State: AOJu0YzOGeuWLTACP7Mfni4UqeDwwf5p42eUhN2C02FrArI2HH7Yh5r8
	hl65rBFsNJ4LmVmLxk4JTzMplREowj6lBKhQjAjvkKRJjib5l9v0H7MXPvcdi3MH0q226LwcyL4
	VrQ==
X-Google-Smtp-Source: AGHT+IEh1gX6lXyECJLY1fMCVWwqQ3VywgG+w8JbXje6jjWeQBputCgI/GB+VIFN+4ob3wSD6xLD2bTaduM=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:cef2:761:ad8:ed9a])
 (user=surenb job=sendgmr) by 2002:a05:6902:1b07:b0:dda:eee6:8e52 with SMTP id
 eh7-20020a0569021b0700b00ddaeee68e52mr1314590ybb.7.1711494906302; Tue, 26 Mar
 2024 16:15:06 -0700 (PDT)
Date: Tue, 26 Mar 2024 16:14:51 -0700
In-Reply-To: <20240326231453.1206227-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240326231453.1206227-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240326231453.1206227-6-surenb@google.com>
Subject: [PATCH 5/6] Documentation: mm: percpu: undo _noprof additions in the documentation
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: rdunlap@infradead.org, sfr@canb.auug.org.au, kent.overstreet@linux.dev, 
	surenb@google.com, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

With kernel-doc script change to handle xyz_noprof() names, the previous
documentation changes and not needed anymore.

Fixes: b3942167cb9f ("mm: percpu: enable per-cpu allocation tagging")
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
---
 mm/percpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/percpu.c b/mm/percpu.c
index dd7eeb370134..474e3683b74d 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -1726,7 +1726,7 @@ static void pcpu_alloc_tag_free_hook(struct pcpu_chunk *chunk, int off, size_t s
 #endif
 
 /**
- * pcpu_alloc_noprof - the percpu allocator
+ * pcpu_alloc - the percpu allocator
  * @size: size of area to allocate in bytes
  * @align: alignment of area (max PAGE_SIZE)
  * @reserved: allocate from the reserved chunk if available
-- 
2.44.0.396.g6e790dbe36-goog

