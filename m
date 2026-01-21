Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FA630B521
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999239; cv=none; b=kLYCEG4k1YYpd/zsqvK+8zjPUmzAMY3JILiY8s6Uh94EdpCrbhzGVjkETFuMpGnhsc+na7XW8WQwLU0A4RJyZ75wY2MJoT/eImSN8mVuTfdcXRoUmNKWpujAzl0nWHgNscqtNiIG7OW5thowz8zHcyyVw9o13K4DT4yErqWxWOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999239; c=relaxed/simple;
	bh=KX0jdUNzXru7m+7hjkqbLQeZGOGKF1Jq6B5UtBA/uVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFQ1o/TpCUG63n5KoyP4u6bIu+/b/VxJdLBmcwp0hCQewSxIu0P2VfOxp5iiGv0vuL5oc2YFJsQrIYY+8a0hY3sfImjNGQtG944Ia4M43cCg3KHXwokHIAJpKEGH/DZIfxsI2t5Lvepk/4rmPUjHV84j6LLBykFZ1B+KC/ZCkgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vYegVE80; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vYegVE80"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768999233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P/QIycmg/Rp660OZ1P92MK5kFHPJosNCmQKo3uxOY+w=;
	b=vYegVE80q2P99aKNiXmOPWPUQvsIvoabN/PTHj4Kum0jSGe4HmwxKwWaVgP+XTxQLU9Vc+
	xDL3GVtpm/ae90vlif6u21ElxIQ6gqwqm9oy1I8eyEFB4UGCb5zfTqhGJgQigxRYLi34D1
	Ueac4zqmHjZtQ1v/IRwv8W4qr+aZYv4=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: linux-mm@kvack.org
Cc: Jiayuan Chen <jiayuan.chen@shopee.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] docs/cgroup: document memory.lru_gen interface
Date: Wed, 21 Jan 2026 20:39:49 +0800
Message-ID: <20260121123955.84806-4-jiayuan.chen@linux.dev>
In-Reply-To: <20260121123955.84806-1-jiayuan.chen@linux.dev>
References: <20260121123955.84806-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Jiayuan Chen <jiayuan.chen@shopee.com>

Add documentation for the memory.lru_gen interface in cgroup v2.
For detailed information about MGLRU and the command format, refer
to the multi-gen LRU documentation.

Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 7f5b59d95fce..bb3ca7ffd600 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1426,6 +1426,23 @@ PAGE_SIZE multiple when read back.
 	This means that the networking layer will not adapt based on
 	reclaim induced by memory.reclaim.
 
+  memory.lru_gen
+	A read-write file that exists when CONFIG_LRU_GEN is enabled.
+
+	Reading this file displays the multi-gen LRU information for
+	this memcg, including generation numbers, page counts for
+	anonymous and file pages across all NUMA nodes.
+
+	Writing to this file allows performing aging or eviction
+	operations on this memcg. The format is::
+
+	  echo '<cmd> <node_id> <seq> [<swappiness> [<opt>]]' > memory.lru_gen
+
+	This interface provides the same functionality as the debugfs
+	lru_gen interface but operates directly on the cgroup without
+	requiring the memcg_id. For detailed documentation of the
+	command format and MGLRU, see Documentation/admin-guide/mm/multigen_lru.rst.
+
 The following nested keys are defined.
 
 	  ==========            ================================
-- 
2.43.0

