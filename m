Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A559C1A9FB0
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 03:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084494; cv=none; b=HDhXWypi5W2QaDS2faMOvLXM2ZeVQXk4wI8wkB+xLrfngOM27FDlBc0/UOByhdIhGqgvG3MhSjvXwGLCaBQaG+pjc7lGhfc74TafUQMfcDaebOwHffgU6r627zvIEcUHL4J3UsjlCgZCE7Rp+tIX0wz/0tNq3wHQZPdxCjcjEAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084494; c=relaxed/simple;
	bh=pIVoiqjlNVCk10yLQulMwW5KkPxiVNnoMH41RZkdLiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MbY16fbp7JxyUf5ltAWcQWasFpP4vzJUGG2CrNoingymMzFHsgNUS8acQNxTO1IKY37bYY2ktnQRjMAC9m5sEqykPyBT+X4qdBK49k32rs87BF/TY4c1EuwkeIbAMZWiaekgoEK5gn145tdtHROTiSqN/JCGJ9MxC3q3upwdIBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jTwAxPny; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jTwAxPny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784084489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5TDsdIa8Xg5/7TFb8E//3LgWq7maer0xFr2rl4UMK3c=;
	b=jTwAxPnyDviMWhsCWOl/aRsCPpEdKDh/hcv8/dyvtGy1cp0CJ3EU57G/knXtlCSUHNOepl
	opaL0P71Ov5jQjjQdxb0o0qUYaYLl+jqL3ZfK2uS+sjLy87lmlyCAhyFeGA5GobwFcTg+V
	emIcz0lVoeoX8RMmo04c4cb5SN/DP8U=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-DN0lcp4kP0eGz8Mp95imLg-1; Tue,
 14 Jul 2026 23:01:23 -0400
X-MC-Unique: DN0lcp4kP0eGz8Mp95imLg-1
X-Mimecast-MFC-AGG-ID: DN0lcp4kP0eGz8Mp95imLg_1784084480
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5BE501800361;
	Wed, 15 Jul 2026 03:01:20 +0000 (UTC)
Received: from p1.redhat.com (unknown [10.22.76.5])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 807BB180028B;
	Wed, 15 Jul 2026 03:01:10 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Nico Pache <npache@redhat.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
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
Subject: [PATCH v2 7/7] mm: Documentation: clarify where the mTHP stats live
Date: Tue, 14 Jul 2026 20:59:36 -0600
Message-ID: <20260715025941.1571316-8-npache@redhat.com>
In-Reply-To: <20260715025941.1571316-1-npache@redhat.com>
References: <20260715025941.1571316-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The note about khugepaged counters references /proc/vmstat for the PMD
case, but never mentions where the mTHPs stats can be found
(i.e.: /sys/kernel/mm/transparent_hugepage/hugepages-<size>kB/stats/)
Add a small addition to this section for clarity.

Also fix a missing period while we are at it.

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
Signed-off-by: Nico Pache <npache@redhat.com>
---
 Documentation/admin-guide/mm/transhuge.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index 16f37135ed80..b187d618452f 100644
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

