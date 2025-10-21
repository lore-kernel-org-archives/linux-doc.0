Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD953385B5
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 12:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051600; cv=none; b=TEWDmAmB3lBUB5qVvbYY5iO3+4dRBvbKGAnZgM+odrLFQwEhBteRuDnvawSLrl8271jRPgp+p3BFKHmdMC3z9S1PbamEr1KEP94RrnWCDQ2I74V0W7rJNk5hthqmLIbiBDdd5UdVPC27sC4gtdLd5fzlaonPHJsuHCJujv6pVns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051600; c=relaxed/simple;
	bh=RVpO0/1Rr2WqDw7IdAgDtrk1Tta4kn04Oz5nTYeayzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJElTzX70pUZKAA/w+nNEAq0xAeivLEU3FyWvMwnSJCWcyInJ2bbUBaWBJhHedydoUH++4+J4s89HRfAynCkWYGtaZ18f2llTmh+ng1GWLkvUl3LGmEP12233n0ir5bstGqTdi3yHGqOvVR0Dts8cXoHLgFA5LEB0DG6hjLYXdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZeqP5W2Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZeqP5W2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a58UIIapVgV9zdPpt63SgupeCmEgQ8fjnLkqSW0/g7g=;
	b=ZeqP5W2Ybe1TzfDt/dZ+rbzug9YXzMDndJCEgtExNQ3acemanQFMWZvupPKoPeuIl4DO/K
	p/DMpE5ieknROaWPPgXWrW0kElvPkJyNKjMXiSa54bP6IkfZaNPckhtuDPwqv4IE/DJEvn
	H8h4FrdRKO/T5+bnF+l2USfoctKYo4I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-1NSrG9_7PnuSV233jctjvA-1; Tue, 21 Oct 2025 08:59:56 -0400
X-MC-Unique: 1NSrG9_7PnuSV233jctjvA-1
X-Mimecast-MFC-AGG-ID: 1NSrG9_7PnuSV233jctjvA_1761051595
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3f6b44ab789so2903891f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 05:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051595; x=1761656395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a58UIIapVgV9zdPpt63SgupeCmEgQ8fjnLkqSW0/g7g=;
        b=MPczE9ah8vDn3M7Oxq/osVgBX2bcXQAMTqV+LqwM4yMTisZXYu64lJK4joW/x4yeZJ
         lhdwFFFBZRKdXMXRnHvxS1LwGfgUuQ5YWz3ezTWZcAfyG8sYk0cu27yXyeDbXIt9I73o
         2XGqsAKAc07aJI7GoE++R9FyRz3oWvHlhnUwhHmNvQE4q4Lpl+9W7XX0u0Ha66kusZaV
         Jv6UBt84bi5E0PnBGSubgfRU7XADxe3fX0KSf1GkPlzEnEhv94phhQkmrRTJhUSz5HuN
         uQgbuh7qAlAss7SVVJazsQq3nKCbPtYpspUwqHd5ZtwM8wI5ptmhUWxc6AasVSeQ1NfF
         iViw==
X-Forwarded-Encrypted: i=1; AJvYcCXgvo5LtXA1Qbohfar+6oZTRY/QM16HWnjYvGxC0Zy67M7Glp0oPtGmV0UCTETdaJ0HUHmiE9pCfp8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0HdRZ5Ly1wVrhhWZFmb0ePvcwAU8/J1J/K0kLiXSnERWGL7fK
	N3Z6pzu6XxKXi+0nXCl5lIe2Vy574BLlO+wDhQpD68GV08+WSG6Qb8YqzqgD19KTQaRpY3pe4up
	33v+yON6Q7PBavJrTKw/E1u4slbibl/8yeRIe2gZh8NFy656Lm79f82Pgy95Zcw==
X-Gm-Gg: ASbGncvruoFHU1L/i/vzp1/kvD51yCjetwg4Hdih6U8hbffaZe2/6rBSpIZzzulr+8T
	ibRGG+PPx0NOWsbQzBzFIYW6adJPEerGI5zIGgltD9FQSP62XG2oajGOKAA53wOxmWy83EMCGJN
	D3C7XleTt0Of7ehG/wwIxynB6v1ScStB4dvqbBbkgmoZIxlYuCbhzfn6cRwZt490qYCYwwZ5Wxl
	my/2GZ9mV9p5lTVPnGdJ+dmEKfCHSCrM3HsqFbA5DwgT1bRryPH3xYnMastpibmU8nLCSb9YZHi
	ElzyI8hBpMxkNKzd1kLFuVE8l7VDH5pyUD5Mx17eOCj1XuIEXznNaIxRwuTxE6wreAvTVsh5ZtG
	N0gIWiPVopeEI3cJz66UmCec6/C8NwW4Amm3u5JS1fLO2oyrZU5L87+Sdo4q0
X-Received: by 2002:a5d:5f48:0:b0:427:2e8:fe5e with SMTP id ffacd0b85a97d-42704d83898mr11742012f8f.13.1761051594852;
        Tue, 21 Oct 2025 05:59:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOL78NSzfD/K3cQTXDnH1hifM9lFea/fB9GzfGevY7RVlJ9OG6SsU/tMvE3AQ+AuHnf7dxjA==
X-Received: by 2002:a5d:5f48:0:b0:427:2e8:fe5e with SMTP id ffacd0b85a97d-42704d83898mr11741985f8f.13.1761051594394;
        Tue, 21 Oct 2025 05:59:54 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00ce56csm20023457f8f.50.2025.10.21.05.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:53 -0700 (PDT)
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
Subject: [PATCH v1 10/23] mm/balloon_compaction: drop fs.h include from balloon_compaction.h
Date: Tue, 21 Oct 2025 14:59:15 +0200
Message-ID: <20251021125929.377194-11-david@redhat.com>
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

Ever since commit 68f2736a8583 ("mm: Convert all PageMovable users to
movable_operations") we no longer store an inode in balloon_dev_info,
so we can stop including "fs.h".

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 7db66c2c86cdc..1452ea0635245 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -42,7 +42,6 @@
 #include <linux/migrate.h>
 #include <linux/gfp.h>
 #include <linux/err.h>
-#include <linux/fs.h>
 #include <linux/list.h>
 
 /*
-- 
2.51.0

