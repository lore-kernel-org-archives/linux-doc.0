Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AD3293C64
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 13:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288492; cv=none; b=LG71LxRRVGaEIJ5rEZRrklTnhCtrHS8GZY3MYHuXDHgJgd40C2cXj/FqfkbYJ6czqEv5YrtJFFoEmVVuAMTV9v2G+wpdcgxD491mt0JPNyyae2PYRuXcyHcvM769FYB/JceFg4otNOVQawWvniccqUmxg3Z5XBTyngcBwOAY4C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288492; c=relaxed/simple;
	bh=isaI58t0kWAv0VvFIE40k9qBORzA058ggEZ88nMmJIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZehQv9TH+/S2ixPcbXTBTyMBgUPPGEwtwHJmXxRLroXdpD4ZqX2h1UKa/QmWNITqPGh9ynBSakcw/tKUahRTTa2v1vqOUOQ26yNzIvju/Gf3J1KcbYaFeh0jqdfJcLNTXHegP4EImMkBYO10bME5VJ8cu66qztMOX/t4iMi40Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DjcjmF5Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DjcjmF5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olXYTUdhc5G5HcwZfX2j4qOOcGFF0hDyepBOzPt910g=;
	b=DjcjmF5QXc4e4sCCO+Y+sKXbONV97BF2T9CM950rqRPpWxOAFha0su0cBeKrUKFT4O3zek
	tPuCDnGPtAM4yhMwCO8zBLKvf3exzFrVygM/cL05QObO4JzmPuojvE6Y5Lt8wlsqzlrfbT
	BAVEQiDEjJ5JFncrracmQSku/rd4Hko=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-NDhUPIhwNHeE0mSZtI9Ehw-1; Mon, 30 Jun 2025 09:01:28 -0400
X-MC-Unique: NDhUPIhwNHeE0mSZtI9Ehw-1
X-Mimecast-MFC-AGG-ID: NDhUPIhwNHeE0mSZtI9Ehw_1751288487
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45320bfc18dso22232065e9.1
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 06:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288487; x=1751893287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olXYTUdhc5G5HcwZfX2j4qOOcGFF0hDyepBOzPt910g=;
        b=oGeGNTPR33Qi4xIzi9DqUTpOyEML09HYKdhcTEY41DpXTGRuuArPW67RsXOiUgNQUi
         eZAWT/hHe58MvHzrruvHICstcn68xzrVg2c5fFv39rqpr65KfIQ45fM3dHcFA4NABp5/
         la2i56cTpXqpWcMCmNc/EnayTGHmJn1hbSm7jfqvQyY7WUdcVoBo4720rD1JrUGrt/R6
         fl24AIU65aHfPOI5n6yP0mQQnAQrdXiI5UovHFkcOcl3wZ78XYp59VItdXXEXB02sBBQ
         mHPBH3gfAeFbR/C7QIRb1TlAcI6wouRFw9I+hUa6MrXtafw8LogSdjbW97o5c6BGjy9J
         fklw==
X-Forwarded-Encrypted: i=1; AJvYcCUizuGshTS7buHAET84e3WSRzrZdpcKrV6R+ndrahXZqTfa1sd01CWZOmYaxgJob7HqFOeV+YiCCtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUE/j3RrOZAF4nB9fxjjogV12t5V/ZsIUYm0Jrm8lmd2pAx+wZ
	/ORvLS5hoq+J3wvRJ86g40gEnNRYS56/PgZt4Lso3J8kZ73dKvq6AyXQ6a6Nm77bug1IyKgi2jG
	NsSDEbngA0T3ax6BkhCrKkk+q4MHInADg15gmPaZICLAflr2tDslSJYXVSiV4kA==
X-Gm-Gg: ASbGncsAT4sAxUzf6HsBSh1lQXjI2M2Y42nGf/iXu1yinxyhb6P0f8LKkBnE06j6dSc
	zlIofQniZsYY2V/FiSLFHksKanAuCFgrQD19ZPfoDuDSS1/8oMSdIpbsJAp/krXZT1A0WJRtnq3
	EdJlXokh0jmgjdlcxVlpMk3VekJ5Nn7f10m8ESKnnvQbQsBGz16n/oRUjbaXo0Ody6RjeIjDoHZ
	LFYXFwx7E8LDcah7l9MmAkvjHqWj5Y9+ttfKw4Ots02P7cYllX0j9wmSikf5SAqDbbMTiY5Q4hq
	wSXp2mOcWa6/6kMby2Ya9DUSsXxLdb+l0etbxafJj5J01mMVegckJlOQjaIeonKweYdZAI/S+hD
	+JQ4NmBM=
X-Received: by 2002:a05:600c:5306:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-4538f308f2amr124064305e9.13.1751288486172;
        Mon, 30 Jun 2025 06:01:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9JbLrxBujZu2VjgMn1mCOlcQzRUhKdRhzGdc0P5pPEt9jKXPpDvx4Rwh6D/+Yae/APwbOBQ==
X-Received: by 2002:a05:600c:5306:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-4538f308f2amr124062795e9.13.1751288484673;
        Mon, 30 Jun 2025 06:01:24 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823b913esm162071665e9.33.2025.06.30.06.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:24 -0700 (PDT)
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
Subject: [PATCH v1 24/29] mm/page-flags: remove folio_mapping_flags()
Date: Mon, 30 Jun 2025 15:00:05 +0200
Message-ID: <20250630130011.330477-25-david@redhat.com>
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

It's unused and the page counterpart is gone, so let's remove it.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index f539bd5e14200..b42986a578b71 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -718,11 +718,6 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
 #define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
 #define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
 
-static __always_inline bool folio_mapping_flags(const struct folio *folio)
-{
-	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) != 0;
-}
-
 static __always_inline bool folio_test_anon(const struct folio *folio)
 {
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_ANON) != 0;
-- 
2.49.0

