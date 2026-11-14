Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653084;
	b=uzYwBKwxpWxnwsySQLepXafd/XkC2yPU53Ab8ICJn5Q6ShEWRjS15QM9aXkMtPC6Ul2p
	 Jo13C74JpXEDcaRatohJ8CP7Lj7hGxhBYiBZAy2k7xTikg3ei0FG7x/CFak0JYnjnhk8P
	 AZZQq26VygJdQxjPdsnV8xNZKbuXDi6zuEgxokdevoeHkyszl0yqlHH8cR9VcShLNM6Zf
	 g/jQJJRmGfY6slakCGsYYU1cd4FBpUb58eCZ38NAbXKdmvcPvD1e6yYKMuCYBplAekcvx
	 MpFu4ifPJIK98MI/N06W94Gdjcp8dkjAP58rWmek5YtMjfUqH2Ub8v7XNKhcNkdHSSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
	b=kpjwI/oHpnbuITqESS6m3E21Ewa8vKWxRTG80xC0p9dLuf476SaaeNraJu1z7ETeWozi
	 9STSh/QueuV2csi1pprqSHYY/3YHNQmrax2Knoo1oJVb1g8EmqeAHEn2m5tV34r9xlTo0
	 ERLTJNYnmGv1xatiOQooCAn15xWtnAyCxyYLkKzyIyEEIhk0I7kuw8V5eUcEu4GJcohMG
	 anARzYqPX9Z2FwJa1pLLwXSyeUNrmc+PUByuvvgQ9zRvfYRuuFr9wu63KPnN92pTxYybH
	 llnNnetUjK+UB9JRIn2ltPz9Rqud0dEI6hi4Pn3N1jrHhuP1iHeoDUyKz6b/SRehg/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pVOWEp3W;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8204660A3808
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 10:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8204660A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pVOWEp3W
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6754bf2dso904615e9.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 02:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653083; x=1795257883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=pVOWEp3WOe28qHag/t5ZSnvAb/yJWXgEYMDc9O/AXCJJhNh87hjSurMqxSevp8BUPA
         47os7gAgol87q1XUkyFhP4KDC0Rrc0HKpC/MGriNoqvenaMsS33T+8IfzXvwfqqZqTZN
         Y+8IXGqhR4fb83HfwdqYMWq0iNgGQpv+ISOfWgGe1V8odOo8doM2JLdocyDkQ3HHO+XW
         /CKSh8dcfjaweQxN1sWFHQeDhMTXeZxO/O4nvPutektuHyQ+PxWp/gcSmKUoriJ1OLNf
         5XV0hBqrXgILz5Iey4nz/oJvMiMJSpqJUklTXmzCeJWuu6l6w97xx2/6sJd//3fxdqkw
         zqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653083; x=1795257883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=VD/BOShmmx0qSQQkfCBTZSEK6+cjMD+ISAgZqbVDldrQLmKojSE3d30z3LfRCznzTf
         l1wa1Kc3ZBLDMRFJtn4XABFQVHos1jcBQI1xTg+0O6KpxNOB7/M5l1P9fJ2k5D8YTXNY
         WFzFS8GJLmk2aSiM39CDONcWyuSv/lnDYVbKNY3E2g6LHe9bQNjib6LPkLaBSmoGaJuo
         rkdn6vtvhKRauqY42Wj0tlbdt5xh52iZRNksD4a6RWm/vm3O/vpL79motFpNAFKtKC5+
         +o0goyo/fgm9wUPSJmR2QayF7+H+99VCXHYnBIZ2F1kbXMLFgS7n2ZCPQ9/S8B6weXm7
         aPaA==
X-Forwarded-Encrypted: i=1; AL+hErH5HAF26OeBSb4cDSpIqKJS2/1kqHkAql8LjGw2U9KYyWcOVAeM7TYaDkvtwjEd4Zo6NaVwLUnSn+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IgbL+CEQX6Sk5d3lyJBEHKeehXx/X6Tb6l4WKdh8tXHPqPSzk
	Vu+LUumsi4mTQGYb6DSLeb8Oupd+Dnpp3OIHo6fzLRgcQpPMVrkLhsIy
X-Gm-Gg: AYBFou1o8IxSR6DUMgoN/fhPGmahLJTXG5Yu2KD9Mchxtuy9s0mdiGSKiPeWuUGDzid
	z+pB6kEHQ9NcBrx82tosw/OVMUHxC3xlLxZopvG+hSHMcerom4f39Dg6mxSqR++aaT2PymnbmIZ
	PN7Fhfdf9XPchnQABw4ZizQk9GioPf5KRpvHb7jDc1Cplzo/K/c9f8LO/aCaxwNRrBkXbkizr4b
	NqRvo0oII06LP7fbv4Pf+3XsXn13R23scjesApBeDrSyP9KVvqK9oJv8lNHxeF8xu7TAs5/3nbr
	l/KjH+6iQ1p888kCbXeUAuH4XbNjETDpFQ96Qga8rd5Y4dmwJcXRexNDjQeI5xG0x+abF2wCmiA
	cILzmpvYQUNiCLix0gdT65RGzDJAhtPl4pktG0cEEKRSOwViA8/2BtfDlEZUnxBRsPM8wbcLYsg
	DuEUdKhyct44e6cY4fCjZuWtLlfvbHDg/Ib+XyqtxAiQ7BtY1WWAMO3AsZQjQeSra9nPFbr9yxl
	jbD+Ax468AWo4stW4BAUd0L1akv1E7mJrdghaV/OzdVYB+qepGPo6YCoviXfcFNIiqyoFVr0U7G
	Pljpo3EwT4Tc3ezI90XHO0igNNiwhYpV5hyymS6YUuPQ6VZ2y3PCavpd+Y5xOI4swyDDzBOMrVu
	TlP4LFRjXZrpAVcVxgVhyLeYkJVuDCc3Z5Q==
X-Received: by 2002:a05:600c:6089:b0:4b9:ff94:6b7a with SMTP id 5b1f17b1804b1-4bb55a7ed16mr107792215e9.20.1794653082907;
        Sat, 14 Nov 2026 02:44:42 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:42 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v20 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Sat, 14 Nov 2026 11:43:44 +0100
Message-ID: <20261114104426.235620-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
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

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 64b00d324988..e2e0b313fd61 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -47,6 +47,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2185,6 +2186,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2272,6 +2274,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2311,6 +2314,8 @@ void phylink_destroy(struct phylink *pl)
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0

