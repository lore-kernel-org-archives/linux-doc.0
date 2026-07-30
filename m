Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C99640860E;
	Thu, 30 Jul 2026 12:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.42.203.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785416139; cv=none; b=baRt3ngJUH0iNCYdYsxwwB+QoKnAzUvbglqr7Tyk7m6H7ryE/0BSdBEG7K+i6cOCkrK+SzNSzRTEAnLdK1q9mPfsGD5lmTZj0FgmTLH0eMsyG9IrGlszuNt4q75Rgs0lk6M2xO3BwnlPdOKjtfTc5EehVp27Idm+1ShJjInmCxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785416139; c=relaxed/simple;
	bh=gOfxoW1bomE6RgcNVyI5PQCmnIe6F16GdSCfHAPPlAc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tqty5sB7Mkhd6C1Uw8pC0Sz+zUVi1c+DXkccV2x/YjMQYPVTjOjt1/qja0O1mdNmsUrdhk1ZpfhnB8L5Is18W5W/kM8w+Kt3aqUTruAMhIpqe3Pjb7BwqymQIciiepGOHVVeascTsbRT4skFAACzYgTzmEuhbVrA29Gu3vqqOQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=mOCKrnav; arc=none smtp.client-ip=52.42.203.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="mOCKrnav"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785416138; x=1816952138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WXFmvCh8DgfRdZzV6o0qyZa1X0YTs5ZqnbjqZWxXUO0=;
  b=mOCKrnavJfK3qxOGJDOAIDglSl14jjJWBHiUpTrIFnDO+3VbNhiTqUJ/
   WWhGuHk9ONLJWpuKvFsEqZ2RBnLFIPrdR0QsIR4mzw7v6BgG73EqJEoUq
   MIiNU+AgkurL9fzuYdtZoq7J7LUVDiXyh9J+/TqfrPPqLncoxoN/Lyq9I
   nLJrwi6Z/dWD12Dm1B7/nMTrMrair49TgcqAB0HYTiXa3W2DcfT5md3bc
   GG7qB11A9yLlG/rXQipvXYOYX9I9aYlJbwkxB+INQFZoZoMotGiH7wafb
   TOTjGga4rZ0/C/7hu7ghf8Z7ADfQrfAtrOcnwETQu4Hs9RdDPs5uUPAah
   A==;
X-CSE-ConnectionGUID: 29n43BPXT62U7sP1Ya2hUQ==
X-CSE-MsgGUID: lTqtfySfTRGajnGHMRxaDw==
X-IronPort-AV: E=Sophos;i="6.25,194,1779148800"; 
   d="scan'208";a="24687693"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 12:55:37 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:10824]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.11:2525] with esmtp (Farcaster)
 id 22f9b494-a818-41ec-af57-3c7c94b3263b; Thu, 30 Jul 2026 12:55:37 +0000 (UTC)
X-Farcaster-Flow-ID: 22f9b494-a818-41ec-af57-3c7c94b3263b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:55:37 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:55:35 +0000
From: Alexander Graf <graf@amazon.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
	<corbet@lwn.net>
CC: The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Shuah Khan <skhan@linuxfoundation.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<mancio@amazon.com>, <diapop@amazon.com>, <mknaust@amazon.com>
Subject: [PATCH 8/8] Documentation: virt: Describe multi-NUMA Nitro Enclaves CPU pools
Date: Thu, 30 Jul 2026 12:53:12 +0000
Message-ID: <20260730125312.71415-9-graf@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260730125312.71415-1-graf@amazon.com>
References: <20260730125312.71415-1-graf@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D032UWA002.ant.amazon.com (10.13.139.81) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

The Nitro Enclaves overview tells an admin flatly that enclave memory
and CPUs come from the same NUMA node, and that is the page's only
mention of NUMA. The rule stops applying once the CPU pool spans
nodes. What replaces it lives in the NE_ADD_VCPU,
NE_SET_USER_MEMORY_REGION and NE_SET_ALLOC_NUMA_NODE kerneldoc and in
the cpu_pool sysfs ABI file, and the overview references none of them.
Qualify the sentence, and give the page a section covering which node
an allocation targets by default, how to move that target, and how to
read per-node occupancy out of the sysfs group.

A cross-reference to the header and the ABI file instead would have
left one copy of the behaviour to keep current, at the cost of sending
an admin who wanted only to know whether the rule still applied into a
uapi header. The section goes after the rest of the overview rather
than into the middle of it, so the paragraphs on vsock, the image
format and attestation stay part of the overview instead of ending up
underneath a CPU pool heading.

Assisted-by: Kiro:claude-opus-5
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 Documentation/virt/ne_overview.rst | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/ne_overview.rst b/Documentation/virt/ne_overview.rst
index 74c2f5919c88..157b632d7437 100644
--- a/Documentation/virt/ne_overview.rst
+++ b/Documentation/virt/ne_overview.rst
@@ -47,7 +47,8 @@ The memory regions carved out of the primary VM and given to an enclave need to
 be aligned 2 MiB / 1 GiB physically contiguous memory regions (or multiple of
 this size e.g. 8 MiB). The memory can be allocated e.g. by using hugetlbfs from
 user space [2][3][7]. The memory size for an enclave needs to be at least
-64 MiB. The enclave memory and CPUs need to be from the same NUMA node.
+64 MiB. The enclave memory and CPUs need to be from the same NUMA node,
+unless the CPU pool spans several of them; see `Multi-NUMA CPU pools`_.
 
 An enclave runs on dedicated cores. CPU 0 and its CPU siblings need to remain
 available for the primary VM. A CPU pool has to be set for NE purposes by an
@@ -90,6 +91,28 @@ the NE driver. This event is sent further to the user space enclave process
 running in the primary VM via a poll notification mechanism. Then the user space
 enclave process can exit.
 
+Multi-NUMA CPU pools
+--------------------
+
+The CPU pool may span multiple NUMA nodes. When it does, kernel-side
+allocations for a new enclave target the node that owns the first core in
+the pool: NE_ADD_VCPU with vcpu_id == 0 draws a core from that node, and
+does not spill to another node once that node has none left. User space
+moves the target with NE_SET_ALLOC_NUMA_NODE, and can move it between
+allocations to build an enclave that spans nodes. Passing
+NE_ALLOC_NUMA_NODE_ANY as the node lets an allocation come from any node
+in the pool.
+
+The target says where cores come from and nothing else. An enclave built
+out of a pool that spans nodes has no node of its own, so the rule that
+its memory be on that node does not apply to it and its memory can come
+from anywhere.
+
+The pool mode and occupancy are readable under
+/sys/devices/virtual/misc/nitro_enclaves/cpu_pool/. Intersect ``avail``
+with /sys/devices/system/node/nodeN/cpulist for the threads still free on
+one node.
+
 [1] https://aws.amazon.com/ec2/nitro/nitro-enclaves/
 [2] https://www.kernel.org/doc/html/latest/admin-guide/mm/hugetlbpage.html
 [3] https://lwn.net/Articles/807108/
-- 
2.47.1

