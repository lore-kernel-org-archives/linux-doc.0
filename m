Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917274;
	b=37Wkp0AhRzdSQ2h0b/1meqNbwfOK1WeOeIhL9he8fmfc7Yy4f9kMgOTcK0AmmWRLLfoB
	 Ga0iJ5euTGZTstX4OaauvvltxddSEFJHVkkraEEclxW7rMvIoSj4vwcm8vWQsQDz7Ebc5
	 33wYtqNvSP4MXsVnx8KD326EP3p4yCabcCuJg9n0qG/PhTkadQeiu5W0XhYzn3GCAvI9n
	 TeSzt+QU/E/IYYVuO9oQu0DmNg4nSFuThgMGNXaPyl75v1rn0urvvANlNjIYHvYTwpk4M
	 97RkZFmFnX/kIKAP2CYynUuSBdUkmR1mgVg86tD62dkdTVmth6dMjva2AA6AtonmryQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=4db2AlEwBuJ3NhUvd6DttANYOsA8cpC5/Z0gBUqIqT0=;
	b=VSkCSWwwhRIUF5ABuhoSX89sV+mN1k6hzQVPM7fR33lsNtQKuqtE0zrwWdASA/tI0NBc
	 WEKgihawMW2NRbvMAUDHXM+ZnSJhR0NcKAMXxDBmtMP4aZrsHLb5ET5figG8QxWXwsORC
	 BtnbxLRv12EHV2mltQc99c6N0sxvsvEFkzU4819/r6owujDQREQOUsZT/IxVKTvUASeDP
	 z5JI9ROv1xJuNvpItzGgKx0PT57unC5ITyoVnm8omVsI2DUB0FLX0DjBGxFn8HRQD8l9q
	 F/D8CNfp8/sOJrf96Rkegp42qwNdXG0W9m4ppxkuSU7VBXzynshMqDaexhkvit5y84w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZrlqBW95;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF79606D83F
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 22:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF79606D83F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZrlqBW95
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-14345ae29c5so51666c88.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 14:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917268; x=1794522068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4db2AlEwBuJ3NhUvd6DttANYOsA8cpC5/Z0gBUqIqT0=;
        b=ZrlqBW957FVRSJmhWtYT2LZ20iLqM9RUGB7Z0X1CqCOXFP0vE1Q7C6Q2nXJgpBFRq4
         Y0uMg2XCt+yCfud4FgOvOKF0JHJPs0lVYLnGJQ4jcxxF70pQppH8nnLD50s6trUzqKW9
         HGpBPaeom520SaQnpAAKksjsd0wAIXkDsU+aD/KgENAMz/PYFf5jq4jUvqCBiJJpoqLG
         v+bH1XZdZ6WrabNwkAW+3z+BeWR94LS0RIHFvavciURbGe8OriTuxF/R+Rx58PPkE5Js
         VeLlpHVqQwrZGLRVasQ9dARnv4xZUCKPjgg+Sgd9mEmFSk4Osvn6arU4uu75Bok6gbqw
         aZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917268; x=1794522068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4db2AlEwBuJ3NhUvd6DttANYOsA8cpC5/Z0gBUqIqT0=;
        b=szuAuOPC1c7MP9bTe+y07qAExtrqwC5UsRVhEwzxmIXUlhdX1A7x57oPElvB8ChYoa
         dK2+6lX6otvo2cdya4h071Fm9Lb9L2mxutQRIg+YbJbb/e0JPO2MK+n2pdLTNh6oZNAY
         bXIefqWG7+l0zavXpUExLrHJYNK+pIR0onDxOHXeX+ywG50e60s3aia5RoQiSrLp21II
         aI7zISczFzUKFlS+B7qQgOwNVuAD7X3wStfeRGTn1x3ywxg17NFP5w7i4pSy83ymPPfG
         ODqlaKgKvXLb7ebgh1GXglO/q3g05Pl5IEzoZU1UeaZotwYro2Xn3L+KPxCABd+JIPHP
         0BXg==
X-Forwarded-Encrypted: i=1; AKwUvBypqlUDRmjmcc8fSsD11v+/h38lA+YFxjsRA/zB3pXV8BaCQLYEABLmMyhvOARBa/5LIbiveXGsGbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ToJgRGCMZvviB/C8YRfdO60I0MMW5LDhh7ArvJFMEVUPkXALd
	Nu4h213zkzTdcPpMKDAxfWK3H/mzRrmMAMfxvVP4aEmy1m1lw72l+FqL
X-Gm-Gg: AYBFou1uYQJBomCgQ/zxH7MpwabiXiwzy5k/GbUMZbF/oJ3tI2nO8yC5O+X3GE0VoqK
	m/MTZG1ZSGDqj2gbjDgolXeaSeBX1xakVOYcgUOxj6c9KfY2EX5shaT4SR1yEtSnm4nJ3NKhZI5
	bij8+/je/+uSY1jAZhZRNAFopYvOEXFIY3eBiozD073ZEDJ75RXKvjPptstPqa9xBD31TE2aKOF
	OhxWBki4UxgS7U/ChtTgge3EtLwVxheQtgt6yMdfMQK/QDG2sUtuJaC2BgyqyiJOvu8B3bd2mpp
	NQTFYaMyfRQodJatyhnf4hjWwwDFAdHeBKKKengfdWJhtm1JQqaULHpCLqsvz/vaI3QtVcp7f7G
	byUEtSHlttPHsjMl3TNNErd4KPrftMOliDFMKQzav2+g+MVdM0AtGN7Joz5U7NhAVc4fCM1ZI3I
	CqygmnAfukO3Bm70ZunEA6REHbf4rUM6oGtf60joryCXpUB+w4v1x6txrfx5WAsa2mHQ+KOs6pa
	CTy/3p9JTAjIgkdbQY99M6nwx+R2K4/rqx4Z6byFPmTKltDQ4PWzc3/WmiLDaPtkXEFTLy9+DAr
	LI+fu3+2quO+bZKMrUqe2bU=
X-Received: by 2002:a05:701b:4590:10b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b25d31efafmr453115c88.19.1793917267847;
        Thu, 05 Nov 2026 14:21:07 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6a::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm26931436c88.21.2026.11.05.14.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:07 -0800 (PST)
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
Subject: [PATCH net-next v3 6/9] eth: fbnic: set the netmem TX frag size limit to 32KB
Date: Thu,  5 Nov 2026 14:20:55 -0800
Message-ID: <20261105222058.944293-7-sdf@fomichev.me>
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

The TX descriptor length field (FBNIC_TWD_LEN_MASK) is 16 bits wide.
Set the netmem TX frag size limit to the largest power of 2 which fits,
like bnxt. With 64K pages this also lowers the PAGE_SIZE default, whose
64KB frags don't fit the length field.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/meta/fbnic/fbnic_netdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c b/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
index 8a6703afca38..0a2b66202aec 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
@@ -760,6 +760,7 @@ struct net_device *fbnic_netdev_alloc(struct fbnic_dev *fbd)
 	netdev->stat_ops = &fbnic_stat_ops;
 	netdev->queue_mgmt_ops = &fbnic_queue_mgmt_ops;
 	netdev->netmem_tx = NETMEM_TX_DMA;
+	netdev->netmem_tx_max_frag_size = SZ_32K;
 
 	fbnic_set_ethtool_ops(netdev);
 
-- 
2.53.0-Meta

