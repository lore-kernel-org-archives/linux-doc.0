Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6E625A329
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 19:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216317; cv=none; b=KQsvpKkB53zjdVqmNXvAF0MOXspbTOh864Ql6uWY9nCoR90GspOlleP1kU67iobZOT5g5K1aO7mZww5ekMwN3hvQoU33EtQg0EL5+C4Cqk88PKg10Q15NwEjrbQAWah3NDYPor3ApEI+0irYMRrrope5BO3tQvnvIf+Dk1fyQv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216317; c=relaxed/simple;
	bh=WTAKrIObiH0+XnAmevo4XgmL855z4Fu5Qvoz089fAGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T8D/WhcWmBzRCvEooTCSG4Pu9JoNZFI+w44D1GoPwmp5/pQVy6ahV2fzr/41LjCDHMkISlUgIL/q7czqjdvgxkgCQB09SyJAORRHXkTSTLusAjdsLiwXNyW3BAtDiEhoxDlshLL27GTu6ahD55bZ9nSL8Z4gWTCZR/yL6EdTckU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fuR/tZua; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fuR/tZua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739216314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NPITbiV5yRtNZIanqm2v+SKlb5hdEoVu/zyhpD+AgeU=;
	b=fuR/tZuabeAN3RHCueQYmMmKXGcP+aIsicl1j4W0aOTKGy9nuOtaXTjpOJWY9SIHPqDlLx
	2HJuS4Ydqm7cRqlYbQoy6VQxslXHDmx2ahdbN5EyWTKP7dSlayTL4TaN7pvglPRGBevX8t
	NAMIoKbNC+g8PZkEc2sn4FtDYkhbVFc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-eIhLshhVNxSkYRCZSDx8QA-1; Mon, 10 Feb 2025 14:38:32 -0500
X-MC-Unique: eIhLshhVNxSkYRCZSDx8QA-1
X-Mimecast-MFC-AGG-ID: eIhLshhVNxSkYRCZSDx8QA
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4392fc6bceaso13133105e9.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 11:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739216311; x=1739821111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPITbiV5yRtNZIanqm2v+SKlb5hdEoVu/zyhpD+AgeU=;
        b=PMxctl6ntWqjVzrKfsmhW6KMYQ7AvE2ajiHWfTb4u206WHAk1Fai8RzapV9+Am9h54
         6BwdFMgcQW0dsP7qwJ6ZIeY10tHgz7Xz3LaPl+doPTqs3fyGLFQc6CrV5MwU3lsrbNdK
         +azG42+ylViEn/k57Cwy+sRAnPntG4pzIvu7k5Os/2zwGzpsQXDt9QsqHSPC4SJl11hK
         r6dAKmy3+7mPNsbhkHRduV/100KuUQMw0qPuf0ye7idCWVGy/gsp7ovOB9/FL6VKJ4/P
         zlPa3YMou3e04DtLpIujRaFtXhARFuUOnO01U58Vij46S53SuddZXih6mmh8CQCZZ8zL
         b7Ow==
X-Gm-Message-State: AOJu0YzGNHSVonJAc+RQZ77GbM2zqy7CQTe6C+qLwKU1McRFW8VVuRbB
	er5s0NkN/hbRptrqK17a9aGgH4UywKV5eWaDs3eBvV7u5BRKQ/8zatcHL0AH1VyPSOrF2nI94yk
	9NTN+2l1MJAqHu+oyCzORXW/03KcKVEMg0VkD5e4yRW+pgfPIblraF/+Y4w==
X-Gm-Gg: ASbGncsQmwUKLyYNyrhtujqMrRlBe50NSR0MRAKCeP0lYR3JvFN/rHjbLK24uy9FnVm
	hE7EhKkQBakeedWUDQIgUPXxm2kkuY0Pqde4Fnt0t3LSvsr2Pf9RqOsyXWqqK2fhyeRpoMfHFPl
	Aih0w5t9j4FHHbKIf42eCekwNAGJOntAAxFUrMNUgK3FoHK8ZkkhgcUvyxAp1U8Yy3t1c1k1NGP
	LgCZgQYMF9kSnz1vDH3naEbY3nQVFY8qlHPJ+0vfu6PktqZi9Eu3DRmIxbd5BnndtwZ4fw5r+mE
	FuoZE2UA5tTMGbZAwY506E6ZAtyjprIYDFADk2UonmuBdrHpf9x70L8yE+Z9LECS1A==
X-Received: by 2002:a05:600c:500d:b0:439:3dc0:29b6 with SMTP id 5b1f17b1804b1-4393dc02be1mr57220325e9.2.1739216311481;
        Mon, 10 Feb 2025 11:38:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbUQzL3Yq1p3VwDR+lxH773I/PQZNBDcgTpUgE2nEJHxULXhio/DNj6yNxLtRtBjWIFSwTIg==
X-Received: by 2002:a05:600c:500d:b0:439:3dc0:29b6 with SMTP id 5b1f17b1804b1-4393dc02be1mr57220015e9.2.1739216311167;
        Mon, 10 Feb 2025 11:38:31 -0800 (PST)
Received: from localhost (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4390d933523sm192523445e9.1.2025.02.10.11.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:38:29 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	damon@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>,
	Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 07/17] mm/page_vma_mapped: device-exclusive entries are not migration entries
Date: Mon, 10 Feb 2025 20:37:49 +0100
Message-ID: <20250210193801.781278-8-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's unclear why they would be considered migration entries; they are
not.

Likely we'll never really trigger that case in practice, because
migration (including folio split) of a folio that has device-exclusive
entries is never started, as we would detect "additional references":
device-exclusive entries adjust the mapcount, but not the refcount.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_vma_mapped.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 81839a9e74f16..32679be22d30c 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -111,8 +111,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
 			return false;
 		entry = pte_to_swp_entry(ptent);
 
-		if (!is_migration_entry(entry) &&
-		    !is_device_exclusive_entry(entry))
+		if (!is_migration_entry(entry))
 			return false;
 
 		pfn = swp_offset_pfn(entry);
-- 
2.48.1

