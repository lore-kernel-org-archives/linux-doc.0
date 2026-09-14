Received: from smtp1.cs.Stanford.EDU (smtp1.cs.stanford.edu [171.64.64.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2CC433BBD
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 23:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=171.64.64.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789427162; cv=none; b=GXSK/kZkMeSrd3Psfwk+eBa3Omh2KRBPKGZkwuUWHS1lhjAJrRFrKNc81pGocONFsHOX+T3yYRZQ0KVLEljUAg8dBOX9ofHMEfjGAxoMfWx6pOetQnglMAgCmUNpyM/0LMF7dVJ75fFIHZJTF/dJO3855pM2h6msXlCepeQaom8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789427162; c=relaxed/simple;
	bh=l/yDWv7wY0mDpsM/Wa7OyOraYCMVN9hfaEseIjJ+Jj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qFRZdwC6wqBEIWDGsyb0WOcaSLq1Cb456LTd3xsDe6L3ZPeBrNMJ1cbQbwwdvHADZd3g6tmH21rZA89qiPG4g+6S1yABf4ztchzJNGfs0LRAlHxhr797j1nLYEUgd/kKDkubxQ53Ux30/p8Dx6QzcsQ0dOJYoCvgHcCTgq8fZsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.stanford.edu; spf=pass smtp.mailfrom=cs.stanford.edu; dkim=pass (2048-bit key) header.d=cs.stanford.edu header.i=@cs.stanford.edu header.b=TEOkqfb7; arc=none smtp.client-ip=171.64.64.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.stanford.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.stanford.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.stanford.edu header.i=@cs.stanford.edu header.b="TEOkqfb7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cs.stanford.edu; s=cs2308; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4w6RQ5eFE0PM60EbSYzSzDxcHf4q5Io32QmXXY8NWBc=; t=1789427160; x=1790291160; 
	b=TEOkqfb7ICG3wSUdHG7bIjh+lCyaYiYzOYzAyHedEdxZ/pwmo9Y3+6gkaKY4+cEOT3HfPTmE9/m
	feCM6FgMgNHOGs4BZO9VVDzGATBT91fLqQdApETz9JjBDCEz1q4FkEsfIlO/TghABZDII0UH10Ax5
	1Wa+dTGMarz88+zqZuUzdkdv9r9U4jejOm+SSM0yXu91n6+Ta4AtdX8xvpzGeK2WRXBc4fSJysvQq
	KoJmNVjeA8XB2IzoUoQo340NWYyb6CE46QcKXOCEnu/QZUXBukQuvPz64bF5M90yPeGVTr/1uvM69
	Zv9JOTvTmnhF5668jyKZF70wRZbQJWDhzb0A==;
Received: from ouster448.stanford.edu ([172.24.72.71]:60752 helo=cs.stanford.edu)
	by smtp1.cs.Stanford.EDU with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ouster@cs.stanford.edu>)
	id 1x6FkL-0007WN-8b; Mon, 14 Sep 2026 16:05:58 -0700
From: John Ousterhout <ouster@cs.stanford.edu>
To: netdev@vger.kernel.org
Cc: pabeni@redhat.com,
	edumazet@google.com,
	horms@kernel.org,
	kuba@kernel.org,
	skhan@linuxfoundation.org,
	bagasdotme@gmail.com,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	John Ousterhout <ouster@cs.stanford.edu>
Subject: [PATCH net-next v11 15/15] net: homa: create Makefile and Kconfig
Date: Mon, 14 Sep 2026 16:05:15 -0700
Message-ID: <20260914230517.1190-16-ouster@cs.stanford.edu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260914230517.1190-1-ouster@cs.stanford.edu>
References: <20260914230517.1190-1-ouster@cs.stanford.edu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -101.0
X-Scan-Signature: 1a99e790efc5595ebc7b409aae77a077

Before this commit the Homa code is "inert": it won't be compiled
in kernel builds. This commit adds Homa's Makefile and Kconfig, and
also links Homa into net/Makefile and net/Kconfig, so that Homa
will be built during kernel builds if enabled (it is disabled by
default).

Signed-off-by: John Ousterhout <ouster@cs.stanford.edu>
---
 net/Kconfig       |  1 +
 net/Makefile      |  1 +
 net/homa/Kconfig  | 20 ++++++++++++++++++++
 net/homa/Makefile | 16 ++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 net/homa/Kconfig
 create mode 100644 net/homa/Makefile

diff --git a/net/Kconfig b/net/Kconfig
index e38477393551..6780fee341a0 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -252,6 +252,7 @@ source "net/bridge/netfilter/Kconfig"
 endif # if NETFILTER
 
 source "net/sctp/Kconfig"
+source "net/homa/Kconfig"
 source "net/rds/Kconfig"
 source "net/tipc/Kconfig"
 source "net/atm/Kconfig"
diff --git a/net/Makefile b/net/Makefile
index 5b2dd7f07a85..f9a3c966a83b 100644
--- a/net/Makefile
+++ b/net/Makefile
@@ -40,6 +40,7 @@ ifneq ($(CONFIG_VLAN_8021Q),)
 obj-y				+= 8021q/
 endif
 obj-$(CONFIG_IP_SCTP)		+= sctp/
+obj-$(CONFIG_HOMA)		+= homa/
 obj-$(CONFIG_RDS)		+= rds/
 obj-$(CONFIG_WIRELESS)		+= wireless/
 obj-$(CONFIG_MAC80211)		+= mac80211/
diff --git a/net/homa/Kconfig b/net/homa/Kconfig
new file mode 100644
index 000000000000..a420ea18b6c1
--- /dev/null
+++ b/net/homa/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: BSD-2-Clause OR GPL-2.0+
+#
+# Homa transport protocol
+#
+
+config HOMA
+	tristate "The Homa transport protocol"
+	depends on IPV6
+
+	help
+	  Homa is a network transport protocol for communication within
+	  a datacenter. It provides significantly lower latency than TCP,
+	  particularly for workloads containing a mixture of large and small
+	  messages operating at high network utilization. At present, Homa
+	  has been only partially upstreamed; this version provides bare-bones
+	  functionality but is not performant. For more information see the
+	  homa(7) man page or checkout the Homa Wiki at
+	  https://homa-transport.atlassian.net/wiki/spaces/HOMA/overview.
+
+	  If unsure, say N.
diff --git a/net/homa/Makefile b/net/homa/Makefile
new file mode 100644
index 000000000000..b36e7fca19b5
--- /dev/null
+++ b/net/homa/Makefile
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: BSD-2-Clause OR GPL-2.0+
+#
+# Makefile for the Linux implementation of the Homa transport protocol.
+
+obj-$(CONFIG_HOMA) += homa.o
+homa-y:=        homa_incoming.o \
+		homa_interest.o \
+		homa_outgoing.o \
+		homa_peer.o \
+		homa_plumbing.o \
+		homa_pool.o \
+		homa_rpc.o \
+		homa_sock.o \
+		homa_timer.o \
+		homa_tx_pool.o \
+		homa_utils.o
-- 
2.43.0

