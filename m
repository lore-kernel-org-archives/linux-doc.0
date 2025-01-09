Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7914915573F
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 02:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389841; cv=none; b=ahxo0f+yzTXLuQQY/8dzo1zoTTq4nlAjDYsEIPIxN4ZjH9MqYE4Wd52Gtu6/Fi5CrO7tEBj5ZcwVx4AEIIgQQupW33RNenhL+3g0yHfzDUlpYq4IINx77vK8k+ewU7swiMg7PGk4y1Gwxn3cRAqmB60T2ZBoLmI2MW0ME5oN8iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389841; c=relaxed/simple;
	bh=t9LvCLfNsf7gW2HQp/USAapAN+m412qBOrN7Y8/AQ98=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z4WtoQ6muhmdZeHaXUyu+S7REVCfjPpYYXfrzphActCulxbl6X2Iy8GSxCsS+acmEPBuWqfIrMSiUzk3SDsxFeNISAD+6LG3Zlhk+f3AjH5NSs0EKcupjNM8LVqus+4q3Ru/aZtHBWGLFDb15+k8XNYsDLTmTzroa7QkWdl1WH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Oy5ABubG; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Oy5ABubG"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-216728b170cso6486645ad.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 18:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736389840; x=1736994640; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QrBwNMjEBhpbcxWqFk88nlV6Pfhf+HDin7YMebARszw=;
        b=Oy5ABubGYniIMUA/4fKpIZAsqITiTMLt3jANHZBGDbVvxSC2Hn2qCm9P90jibz18BN
         KsrxMSYieoy3AVKbHljvZb0qQgcty2zLLO9wfop+RfTNYiwPFhAkuwzGqFoy+3/9A8K/
         DNt9xhClIkVLt0jWJ+Po0RYneALYmpcdFx8TTwkNp6aVH6tUcFQHgqToOISHZapd8/fD
         RZkqWS6wu8W+THTSnjfBkCjJWCKvZ/JhCn6Ng1h1jH6bIwLWX/ez9xMGt0riWaOwJpP0
         YMnB/nK07hl8iXR2PcC4yVy72/2w00NbP/SRTvtfBMW1FmVpIMUqLuXCLMpn4i6qjMwN
         zqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736389840; x=1736994640;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrBwNMjEBhpbcxWqFk88nlV6Pfhf+HDin7YMebARszw=;
        b=Psz8uiwizOPa+l2CZEQ4lHVZE4lWKClw9BgGaRxWiA9CEobcaxLSM6gFbPhdXml6mL
         ZJX8Giu22Wp/7667+HdIltQ+/bsH27JUHaO3VWzEn1OJWUU52OCldahjWahEEgqYGpsV
         kNQ/XrHa8uvpBAquZqJ7ZresILEE9SetUjOlCD2789X5Q1KpmTTNDoF8nXZZNcpWyfkH
         XaqjDoRo0smcK9/z/3xvFPQxZeUaebDWQTJjVK+t8SO7avpuy15U6n/Z5TyvzLFK/DEO
         kIXsp0CsWzkm7KK/8OfrbIhCPQi0y4JFvxc80YXxFoF8phrcnimmbGKbIawh5Q1LUFQi
         hBig==
X-Forwarded-Encrypted: i=1; AJvYcCV6CkvlF1AHdinm4H4YGsW33AK0nE7ueF+u1PgfOFwHx4wTmWC+AWVjudrV1NvA3NSoQ8nNCjrVmrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhRDYngmZOFBuSYJNd+VBEi+KCQNd5hj882jzNwmx1X4ptGNDr
	e6r6WuvX1zIzW9mibOBa0wxJOnftv08T5n+u8pFzwntH3ODo9o/y7xK59Tu/S+u0iEPd5AHU96x
	KOg==
X-Google-Smtp-Source: AGHT+IGCSi1cLKzQVkSU7lkundl6oeEMCOCXsG4KvMhn7UcrmY2u1vKpnTKufMOdZ0o1PI8HbdJQwt6UXwo=
X-Received: from pfbds11.prod.google.com ([2002:a05:6a00:4acb:b0:725:e39e:1055])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:8403:b0:1db:ffb9:f359
 with SMTP id adf61e73a8af0-1e88d128ee1mr9121257637.24.1736389839663; Wed, 08
 Jan 2025 18:30:39 -0800 (PST)
Date: Wed,  8 Jan 2025 18:30:14 -0800
In-Reply-To: <20250109023025.2242447-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109023025.2242447-6-surenb@google.com>
Subject: [PATCH v8 05/16] mm: mark vmas detached upon exit
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

When exit_mmap() removes vmas belonging to an exiting task, it does not
mark them as detached since they can't be reached by other tasks and they
will be freed shortly. Once we introduce vma reuse, all vmas will have to
be in detached state before they are freed to ensure vma when reused is
in a consistent state. Add missing vma_mark_detached() before freeing the
vma.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/vma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/vma.c b/mm/vma.c
index b9cf552e120c..93ff42ac2002 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -413,10 +413,12 @@ void remove_vma(struct vm_area_struct *vma, bool unreachable)
 	if (vma->vm_file)
 		fput(vma->vm_file);
 	mpol_put(vma_policy(vma));
-	if (unreachable)
+	if (unreachable) {
+		vma_mark_detached(vma);
 		__vm_area_free(vma);
-	else
+	} else {
 		vm_area_free(vma);
+	}
 }
 
 /*
-- 
2.47.1.613.gc27f4b7a9f-goog

