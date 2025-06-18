Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0982FBFE9
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 17:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268491; cv=none; b=Iw5SOnNOgeCKZiAwLpfPczApGCoJSE2lEt0M0orGR8eh/o2PqmgkBU+rtBCpz52hvpUGbC61RxkENqTjmWTzx/0HSsmVpFJvDfDG4V8RaEEbWGEP0wbcHlJoPn/EEO9wtBSV1+PGmtARY0BTj1be59EXMbLkrV9OiXekDnpKPY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268491; c=relaxed/simple;
	bh=klS5wctUdaGGEO0GDFp0U+oLqOtRx0jqeVG9P2Se0qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DH7kS1uxrbS0aor1cmQNGAXNCLHcwUoGNzEPZ0VXvq2Lo80mu0uXCq4bEjv+WsxRgIyHXLMBhLeQAJDK84OzdB6pWrjoZiONF42IDoC4+4gZB2F81d+wAL87Iags7urgr85a1z5YiI7PDKdmPsUG2Pstz8qE3etbcZIcKlm0c64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EjNJwPwC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EjNJwPwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UnwUSh7o+5ZmaRZCKb6UInkhBSWZlCwshIxY9Qz5Cgk=;
	b=EjNJwPwCoZ6wmrrUKTjRbGbAOnTZg93QQzrb7Iocs/VQdILH334rfW3xVnLFiV+2CT+6pj
	x9NuE3rgfx8HgSnl6l41CIJFBFrbv7bkyCDISz7u8Xuz41Tlih6xdFyPIeYY+VKYuYdCLU
	zoZMwVFven7rk28v9Wu+dSuWD7s7GPo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-9j8ChtPNM4KCJLbt-HH6-g-1; Wed, 18 Jun 2025 13:41:26 -0400
X-MC-Unique: 9j8ChtPNM4KCJLbt-HH6-g-1
X-Mimecast-MFC-AGG-ID: 9j8ChtPNM4KCJLbt-HH6-g_1750268485
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso47063265e9.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 10:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268485; x=1750873285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnwUSh7o+5ZmaRZCKb6UInkhBSWZlCwshIxY9Qz5Cgk=;
        b=qoDPxkkvlxJKbPh60lYG0u39DlfZus14hiN7GFTmPQ8cohvYls8Vocw/ALTFcKp5OE
         7nBchvl5RB7JMhO1gLQqBn/jv9BWhOpDriMmyY7+ergFlLr2PYr9gJeiW4VCuflJPCfy
         wHVJpsrPYVXPGnSiBmvIDcAX3l4NVfNw7Bijro7YK35MhRcxbI+1cVO3uW/okk7gNSN4
         BXS1ZiNEuDbWAi8SqE4IlbX+2Moh6dSKQjasMsf0+4o5KIQBeV3ODkMtH21/HLXq5Qfz
         QxVQ8fw/TnGf4y9oWpVxrbT9kXY6Agbtd25Vx3emQ4w5bawpqkE+8uq8RvK7d8i6TcY+
         cCLw==
X-Forwarded-Encrypted: i=1; AJvYcCX7ANUTmkw+9HvMQd6RVbqIozflyjfGK1RLznfvOPBMXk91Wf0PuN/VldcBAuX6ot6EgRxjVNir44o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3d5ot4RGOtWXtrUc3WIPWJ+CgPZjFq1e3di7Ts6+CIWVBqB31
	1u0thZOHu00kDRuWo1mPWC/m4S7lVrgeBEdYg4KKS6mzPahzTtiiYUegcP7meZJVGwkM4kuu8g9
	FdecisYmhLDPUZ3r+LCsxmSxS2jSJP3mww9nKDmJzefcyTPLEYowLQGv6GbOxLw==
X-Gm-Gg: ASbGncsC27qilxCT9yWvPypCFFMQUiQZPpruFPH5QspvmRAYEQs8KaT2vdY/ikOKAgw
	rt/tXo4Rz4Sk3Z9eXgLtj3dP4ShAne0Wm+9Ekq1DMD2kldb3McreN7kKtXyQ/J6mStX1QAFNwD6
	eQwtVJ08kZRnsyG7kGe4giPxHUvXE6oDc2ONL2w69sGZOodd94PGx5yU5R9dnln6UogZZ4fHHFk
	vdf3jIbXKQ8pFvBKBMGzyfONy3TJMA05u+Pjqm+qCiOmPVGsr/9mJ3Ps/FHEJUqvSgVYu2K1fLE
	kS20rjo0qlDmEpGIPD5EvtQNc2EyJJO7KCRGP4VBTUHxjOD/qaSuaGJNN8zLG5uxP/Bw/x3Idrj
	cByEovw==
X-Received: by 2002:a05:600d:1:b0:453:5a04:b60e with SMTP id 5b1f17b1804b1-4535a04bc8amr21842905e9.26.1750268485364;
        Wed, 18 Jun 2025 10:41:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv5K+zuY4+JCApu2tViRQi8tnrUP4BMaDADA459jpWP1i37cwdJ2pp4j+WJZa019DgSPcT4A==
X-Received: by 2002:a05:600d:1:b0:453:5a04:b60e with SMTP id 5b1f17b1804b1-4535a04bc8amr21842675e9.26.1750268484986;
        Wed, 18 Jun 2025 10:41:24 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535ebced8asm3463925e9.40.2025.06.18.10.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:24 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH RFC 25/29] mm: simplify folio_expected_ref_count()
Date: Wed, 18 Jun 2025 19:40:08 +0200
Message-ID: <20250618174014.1168640-26-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618174014.1168640-1-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that PAGE_MAPPING_MOVABLE is gone, we can simplify and rely on the
folio_test_anon() test only.

... but staring at the users, this function should never even have been
called on movable_ops pages. E.g.,
* __buffer_migrate_folio() does not make sense for them
* folio_migrate_mapping() does not make sense for them
* migrate_huge_page_move_mapping() does not make sense for them
* __migrate_folio() does not make sense for them
* ... and khugepaged should never stumble over them

Let's simply refuse typed pages (which includes slab) except hugetlb,
and WARN.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 98a606908307b..61da588dda892 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2167,13 +2167,13 @@ static inline int folio_expected_ref_count(const struct folio *folio)
 	const int order = folio_order(folio);
 	int ref_count = 0;
 
-	if (WARN_ON_ONCE(folio_test_slab(folio)))
+	if (WARN_ON_ONCE(page_has_type(&folio->page) && !folio_test_hugetlb(folio)))
 		return 0;
 
 	if (folio_test_anon(folio)) {
 		/* One reference per page from the swapcache. */
 		ref_count += folio_test_swapcache(folio) << order;
-	} else if (!((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS)) {
+	} else {
 		/* One reference per page from the pagecache. */
 		ref_count += !!folio->mapping << order;
 		/* One reference from PG_private. */
-- 
2.49.0

