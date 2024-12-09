Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B9C19D09C
	for <linux-doc@vger.kernel.org>; Mon,  9 Dec 2024 22:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733782233; cv=none; b=pobmbA5ZbICwVCKCiorAyZPO+LTsyjEe7o16HNY1zZoEfEUPv5tlDfvL+AUY++TXQ+cTm4aTcsUTnRWr+bNhzxEA3qa+mODyHcLo84FpsjC2s6WpE3lR/Ju5jCFOL5h0WTA5Ec33M4sWKBF/csSSAaJiAXD579jeOKbEhkxlZHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733782233; c=relaxed/simple;
	bh=xdhQRO7iG5g9QwFMiLtS3VOf3NDOq1Xd5r/XukgCc4c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=uLzXFIA6+fppsznCI6cZNxy28k0+aSWLVxdEryzsu+wO7ig7CsgqkIgsJm86jxkznRlI4zxCGDpN6c9SMBRD7bmBEgmu5V44ePWcpxSJ35RpiDvkTYvHcyCQsTmYn9PEg+wDPD6D+M6DKdLtSS6gr23SJUTV/881U6LEbhQKyXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VgAOcLQA; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VgAOcLQA"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7fd312feb10so1829688a12.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Dec 2024 14:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733782231; x=1734387031; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s5kJ8tuGRSUiMYssDTJ1ovChFT1489Ldfej8iSXdE6s=;
        b=VgAOcLQAtEFDdzKiss4o1QcuVSW0Ci4H2L81LBl5MdEXuYQeSAoA/9rQOKU+ZguQjV
         Tg/HX3n/RGVSqK+yLsdXWfB/3jfDo46c4aogbyp9TJ70OQn6n+e8vRKtwfn2DDYenx1y
         bD4kSYKVDFI9hOTTpLocdPO3E+o5wwew9yHmCHBYeX5v4MuJRvXTwDe4oWkXZg1fAlew
         ROEYTG4PKBmaJIE0fFzbj36Xjox33ML/iMHZsXekIwRH42wyu5Cr+FBqASPemDZ2wELI
         jcTgbU95z0+SQhwlEmbivR9CqIJiuLYtqufXsKQuZ1jeRHzlhPXVnsCTMaG9hgKeMR+d
         cCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733782231; x=1734387031;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s5kJ8tuGRSUiMYssDTJ1ovChFT1489Ldfej8iSXdE6s=;
        b=NeRiarJwjiPFeqr5OKVZIotuDRX1LrBfyo20U5i7/j4RAqYEDfefia8qqCuMkWg3HY
         82A5lkODYvHdKVtX4lFJltpt0MyLSYPUpYJnkN/RjuJ+sO/UrWzqCSBe/SJnP7nDwckB
         WQl3W67FCrvl4prCNuhoHBFjG16EjEWeHTqAhvtueroRPJsPfIEuCqTjPx42+dilTdxq
         Tuk+kn4wPcIuMv5HukhXkJ88ahL/aqgLz0GOoh6lotFq+pEfJ0+hfaucAqNdZ10gEkRt
         ZG6ya7tYu7QEgeNWnOeyEQAqQAQoiO2UC8OK7Mu00cg9QlNUrXyHU+MlfgnvcGVj3Yjr
         D0eg==
X-Forwarded-Encrypted: i=1; AJvYcCXieU4abvWxR0jf9h1uNqEr7KjCM7qiKDhaJfjWct2CtSAxHZscJu15cAibRzT8fm4ATHju6MBFBxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrcQK1AKf6gdgfzLnz2qki0hq0JHy8wh7pu9jWXzGpXbbtond3
	utfiOpjuDnyzYQvXeI3X34Pkmbm9gtw9c7Rq+uRRNSJosno7oG4cf21FuKd5vPO47ZpCOoXYa3+
	L6w==
X-Google-Smtp-Source: AGHT+IGwA+SRdoKoKP199xBaNffbhc4gaYBx7LHg0PekrQ7mrUUner/oH79OTzpbo5FJCxTnEDqYj4PiT/s=
X-Received: from pgbda5.prod.google.com ([2002:a05:6a02:2385:b0:7fd:57ef:61e])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:918b:b0:1e0:d837:c929
 with SMTP id adf61e73a8af0-1e1870a8012mr22865787637.9.1733782231311; Mon, 09
 Dec 2024 14:10:31 -0800 (PST)
Date: Mon,  9 Dec 2024 14:10:28 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241209221028.1644210-1-surenb@google.com>
Subject: [PATCH 1/1] mm: fix vma_copy for !CONFIG_PER_VMA_LOCK
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: oliver.sang@intel.com, klarasmodin@gmail.com, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	surenb@google.com
Content-Type: text/plain; charset="UTF-8"

vma_copy() function for !CONFIG_PER_VMA_LOCK configuration copies all
fields using memcpy() as opposed to CONFIG_PER_VMA_LOCK version which
copies only required fields. anon_vma_chain field should not be copied
and new vma should instead initialize it to an empty list. Fix this
by initializing anon_vma_chain inside vma_copy() function. The version
of vma_copy() for CONFIG_PER_VMA_LOCK is fine since it does not change
that field and anon_vma_chain of any new vma is already initialized and
empty.

Fixes: 85ad413389ae ("mm: make vma cache SLAB_TYPESAFE_BY_RCU")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202412082208.db1fb2c9-lkp@intel.com
Reported-by: Klara Modin <klarasmodin@gmail.com>
Closes: https://lore.kernel.org/all/d0ae7609-aca4-4497-9188-bb09e96e7768@gmail.com/
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
Applies over mm-unstable

 kernel/fork.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index fec32aa06135..d532f893e977 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -524,6 +524,7 @@ static void vma_copy(const struct vm_area_struct *src, struct vm_area_struct *de
 	 * will be reinitialized.
 	 */
 	data_race(memcpy(dest, src, sizeof(*dest)));
+	INIT_LIST_HEAD(&dest->anon_vma_chain);
 }
 
 #endif /* CONFIG_PER_VMA_LOCK */

base-commit: 6e165f54437931f329d09dca6c19d99af08a36e1
-- 
2.47.0.338.g60cca15819-goog

