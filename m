Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5AF2BEFFF
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 13:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288509; cv=none; b=THqDy+JWvrmB582IZCMshhj5j36wI/Q/y0XdXFGeQJrytIObm/biQ+0RD58gZexwlzt1Lnw96oZ8ZlJ8UXnNLN7hr4wCNooBdggZHVm39Hu4yF4+WcoXW6k6Rq706nbA6/pNlpcv9n7dEWD7ZFHxxSzZPQcA1uH5lcFTfeVfgMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288509; c=relaxed/simple;
	bh=bX2O32zo3eRkpyjOPjcPSMjPx5jynwq3pH5hPVFisUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z0XUz3M43lOZRkdHSnfa0TPpB+vQGun4nJV1nPqkiMzMp3W+SajuJF3dEFU60GcPACHNEpAq6kvnJhWhavKxOEY2wO4qXnuZd6Fnne/FKvfqqfloz0C+owel3B5PaVJBWhI73ki4S3IzvXc3W7vlHbCDsbXDyi//wS6aoQmmRUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ELNw3OB5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ELNw3OB5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lqdlPSrzqUfx0/Anfl8VFepfeUNo5Gqwl7mCFswBHro=;
	b=ELNw3OB5CYpoY3mgwPM+2HjEeQiEW0UPqHO2TNjmLtDgZ+cqZM/sQ0rxJ2oFxdQ8UPzLoD
	omSyX4mx/ngv5QGnKJoyYnlR+pyBxwGj96NnNlDl3s21l6nE+3fo/SKV/9luiUf1aU8h90
	wGMoQJyMpYDfk/1STc+BM6O5n+Se5uU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-zWBkpEukNxK12WEju7q8-g-1; Mon, 30 Jun 2025 09:01:21 -0400
X-MC-Unique: zWBkpEukNxK12WEju7q8-g-1
X-Mimecast-MFC-AGG-ID: zWBkpEukNxK12WEju7q8-g_1751288480
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-453a5d50b81so1644145e9.1
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 06:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288480; x=1751893280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqdlPSrzqUfx0/Anfl8VFepfeUNo5Gqwl7mCFswBHro=;
        b=XFzpe5x4PY+NcSpS2+/IjyYeY5TD/RYOc2ZUwzmDKVPE1NtUm0Zl0MIbkyJcZHIDyy
         GIyHA1h9y1F5dl51DaQDyLOaydpQKQN4HoVa2PS28KpAv0HPzlGT5IRtUlKbX/rlTCpv
         z+5hJDDh01I5odJkdPsaJE8P1ep2Lq4vlycRTM5cXg2OnQsxPyig+n2CcrkgdXP7VdrO
         nhugIwnASo8LAZLU04+bQyYX/AC++D0TzpG9DU8xht83is8qH2XGGalXRWEPTjcADdX6
         vqBthrvznEWec8COX68xuCpBa1y9lQkXvdG3kyoX7wyUUR2c9NhyIj++A9gcUM4lyoH/
         b1YA==
X-Forwarded-Encrypted: i=1; AJvYcCXV/ln5vNXaIrt2bNf8I9AEQuv/IWX4ubL5R7UTcWHWwy2UiL5yPHJCNe1rIjufvlhn9fJ6tjiTTCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBYWPSaSixUczTLrDglT0FK3nhshsSjdclz6zstP6nnli1zBr0
	Jf3BrsGSuVqJbjHTkpWrfkLcI2jGzTVsnKEAtQOZeemuhtMoSJj4B5sgDE7S5Xlt0eoy3l361a0
	a1qWRq7U6j/9P7ZI8a2QV5rL1M3+8chVccBOiGg8Nt3VMMf+POALDm5dd5Tuy49bDWqMQZY7K
X-Gm-Gg: ASbGncsldh9cgyRg/YyqQDmXoApV99Q5WiYgBN4fTBQzxKHHNAoZYluIl3GdvRHM6ye
	FljkuN0c4svarR9wJavuzJQNQGFhZxbEegNqwIgh3bxVyLmBAE5tn1V6xjWyjOIrQdcigVxWGrt
	Hv+lquehzh8ZoIVQBWU/UzsfF3MN8psVwAT4SCJ5EqYCVUHKXFneiccHChyLeuhvgoJfSrrove7
	d6nQXyI0l5KguMag5MGNaDSefTacEyvx6YR2QT6gZjWZqs1vLEUrQfH6nzYTbQCHWJfCBEZj38p
	nQugUbeJVhsl8FE+Fb7YIEzsG/UjuDawhKsOgGjFZdOU4/2NaVoPDpW8YowY7dFNDmLGweIOR8C
	9abZW52w=
X-Received: by 2002:a05:600c:190b:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-4538ee4fd6cmr142842375e9.4.1751288478998;
        Mon, 30 Jun 2025 06:01:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIe1HafHWQMdBGxTE/8gmXCwDECQtvb4nkW8MYtHAgLmX5UxDUSKKTFebF7rirr8hhXGCxDA==
X-Received: by 2002:a05:600c:190b:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-4538ee4fd6cmr142840675e9.4.1751288477814;
        Mon, 30 Jun 2025 06:01:17 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e528a9sm10541491f8f.60.2025.06.30.06.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:17 -0700 (PDT)
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
Subject: [PATCH v1 22/29] mm/page-flags: rename PAGE_MAPPING_MOVABLE to PAGE_MAPPING_ANON_KSM
Date: Mon, 30 Jun 2025 15:00:03 +0200
Message-ID: <20250630130011.330477-23-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630130011.330477-1-david@redhat.com>
References: <20250630130011.330477-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KSM is the only remaining user, let's rename the flag. While at it,
adjust to remaining page -> folio in the doc.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index aa48b05536bca..abed972e902e1 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -697,10 +697,10 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
  * folio->mapping points to its anon_vma, not to a struct address_space;
  * with the PAGE_MAPPING_ANON bit set to distinguish it.  See rmap.h.
  *
- * On an anonymous page in a VM_MERGEABLE area, if CONFIG_KSM is enabled,
- * the PAGE_MAPPING_MOVABLE bit may be set along with the PAGE_MAPPING_ANON
+ * On an anonymous folio in a VM_MERGEABLE area, if CONFIG_KSM is enabled,
+ * the PAGE_MAPPING_ANON_KSM bit may be set along with the PAGE_MAPPING_ANON
  * bit; and then folio->mapping points, not to an anon_vma, but to a private
- * structure which KSM associates with that merged page.  See ksm.h.
+ * structure which KSM associates with that merged folio.  See ksm.h.
  *
  * Please note that, confusingly, "folio_mapping" refers to the inode
  * address_space which maps the folio from disk; whereas "folio_mapped"
@@ -714,9 +714,9 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
  * See mm/slab.h.
  */
 #define PAGE_MAPPING_ANON	0x1
-#define PAGE_MAPPING_MOVABLE	0x2
-#define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
-#define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
+#define PAGE_MAPPING_ANON_KSM	0x2
+#define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
+#define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
 
 static __always_inline bool folio_mapping_flags(const struct folio *folio)
 {
-- 
2.49.0

