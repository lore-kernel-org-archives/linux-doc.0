Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795144476;
	b=hMSBZV8WE4FuNNpOYfzTRVE71JCqpkygHDijdvd/d3nSc0fNKE5pbzKx8XdW4I4TgNMr
	 EMIvD4Kjgz8SeK8NloYy86xMWtISothTtd0ychhc/FQCjOthnMg/JPRNVggbe1/6tB5B9
	 Csnikiof5MhE80w7j3b93LaYiBb2u8fkU55O3HQtHdxuR0LZWqOJ3meLwa3sHRtFMXY2n
	 OSsMnGP6Sg6ZcauhrfebxnTb5zWpAK8dSjxhClVlwtX2BT5c6G8PO5jrbfDmnTkBXWGbA
	 ZZebcUoPZFYB6xMHG8iacbDhxRDsf3gkV+skvUEI9yTAp/E+zzEGX+Tk17t9M72tw/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144476;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Tl/7Xner5ax86FOmOQg4kefqyaY/77rqLwd/Plguljw=;
	b=HLwwVzrjxMj7rmvz10C7q7a8C07sp5qW6Bf/eDx6Xh2ZHiG2iLtpbwBpFJ/e6232ElcJ
	 H2a6X+tpVXy3MDV02yWyM4ipmqZNlQuIjqZ7qqOBta7IEyHc+aCCQ+jEwWoJwVRoX5s2i
	 +vM9Z88YvrNyFAQVFgzgPp9K6WtlfY71GRUVzIvL93weUHsiTH6IYW9yuTLH5m5ovX8lC
	 79YNxKTKtRIfINau9gH3yYqzM3O3X7CSeXiZ1lHc6v0UPTFjkdTN+991cgIg+f9vwTghZ
	 Y6q9SJjySu/1jkjGWh2bOXX1ceVZwEC7T693O22rFl7VhBu+JKEcwBwhpMCqwVI0qwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=lPprlf+l;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1581F606A336;
	Fri, 20 Nov 2026 03:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1581F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=lPprlf+l
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Tl/7Xner5ax86FOmOQg4kefqyaY/77rqLwd/Plguljw=;
	b=lPprlf+lVjTHgjMYmum7ZlrdI+/cqscXq3Q+i0XgaC35OkdScPk97nSCrfWsETOB2/rPiajty
	PmUAn6gETj3cCG/6qT5+O+6ixNpJRNRsw6QRyTfAzusfh1Si3uoIQIX14kBpmhBJ7hpE+V86TXS
	NTmzX4Z2R7v27aTXhV1+5t8=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jW0md2J9Vz1K97Q;
	Fri, 20 Nov 2026 11:14:09 +0800 (CST)
Received: from dggpemr100006.china.huawei.com (unknown [7.185.36.155])
	by mail.maildlp.com (Postfix) with ESMTPS id 1265A4048B;
	Fri, 20 Nov 2026 11:14:24 +0800 (CST)
Received: from whupemq100015.china.huawei.com (7.152.185.230) by
 dggpemr100006.china.huawei.com (7.185.36.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 20 Nov 2026 11:14:23 +0800
Received: from DESKTOP-62GVMTR.china.huawei.com (10.174.220.94) by
 whupemq100015.china.huawei.com (7.152.185.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 20 Nov 2026 11:14:21 +0800
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
Subject: [PATCH net-next v05 0/1] net: hinic3: Bugfix for later patch-set.
Date: Fri, 20 Nov 2026 11:14:13 +0800
Message-ID: <cover.1795144996.git.gongfan1@huawei.com>
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
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemq100015.china.huawei.com (7.152.185.230)

These issues were discovered by LLM Gemini-4-Argon and Claude-Opus-5-5.
At the same time, LLM recommended submitting an independent patch.
These issues were not actually triggered. Based on theoretical analysis
and consideration of actual risks, this patch is used to fix the issues.

Testing:
* This patch-set has been tested on hinic3 hardware.
* The software RX OOM recovery has been tested on hinic3 hardware.

v05:
* Replace the NAPI busy-poll on RX allocation failure with the software
  RX OOM recovery that hns3 uses: a per-queue bitmap plus a delayed work
  that re-arms NAPI, so NAPI completes instead of spinning while memory
  is under pressure.(Jakub Kicinski)
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

 .../net/ethernet/huawei/hinic3/hinic3_irq.c   |  5 ++
 .../net/ethernet/huawei/hinic3/hinic3_main.c  | 51 ++++++++++++++++++-
 .../ethernet/huawei/hinic3/hinic3_nic_dev.h   |  3 ++
 .../net/ethernet/huawei/hinic3/hinic3_rx.c    | 26 ++++++++--
 4 files changed, 79 insertions(+), 6 deletions(-)


base-commit: 66726ba54a01a2951688a56f5eb4d13d063acbea
-- 
2.43.0

