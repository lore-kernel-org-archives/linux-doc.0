Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919219;
	b=d+jg8C1/DN5HXjkuvdP1yNaNI/X2QGq2bjh2m4ECDWPPAoems7Ax+YW1qguitCyVhM8w
	 FBiFSCEn+WmLipfCQCsp8frk26MJ4OTWuxaJxZkpxU4OTdestvCsnuFPA6k8vnIjggGBK
	 CUZ1UwjOQ65xa1rQjxuZB/fGD4S+ywBOE2tR5o+mltIm4hvoRX/X2zBBqdQ0Tkk7F057K
	 5VrTVQVdiTvErklt31vvyhwkve2IRGJXYmeU/JETQQpo6g1lKJkrk+Yv3SBGWNU16ycNJ
	 V7g8qTLgbXUapfCsiKyBuvZM0vQLNYycHAdhxqugsN8lpDmxWqS9ryvcWrtLEk//UyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
	b=fSbP1AbQNBlB8paY7US7cbuHOX9nE6OXn3Fdd22+1X4iot6yUQi7P8OnexuLylOGvRiM
	 A5bZUTZhfI918i/Isr8SSqtDaSS58uE1zGP4bXX+lGQJNZY05y3sYjioMvsp8lpIigk2s
	 guVkRkglwBkezUnDCNaUmJWRFUAsjm/u/TNoTP0ry8DrTiu9dikzvpUoF2HV7EIsVzgSr
	 6XdePtxtY9L3VUcTV3c2YX4IrjwDLaF115DLPog7Krsg6puye3Ko4XuKrrDZZ5s01tguk
	 ScQ7xLQhTZp+k/71afuWiySn4wo8ue4CP0VZDS1byNGxhxQFtUVXjLMXMkzULdQeh+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cD8I7k4x;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9B1606A8B0
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 12:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E9B1606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cD8I7k4x
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so47828655e9.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 04:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919218; x=1795524018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=cD8I7k4xDGq/qBARL1vrdzp6+zD8+TGMO3ILYOwEhwvbBTbkFKokDA67pD0xhaRcx5
         l25xvG3H1BjIgmcC24KztZzkdeblUuckTV9neVu0CCs8onFLtmVNk+ICrdt6cmtpkfAx
         NTwhd7Rt23vZp79UHXVk/O0zPc6njAMDkXvLrlnq9G0qX5sCBfLbnWTv3ujpFpBl1V2T
         YB2DtCZ2GVP1Lg+cAsrz9UN89V4eZ4eewqaJbKNqLyGONEXdRCynnp2o3mH2KAjCrQsU
         EPZQx5kN2ucNg7FTkd8yi/RSb6yjTIyruRiDvxsjrtKnBnpaUoy6DKRTo2OMMH5CkoWG
         6DZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919218; x=1795524018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=IeXJXRikvpFYn2OwJPI8vRiBDuM3Wr6j1pBo03REpWneMznVVpByvcpo4TIJHjZS1J
         FfqT/hAZ2+iHfsU6VmtgkZhJ6DiurCsRx7lj1HponkhW2ZzVifnLN+hW57QImxrDYQ/8
         V9k9MCflV2CCmf//D4KiXI6qyl7BCFEx2kW4oLWN4nxOcEN1lGE6SQmiMUzuYEAvxsXx
         9516G8MaHbbhOJBPr43ngBNe4MzPJLzViq0jjclepQXijQS0GSW0Eu64Awbi8qVgZN+u
         2qn0pn1iZs611Q2muk42pFIWcx9mBHdShhszLJyDx9t9z0L4oJBHZYvOoSLWkz47DI3O
         iAXw==
X-Forwarded-Encrypted: i=1; AL+hErEah/Z81uYPqC5SYPrs2/8Of4BbkQhowtDFOS41KH5NlTBY+zk7mB4WAWlpdGz5h3MIyimyi0/zDGI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vaRrjU0uh5MVHKbMGYyoa4W8Q2jmJ37IIcxmRZlCdpqd+MuSG
	bDAlw9MTN+rssIjDzCa/dd4ZxWjYagUTmk6+Zaaycy3HytBnn1BNHGZE
X-Gm-Gg: AYBFou2fIO+W6ZXVIzjtwVj3O/a+7aSx3RLPjPR7mc1LZwAPDwkeAG/KjomrnZpHqto
	llA8cuqis4k0DuKNtJ6KXP5E67QbV3ngbJvRIInZ0V//caBDU+7xpokV1WvWV+IdcYgE5RECoJw
	D4O7kOU1KYlMbie7mL52mxdqACliMMDE2PDxMKmrQboiANt7dV4/Ns7589YEjbpHYVFDWvqxFt5
	v6cknuFiEPKfPxO5hFuCTIOoQmNtUc0GlV7uGcQNLYXBFEnj6cUtJ67ITWLrU1pbU3pwnXAsTH8
	zzR2eZe62VkqAJqjS2ZE8MG0JwM55uJMT26+ec6u39xhreI595bSlo62gpzZ+lH+OVZPgwqOHP0
	sjncGMUL2bSmiNiWUKOCcfzJshENEsZ0aZim12RjPpnV86Kh2nIs4fgIAv0xgrlJvHv0j/CeQS0
	/6dlBTGA/CFaGR87sYWYm0CC/YSQqHVVV3k5saWQw6O8reEqDr8noa1BnNWOXJkn9dWJj32eSrx
	Eh84eMLApDXhPQvF1Sthe+MM6O8RD6bX5j/yabKOyrghZSoe7GcoBuJr25jjoAqVkpTrEPR/8F9
	8r0/bIMnHS5316rwMKuJ1wv1CXJ5T3mBpZ04bLjh3G+gjgYWbSAgxFQ3PH8b40ykChBso3Uno8p
	Cc0ib/HUuQ+P74pTseFDhZffGkrKsrj0tZd0=
X-Received: by 2002:a05:600c:8b81:b0:4bb:5f45:c97f with SMTP id 5b1f17b1804b1-4bb5f4f93f3mr220965765e9.27.1794919218079;
        Tue, 17 Nov 2026 04:40:18 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:17 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Tue, 17 Nov 2026 13:39:45 +0100
Message-ID: <20261117123956.11981-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
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
index e8ba906cfba6..091c3a79c120 100644
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

