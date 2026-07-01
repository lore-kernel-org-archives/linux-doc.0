Received: from mx-2023-1.gwdg.de (mx-2023-1.gwdg.de [134.76.10.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE63C48BD2A;
	Wed,  1 Jul 2026 13:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.76.10.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910962; cv=none; b=IsVRJFUog3Fx8H5Jsw8FaaEIfict4FSUhpmQgM2lGRNznk0F4n/uIcTx/pi1Pp3f4JhxIEwJJgoHuz+UoQ9eMZEGCW1UJWXQiwp5jSj2HFyggotI7McDQAOVKsYmwpvDOM5ozS2MqK4UL72rdkpvb+Fom2RgsDlWVzz355hsejQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910962; c=relaxed/simple;
	bh=gIRBDH5MkVs4M65NaOL4Aqf/xk0q/mTwkbUGv/zYKOk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b/tsSbL6DZAchFBTDRTUWo3YwZek7ciuYE9kl27atiuZEXUSQ7FvlgBu64Smwjr3gxxijYSv/MB/8dBhYUt86l44Ad4xiaGmSS0BSK7qa8TNzA/6wCqvtZ2XP77LBGa9qSGJI3zdIWz+MJ+P0w4yJLGtJ7EXdqKVEBZ8dddUdVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cispa.de; spf=pass smtp.mailfrom=cispa.de; dkim=pass (2048-bit key) header.d=cispa.de header.i=@cispa.de header.b=ZhbIw9fq; arc=none smtp.client-ip=134.76.10.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cispa.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cispa.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cispa.de header.i=@cispa.de header.b="ZhbIw9fq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cispa.de;
	s=2023-rsa; h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=igSAA+qbMyAUJ/ctuYxX5vMbJh38ICoyVxEkz3kxQlY=; b=ZhbIw9fqquLvP+NzDA2txtXZ8+
	WImhoVahtRvkNl83N1vvPN7gfIsZtm1VHNI87ooxtvhKVdig9marOfxvLCjjCFSenNpXc1lHYKEXl
	C/P21mvQFxB1nigyI0O0+HsfPR/ZFZDHamKY6DAm9B1cEyWMqgNPsJYJBVuhtBfLOsBmPrgvQqzH4
	FZQvsA6Qb2tmtzDhDklGgCJGqkkE0bU66O29EaMenvbONl5kOsRtpAc65zansqIaMUv7uKq9DEIzJ
	+9JqTP4CkAWWlvkUnhTnUWgVORWdV7IvOlmwemw5hQ0O2wPcv1i1Fhx3HpYoPepzz96TF4F0Fw/fx
	o4m4vdLg==;
Received: from mailer.gwdg.de ([134.76.10.26]:52023)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1weu9E-004V6p-1q;
	Wed, 01 Jul 2026 14:34:36 +0200
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1weu9E-0001cN-1g;
	Wed, 01 Jul 2026 14:34:36 +0200
Received: from Mac (10.250.9.200) by MBX19-SUB-05.um.gwdg.de (10.108.142.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.43; Wed, 1 Jul
 2026 14:34:35 +0200
From: Lukas Gerlach <lukas.gerlach@cispa.de>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <corbet@lwn.net>,
	<linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <xu.xin16@zte.com.cn>, <chengming.zhou@linux.dev>,
	<skhan@linuxfoundation.org>, Lukas Gerlach <lukas.gerlach@cispa.de>, Jo Van
 Bulck <jo.vanbulck@cs.kuleuven.be>, Tristan Hornetz
	<tristan.hornetz@cispa.de>, Michael Schwarz <michael.schwarz@cispa.de>,
	Shukai Ni <shukai.ni@kuleuven.be>
Subject: [PATCH] mm/ksm: document side-channel security considerations
Date: Wed, 1 Jul 2026 14:34:30 +0200
Message-ID: <20260701123430.20699-1-lukas.gerlach@cispa.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <f75d286c-4d9e-4b64-8a9e-03e1afcb509f@kernel.org>
References: <f75d286c-4d9e-4b64-8a9e-03e1afcb509f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MBX19-GWD-07.um.gwdg.de (10.108.142.60) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-Spam-Level: -

KSM is known to enable side channels, but the admin guide does not
currently spell out the security implications of enabling page merging.
Because KSM merges pages by content across all processes with mergeable
memory, it forms a side channel that can be used to infer the contents
of that memory across security domains, regardless of the user,
container, or virtual machine the pages belong to.

Add a "Security considerations" section making this explicit, so that
operators can make an informed decision: KSM should only be enabled for
mutually trusting workloads, and any memory marked mergeable should be
assumed readable by every other process using KSM.

Co-developed-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
Signed-off-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
Cc: Tristan Hornetz <tristan.hornetz@cispa.de>
Cc: Michael Schwarz <michael.schwarz@cispa.de>
Cc: Shukai Ni <shukai.ni@kuleuven.be>
---
Hi David,

Thanks for the quick response.

I generally agree. The issue I see is that the current documentation
understates the risk. The RHEL documentation ("could be potentially
used to leak information across guests") does not read like enabling
KSM is an arbitrary read across VMs, which the side channel we
disclosed (in contrast to previous works) is. So the documentation
should really state that KSM is only an option for mutually trusted
workloads. A clean model for this would be to assume that memory
marked as mergeable is readable by everyone else using KSM.

Patch below to clarify this in the admin guide. We would, in the
future, publish a paper on this to further raise awareness of the
risks involved with KSM.

Greetings,
Lukas

 Documentation/admin-guide/mm/ksm.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-guide/mm/ksm.rst
index ad8e7a41f3b5..cbd5f2fdcfcb 100644
--- a/Documentation/admin-guide/mm/ksm.rst
+++ b/Documentation/admin-guide/mm/ksm.rst
@@ -27,6 +27,23 @@ KSM's merged pages were originally locked into kernel memory, but can now
 be swapped out just like other user pages (but sharing is broken when they
 are swapped back in: ksmd must rediscover their identity and merge again).

+Security considerations
+=======================
+
+Because KSM merges pages based on their content, across all processes
+with mergeable memory regardless of which user, container, or virtual
+machine they belong to, it exposes a side channel that can be used to
+infer the contents of mergeable memory across security domains.  Users
+should assume that any memory marked mergeable is readable by every
+other process using KSM.
+
+KSM should therefore only be enabled for mutually trusted workloads, or
+where the merged data is not sensitive; in particular, merging pages
+across mutually untrusted virtual machines or tenants is not secure.
+KSM is disabled by default (``run`` is 0).  Applications and VMMs that
+use ``MADV_MERGEABLE`` should limit it to regions that do not hold
+secrets.
+
 Controlling KSM with madvise
 ============================

--
2.51.0
