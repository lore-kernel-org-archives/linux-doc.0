Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917270;
	b=prxYW1zZK1PgczwZwMiNoRc6X8Xlsjl+JM30Mq3SoXj6SHitm0QnKV2jvYCbm2J6PZNi
	 xiehGiHrp40yrzAJeRJ1ATOhJaYXybj1mpO0/x9JyFXKal3TgPJbFALNb4H+wb/lnUFtG
	 dyWybEHjICQ8icUGdb6oMEXCxVv22Zi+5TruHTXAVw8NrSkUkgYxwF72KwSnVngHxWcGB
	 wA92rHbnCI4HqXJ2cafU5CRC9M2bA4w8Deu0hDMH/pzHEKTatUpWcNlvViIa3hjgcTV1g
	 Aj41Qk8hFD4O+ZAvuIy+lgqfvK9rQ+kocdKYZKPQa0U/oD/LDUkM1pWzDvw53v8hVIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=SeK2ptx5a0hAbgEAKy9F6rfb5PgJz2u6yxoaC4Xui3Q=;
	b=PUR/wJKBrjG+EAwyxUK+YQ09aETadcNXVjP+ouoEU35DnfWMUfzaI7kQZcPeefoxjXo1
	 emR+QZfZyQ21BDheim45Mhh4m6TKvxk+NKadBiMrGbwGngeuvgnYb5uV2IExR2YDLv9rY
	 ri5quLJGBAOQgXc33zhCRtDcPLgs3uIc2ZLDnDVlO/mp9An2385Rsewf2TcbVrQINmvC8
	 BW0cRtKD+BdwOyhxyE8QuEytikJ5xbCj5XG9mxXa3RDgWImQkhwMhrMZaLaMPzFBVkUlU
	 nwynh2K0/wZooBD5m8sS4ZLE6d/t5VvEKAwcDE6KV6byU593ibOJ88/f/14fzh2p4Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tXK09pbb;
	arc=none smtp.remote-ip=74.125.229.136
Received: from mail-dl2-f8.google.com (mail-dl2-f8.google.com [74.125.229.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40BF606D810
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 22:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F40BF606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tXK09pbb
Received: by mail-dl2-f8.google.com with SMTP id a92af1059eb24-1379d236149so80295c88.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 14:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917269; x=1794522069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SeK2ptx5a0hAbgEAKy9F6rfb5PgJz2u6yxoaC4Xui3Q=;
        b=tXK09pbbOwh8AP9jNlpQhqDpUJfAjAae6Ku58Zgm44oOrfeRgdSy3UqYDB78OGEkcU
         +7aiH8UB+U/cTYuBSbGlhDQoEbs9Vjmeyf3p9O/kparVcGyxuc93925WNTKkW6a3BEzO
         kK/Sp3YdmtVRiF09ADY4T1DxgRws8BeCuiAIpg2IYjHqryzRmvfWPHfU/TX0kerBTqqP
         Z9XvevicmbaLbeiorRF3IL8ubRSPGIbqOCg8Q6r+m7CUkeDrHjJ0xWcSXEoZeV3ileAK
         XGTP86A9kpQXIAKr1zaON1csyIQLpcAgryipH13EsnYOQnbNlmrL/xzxbLANwK/Q5qrd
         5YDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917269; x=1794522069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SeK2ptx5a0hAbgEAKy9F6rfb5PgJz2u6yxoaC4Xui3Q=;
        b=ArJUrgE9XB2ct/5jAmQHKn+NZOEfhAKivxvz2a4GmzOnYBwTsWYPr8NuqWsbwC/eUO
         UxIyyElNCihBxjbxZkqEL/CqDVxk/WWpf3qpHu6MGu94aZBZeocV+cyurUHQLceMKvUj
         41ciD10R5t5lIGr8TLZ5MwRoVZGeUIxKAXIkikE48Po1J6d0T/d+q9f3gF+90dlGcGad
         sVQivMdKget3LSNJpPJEVc7jD1ZPk3uIgi5t4hRIIs1b59fbyt8kikjKc61fETyBOt0r
         WM0PrGPeFEFVxq5R/yoBy1KRLySgJgg6b2f3Iq4TMwirqWqxfnasuZpbGIE8Y6Z27Cdq
         FOew==
X-Forwarded-Encrypted: i=1; AKwUvBwV1exvczRZ1chAOdk4JooWG05ErL9uDWRTDhHZoh1iAsamZgfi6qWfAu62hDTRQU95Q3veEvJe8v0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4AJHZoWEQpofZOzm+4TOkfcjkEE35jyXz/eRUgs2RO18j3wa3
	WmaBwqhf+1Fd4ZzNlMpEC84NI4avjs+fx1xF2D91vDEExd29pzI0tp6Y
X-Gm-Gg: AYBFou0sRisp4Pv8gvr94p9tf7Mmywzjf6a9RbP9NRg/+yEmiWw/F0oBpHju3ywTO/n
	YZlJIne3lbZkUMRdoitnK4MXsNMfRZh3Kpo8a+ttPE9h5FXMwSwFkwa4qnZZ2m6eKzQALWZrO3n
	l7uTZ8Z6wWp6TsioLpsZfmuzU0UhkD555/uLXre1zGtI/CBhl9sy3DRgi948eto1gD09sEIoGfS
	v/IRui0N/jN45rV5m6AgMvtJWXmeRXCSGcbNNWK0HS1vCih1uqaCTxbN99+BR55ztcD6m3iZCVO
	gEtjaN48+UlYDy7hhxVHT6cCdAwlSWgtlWz8S4wVQGuHXiiBQ03C+b9tJBrdmVYPFBJAd3kbyq2
	RPlgDD5b3zqd16krIXa5lQDmkd5fOQ9xmSVjpZvUbsun2jBU//EDsqoyWbY9jhowTeJtizPEAbB
	62sE0nWTxNFxOd9cwxcgrrJya8JzYNokTvwAFxzT5fHrhun9m3JWzg0/7/U6KidAiE2G5lUNq39
	2yKbj7sLKyOruGYZV2a18WvyNAihuORDCY/mtIabDG8dczB46jK0323hNkhFvEBk5fKH3wOZy+1
	7HOzKOc99vNIfy5Bfn47QXA=
X-Received: by 2002:a05:701b:4292:20b0:15a:4155:3d9d with SMTP id a92af1059eb24-1b25d37e36dmr449336c88.31.1793917268955;
        Thu, 05 Nov 2026 14:21:08 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:68::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm26931552c88.21.2026.11.05.14.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:08 -0800 (PST)
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
Subject: [PATCH net-next v3 7/9] net/mlx5e: lift the netmem TX frag size limit
Date: Thu,  5 Nov 2026 14:20:56 -0800
Message-ID: <20261105222058.944293-8-sdf@fomichev.me>
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

TX data segments have a 32-bit byte count, so devmem TX frags don't
need a size limit. Set netmem_tx_max_frag_size to U32_MAX.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
index c3c2c5720c6f..28ba04bd5f4a 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
@@ -5967,6 +5967,7 @@ static void mlx5e_build_nic_netdev(struct net_device *netdev)
 	netdev->priv_flags       |= IFF_UNICAST_FLT;
 
 	netdev->netmem_tx = NETMEM_TX_DMA;
+	netdev->netmem_tx_max_frag_size = U32_MAX;
 
 	netif_set_tso_max_size(netdev, GSO_MAX_SIZE);
 	mlx5e_set_xdp_feature(priv);
-- 
2.53.0-Meta

