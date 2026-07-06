Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6251A357D00
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 15:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352734; cv=none; b=nRa/8a1EwAeLh8wxp35Wyrt2xSvgAQJCYOYrivuz3KWTIWNvzYV54rjIs2oICDiIE8AmY1weWKiijXZhNRr48CEYV/2/v5ZW/+vdSf1p145DYlGKyO62miN9XNJ2JKXLVhCoHuTVdUhF4sbCbDrAoE1dYUl7ualehQqGkPIndTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352734; c=relaxed/simple;
	bh=quHH+6PWYfuMuJVQZcavOiesokEX0sSSXUjM54axXnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXKpYrgt5me9boRRPRHhlW0uJEjkzzUlKyuzoVli4hmOWfKvXli6rqt/X03iMuGByIgFx85lsmB+9hIfE9NN4rZi2tj24QxdkmYRV6XtiR0TLmwLXEstG8zMbUMXvNvHUgRIAjkJrF3iWihIDabDH8Nu3j2GjMu3yNLQJZd7hkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GHLdo+2k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GHLdo+2k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+9/R9m8CliZKPXWKCxsJPwwuxejAeoC8BdbX1cAR2zc=;
	b=GHLdo+2k0gAkoZIp+7ujEZiMHiyyenC87uftYQJ4y8EVwW5Y1HoI4suA0LgLbCdVYJHuea
	XoycJnfz0795CdQmrpBJG3v01aCLS7Fse8uO14Fi6U8tq7SMnJdjXstIpopy7bWQJDEK4M
	oZwjog0Nsss5NCfJp5euLujoeawlCno=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-159-iHLT0QhtOVa6q7-HMCiueQ-1; Mon,
 06 Jul 2026 11:45:25 -0400
X-MC-Unique: iHLT0QhtOVa6q7-HMCiueQ-1
X-Mimecast-MFC-AGG-ID: iHLT0QhtOVa6q7-HMCiueQ_1783352722
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 94FBF1955DBE;
	Mon,  6 Jul 2026 15:45:22 +0000 (UTC)
Received: from p1.redhat.com (unknown [10.22.58.4])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6A910195604B;
	Mon,  6 Jul 2026 15:45:14 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Nico Pache <npache@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 8/8] mm: Documentation: clarify where the mTHP stats live
Date: Mon,  6 Jul 2026 09:44:55 -0600
Message-ID: <20260706154500.39178-9-npache@redhat.com>
In-Reply-To: <20260706154500.39178-1-npache@redhat.com>
References: <20260706154500.39178-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The note about khugepaged counters references /proc/vmstat for the PMD
case, but never mentions where the mTHPs stats can be found
(i.e.: /sys/kernel/mm/transparent_hugepage/hugepages-<size>kB/stats/)
Add a small addition to this section for clarity.

Also fix a missing period while we are at it.

Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
Signed-off-by: Nico Pache <npache@redhat.com>
---
 Documentation/admin-guide/mm/transhuge.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index 23f8d13c2629..123ea281082c 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -224,7 +224,7 @@ khugepaged will be automatically started when any THP size is enabled
 (either of the per-size anon control or the top-level control are set
 to "always" or "madvise"), and it'll be automatically shutdown when
 all THP sizes are disabled (when both the per-size anon control and the
-top-level control are "never")
+top-level control are "never").
 
 process THP controls
 --------------------
@@ -301,7 +301,9 @@ being replaced by a PMD mapping, or (2) physical pages replaced by one
 hugepage of various sizes (PMD-sized or mTHP). Each may happen independently,
 or together, depending on the type of memory and the failures that occur.
 As such, this value should be interpreted roughly as a sign of progress,
-and counters in /proc/vmstat consulted for more accurate accounting)::
+and counters in /proc/vmstat consulted for more accurate accounting.
+Per-order mTHP collapse statistics are also available under
+/sys/kernel/mm/transparent_hugepage/hugepages-<size>kB/stats/)::
 
 	/sys/kernel/mm/transparent_hugepage/khugepaged/pages_collapsed
 
-- 
2.54.0

