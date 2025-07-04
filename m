Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EA62F4314
	for <linux-doc@vger.kernel.org>; Fri,  4 Jul 2025 10:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624748; cv=none; b=pI+kIYZ7uZyFWbrwAec8wSiUZgG7owxrBhupbbVBMOr8dCfBTEAvUdVM8vSrAuZTxfVOqJb4rIS2i1gUfEgUkczYWp907CSZ4/OAUqQ7BhAaRBNhhursS1OpgYSoJJHUV9QzH1YY2IaCtBHNYk552w2HOXvM6kE3xLlHcKqTehM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624748; c=relaxed/simple;
	bh=ALxPszCmVcU8TjBy7B2t3BqkreYKMgNug+n8yrbc+Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gSMabOQgZAoU0ifV0z7gDsIh9C673zmK5940MMHE/aAg+3/QSkY7kX6ODmQWIA5oWjqDSrivAVc5wit0S0PF4VkULfaqnDwf2oi1BNz+MVp1G+z5VZODqYPgXxmpibb/zyiExcudhxcbxoUHxHzE4NtJJhlPWhCC1tKXXVwJ8Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AkkQMC71; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AkkQMC71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4vricv2e71NWYYMzs8BIQr/CRgQSzBMTqlFovEI9fk=;
	b=AkkQMC715yGmSovBRIW3z6FKfftarha9NjRCKC96i1kcYfAzI/dwgiVPY4uuYoy4mKIdp0
	uokh3MYkcSTj7o7q9s+Yv1EsrE/Iv4BVdSxXzddURdgpDiVspuRVN1kaG4K0ejz3zVAuIk
	IsdIHfNcK7UBcydtu+6h25UYOngKtVY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-v8wnwlzZPf2LTQyyH7Avaw-1; Fri, 04 Jul 2025 06:25:44 -0400
X-MC-Unique: v8wnwlzZPf2LTQyyH7Avaw-1
X-Mimecast-MFC-AGG-ID: v8wnwlzZPf2LTQyyH7Avaw_1751624744
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso354611f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 04 Jul 2025 03:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624743; x=1752229543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4vricv2e71NWYYMzs8BIQr/CRgQSzBMTqlFovEI9fk=;
        b=FielYarHXZw3dwKp93I3zgHJy31j6hOh7F4x8vTLaH/e2kCABR8o8jgF/BCRXI8Co9
         xqjKeDWUiCUvO4Vzp2YyzWZgzOY4in53vSPyEKBL0v6HNJ+CeqWchKmk95bdCYje7LX0
         ZaBGhd4sOa5CLkBcDNX8La2kHRp4xfKyZMDWf97RL3iuE37WuzNFPhFVyKT2NZ/eFxyS
         72HlFFYWL0eQZVSz1ctJPez4K3ZOAtVhbJLi/dEsmawmTOtjt4PIUxCLs5eKLIiKcTZN
         LWCNn/ZD00cC++SQ6sWOHLyYyYcEmDRr1AEdRr27SmCdZ1uO5mTCCV7ybolzGqYcEo6j
         Mkmg==
X-Forwarded-Encrypted: i=1; AJvYcCXWXZPrSmTpipjTZGTEMpAyZ7lHpZN3BxwmC2ItOju0nZKSu45Tpw20qVKkY7q03ialgw0THyxjHN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmOw4M6TnFcsOc2XEpb8je8nipLlU9v/KS1GiXP+OWgczgw4pk
	3QUuIyQj4WSSi7/Kp3NUWCanSdEa69/6dLzJtlg6hJHzbFVzEoM7yQKP7KuyMKzTpncsUUCZuxr
	+fl2U0aLBAx+lqnriwm7+UzQ7zLplsZioHMS7k9c4wd8NlVnqUPovxYBSnzXEOA==
X-Gm-Gg: ASbGncsne92txPn+W4Zf/ZXDfkYAr3orxf2ZLCyre+pZOg8ISMEVbGeb1p1pMrn/O5S
	hs5xpu6ihzhzm1UDO7o7DrKqDxoj/JPLXI64WpNosGPbKiiOZO4QzBfyf7taETXEQsrnOoFGtVJ
	noRXRgkBGm42jAxn0y5Xlalwyg4uVdN1a7HkrVE7uEEd8nFr3oRipkUvwR2tObi8HEJirdmqkFW
	LI0jydX65YOrYAjon4voN4K+J9jNOZR3kxFMqn7Q67gu5PXSHH56+n372rIVMmcMTLZHAjLgwAy
	5mc/9lg5Wjr+l2D62nPpvGst88BZOIdvsc7P/7SC8pONVIMCZt/WSk3pgan+z+gnXwjcryLWNdv
	w8ohAHA==
X-Received: by 2002:a05:6000:25e7:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3b4964ded13mr1424154f8f.31.1751624743528;
        Fri, 04 Jul 2025 03:25:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFw2GicaPInsB28PjQGll7qbBWs9+u0wQOGd0rdAKVxiB08VA9zODFfDmMz6Eob0+nsp252Q==
X-Received: by 2002:a05:6000:25e7:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3b4964ded13mr1424048f8f.31.1751624741867;
        Fri, 04 Jul 2025 03:25:41 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47225a2dcsm2114225f8f.71.2025.07.04.03.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:40 -0700 (PDT)
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
Subject: [PATCH v2 05/29] mm/balloon_compaction: make PageOffline sticky until the page is freed
Date: Fri,  4 Jul 2025 12:24:59 +0200
Message-ID: <20250704102524.326966-6-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704102524.326966-1-david@redhat.com>
References: <20250704102524.326966-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let the page freeing code handle clearing the page type. Being able to
identify balloon pages until actually freed is a requirement for
upcoming movable_ops migration changes.

Acked-by: Zi Yan <ziy@nvidia.com>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index b9f19da37b089..bfc6e50bd004b 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -140,7 +140,7 @@ static inline void balloon_page_finalize(struct page *page)
 		__ClearPageMovable(page);
 		set_page_private(page, 0);
 	}
-	__ClearPageOffline(page);
+	/* PageOffline is sticky until the page is freed to the buddy. */
 }
 
 /*
-- 
2.49.0

