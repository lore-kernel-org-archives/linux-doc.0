Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075464;
	b=sy8vfU/FXfdKha2z86Q7GNYOq0S3WWUM7C66cgNYVkgM6i2VwKb8dXUXV4UckJ/zNXlF
	 QHhRlruG9tzE1gi0Y5H+hFBtagHmJL1ag4HrJafyc3IxPJsGqwH3Xw4piUyE0u9cUjGsG
	 Qjpy9MibER3aiBUKwaHtecf6Cz2cS1KPEyy+wy+PTXrAXYUIqtfS+DQpzquCvBUupj23y
	 oZqEGcFysvBeMsWNSvfAJvo+E8nhvJP6svkp47jeAMMTmDcVdeygeYuecaNWXoqVrM7eq
	 YmIycAzisO4hilUiqCrmlvB8mpB0ZYmT5jN57Q4Ra7trPnuekh9w3AeShTiJgAuj13g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075464;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=NNtg6nawYJsI+Au2yKHzzfTB8XIjxD+Um0wS7YZDvu8=;
	b=Z3+LYOxKXn94UP5hJdauL2Madga14n3WPopHyMQXcilQIIUJsog0BcuCsHt9DLqqJFz6
	 HuqHEnsjM7c67FCpNPddu8qAguVLlBP1U5CQbezXOic7s1Us5GPFwZYikVU8PVZPhtBfe
	 qtgn9gG1VDUAn4ZzFZzp3dg0EWoFkKhGrX78wuGGhpnC0FmztDWGvRmHhFdG8Gp3yirEW
	 S2yNKaEczlj3tWDYa2UIchvxhO+zoxlFPSP7vuY/ABO3IzGD4lYKChX+a0ARpZb81K6BE
	 G5xjWtamZiHmgUAwGL8osnknQr7YyLMpJmcNn39mSEdixACQJDjKjlmdC2qX6DDu3mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Ug7itAqZ;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC22B606A32A;
	Thu, 19 Nov 2026 08:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC22B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Ug7itAqZ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NNtg6nawYJsI+Au2yKHzzfTB8XIjxD+Um0wS7YZDvu8=;
	b=Ug7itAqZcVfd+9VmIk0A9Ly6M2H5qwzHz2uYhaRzAtzvwCiT2yCZDmB3hInGBrg/EMMwG0P5t
	d/zlOhQ8xrRWed4HTsGJg4yrrEl8BhLc/qAkSv3RSceU0UmjB3B5rRtPeAkoyq29pGNJ1feK55f
	MyTTI8hyDhfsLfezjTXQHgg=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jVWDk18jNzcZxp;
	Thu, 19 Nov 2026 16:03:18 +0800 (CST)
Received: from dggpemr200017.china.huawei.com (unknown [7.185.36.233])
	by mail.maildlp.com (Postfix) with ESMTPS id 7B98F40579;
	Thu, 19 Nov 2026 16:04:12 +0800 (CST)
Received: from whupemq100015.china.huawei.com (7.152.185.230) by
 dggpemr200017.china.huawei.com (7.185.36.233) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 19 Nov 2026 16:04:12 +0800
Received: from DESKTOP-62GVMTR.china.huawei.com (10.174.220.94) by
 whupemq100015.china.huawei.com (7.152.185.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 19 Nov 2026 16:04:09 +0800
From: Fan Gong <gongfan1@huawei.com>
To: <kuba@kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<dimitri.daskalakis1@gmail.com>, <edumazet@google.com>,
	<gongfan1@huawei.com>, <horms@kernel.org>, <hramamurthy@google.com>,
	<ioana.ciornei@nxp.com>, <larysa.zaremba@intel.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<maxime.chevallier@bootlin.com>, <mohsin.bashr@gmail.com>,
	<netdev@vger.kernel.org>, <pabeni@redhat.com>, <tengpeisen@huawei.com>,
	<vadim.fedorenko@linux.dev>, <wudi234@huawei.com>, <wulike1@huawei.com>,
	<zhoushuai28@huawei.com>
Subject: Re: [PATCH net-next v04 1/4] hinic3: Fix the RX stalls in hinic3_rx_poll()
Date: Thu, 19 Nov 2026 16:04:05 +0800
Message-ID: <20261119080405.123506-1-gongfan1@huawei.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261118180907.641e8e51@kernel.org>
References: <20261118180907.641e8e51@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemq100015.china.huawei.com (7.152.185.230)

> On Tue, 17 Nov 2026 20:08:31 +0800 Fan Gong wrote:=0D
> > hinic3_rx_poll() can leave the loop with a completed CQE still sitting =
at=0D
> > the head of the ring, or with no WQE left to receive into, and still=0D
> > return nr_pkts, which is below budget.  hinic3_poll() then calls=0D
> > napi_complete_done() and re-enables the MSI-X interrupt, which is edge=
=0D
> > triggered, so nothing re-arms the queue if no further packet arrives.=0D
>=0D
> Look how you Hauwei coworker is fixing this in hns3:=0D
> https://lore.kernel.org/all/20261118130330.3026625-4-shaojijie@huawei.com=
/=0D
> That's much better. Live-locking the system in NAPI when its OOM=0D
> is pretty bad. My personal preference is to have a work that just=0D
> checks for Rx buffer queue being empty every few sec.=0D
=0D
OK=
