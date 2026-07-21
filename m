Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B1938238F
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 11:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632802; cv=none; b=amb6QbkyEGRU47DZfLN/VmSDH1a81+VgDmqwQsx+dvjL/Lb8wlFeue4PTYRrqEXkASXLRod4G+c4lixtBQIzJU+qyaGbzGcfoKoPqxQ2/z1lW8EBTRM0y2zgptR4AO4X6mYrlFeMzKK7BdKuiWcLJG6SCoD8VOPIqjMxG5NGi48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632802; c=relaxed/simple;
	bh=VstWFe1QGiLgqMfN9MhMyJmjYtgBbA+GCpM1/cHklkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SN4xUPJh+NlmlWf5RTN+oB4CtwikkBTjNCSUees49eYPiWgjNGAtuHqB9Z644DaTlvcpoSSczHBMGoea5GzJSFdipysBixaDyEi61X/9kAzarGgKRwKxdrJh4SFllPjeby08rtygxHoFzw9Z+AGxbt6eH9B/rq6svwt0Hb/OybY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eQOaxyJc; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eQOaxyJc"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784632787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uSH6xOaL/2+ur3DFoIQmHK2qeCYPezL02KujIX/OmBU=;
	b=eQOaxyJcCAlYAbiR4y3RqVxueLsjhvF0KS7IiI463PKNcpwLd68vxYFQrfI55HkKKPnS/S
	lukSTPU1madTjYLXejpDZoDxZkc0EwMDLuM1vVcjzJVOLaC+SCJU7y5xpJyV/cOYEFCGGo
	gXhlf0ZI3bLdCDd6imLrnuh7XRKng+M=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH] docs/mm: Physical Memory: remove deferred_split_queue
Date: Tue, 21 Jul 2026 19:19:19 +0800
Message-ID: <20260721111919.22923-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

deferred_split_queue was removed from struct pglist_data {} in commit
fafaeceb89a5 ("mm: switch deferred split shrinker to list_lru").  Remove
its description in doc as well.

Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 Documentation/mm/physical_memory.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/mm/physical_memory.rst b/Documentation/mm/physical_memory.rst
index b76183545e5b..a09407d72973 100644
--- a/Documentation/mm/physical_memory.rst
+++ b/Documentation/mm/physical_memory.rst
@@ -262,9 +262,6 @@ General
   PFN that needs to be initialized. Defined only when
   ``CONFIG_DEFERRED_STRUCT_PAGE_INIT`` is enabled
 
-``deferred_split_queue``
-  Per-node queue of huge pages that their split was deferred. Defined only when ``CONFIG_TRANSPARENT_HUGEPAGE`` is enabled.
-
 ``__lruvec``
   Per-node lruvec holding LRU lists and related parameters. Used only when
   memory cgroups are disabled. It should not be accessed directly, use
-- 
2.53.0

