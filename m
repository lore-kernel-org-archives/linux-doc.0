Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846873;
	b=YdUL3XvZ5G+lk+QPFtAOQnLZLUnfRZAC5LdfAhnj5pBCJyjWizZxnHDOa/QlDg8e33w8
	 QwYVC/CwaQj/koLwkK1PpJqBJcS44BOS0qYbBA1YuW9Vfg1J6PxtvZXcDT9hNRArThoyN
	 tr6nEWz/22Lu1gtxnmiKPDq7gT5rRD2HfBUoqMIqz0mGUZeCxBTrIvXShliUGJ4cVZV18
	 OSy3EdmjkjayqLV/9yjXE2OAlwd/491sPxFkHeRzAHbPadAzjc7pdgOmMdNif19Ro2PzT
	 5gMxLiAld0wPFduGy+znnE8ub3bnMWKu9ULKHAprpNhAFCZ36+zqksbh9RpDdasov3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
	b=Hwg8eWcszWHKF1P1H0Qp5GpspiHqPJDHSJ8WvxHygeODHfaMZwXLSdrpozzUd60etaZm
	 2A03smt2XEaYOasYXY/4gfxe8zjfj1F5VTdf6cDBoOcWENkrAKR3IMaL/YpuuQqy0SnNB
	 JvItGApU1EN4KG5ShtQVO/ViVcFB73q7bDfVb2Rj6dpLFPbtYlgBCrl/SyasxyiyJNO6p
	 ERKr+v8FBHJWzCJzxr3RKTGXTzbQhbLP5DjsvV/BR7q5UxTZVihrGzSDuz2/3WEoFAICD
	 DAKWTdM7sHCrOaTBynKu1OztmouUwkqk1vhOIyGf/i9gizs906PWSXKlCjjzdxItYaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcOZjTxo;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405DA606A8B0
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 16:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 405DA606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcOZjTxo
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so38917335e9.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 08:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846872; x=1795451672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=xcOZjTxorByYizNJGssiaOGwwfyU9b6w4K9GiOMTxB1/FYWzqD31nxLNCMayp8ZYfT
         55WgPoRbpyPST//W3OuMjpvw1KCwPFP/l7e9QeNWRfPBkbtCwnsMq9cHDDG2oXTu1bbL
         sYopDicSNp4FQgXY01YPI9cnvbAckqki0hJLitiUfqpqw4bucvPUoMbcJegxGzUVOuLi
         qTWMTNwL6NlO+ViUHjPlfH9k4QzhxGPSiqE7/eFV/ypUj01YbAnTN+KIf5rKQmXZY26J
         V9aR5aYklwZNW2HT4bPogiXRlWT1d8hyWssoCEynKFbUFsbeJ0RjJoSihLgFY9D27lb7
         EcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846872; x=1795451672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=wtoNDVkTvPzYzD7IF2P+4zj2T7iDbIunZpnUttn1aAKQOgrkNa+Flyx8SYLOim6+34
         gB2xa+FNY+g98Ir2XrYKvMa/r8kP3SwfcU3tbdbgSfFK9P9eout8gJdVAgxiDSB9ODit
         itmqbP9V46IcfYnEW6CoN7aVY3GyyxJ3sG8M2C7kzzP4KhAc9JgpoFcz+caKgsFOAINn
         B9KeMvpJ7ylvUgl0jR+TfG1zRWeS0+yNzBex7C29CGkhdhJG9DCDeVIZwCOjQRXVCzb5
         yrn+iGdyrMG37V31Y7x4/KsDU1VB1B9iR2zdUrCZHsP+Z7mz6P1Ye0k+VjZ1ltNx4BJ0
         dWzA==
X-Forwarded-Encrypted: i=1; AL+hErF/uESzPpGyaN9zFilf2BVQ3Yeoxz3Auh8gE49R3wCDkXDRedWyXiuB7hJU9fyuBq7W5r8KEvu0uJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VeCWClHgA7GVzui49JSDNU8NhJzlrgVg9tc30YFLSDQvdmzo+
	TqPCbSaR9eKznyImbY5CPBp6UZvDgugP14/5mhtZgu0vSajoLK++JDAn
X-Gm-Gg: AYBFou0aeRt5Il8eCDI0y+1AKWC8Sz8VKVzF01vP7Cxjkykwu5RfMx2DxnEcHWc5Dlv
	7c5/jDthU6HrUdLkdlF4HTS5tqPU3wGrrnbRyLVmJ6xvj5gYzR+1wHBkFBw0n0kUcnIz8ecCMxo
	Q51hrBB84tf7lDq9SZ6sABC/VwXm4Hmc28syG8qJRljej2sDi2ECjnyspS/TtfELZBWFCtwrJxT
	XkZRkimKewaH6hn9mbYbv19IljR/8MpMk5qGCQ+eQQQVRZuuIygrMjTTYPVj+ZU/SuVb8jf4ern
	Td4GD6QZo10xY987FUA+yQlmCbKLE05bT3Z8JLY7MKxfkSXMLpAYj6DGj+ocNPp9A3H+/9fNenU
	f+1PBXDvs7MWwWF40x0OGPiK5Ruyo8dY+PpVRXG1y/pvQZ5ori8KFRegMTdMdzDUgx4oM0MkqKl
	e350tLLRdb76wSOjjRRPgTfJW5625aAMqaaTnQ6USUwg6j69qo/BoqBHcjWwZ58z6oRrVZ+5Gql
	aNaog2Xf/8T6xWuK4ce+xEJ/72NrsftYiju9uuFh3pym+9kg3N9YLwH2sbLxf4/gXc7/dKKJdm9
	C2g5C4SQQry84ciP/pvTuJpAXkPgxv3FEPtG40zzEoyufDuwhTtqV/XgJC9GKezdnqIrmGicabc
	ceL5Oz8/5yjwkKDJHEY7CR+KLKAhcI/j5SPPXJOigKyLXr9xHvaJS4DY=
X-Received: by 2002:a05:600c:1913:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb55ab021bmr249777075e9.30.1794846871585;
        Mon, 16 Nov 2026 08:34:31 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:31 -0800 (PST)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Mon, 16 Nov 2026 17:33:48 +0100
Message-ID: <20261116163412.551438-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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

