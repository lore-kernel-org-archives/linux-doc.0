Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513783;
	b=EUffEHePtqovZ+YqgvQWczLi6zYIx4yQVg0LD+RH3xv8nTemfjWQ2YvLOGu57g0GKEhJ
	 o1zmCU4oSDLpx5cNYarM+hjVbHWpWrrnexezWGCgIYMh4lnpib3WIkLG+8KNZ0zcEgkkP
	 xZeb2Q0eiAmkx4PQsb/8vs5MQbIS/TtOQRsSRtH9bPKQ0zxxD4F3OZF0B/ow6WSo/x+Yp
	 KJ6ooqiz3HWPubM+AWCSxK8kLL5MC/j5irvNoPRTMYnIef4YfFZ54Pp0Is28yDk4xhddn
	 3uzqXXx8oH6X3U4MSsQnZYNO63k1/cySOGR51jATWIGqp1bPwJ1yhiyQcz0wnGnmUeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513783;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=/a1vva7FqzaS/EgN3scQHwuVuCSoCiwNB6PDe0HjrWc=;
	b=rYXclIgWo0EKzHMSiEteJRZHqvahDby1ZqA6z3wryp6/IEQsb52PfG+nOnOG8G4Tpwa+
	 bYfHbSu2t+6nEVltEtQ4cuD2kF+AMQGwUgXSyjbAevtWpW1FFt0H4O3ux4Gzhiwtr1iVx
	 hW2OBm4egm3KUYttpYwa7vWd6CTX7SqzhGqBD1nFteAtMHQovnn0asp51jFNcnpnMDox6
	 JIpXKAorj6PFmCfw4A+w0iEUVFu2NKs6y+OZVRvdR/KOOYswsqWgnTCSDgkigCh8KjCuv
	 CaStIWtlOLdrQlbl5ketrm1sqlrLYU5PD3NUy+9U49y3alyBspSNYprT1cR9JLoVXZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ZxpLAg4W;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD4C606B022;
	Tue, 24 Nov 2026 09:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFD4C606B022
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ZxpLAg4W
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/a1vva7FqzaS/EgN3scQHwuVuCSoCiwNB6PDe0HjrWc=;
	b=ZxpLAg4WB2U9nxY1iEGcsHstPElDQ2ye5L07jf/yrmwEt+mXq0P3WZp8pgM2G5l/XkuHAP1dD
	IF3ClZBYY+vEiY2fiyJmg1e+t0ROrVQxAlhJgJe+qDsE8mXrL+EBImJZ7VCzd9hxGXY4XuEl1FJ
	RZl4hX7G/rX/1WhDJ8nLC70=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jYdLX5RBJzLlVT;
	Tue, 24 Nov 2026 17:49:08 +0800 (CST)
Received: from dggpemr200014.china.huawei.com (unknown [7.185.36.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 15AE840586;
	Tue, 24 Nov 2026 17:49:32 +0800 (CST)
Received: from whupemq100015.china.huawei.com (7.152.185.230) by
 dggpemr200014.china.huawei.com (7.185.36.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 24 Nov 2026 17:49:31 +0800
Received: from DESKTOP-62GVMTR.china.huawei.com (10.174.174.76) by
 whupemq100015.china.huawei.com (7.152.185.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 17:49:29 +0800
From: Fan Gong <gongfan1@huawei.com>
To: Fan Gong <gongfan1@huawei.com>, Wu Di <wudi234@huawei.com>, Teng Peisen
	<tengpeisen@huawei.com>, <netdev@vger.kernel.org>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Ioana Ciornei
	<ioana.ciornei@nxp.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>, Dimitri Daskalakis
	<dimitri.daskalakis1@gmail.com>, Harshitha Ramamurthy
	<hramamurthy@google.com>, Larysa Zaremba <larysa.zaremba@intel.com>, "Vadim
 Fedorenko" <vadim.fedorenko@linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Zhou Shuai
	<zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>
Subject: [PATCH net-next v07 0/1] net: hinic3: Bugfix for later patch-set.
Date: Tue, 24 Nov 2026 17:49:24 +0800
Message-ID: <cover.1795514513.git.gongfan1@huawei.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemq100015.china.huawei.com (7.152.185.230)

These issues were discovered by LLM Gemini-4-Argon and Claude-Opus-5-5.
At the same time, LLM recommended submitting an independent patch.
These issues were not actually triggered. Based on theoretical analysis
and consideration of actual risks, this patch is used to fix the issues.

Testing:
* Tested on hinic3 hardware.

v07:
* Start rx_oom_work disabled right after INIT_DELAYED_WORK(), so the
  first enable_delayed_work() in hinic3_qps_irq_init() does not underflow
  the work disable count.(AI Review)

v06: https://lore.kernel.org/netdev/cover.1795417161.git.gongfan1@huawei.com/
* Enable rx_oom_work in hinic3_qps_irq_init() and disable it with
  disable_delayed_work_sync() after the NAPI instances are torn down and
  on the init rollback path, so it cannot be queued again.(AI Review)
* hinic3_rx_oom_work() uses HINIC3_INTF_UP to keep the pending queues
  and retry.(AI Review)

v05: https://lore.kernel.org/netdev/cover.1795144996.git.gongfan1@huawei.com/
* Replace the NAPI busy-poll on RX allocation failure with the software RX
  OOM recovery: a per-queue bitmap plus a delayed work that re-arms NAPI,
  so NAPI completes instead of spinning while memory is under
  pressure.(Jakub Kicinski)
* Return budget only for the LRO replenishment threshold.
* The u64_stats reader, the 80 column wrapping and the max_qps patches of
  v04 have been merged as 66726ba54a01; this series carries the RX stall
  fix only.

v04: https://lore.kernel.org/netdev/cover.1794917917.git.gongfan1@huawei.com/
* Fold a short ring refill into the hinic3_rx_poll() repoll decision: with
  no WQE posted the device raises no interrupt, so returning nr_pkts left
  the queue dead until the interface is reset.(AI Review)
* Keep csum_errors in rx_errors, and describe the u64_stats reader change
  as the cleanup it is: the driver depends on 64BIT, so the retry never
  happens. Drop the Fixes: tag.(AI Review)
* Rewrite "fix some checkpatchs.": name what is wrapped and renamed, and
  note that the patch has no functional effect.(AI Review)
* Reword "Ensure that the value of max_qps is not changed": max_qps sizes
  the software arrays, the hardware capacity is nic_io->max_qps, and the
  change is a design change rather than a fix (no Fixes: tag).(AI Review)

V03: https://lore.kernel.org/all/cover.1794467919.git.gongfan1@huawei.com/
* Cleanup checkpatchs in file hinic3_netdev_ops.c.(AI Review)
* nic_svc_cap->max_sqs is already in the range [1, 256].(AI Review)

V02: https://lore.kernel.org/all/cover.1794371175.git.gongfan1@huawei.com/
* Rewrite the commit message and provide an explanation for each
  patch.(AI Review)
* Split checkpatchs in to a separate patch.(AI Review)
* Fix the failure of napi_alloc_skb() in recv_one_pkt().(AI Review)
* READ_ONCE()/WRITE_ONCE() only stop the compiler from tearing or caching
  the access. They don't order anything against the work item, and they
  can't stop it from running. So, remove READ_ONCE() and WRITE_ONCE() on
  nic_dev->adaptive_rx_coal.(AI Review)

V01: https://lore.kernel.org/netdev/cover.1793946318.git.gongfan1@huawei.com/

Fan Gong (1):
  hinic3: Fix the RX stalls in hinic3_rx_poll()

 .../net/ethernet/huawei/hinic3/hinic3_irq.c   | 10 +++
 .../net/ethernet/huawei/hinic3/hinic3_main.c  | 63 ++++++++++++++++++-
 .../ethernet/huawei/hinic3/hinic3_nic_dev.h   |  3 +
 .../net/ethernet/huawei/hinic3/hinic3_rx.c    | 26 ++++++--
 4 files changed, 96 insertions(+), 6 deletions(-)


base-commit: 66726ba54a01a2951688a56f5eb4d13d063acbea
-- 
2.43.0

