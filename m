Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9801D334C33
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 12:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051584; cv=none; b=i0JsLA+VuO0q6zp6RSfYghR/5DToj5GGqpMroYOrIWl+kypRJWZC0KJtIo00xBa6bqI9t2dsiUIcOjepMQVsPhOAvifHgbWzXjxsSwcGmkT1JT+fZLsUanaY6tR9pZLtEY448vLy3EWQz7qfa2CY/WR0c2qSzdMiCMfLTz0AYN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051584; c=relaxed/simple;
	bh=ZX1IzZQQgreBcTlZHB/kVI28Gz8nSRy+pF223nJsGSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D+FD6GIHWlrkTb/U7rczc5W1Tq/WudUm0joXW5DLRc98y8q26jLpPyXbfWx2QR3++HIFPgldgtX2P0RxTLl7MlOEBmtHcWLnRT2d324otuF3+dr212jmgpf+t7XWSHyeX0LZUbrKogFup1F1KnVAfp+0sd6qFQEhHq+G05L1ouc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JcH6OVLf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JcH6OVLf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cInpBRrRn5ydv+Sa63F4MdgmnDVvTCru+7wR3lsxUS4=;
	b=JcH6OVLft+9j/hEazCH2GPV6OVITuPKaLYaEd3dDMvzPFLzfeSOvOH1JQUYHWC//PqwSwY
	EYnoWDj0CAMk+Z4u3w0GBFfefWrn5E2mWTCUU8FjtwmkJlPFFjcFa+ruLWB5URNznCH5zy
	jbcNUSNDbu7ehog5fWrI/3fnBvLEcOI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-_vex_WnFMo-UgWu3lB2jTw-1; Tue, 21 Oct 2025 08:59:40 -0400
X-MC-Unique: _vex_WnFMo-UgWu3lB2jTw-1
X-Mimecast-MFC-AGG-ID: _vex_WnFMo-UgWu3lB2jTw_1761051579
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47106720618so34993955e9.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 05:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051579; x=1761656379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cInpBRrRn5ydv+Sa63F4MdgmnDVvTCru+7wR3lsxUS4=;
        b=ixDJn/tAe4VUWIBqMGh5UyojrGKh8tBEkI40ymeczWXVHNANK6rkGCrlTXJG9Sp3I6
         LiihCOZPRyHSqCAKHsY3K3oiSVRDgLSCrdvlU7fWZ4+SDsGOAXJ+Z2mh3HuKh/rq8um+
         apOO+sHytydkADBpeh4BgZ8hqlBntmclRMLK4/SKNheeK28j5nEemxHYjwnjI4HhuK3I
         H3B/8m5wjX9rMiLZPcETdW7VqFs7nJ7xTy/1EpCyiyua1zjgX4CO8/NQSMkMZrGTZRNJ
         nWc9mYKTF/wXaDwUackkUWm6rDpv9Di40lc8pyCpUNr7xTC1kl7ebAJe5m5YcQWVBkMx
         rnsA==
X-Forwarded-Encrypted: i=1; AJvYcCVaT3PCBsSKBsXD49cWnwdKrQ8H7nVg9e4j0ThdJPu8u4GLTmBbbgO4ow1HVqBQDTtFEyqcUCg792E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBvm/M7mTqgj/bguIvSG9yWzaUVKzg30SItlroFOQeOBqzF0kM
	2qo3OGfsny0yustgvovs8pWC/32J6dW1b15wTZD7RgWwFVyxkxJbbcFGfemlMNM07KpTg43UIZ0
	Ofex+9A6mPBkJvfgNx22wXgnAiDKSjde4U4CM9U3T+w311lDoibDrxrN0zy6Mxg==
X-Gm-Gg: ASbGncuf8/IccPtexH9qxpDBL0rlIpLYQ+9ZB3MnCtIU3HDC8PdhAZGVfNaJFYsbZSB
	LurWAQr71aiv5VNDJHop0kKbnVna5iQuIboEMk2HF+D65WdlOxkucsi029cCsgZx3aq6cVDDOrj
	A1V9H0Onh+eTqxYyH8wTF69OzrX2gdlkVyS+fDdPIwbiOkFCHqjTEEj3DszbkrHWfWUKnpdsfoi
	TblA8lSCVCpHLrIHkSWgLiUhsXpYjaz/ySk87J3sDBOnrVbsmLpefiW1LKJc8DwZSELpbpKi9AN
	ChD7BVwI4pYy4WFr8UJEPm32tcLCYvAxMPzTorVH4zQ7cIRjiBOfQ04hYZPjet6Pt3aPtKOUihC
	QFzvRyrk7q32qIaCdKjyzXaaowiyJJyDnCW1IiZDzZGwBHmP1CroW5m73xbXT
X-Received: by 2002:a05:600c:811b:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-4711787c803mr122622385e9.12.1761051578976;
        Tue, 21 Oct 2025 05:59:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+zjcAWFH7UfZS6G5yWsBJ4PGUBhvAl9sC1ULzHpIWHcC8Aeot/GO9fktrhO0M9VdZy+aJsA==
X-Received: by 2002:a05:600c:811b:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-4711787c803mr122622255e9.12.1761051578618;
        Tue, 21 Oct 2025 05:59:38 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f009a781sm20658322f8f.30.2025.10.21.05.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:38 -0700 (PDT)
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
Subject: [PATCH v1 03/23] powerpc/pseries/cmm: remove cmm_balloon_compaction_init()
Date: Tue, 21 Oct 2025 14:59:08 +0200
Message-ID: <20251021125929.377194-4-david@redhat.com>
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
the migration function.

To avoid #ifdef in the caller we can instead use IS_ENABLED() and make
the compiler happy by only providing the function declaration.

Now that the function is gone, drop the "out_balloon_compaction" label.
Note that before commit 68f2736a8583 ("mm: Convert all PageMovable users
to movable_operations"), now not anymore.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/pseries/cmm.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 310dab4bc8679..67c7309c36147 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -548,15 +548,9 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
 
 	return 0;
 }
-
-static void cmm_balloon_compaction_init(void)
-{
-	b_dev_info.migratepage = cmm_migratepage;
-}
 #else /* CONFIG_BALLOON_COMPACTION */
-static void cmm_balloon_compaction_init(void)
-{
-}
+int cmm_migratepage(struct balloon_dev_info *b_dev_info, struct page *newpage,
+		    struct page *page, enum migrate_mode mode);
 #endif /* CONFIG_BALLOON_COMPACTION */
 
 /**
@@ -573,11 +567,12 @@ static int cmm_init(void)
 		return -EOPNOTSUPP;
 
 	balloon_devinfo_init(&b_dev_info);
-	cmm_balloon_compaction_init();
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
+		b_dev_info.migratepage = cmm_migratepage;
 
 	rc = register_oom_notifier(&cmm_oom_nb);
 	if (rc < 0)
-		goto out_balloon_compaction;
+		return rc;
 
 	if ((rc = register_reboot_notifier(&cmm_reboot_nb)))
 		goto out_oom_notifier;
@@ -606,7 +601,6 @@ static int cmm_init(void)
 	unregister_reboot_notifier(&cmm_reboot_nb);
 out_oom_notifier:
 	unregister_oom_notifier(&cmm_oom_nb);
-out_balloon_compaction:
 	return rc;
 }
 
-- 
2.51.0

