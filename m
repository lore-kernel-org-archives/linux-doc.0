Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418669;
	b=RwJf6GZHLEJTrWw4iJtljlyhLR9DTm4UppksOARd/XZhhh0mJxJ62HBTjUhIokhVTchN
	 2czmBckdLB+HruGAHSd8V2TmSkponA65CgvQIlr3HB3UYIZR4l3iDRYMpLMKlLl+P7Gw2
	 zmZ9o/3S7TnrKghTEA9XkNqE4SZD7BmuVjp084GsbOJ7qIR31IY7h5SJqk/pjZChIuBeu
	 h/F7VlNxoIB7fZDPMwo4+X/ErzlFi5TMENrUQxMGjyz432YXmfPtTSXShGoMsfjXEwkFz
	 XAzh/Q/pWoJrssXiSzZIBSHqE1outRYNRE0ZWPf5i6rBlKSMW3ATV4XV1K0ZIqgtRTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418669;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=WYTOzbA8G6pn0q4/OAQLh5TG1sGG3Z0xBC2CuaX9NIE=;
	b=yVgcgh7UXYl2CPacepeyrZ/Y4g4VRjYmOlqhgZ3s19092Il9lRO/kv1EWZfDVVKCX2rm
	 44fQR6uPoorSl3CzTEpA5vD/iEn5Up1+TFFjIJDCFZLFLTPxrLSjDIOuT0trbv9i6VOds
	 V4hPURz6k+wRJqFk4NDmHIvzxDElAVXcmWtlvvwWWBPZ8+yEMOJa42nIp6V2FuE9/vdUD
	 gjQVited/idrWVCJ/CejKfxvzebdhMltYN17Uitf0oMtzqumosSGsoVHH2HIGUw06gNxt
	 C5KQ+LExJXQE+i56FlMEIQni6Zekn2Ln5h1Ouj8mWJwHmtDugGEJIkBfqpIhhf1EzVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=v3O+ZP5e;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6437A606A31A;
	Mon, 23 Nov 2026 07:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6437A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=v3O+ZP5e
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=WYTOzbA8G6pn0q4/OAQLh5TG1sGG3Z0xBC2CuaX9NIE=;
	b=v3O+ZP5epWwuZoqgTXYrrXqLqW6p7NPYnN6nO61PbtGCaIq8YoYXXv1UtYSgq0GDF9zPKZydN
	6laE7ER8u+kb8/dIMAZ0axoSC5G0YwewNPLJpXATif5ZywxQXh9tXylFQlogh+Y6p0OpL5w43kJ
	yW+lO/IWL9k0npjnS0QWfns=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jXy9052Lcz12LCm;
	Mon, 23 Nov 2026 15:23:32 +0800 (CST)
Received: from dggpemr500017.china.huawei.com (unknown [7.185.36.132])
	by mail.maildlp.com (Postfix) with ESMTPS id 1C4FE20333;
	Mon, 23 Nov 2026 15:24:22 +0800 (CST)
Received: from whupemq100015.china.huawei.com (7.152.185.230) by
 dggpemr500017.china.huawei.com (7.185.36.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 23 Nov 2026 15:24:21 +0800
Received: from DESKTOP-62GVMTR.china.huawei.com (10.174.220.94) by
 whupemq100015.china.huawei.com (7.152.185.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 15:24:19 +0800
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
Subject: [PATCH net-next v06 0/1] net: hinic3: Bugfix for later patch-set.
Date: Mon, 23 Nov 2026 15:24:11 +0800
Message-ID: <cover.1795417161.git.gongfan1@huawei.com>
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

v06:
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

 .../net/ethernet/huawei/hinic3/hinic3_irq.c   | 10 ++++
 .../net/ethernet/huawei/hinic3/hinic3_main.c  | 59 ++++++++++++++++++-
 .../ethernet/huawei/hinic3/hinic3_nic_dev.h   |  3 +
 .../net/ethernet/huawei/hinic3/hinic3_rx.c    | 26 ++++++--
 4 files changed, 92 insertions(+), 6 deletions(-)


base-commit: 66726ba54a01a2951688a56f5eb4d13d063acbea
-- 
2.43.0

