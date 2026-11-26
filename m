Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699725;
	b=yyl97+09g5Tx1/+EORlrf3nwQCTphqm+KhxQjikozDfkJiU787IPt4eurajYgBXLCTmA
	 1zKI2newdGoWZzDM0uYp/DHu5yqNs8wWb1xfEDaApJDBUwuecHd8YdArCliKjVgYAsgpx
	 S3Y6BELiXjlpaRE7D7dS+ohv0wjSmgCBGu1c6ATNtY5383dyLBcOfUTozioWEV84TRR8e
	 jkluhXhEAc8whKomrbJ5arJvBwu/48ZxOqKy/w/Gb1eWvFApwta7UVL9gktDg/ephW27c
	 yxhr15HgoTcc8kc8TASi11duuGCA990Lc13IecRcYWhf0/Yl6n6UxiQzc/CUeuryLcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699725;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sePCiVauuSqOAnYV288wGjdkvSBQky2K126fYSbUmfE=;
	b=dlJTX+IN3cSAOcJ2bVct7yDBe6GX/Iyz73cgmmGQo4hmt74xvnzpkwSgwHNrPvfYEykf
	 IntjQfzCUYItB5GQXztJzbtuW09eqDrpqy+a/BGDxTU3tQjnQzgEmocc4vvGyQ+AMm6vi
	 n7bl2xMFtl8wbJdujKUiBpbxRy8gBRLFrEDbDH49GgCjT3FluChU/lJ4/8aCF312Wgs/F
	 LTvAGv40xfEKfPllh7KjhhSekPiflm2xuqwb0AgSY1msa/8sJCa1748vwIG4gPGAGlkkb
	 334B+Td6NhwHF7Z2Zlc7fwQfkTfdkn+yb/t1DPIujvXQw+fKVneLRVJjrRAxuXHRw2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="f/lgjcs5";
	arc=none smtp.remote-ip=95.215.58.5
Received: from mta1.migadu.com (out-5.mta1.migadu.com [95.215.58.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA009606A326
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 13:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA009606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=f/lgjcs5
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=voPRCI34GRzvXMCYJVFRcZ9FG3JeoOsk3CVz5w57PG8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795699722; v=1; x=1796304522;
 b=f/lgjcs5EPQFGFQDkFnuQQ/8OEGrrbv11aOqmPC7BOxw7OjN4jb4+f/wyuydPmR8vHCs7k+b
 HzgCYeFog3DVy49Pwpq5BzZqOxZosgrZnJ7OWPD0gE6wHvje0owSk3Zja4dc503XMkXtPBZt9FE
 CJQz05ln2qRgIIw4C1TpXHyY=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 228c84f2e902d042;
	Thu, 26 Nov 2026 13:28:42 +0000
X-Mizu-Trace-ID: 228c84f2e902d042
X-Migadu-Flow: FLOW_OUT
From: xiongwei.song@linux.dev
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	wy@wyuan.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	paulmck@kernel.org,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiongwei Song <xiongwei.song@linux.dev>
Subject: [PATCH v3 1/2] docs/zh_CN: Add RCU/index.rst translation
Date: Thu, 26 Nov 2026 21:28:00 +0800
Message-ID: <20261126132802.6627-2-xiongwei.song@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261126132802.6627-1-xiongwei.song@linux.dev>
References: <20261126132802.6627-1-xiongwei.song@linux.dev>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Xiongwei Song <xiongwei.song@linux.dev>

Translate .../RCU/index.rst into Chinese and update subsystem-apis.rst

Update the translation through commit b3eb16109ae1
("doc: Update stallwarn.rst based on RCU Tasks Trace as SRCU")

Signed-off-by: Xiongwei Song <xiongwei.song@linux.dev>
---
 .../translations/zh_CN/RCU/index.rst          | 49 +++++++++++++++++++
 .../translations/zh_CN/subsystem-apis.rst     |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/RCU/index.rst

diff --git a/Documentation/translations/zh_CN/RCU/index.rst b/Documentation/translations/zh_CN/RCU/index.rst
new file mode 100644
index 000000000000..3675da1a2993
--- /dev/null
+++ b/Documentation/translations/zh_CN/RCU/index.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _zh_cn_rcu_handbook:
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/RCU/index.rst
+
+:翻译:
+
+ 宋雄微 Xiongwei Song <xiongwei.song@linux.dev>
+
+:校译:
+
+============
+RCU Handbook
+============
+
+.. toctree::
+   :maxdepth: 2
+
+TODOLIST:
+
+* checklist
+* lockdep
+* lockdep-splat
+* rcubarrier
+* rcu_dereference
+* whatisRCU
+* rcu
+* rculist_nulls
+* rcuref
+* torture
+* stallwarn
+* listRCU
+* NMI-RCU
+* UP
+
+* Design/Memory-Ordering/Tree-RCU-Memory-Ordering
+* Design/Expedited-Grace-Periods/Expedited-Grace-Periods
+* Design/Requirements/Requirements
+* Design/Data-Structures/Data-Structures
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
index b52e1feb0167..4488a97934ec 100644
--- a/Documentation/translations/zh_CN/subsystem-apis.rst
+++ b/Documentation/translations/zh_CN/subsystem-apis.rst
@@ -29,6 +29,7 @@
    power/index
    scheduler/index
    locking/index
+   RCU/index
 
 TODOList:
 
-- 
2.52.0

