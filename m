Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8902A1E897
	for <linux-doc@vger.kernel.org>; Mon, 26 Feb 2024 22:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708987634; cv=none; b=OwoQd3LGTh6R6ly759LYYAjwFjpTtVI7A6xfiJAxHPH1k4hMm39Cx/eBVW4oghzakPLB5X40iP1Lm4VCFckN2mbC/xfddEad7P+HQ63sET058g8fCu1Ee2sFH7q1j07TE6knH6X9uiynp3jMNvOfTJFRDIyKawCodjkMup1tBno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708987634; c=relaxed/simple;
	bh=6S2iaa1ziWP/+AZL5PVpvzk6dQnjcMLBdQBD+N8qB+8=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID; b=J15+cHCjFqyTJFj7M8MyBlX38N0O4xN4Hvn1Ho40UG+DhAKrl47LquCamhXdHFZZUTuwGsUDBLvk9i/mvhL7yplwENsGGEpAIKFHnJwvTXsb2zLQiBBjEnFvo/gZ+erSSjXBUhL3p5Q6ZH2a4JEL2EjLGa4kCPePZ25R/lNqIWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=jE8AVnq/; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="jE8AVnq/"
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0DBFE40DBA
	for <linux-doc@vger.kernel.org>; Mon, 26 Feb 2024 22:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1708987623;
	bh=gr+WKKnlHjOQT4Ki8d0xTGUPBtTeKxzlDsfRKLcxP1U=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID;
	b=jE8AVnq/jQkuTpV0+yrrtn2qMGyZABwqMNcjdZra0kJT4ya6vjacp/TGVp1ADhYFU
	 tYNTWTZC2CvuDJRGP2SephbGbYSpQO/dI4PpP1PzV/Ndoh64D3I0irbXgcDUDZ7Epf
	 /FQjDXAVtVkIh2NW3R+1Ck2P5eZHXoxlPTsbiDaxgKxrm0NQC3CTdo050UGv+Pc4kF
	 TPtedurvw7WeTvBoG+xikAxnvnePizA/yV3zbvxxAfW3TOoTUfpwgZ22MsECodHXiM
	 YsVDASPqs/iRV7sK7378IR9iNrRANMp9NcVIU6NKyCJp7ynZVhcB6oceP0HR/evMhe
	 6DPb0hk8U5Elg==
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-5c5c8ef7d0dso3179098a12.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Feb 2024 14:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708987621; x=1709592421;
        h=message-id:date:content-transfer-encoding:mime-version:comments
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gr+WKKnlHjOQT4Ki8d0xTGUPBtTeKxzlDsfRKLcxP1U=;
        b=s1KXVfqAOE5na+9AP0X1kWb3r9PQwh6A0Ah4C1Gry2cicPEeADsMuRNnxmtUq+Cqdi
         anYWxjzNS+aqH0ajMgnGAAn9bqS1Nn1EoqwvawkPbmIc7BD/PyZhZqo28u//G5dTpjJB
         WxOYpa80dkY9PwRwHNPJ0ClBlvLsaOC7OXgcE2MFWMCG9OhyvgcsJy20B9yUxB/7JMzT
         9ciShEZl8L1aLVjzxHNiKO4Zo/uVstcTMBmUmKlTg3iBoYk4dxWUEGrOIwQjKYw9XY7s
         P1YUyHFlhcyO6qZIiOHAHD2TFoSCDGbD72/DV/lJ6ru7++g4DQsfsQcpGSzR/RO0MOdo
         6ehw==
X-Forwarded-Encrypted: i=1; AJvYcCV9qzYD953z3W2vz+156BVByFPd/d/NQrx6fiIWZmcvhiErSEhUzo8llryS/6cggJN0IU7JyZOWEK8g/1m8SStxwlkTcrwEU8Xn
X-Gm-Message-State: AOJu0YwgioRrG/S0ePzt83KuFGe9tqLuaMonvQyvr8LFSABqxV/Qtt8w
	mxL9DQKivrO1C2Ye/EdhUk76FSDZxfu9z4Ib60BrSFPJehiMCrwniB0AXHSZkOLnMZZfzsqE1VZ
	HJYFcCo35TdDwMzZ0+BVSt8GAdp+5f/ETIZI8mBdqXie3RpDVTvLajHRPe8KJBtEUJjniBrwGmA
	==
X-Received: by 2002:a17:90a:1210:b0:29a:adb5:b045 with SMTP id f16-20020a17090a121000b0029aadb5b045mr4473999pja.9.1708987621446;
        Mon, 26 Feb 2024 14:47:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfO8b7Km0xOTYWEQV0dBP+d4tg1/74p4NInrzrufP6TwLpfyBM1I5NvyZZu8SzCRkTtprVwA==
X-Received: by 2002:a17:90a:1210:b0:29a:adb5:b045 with SMTP id f16-20020a17090a121000b0029aadb5b045mr4473974pja.9.1708987621028;
        Mon, 26 Feb 2024 14:47:01 -0800 (PST)
Received: from famine.localdomain ([50.125.80.253])
        by smtp.gmail.com with ESMTPSA id e4-20020a17090ab38400b0029a75101532sm4909195pjr.50.2024.02.26.14.47.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Feb 2024 14:47:00 -0800 (PST)
Received: by famine.localdomain (Postfix, from userid 1000)
	id 34BF0604B6; Mon, 26 Feb 2024 14:47:00 -0800 (PST)
Received: from famine (localhost [127.0.0.1])
	by famine.localdomain (Postfix) with ESMTP id 2EF979FAAA;
	Mon, 26 Feb 2024 14:47:00 -0800 (PST)
From: Jay Vosburgh <jay.vosburgh@canonical.com>
To: =?us-ascii?Q?=3D=3Fiso-2022-jp=3FB=3FSm9uZXMgU3l1ZSAbJEJpLVhnPSEbKEI?= =?us-ascii?Q?=3D=3F=3D?= <jonessyue@qnap.com>
cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
    "andy@greyhouse.net" <andy@greyhouse.net>,
    "davem@davemloft.net" <davem@davemloft.net>,
    "edumazet@google.com" <edumazet@google.com>,
    Jakub Kicinski <kuba@kernel.org>,
    "pabeni@redhat.com" <pabeni@redhat.com>,
    "corbet@lwn.net" <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>,
    "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v3] bonding: 802.3ad replace MAC_ADDRESS_EQUAL with __agg_has_partner
In-reply-to: <SI2PR04MB5097BCA8FF2A2F03D9A5A3EEDC5A2@SI2PR04MB5097.apcprd04.prod.outlook.com>
References: <SI2PR04MB5097BCA8FF2A2F03D9A5A3EEDC5A2@SI2PR04MB5097.apcprd04.prod.outlook.com>
Comments: In-reply-to =?us-ascii?Q?=3D=3Fiso-2022-jp=3FB=3FSm9uZXMgU3l1ZSA?=
 =?us-ascii?Q?bJEJpLVhnPSEbKEI=3D=3F=3D?= <jonessyue@qnap.com>
   message dated "Mon, 26 Feb 2024 02:24:52 +0000."
X-Mailer: MH-E 8.6+git; nmh 1.6; Emacs 29.0.50
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Feb 2024 14:47:00 -0800
Message-ID: <16063.1708987620@famine>

Jones Syue =E8=96=9B=E6=87=B7=E5=AE=97 <jonessyue@qnap.com> wrote:

>Replace macro MAC_ADDRESS_EQUAL() for null_mac_addr checking with inline
>function__agg_has_partner(). When MAC_ADDRESS_EQUAL() is verifiying
>aggregator's partner mac addr with null_mac_addr, means that seeing if
>aggregator has a valid partner or not. Using __agg_has_partner() makes it
>more clear to understand.
>
>In ad_port_selection_logic(), since aggregator->partner_system and
>port->partner_oper.system has been compared first as a prerequisite, it is
>safe to replace the upcoming MAC_ADDRESS_EQUAL() for null_mac_addr checking
>with __agg_has_partner().

	Ok, I missed this bit when I read the patch this morning, so you
can ignore my earlier email's question.  Patch looks good to me, glad to
see null_mac_addr get the boot.

>Delete null_mac_addr, which is not required anymore in bond_3ad.c, since
>all references to it are gone.
>
>Signed-off-by: Jones Syue <jonessyue@qnap.com>

Acked-by: Jay Vosburgh <jay.vosburgh@canonical.com>

	-J

>---
>v3:
>  - replace macro with inline function in ad_port_selection_logic()
>  - delete static variable null_mac_addr in bond_3ad.c
>  - re-phrase patch description with more precise text
>  - re-phrase patch description in imperative mood
>v2: https://lore.kernel.org/netdev/SI2PR04MB5097AA23EE6799B3E56C0762DC552@=
SI2PR04MB5097.apcprd04.prod.outlook.com/
>  - add correct CC list by 'get_maintainer.pl -f .../bonding.rst'
>v1: https://lore.kernel.org/netdev/SI2PR04MB50977DA9BB51D9C8FAF6928ADC562@=
SI2PR04MB5097.apcprd04.prod.outlook.com/
>---
> drivers/net/bonding/bond_3ad.c | 14 +++-----------
> 1 file changed, 3 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/net/bonding/bond_3ad.c b/drivers/net/bonding/bond_3ad=
.c
>index f2942e8c6c91..c6807e473ab7 100644
>--- a/drivers/net/bonding/bond_3ad.c
>+++ b/drivers/net/bonding/bond_3ad.c
>@@ -82,10 +82,6 @@ enum ad_link_speed_type {
> #define MAC_ADDRESS_EQUAL(A, B)	\
> 	ether_addr_equal_64bits((const u8 *)A, (const u8 *)B)
>=20
>-static const u8 null_mac_addr[ETH_ALEN + 2] __long_aligned =3D {
>-	0, 0, 0, 0, 0, 0
>-};
>-
> static const u16 ad_ticks_per_sec =3D 1000 / AD_TIMER_INTERVAL;
> static const int ad_delta_in_ticks =3D (AD_TIMER_INTERVAL * HZ) / 1000;
>=20
>@@ -1588,7 +1584,7 @@ static void ad_port_selection_logic(struct port *por=
t, bool *update_slave_arr)
> 		     (aggregator->partner_system_priority =3D=3D port->partner_oper.sys=
tem_priority) &&
> 		     (aggregator->partner_oper_aggregator_key =3D=3D port->partner_oper=
.key)
> 		    ) &&
>-		    ((!MAC_ADDRESS_EQUAL(&(port->partner_oper.system), &(null_mac_addr)=
) && /* partner answers */
>+		    ((__agg_has_partner(aggregator) && /* partner answers */
> 		      !aggregator->is_individual)  /* but is not individual OR */
> 		    )
> 		   ) {
>@@ -2036,9 +2032,7 @@ static void ad_enable_collecting(struct port *port)
>  */
> static void ad_disable_distributing(struct port *port, bool *update_slave=
_arr)
> {
>-	if (port->aggregator &&
>-	    !MAC_ADDRESS_EQUAL(&port->aggregator->partner_system,
>-			       &(null_mac_addr))) {
>+	if (port->aggregator && __agg_has_partner(port->aggregator)) {
> 		slave_dbg(port->slave->bond->dev, port->slave->dev,
> 			  "Disabling distributing on port %d (LAG %d)\n",
> 			  port->actor_port_number,
>@@ -2078,9 +2072,7 @@ static void ad_enable_collecting_distributing(struct=
 port *port,
> static void ad_disable_collecting_distributing(struct port *port,
> 					       bool *update_slave_arr)
> {
>-	if (port->aggregator &&
>-	    !MAC_ADDRESS_EQUAL(&(port->aggregator->partner_system),
>-			       &(null_mac_addr))) {
>+	if (port->aggregator && __agg_has_partner(port->aggregator)) {
> 		slave_dbg(port->slave->bond->dev, port->slave->dev,
> 			  "Disabling port %d (LAG %d)\n",
> 			  port->actor_port_number,
>--=20
>2.1.4
>
