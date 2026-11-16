Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867993;
	b=wE1unVrxOWphd6TVAk58LdcxtQ4T350KRfVGffaHq4Heq9rA4sSuH4jNUQ154Y5zMfat
	 IPT3ticwnpydHFQiccvr6d+WXgfj9pE+8ll1rgUFVc3bTSvEeEkT6qDekbHbUHg3GXeaY
	 mnIKR1ZWHwQjX7SIuFHm5NsJl0rdGjKraVaNBeOAGYWOpNfCDD3Vo3yBq36mgjt9Z/kBB
	 oGbuALg2ds2nW501GPAD2wMkzRtIBnS9QyqwRPnIJNDPLOrCyww8B6FNRFvSWJezl9RjS
	 l+4ptyDC4zmtNUMIcHlxN6KD4bm55xcEzlxi/gAZ+6mfSwCw2jdOe4IWrNJnawLLJQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867993;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=SwgKM/LUsmyzVGglaupm2j1ixL7nRDboOcNVB38JNgg=;
	b=HleIP+4cvooEEsbdggiDNB0DG6N1vJgrX6Az8iVdYnJuFcQeK6m+66DHEdT/kNT3OKD6
	 e5xCcx5uNqH8ZWlmOZRTAqM3leyayn3K8+8XkH0EBe0lf9MvgQf2y6/BVZ1RD8XVNA/jZ
	 jX0At9wQLfCFGcIX9N58gAjHCHZzf5/GoFjxFai7I0nSEIUCpisSkJdtyXGl7c5TCibSS
	 nSTYMMvdCeAs2ZBkWsH/cQBLcsqlA8iOJtMaS0JZkhXWENafV/Rwo5XFyvD0+PwOJ6d1D
	 3r9mgvoanVUkgPNqzesudhnZykLv62bsQdv+lYiPGZNYhVjd8IGkurs99pTh9WcWGQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZXVYLoBe;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0D7606A88B
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 22:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E0D7606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZXVYLoBe
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so2526237a91.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 14:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867992; x=1795472792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwgKM/LUsmyzVGglaupm2j1ixL7nRDboOcNVB38JNgg=;
        b=ibPwIDyGyhYHT0HUeSE33Stae1/g3yM0zt3Exc7HG0yA0ejbluHmgeZpeDil/aB9Bp
         dHQ8HFtu9PG6Orkucbi/7uA8R0U1Q+yJyrUVoGWRsED07WWCWh7bmjy1QAxwfRLb7lLc
         rJmAoqLocsiE2TYNhKbRGUD/+J7OkfBkgLXtEaC2f15Kqeul0FO+mI534ozlp2qiwRgO
         mgGCFYbrtZXfWdExEjRYm6Nfo3TAAo8UfXKtbzDfrHB4wIfNXfc8DLboGQ2E5IydMsg0
         gseKheSV/qyHHUEeCa3DYlQ4fzM456cwLH0q4UT1g9AJEjgbpXT/ektkACQ7SpLJW4Nh
         hnNQ==
X-Forwarded-Encrypted: i=1; AL+hErGf1Ru14YE75c2AQvc6cgVLJVPWSV3PLtxRKYTiN3mmv8bgOw3KkKzqCgw38P0mURhq08FGxOfhoxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YCQQrKu+EOuN3TZHbvZINhlVcbPfKzuElf+YYBlX2fkiboXjI
	4KjI61A/s2aIkDTEradEJ4LL/5i2xVNkgzNBhfhvJSeYVNwqP5mxLzdhThfDi+bx8mJ3NGp9kE0
	CuEuI8Vr3deIhEIUAJpf4xkidez1JrqvO/MZ4fknXVFPEOZdPf37Xj5W8v6mUTbjY9nqXvkmZvE
	qiF5I5ECSvPFY646qe2CgkSn3GTrW/B9F9ZAfW+bPIXPQ31HoQF1jivPdHaKbH7V/+yodwFlBSY
	B9X3wteLrt79REEFZRn
X-Gm-Gg: AZFdTZe3ECRTK/ufTdLUbKXLLJkeFFKRYnsvajHAvTT68vyMfxwPHoGqi5bTvjVcfNB
	jbvhRuDxTvF9MGthhfkuvxsDpQEeJqkEcekDxAfHfbJwqEUvGuGQeSauFNRjD8bEOGYzXdzZ7al
	oWF9NrYCO+pZvATAYruZQBRyzjIdLTIoB1AvQsCTFK7hfjeXQohIju6gcN7kxQzA3VA7ND1FPX9
	eUVQhDs6+HqW8xaSRNrAaROhIIMdN5rU7l+PjTO3rnQDx/JZ6l0TgXBvZzspTS2cP/klFtwazk1
	pOm34jIP0/u9ls+DGBSEJAlA3EizT/pwxVu5n3Kfr3OjEQV+rrizQu3YQaIy+KgBa2vzNAeqH6p
	AfMlTDCBS+AiAYJ4y1Sxen3gC5WavFqyyyfsXFMduxYgDob3fX79xQjGgIop2alelknGAOCKUZS
	Aw6/u8QLxf4zQdQLzE7aLcfdf3W1sPgPG6LqnCrEugSj0=
X-Received: by 2002:a17:90b:3d87:b0:3ad:5c64:c7ae with SMTP id 98e67ed59e1d1-3b1b0ca547cmr11286278a91.57.1794867991868;
        Mon, 16 Nov 2026 14:26:31 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2efd7b09a47sm315115ad.41.2026.11.16.14.26.29
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:31 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1af203073e0so3533213c88.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 14:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867988; x=1795472788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwgKM/LUsmyzVGglaupm2j1ixL7nRDboOcNVB38JNgg=;
        b=ZXVYLoBeyjKuwDQQHfurKC/93+dEugF/FYFfNiIwPyyiWcQZ3lc4Z49np2Y8lLqFJa
         x14+TMrqyNZ6Ljz0yqlI39wpihU5gR1eq+/T7ksrIVVe+S6b2fKwf17Df5d8L9tmqYPA
         sJZUfmYkx53VWsG9RFS0ITZvAs3EWrL8Y36nE=
X-Forwarded-Encrypted: i=1; AL+hErFC0GAZyltNuoZWcsiSC+8pwM0RO1tc7Ub2OGcIeUvb4zka+KDZkfN2sMNNtjntSF4XbghwC4pCwO4=@vger.kernel.org
X-Received: by 2002:a05:7022:7e86:b0:1b3:8814:8383 with SMTP id a92af1059eb24-1b5030e77efmr10964767c88.9.1794867988136;
        Mon, 16 Nov 2026 14:26:28 -0800 (PST)
X-Received: by 2002:a05:7022:7e86:b0:1b3:8814:8383 with SMTP id a92af1059eb24-1b5030e77efmr10964713c88.9.1794867987246;
        Mon, 16 Nov 2026 14:26:27 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:26 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
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
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 2/9] netfilter: flowtable: reject non-host IPv4 packets before lookup
Date: Mon, 16 Nov 2026 14:25:12 -0800
Message-ID: <20261116222519.1416501-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The IPv4 forwarding path rejects frames whose packet type is not
PACKET_HOST, but an installed flowtable tuple bypasses that check. A
packet addressed to an unrelated, broadcast or multicast destination MAC
can therefore be forwarded if its IPv4 transport tuple matches a flow.

Return to the normal stack before the flow lookup for non-host packets.
This preserves the IPv4 input path's forwarding decision.

Reproduced on BCM53012 using an active UDP NAT tuple: classic forwarding
dropped the unrelated unicast destination MAC while software flowtable
forwarding transmitted it. Boundary tests cover TCP/UDP, both NAT
initiators and unicast, broadcast and multicast MACs.

Implementation, tests and changelog prepared with OpenAI Codex assistance.

Fixes: 97add9f0d66d ("netfilter: flow table support for IPv4")

Signed-off-by: FLorian Fainelli <florian.fainelli@broadcom.com>
---
 net/netfilter/nf_flow_table_ip.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
index 19cafae748ab..98bade1b8299 100644
--- a/net/netfilter/nf_flow_table_ip.c
+++ b/net/netfilter/nf_flow_table_ip.c
@@ -911,6 +911,10 @@ nf_flow_offload_ip_hook(void *priv, struct sk_buff *skb,
 	};
 	int ret;
 
+	/* The ingress hook runs before IPv4 rejects non-host Ethernet frames. */
+	if (unlikely(skb->pkt_type != PACKET_HOST))
+		return NF_ACCEPT;
+
 	if (!nf_flow_skb_encap_protocol(&ctx, skb))
 		return NF_ACCEPT;
 
-- 
2.53.0

