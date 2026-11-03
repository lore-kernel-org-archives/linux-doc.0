Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749922;
	b=giZ1TqWlCAoCKrKc6KHkOiprlRpItLUKFYXkJV0K7/wEonnajtDSBVUvMm8p21vTH3jP
	 UtEypIgkmGz0BNPmGvc01d0zi98zzaF2ZMKCeT8jckh6K7ridcwC5y9uq7+BZgbTl6hFI
	 o2vEb/IPZZBuMAxTjWhctC/3x/zbQ+znKTIXchZ0lozLZZHeiX7anR8dOBn9DT9+kssUe
	 GT0DYs+9f92k1g4LkNaTwOh5kfl7xiOd0Tpji+2uA+INxlCDDET3rcULJAfAPJgt5E9zW
	 XkLqfLcPZXZakUumeSGBv6CC/s2rdfmyzQE/X+tHJCpZZk/I737mog98tyWdjPRTJWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ISoGhcCNNYayXnvzELOl+oJCyXpnYMCHuTL7kvKeTX4=;
	b=0JzPWbWFHKzWbzKT42W0uuFVQ09V8zTtPs5x2pZiP/hW9sujJheYmkP6GXmHGBpH7qeJ
	 O+B9YnhlLotpSfRNs4OeFpVTwlBmz096/82ciPIjjrib8ZdG6bQGK47wHsphPucWmWaDc
	 h+gCmjvqIEv2MAloVsgW5rqNfIm6hLTghAAfnjEqoph1+vi38qFLBI7SoI4XmOe5XkoS0
	 Ru0mcRkLfrA5nW/sL2n8s5ITu1kng1iRdGyHdkDY7yrV5kww7+vP2cqTNeotkQRO3+4i4
	 oqhV3jlsFQ/+EoIyjsJZpE3h32+qsAP3Zxgx45871cHoFjYzoakpN8fMNHnIFA+5EYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TDIPQIU+;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14C1606EE87
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 23:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D14C1606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TDIPQIU+
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36c9b5c6faaso34038eec.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 15:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749921; x=1794354721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ISoGhcCNNYayXnvzELOl+oJCyXpnYMCHuTL7kvKeTX4=;
        b=TDIPQIU+eEgw4o0cUbF8C3770HMTkrQOKM6qhMk5pKVPQTT+BVDahHBjq2+/twmgQV
         S0+gn/+TrWmsEL/xPSlFBScJefiABWlsaNNaX7D4IVGe9KSSvTWTChod9uWXMl93Ko8s
         x5nJQb+8/MmBnrLV8avr78N6hIi988DNFRP0e5g1mMBGsaUCbmtN7+sUdFkYR3ek8rO6
         PdvIk5zy4l/gzb2qLKlL3C6XpYOkLBD+1JL/ffRT/p5yd7/QrW17ZlaM0HO1djW1uGoE
         POxVNfVuC6HArG4Yo+AU1KAwBPlRjQ26micKU9FQK1KK5UWqojZq7BB1ZMMOtrX4MFRZ
         OX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749921; x=1794354721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ISoGhcCNNYayXnvzELOl+oJCyXpnYMCHuTL7kvKeTX4=;
        b=lWRAQsc/FoL0tGv9QgvI9GEqpJMVq3Z4rFU3zoa7OTQrhQwF0ckIBKiUluWhoQ3BWy
         6MTzcxT3zyQXlt/7lMzVLUYGXFwdYX8DlZQm8VTprIP9oBqzWsisNSbLTllve1lAjrry
         vhX6xcN4P3a48LNIBA7QKssFHTqbJBX9PwRRB6abMcNqNPNki3Wlz4Haqi3pxpgJpZI7
         SnbxKE+Hs2MM1v1yPdgd1J07gJBfgRoV8uyPG+DH+B4fwLLZHY+jTuQnr2m4/+gUdIpj
         yDlAQL5oFdDinXrSK0cjYJ3Y46tjhGnzKuW6YepCq364GD/UlIRLFZCq7OW0C3iKVIJp
         zJlQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5Cs9auxDd7bFRe5GBhQ0a8k9wOgMRD/DNzO+SD9s09mUfQnGLGThAro2w9FAFq6vkZkKBG2Xcdx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Rg0peXHwRsEJSTv8VgCPIxoi+L2ngofW1N03cBm0SBj4+fr/V
	PGAg/rzF/nVpEPDi6O1rssE5cfq50t7o2FVJBR67SdZippQvEmLbbHli
X-Gm-Gg: AYBFou3/PvsvsIJHg7IInzu+MfvtG78NX+QNosY7fxxj5gbapLS+pl9UrKTwAxi2p1D
	nCCNJgJX+NkwjActNFHlUNh4UxAqWB2DIXtC2p0FMfgtjgernbCSkilKVz1po9URqzVIU5K9ejm
	Hz5MTgB1upEHKfqadHeK8VYzvBUXzMemSvqtIuwXf2T9Yzi/FnA6VkvukyQefKX4CqOXQ03g9CL
	dwM2Slkq0zIBS2ZsidwOmcNREoxKZia0ao1cHh2iPO93Pe+uiuT6xmKhCEqCJPK3bfsTiO5rAMI
	ui5kTOLz8uvUp+ma0GUhjGCkzmvaTGLE82GuASjrpWtVN53doRk5TH3Myk8aV3weEWHcalSlQ0r
	S0QZe3g6bZySCsYBOnMXuEawaVmxi2bDBe5ijTJabs40xNxamGqRAiKjXVY76B04b4zkKmWPclk
	imMBvFQR27JwdS1ZKbBytq0XdcbA0C5K2uNqIAP/wenpFdSy/LSAd6Q7TiuuwUb4LfjtcDHwugp
	Wez1d4Olxektdq8C8cUl1zQBRHM5p45+tFDBr2D5dOYAQrC7v2394cvIL/OdWepTZWzaC1ZZz/D
	hARq/4yNWuPnTqVU2ZBXA/M=
X-Received: by 2002:a05:7022:3f0b:b0:1b1:f02b:232c with SMTP id a92af1059eb24-1b1f03a6a35mr12004352c88.29.1793749920767;
        Tue, 03 Nov 2026 15:52:00 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6b::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm2855464c88.15.2026.11.03.15.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:52:00 -0800 (PST)
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
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	razor@blackwall.org,
	daniel@iogearbox.net,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 5/7] bnxt_en: limit netmem TX frags to 32KB
Date: Tue,  3 Nov 2026 15:51:50 -0800
Message-ID: <20261103235152.1904727-6-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103235152.1904727-1-sdf@fomichev.me>
References: <20261103235152.1904727-1-sdf@fomichev.me>
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

The TX BD length field is 16 bits wide. Limit netmem TX frags to the
largest power of 2 which fits, which keeps 4K aligned frags 4K aligned.

With 64K pages this already applies to PAGE_SIZE net_iovs, whose 64KB
frags would otherwise wrap the BD length to 0 with BIG TCP.

Tested on a 50Gb/s NIC: devmem TX from a 2MB hugepage-backed udmabuf
runs at line rate with 2-3 frags per 64KB skb, none above 32KB.

kperf output (sender side, 1 flow):

  client: == Source <sender>
  client:   Tx 46.358 Gbps (174483046400 bytes in 30110590 usec)
  client:   Rx  0.000 Gbps (0 bytes in 30110590 usec)
  client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
  client:           729   153 599     48    0 13893632 3147
  client:   net CPU 71: usr: 0.03% sys: 0.06% idle:67.62% iow: 0.00% irq: 1.12% sirq:31.14%
  client:   app CPU 72: usr: 0.16% sys: 6.01% idle:90.66% iow: 0.00% irq: 0.83% sirq: 2.32%

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Acked-by: Mina Almasry <almasrymina@google.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index e7a4190a8c78..c8a887facc20 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -17439,6 +17439,7 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (BNXT_SUPPORTS_QUEUE_API(bp))
 		dev->queue_mgmt_ops = &bnxt_queue_mgmt_ops;
 	dev->netmem_tx = NETMEM_TX_DMA;
+	dev->netmem_tx_max_frag_size = SZ_32K;
 
 	rc = register_netdev(dev);
 	if (rc)
-- 
2.53.0-Meta

