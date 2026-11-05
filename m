Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917265;
	b=D+FYxO2qjVfQAEa+3SPvC2ZyvYXmben0SsXC/V67T+azUhhY6TRlFuwpwJTwSqAzlilz
	 0lIUPUPajIuZJa8mkbEoA4ae7cWpMr0cT7llQvP+qHPKgRwGK67Q84NSkv1d6GB+9us19
	 6cXNG7s0DObK56k2jiLEBc6jGEonza7xkjlRS1+ooW/vjwzazfONWNudIk639ufl1jAYK
	 5cPXvJo/V8mbADVlwmv1/ljM/2bWjbLnkvZTrcRVHFo28h5ZOtvK1SF03rINbV4um8k6s
	 M2iZq5aTEGb1x1L65Werjk3sMoKGCgYqKv2RUfcJJTgCHNnGalCAzqRckQGhFn6+abQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bZjDWOUD0tAJxtZMll1Q64xr0BqB/ZpzoZmoV9J+vc0=;
	b=uX3ht9QVVHRrFxnksKw8aDAW96YIKODC28OmV4G+gMEiBSIFgSTlU90qJelz3PjM38iU
	 F4+x4xNhVWvN7f210SDd8W2bg5wwA24GOIPU/IlER7OXTLAEXzcTOJCCxL0rRTD4ews70
	 XZ7l2i0wIg/bjNVt10+ztcrEcGbPRnQGXzD93FNfol/UQRJFY6X6mr3rdkPxgLEHKYkPO
	 bxUYYVdhXIJ3pMJwF0VRSt8X5vmJaHBcx1xpCbU44IIbNWowm3gmFa/37QEQUl66TYyHr
	 q644BOKTRMK/BTnMCC9PK8wSxAtp9wyX8+ITMYD5hDwlhU26GPXJVNOArDQUfL2t53Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTmCPrmV;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE32606A32C
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 22:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE32606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTmCPrmV
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36e06480786so304eec.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 14:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917264; x=1794522064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZjDWOUD0tAJxtZMll1Q64xr0BqB/ZpzoZmoV9J+vc0=;
        b=tTmCPrmVRUAllLERaiIgEGzgA/3GcfFM2ivaSUFN58HhzdGttxq7aMEdu5wFU88DN3
         BGADzbE+V/rwCP47nlsBPiPbimmbqXpsm0MTO8By3xg3KpXoEoJg/xdT0VlsAlDt1Qws
         XBiuk012JlHh4nvmFh9c91uBbDK3j/UegZ3ClICJVHL+CXJJZhjeWkC20o45Z6amYY7z
         nX+4m+6F9NRf2a/BOP4r7rY3hLk2InUAbIHtQrptWriCeAuG1hD3EmLPQ5n/AzeXrwZE
         86vRSdPo2JBAI0tzU8eJWVzWY5nCMyI+JmMTbfHCkbdmBgZJIqVl2SVZdWy0kwxDGHPq
         +gVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917264; x=1794522064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bZjDWOUD0tAJxtZMll1Q64xr0BqB/ZpzoZmoV9J+vc0=;
        b=2Dt+L5v5ZI+TEp/KtN7D5DCdnFZAwDiZhvoZPKjhuTsCo37cHmgmLj2GXdOWvt2UTr
         W1mWWADhQ/BIWrDFF0WniVm0vsMhpGoToaFcAwEQBomUd+OLC+XBH5mseo0lYL0lksWj
         hznYBs8dRCX72cOfBpIySVONriZYr4y5pcNoZrdLD+ONFJzhsr+WiDPS11iTgzChsgJe
         +C0iLC9wL1l+Tw2E2RZ7ipjknWh0S1iqswlFaQGnTJkn6gfuZtpeCuStLX4n+uWBzdPp
         WnxmuHvuIB/Q2tffm8wNIOBrTsBYiYNEr9puwPdFaSxvX4a/E7m27Ojffo8dClKD1ye5
         9poQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMwo/ZKqFZb7xR6ODGFL9iUOd3orlBS5Finhuw2YOEvh4RZac/YgtONc/Xg3dayD+arK3MUBLY7CQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8692LiX5vk7R5j6HBNGD5qgZEVJ7GmiYk3GLLR7sbB9GCuED8+
	+eTZvv5ziRXRbLrXwdALSqn5eXOvDHD3N+Hnn3AMfdcNBRCztg0Rtbzj
X-Gm-Gg: AYBFou3HZxVViJDO0igGNB/T2WsTlOwYr+JckHQZJ9Gjci/qxkpCl2CrWml5jad4cgn
	M/6IVXGHaKl5Sw0CyMhCf5f6+rWxW8c4c2+r1mYU6c180ekdDC5IoBwPqYDceXyDk1vvu7lttHI
	G2W8db11VOtcI2+5y/1Lf6rZToFP7FBVef4nUB17O6ZiezioMJ8jMyYpEXIrpnSp0UANkYmSLS5
	aI3UcDvQh6XWDI83g0ai92lEifuOG1S7lUbCzwSRD7aMEE3M+vWlCtPzSggoS9pjLKr1njEO4OY
	gFPO74X1yUBitukcMe0aWPJxUmWc2hR4QjuGRUYqVLRRVo2TWz1nQqLX5fNGtKF3Bp/+B3TqmqW
	PDoiyOOx1CBydRlPESDK7RFagw+xZ1rq3LPkrBpl229I50y3W2P04WinkcLL0QZSBKdEEGelxGi
	59tI3PiL+drZNV6eJJBz0+Nz/as3f2sKsSPIdHe/cF55QAi3J7ohJGAmSN6ZjqPlcS+pBzQIx/E
	UItEtYShfeh2KFlfoWheA2UqeeocfCYWMJX4LxcSYL6N6Gj8C1EBxMrL8YMEoSgp7PIkbtkRr/N
	PcCZvmaqso8NL3Mc1EQYKIM=
X-Received: by 2002:a05:7300:f586:b0:36e:2b8b:a09e with SMTP id 5a478bee46e88-36f76c1875amr631599eec.34.1793917263769;
        Thu, 05 Nov 2026 14:21:03 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:42::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea414sm47741eec.16.2026.11.05.14.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:03 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	sdf@fomichev.me,
	dimitri.daskalakis1@gmail.com,
	almasrymina@google.com,
	dtatulea@nvidia.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 3/9] net: devmem: use niov_shift in net_devmem_get_niov_at()
Date: Thu,  5 Nov 2026 14:20:52 -0800
Message-ID: <20261105222058.944293-4-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105222058.944293-1-sdf@fomichev.me>
References: <20261105222058.944293-1-sdf@fomichev.me>
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

TX bindings use PAGE_SIZE net_iovs, and the TX lookup hard-codes it.
Derive the index and offset from binding->niov_shift instead, so TX
bindings can use larger net_iovs. No functional change, TX bindings are
still created with PAGE_SHIFT.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
 net/core/devmem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 32fafbfa1359..6339f221bc82 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -455,13 +455,15 @@ struct net_iov *
 net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding,
 		       size_t virt_addr, size_t *off, size_t *size)
 {
+	size_t niov_size = 1UL << binding->niov_shift;
+
 	if (virt_addr >= binding->dmabuf->size)
 		return NULL;
 
-	*off = virt_addr % PAGE_SIZE;
-	*size = PAGE_SIZE - *off;
+	*off = virt_addr & (niov_size - 1);
+	*size = niov_size - *off;
 
-	return binding->tx_vec[virt_addr / PAGE_SIZE];
+	return binding->tx_vec[virt_addr >> binding->niov_shift];
 }
 
 /*** "Dmabuf devmem memory provider" ***/
-- 
2.53.0-Meta

