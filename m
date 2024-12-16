Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7BA209F58
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 19:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377075; cv=none; b=FDAWMrctbcYOj9BGVKa/yomo0Q7GrKIDU5vdJ8CfUFUCMXT9mzbkcqLyr2d2pmX0f46IbF5Rz58e6a+usJY25cRc+FKFMteYj+YcemYbbzcRlO2Vkw6EfU9AGyD+cuwei1PuX+PNRMlfFcnz8Ydy6W0DG4K2EaN4RyagIHAf0Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377075; c=relaxed/simple;
	bh=49beW2sXDUl+AO8f/HtB0hh16LO58j92QfMcV5g84FE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iOgr8uukm1DQw0lcRbqJqdsouoCgprv4jcOxcPi5dYt9r1d6ComTcOe93i+S9UxToP6iWFwUjh3Cne3wH8c7RIwNFT2I7C2mNaVfndadZvuvpmyL36CCRPirWESUFzLuvfuh/QTdkR+asD7YFTzqio+nI1v1uxO/Oe4kl0lF9ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wec0Lhzt; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wec0Lhzt"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-728e3ae8112so3419476b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 11:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734377071; x=1734981871; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ia4skJ0dxk8cYc3IKUIPhlZF9heDgJL08xGmdJ5E3s=;
        b=Wec0Lhztpt5nC8HzvM5gTFs02RDCMsa2sE3vtUdLVnpFsTcyswh9eFRxlW8LVgTr7s
         JWNjxK375vqgbThc7E/CmmR93/0LvJUFeAWX2C6j/rBOsl9v/wQn2wLjai9unVbM8ovx
         2N4/9g0Ay/u+8qjx0n6NBZ6pijc87PJAl4nhmWgVvLGY0BmVUek6fWtMXvaPZ7+wwrSA
         T2U3drZwahFF/MEk1TIWtP5l3uCIY6uelaz4iGijmmzRSmByOKnnzM4cNL2l6ybYCS4w
         jG+mIDCUl3oZv4yIWQPMGXqA1r5QDiJb96/mapTUsCCjO35b0756Typyld6QyGyHFrXE
         /8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734377071; x=1734981871;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ia4skJ0dxk8cYc3IKUIPhlZF9heDgJL08xGmdJ5E3s=;
        b=rWPp+Ubw5h57JJ5lEZPzuGKpgNoLovzlT/pBvdQCFFiezT72dkTiM7H8NZZIUCjEAz
         BfZC8P43lytC3q5xGW70XDfprOUwq6zXAfeF6TpFWWPMTEaRkkcFvoz0w23/xUEIQ71z
         HUgs08WxfqKRfq3Qn1h5L+kgLWrNQj5NguhyCLxBPqRZIuiHnybK0amJC9mRmZe9QdAk
         RBWBrf0fO6HPskyzNPu7EVAQptEslzdxrJ+Re+PckYc7WOSERxrWWcj/agb2VHoYXdnG
         3Nu2YDomNvzBDzBirPSqDJ5WLgYWmbWJVROQWdogtWsjvCl9U186Ab9IOk6TNo+Cn3wH
         rOng==
X-Forwarded-Encrypted: i=1; AJvYcCX3LG/bkoJMaimTzaQ5U3GazSoNghiHKZtQTuRcPv0y4Lujo5tEYVZeqNMymT1TWvUXSb83SGwYoTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhKgcTclQI2lywDMhfffEgnDzccgeq6aWcJOvHya16RRWkU+K9
	MPwCQZZKz3Zm8SvV4blSYB5q00Dc4i136XH8ZMMcbuwX3BdfPng3S9ndqgCBh+6WuQEsURhX7Ss
	pFw==
X-Google-Smtp-Source: AGHT+IGblgxI1ekRLHe39odjzDuWa2GhKIvnP9JXJ082wXSRcQoL744G5O8IU0+gMQyAryC3i1beb9Fb4As=
X-Received: from pfbci13.prod.google.com ([2002:a05:6a00:28cd:b0:725:ec78:5008])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6c8c:b0:728:b601:86ee
 with SMTP id d2e1a72fcca58-7290c24330fmr18435707b3a.16.1734377071613; Mon, 16
 Dec 2024 11:24:31 -0800 (PST)
Date: Mon, 16 Dec 2024 11:24:07 -0800
In-Reply-To: <20241216192419.2970941-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216192419.2970941-5-surenb@google.com>
Subject: [PATCH v6 04/16] mm/nommu: fix the last places where vma is not
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
index 9cb6e99215e2..248392ef4048 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -1189,6 +1189,7 @@ unsigned long do_mmap(struct file *file,
 		goto error_just_free;
 
 	setup_vma_to_mm(vma, current->mm);
+	vma_start_write(vma);
 	current->mm->map_count++;
 	/* add the VMA to the tree */
 	vma_iter_store(&vmi, vma);
@@ -1356,6 +1357,7 @@ static int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
 
 	setup_vma_to_mm(vma, mm);
 	setup_vma_to_mm(new, mm);
+	vma_start_write(new);
 	vma_iter_store(vmi, new);
 	mm->map_count++;
 	return 0;
-- 
2.47.1.613.gc27f4b7a9f-goog

