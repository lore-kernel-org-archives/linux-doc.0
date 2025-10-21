Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239313346B4
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 12:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051582; cv=none; b=fZo9L2gwli+fa1/7yO2a+9oldrzsnEYviMy7YyqpsjC5391C8nZNuK9k0bZJS+orA+AFO9ZGNxc+A7byAvIhE6OjJuYkFm9DWP5RKuJhifhR3pwmhXzk+4lMHoWWCVmKY1zVCVNwKhem6xSCJ8c0SRSdeSn6hJuAYTWnjzKpxFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051582; c=relaxed/simple;
	bh=L+63bx9D11EYkqLrccK+lnT9JaJRwWO+dQ0bdJZ2z3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZm5lNUo/qQHeeOgjZfV76nD/ypE0OkDjXI3024xfTcys1hGNf9djOrD8HxEaMcOlxGVTsc+4fA3oxV3nQjiiJSzXS4JehabosFt39XUL0qJijwLipdjaRRJAIuMsMciO5ADAzOS508AUSC6pawFlxMq4rcDgVGNh886pZA43dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jwpx5sVv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jwpx5sVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8R/9+ffq24GRtsamw+sO0Dq3xyN1P0TNXMmPfo3y584=;
	b=Jwpx5sVvnWtjBFnrQOc8CPu/FjLU92WX9OM3WxvYic+nsdneJiOGYjuZAaoOQt1EsnMKh9
	b+HO9R9DQSVN5vQhPn91eIn3CmCwik9qddFpHLu9RfHdjZCrmJniACxVFgzQ3LzNAXlnnv
	ByecGhDGX5GFLusTGILAfOqQ5o68eXU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-n2woTZ3RPliMWGPRp9l8Uw-1; Tue, 21 Oct 2025 08:59:38 -0400
X-MC-Unique: n2woTZ3RPliMWGPRp9l8Uw-1
X-Mimecast-MFC-AGG-ID: n2woTZ3RPliMWGPRp9l8Uw_1761051577
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-471193dacffso37638665e9.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 05:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051577; x=1761656377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8R/9+ffq24GRtsamw+sO0Dq3xyN1P0TNXMmPfo3y584=;
        b=aOwiwpW75NaX6k64lob+mZirNxoIuZazEeP3dd+OImkdEsa5rMoxEGnAl1xviTRJBG
         cbJB6KAqemNWUTaYthJzlUQQxjDUDho87ixW3Ay7ao8sy/2ofUdivjbtZ0F8VQ8QTtbm
         7Frk/qVP9mbHrRP7DdzVUomu5Lyvd4x73S4vwdQ7j8rRCG6M23fLSpsy1rLz9pszfYF6
         02ERO8hI8506DG8Hh0BVHsW/sMYdRCbTYmCvTtT3NaxM1HluJvlah0mSR1sRlHl4WGz+
         Ru6Z9eAvlS4CQ4rTg0oMTCckjdm0bJxeqqz4P6psSMUmcjvJN5L4PY4m3tQ13ZCebHvF
         OQCg==
X-Forwarded-Encrypted: i=1; AJvYcCUNu7bVLABqEOuCNKsnbKMu5D1OpmJZhBPX7KglXmxB9a2D//L/G46baxT0HA+smIlRstRKPnJANCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaGWklFL8pw84P2UmdR19seloHKOY5/SdpMINofbOjXfGrpfYS
	KRSpiwOd+1m/YbTW/+NESJfPmxMGALFxFnSLO72/6vPx8ytQyxt3YoIFfE8umfv7waDLNTBl1XJ
	Bhi/eF0iZfcdEsh34T3E0MpkxFJbZ1P5ultn/kqyHFnd1bGwMvMkKxCTFYHkaKg==
X-Gm-Gg: ASbGncu20vB5qWBK7Rl5FumxW+EPWopdi4858KCD7ZfTV/B09nIEQoyMgQ1X4ErcMN7
	HvU5jS8I+sGShq1tlJwReRyd9zx/bvVOlo95JnGLsA6lQr75AqFqs/FmdBu0L11jYxvtQDQwuD6
	VAera681EmbreGN75UyVCJLcuRoX+yIZZsC91F0KlRN1z9qJjqBPvE+AU/3UEA8zfivINE3JC2L
	ZIB1pw5EEsWx/qRg/Kmt6xygGeHrgj/0bTS7j9uH+fDmwGpNSb19aQt+npTpyofG73fHVn1Mc9/
	tTjJevz96UjFRIZs0c3hyumWgF3EqSvofiCHKlN1yXrXryaw9AZ02utdyIcc1q2COExqq29Aalq
	9q2I+vRPVXE94atp6G3y+JnnluD8A94LjDVGDWXTo3IxZ96wK7f8MwwS3r7tD
X-Received: by 2002:a05:600c:444d:b0:45b:79fd:cb3d with SMTP id 5b1f17b1804b1-471179202famr118678435e9.36.1761051576991;
        Tue, 21 Oct 2025 05:59:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEokGBhUzCRsmptihAjBHDZlL2+6LwM1McdhB6sS9tCAS0C96fTIUzPBBNJE//85lgKmaBsaA==
X-Received: by 2002:a05:600c:444d:b0:45b:79fd:cb3d with SMTP id 5b1f17b1804b1-471179202famr118678045e9.36.1761051576500;
        Tue, 21 Oct 2025 05:59:36 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47496be2eb6sm16562465e9.2.2025.10.21.05.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:36 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v1 02/23] vmw_balloon: remove vmballoon_compaction_init()
Date: Tue, 21 Oct 2025 14:59:07 +0200
Message-ID: <20251021125929.377194-3-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021125929.377194-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that there is not a lot of logic left, let's just inline setting up
the migration function and drop all these excessive comments that are
not really required (or true) anymore.

To avoid #ifdef in the caller we can instead use IS_ENABLED() and make
the compiler happy by only providing the function declaration.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/misc/vmw_balloon.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index 2cc34c4968fac..07e60a4b846aa 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -1833,27 +1833,10 @@ static int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
 	up_read(&b->conf_sem);
 	return ret;
 }
-
-/**
- * vmballoon_compaction_init() - initialized compaction for the balloon.
- *
- * @b: pointer to the balloon.
- *
- * If during the initialization a failure occurred, this function does not
- * perform cleanup. The caller must call vmballoon_compaction_deinit() in this
- * case.
- *
- * Return: zero on success or error code on failure.
- */
-static __init void vmballoon_compaction_init(struct vmballoon *b)
-{
-	b->b_dev_info.migratepage = vmballoon_migratepage;
-}
-
 #else /* CONFIG_BALLOON_COMPACTION */
-static inline void vmballoon_compaction_init(struct vmballoon *b)
-{
-}
+int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
+			  struct page *newpage, struct page *page,
+			  enum migrate_mode mode);
 #endif /* CONFIG_BALLOON_COMPACTION */
 
 static int __init vmballoon_init(void)
@@ -1873,12 +1856,9 @@ static int __init vmballoon_init(void)
 	if (error)
 		return error;
 
-	/*
-	 * Initialization of compaction must be done after the call to
-	 * balloon_devinfo_init() .
-	 */
 	balloon_devinfo_init(&balloon.b_dev_info);
-	vmballoon_compaction_init(&balloon);
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
+		balloon.b_dev_info.migratepage = vmballoon_migratepage;
 
 	INIT_LIST_HEAD(&balloon.huge_pages);
 	spin_lock_init(&balloon.comm_lock);
-- 
2.51.0

