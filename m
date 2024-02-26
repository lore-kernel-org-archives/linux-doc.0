Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C35605A1
	for <linux-doc@vger.kernel.org>; Mon, 26 Feb 2024 17:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708969600; cv=none; b=UfmKu3KnzpqGCY5NBYi1eR5KxAuOEyo7o6eTHITZ9iDElGWsQ++jc4EfvWKi4lCEn2jdY0E7SH+yjtQvn2gRT4/SX4MlH690BF+xlzX0QCvz0W6kIA9TrFO+e+lbYhLNHEw6Yvzv3pe8Cu5N0sGC+wyPS/1ARonRoRRf6Eux2/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708969600; c=relaxed/simple;
	bh=4wcegm+FrHnOWAQeGINRXP3mpmA+GrZM/54FU/bpXa4=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID; b=E/B57Wi6fP97zn6nPBSkKA4P5qKLBzx0ryI8IFDWX9bTUp8IUtvX8LERI7ILei4MBBNGmErbxQ2bhXMZcmzLIzNmXV2xduc7Pr/Xbe571Fwf6fgc3cEoVWxvlTu0F7xOCA1uo13f2aTSqP4MgRkNx/UFbMmWA0gFZSerKmIVAsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=qSnyqvjj; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="qSnyqvjj"
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C160A3FB6A
	for <linux-doc@vger.kernel.org>; Mon, 26 Feb 2024 17:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1708969570;
	bh=qlG1XXfMSTJgylXzlZx6s+GnEuZ5LCkwrjatFG2+AN0=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID;
	b=qSnyqvjjDPSEulTFDc9DV3UEveiIBeKAVIY/xQ5q0PYgX7ixhDZhHDjUVD5I1t0Mg
	 cq7zhkrrIp+CmdqOn6jCUK74Xf4aQ97aX8uw+6pxdiKnMb1OeCIFFQa68taWKam5Zd
	 nUj3OpMkOTm5QAMPBUBsJ4WYhfRcIRmA0CfLf/WWgVNACEui7o+JSA0+GsCLAG6pQP
	 NXv94c4CCXxwH/IvXC9jwnklALfm14rTKYUEY87X4HAMXDsPMWmiMScjr4a7xuXhvk
	 TmY8HQDHFxobjjekhygOCf0IvnaAPAL/XG3n3xtbpCyBciC195lEldZigfVas+Jf92
	 A0u1X1jRaXGew==
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6e09015f862so2277159b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Feb 2024 09:46:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969516; x=1709574316;
        h=message-id:date:content-transfer-encoding:mime-version:comments
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qlG1XXfMSTJgylXzlZx6s+GnEuZ5LCkwrjatFG2+AN0=;
        b=CUtFEtwZ8xiwxby0a2kd97rSHWBHNYlqFuKDs1U3QYLv3N5PTDpvQfeCn+XzBfAye/
         6X154IpMQvbOSbLizJ7y18j3u5ggk4qy0JXkAycfNQgXPNZF/3DpfQbW5cn8rCAN/UvS
         r5KwXWcAMislB62oF4CuYs0sZai5S8x1re5uOSl/JJk4D/tV1KFGp+0IrMaJ5gfwge4Z
         73g+SHkL4pRKVYBjmW8r2zQn33rT32BUhnNVInmFEAyZO7sRPgiIznr926e9y11JhG0w
         mmxPYx6pJWj/lsk5zAVATnoyZs6So4g1NZBXDos0B4RL4f2IQSpVdtzpoCms6xAUbaJw
         8YCg==
X-Forwarded-Encrypted: i=1; AJvYcCVhoz4JE9t+eXhkCECoM2it8kjJGsO21Pud1xpCvOBsJZXHVHd3UK8tZYOIc6ejrGEkQFBC2mOXESLq5NGQ1SqmLXL4raNGbSCU
X-Gm-Message-State: AOJu0YzxMvjXyBVUx/Du6w+776iu9Z2VIosm1Eqsk0YpvqdzaLH6vc+N
	kSFyPNbMAzcAz2DYQwUGgV+WIDh/g/phMJx5gK9GV48wsdfwAOpLhDcAsxO9TQ38hg4+m4KAS7T
	WeyXdueZzKvuHiNUoQFqpkEFkFX+JuMomfdTcbhMIp8U3jVY2+DZ2HjJhT6rPtL4PHWzgH7MYqQ
	==
X-Received: by 2002:a05:6a20:93a6:b0:1a0:e4ac:9c7a with SMTP id x38-20020a056a2093a600b001a0e4ac9c7amr8729906pzh.1.1708969516012;
        Mon, 26 Feb 2024 09:45:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwrH70fY1lfDhaL/wJvKiyVY14zTHKwXoKQrun8J7qB0UIM8KzO1Ma3oQtc6YCvbaQNxkCvA==
X-Received: by 2002:a05:6a20:93a6:b0:1a0:e4ac:9c7a with SMTP id x38-20020a056a2093a600b001a0e4ac9c7amr8729891pzh.1.1708969515647;
        Mon, 26 Feb 2024 09:45:15 -0800 (PST)
Received: from famine.localdomain ([50.125.80.253])
        by smtp.gmail.com with ESMTPSA id l10-20020a056a00140a00b006e50c083b90sm2817375pfu.212.2024.02.26.09.45.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Feb 2024 09:45:15 -0800 (PST)
Received: by famine.localdomain (Postfix, from userid 1000)
	id C3BDF604B6; Mon, 26 Feb 2024 09:45:14 -0800 (PST)
Received: from famine (localhost [127.0.0.1])
	by famine.localdomain (Postfix) with ESMTP id BB48C9FAAA;
	Mon, 26 Feb 2024 09:45:14 -0800 (PST)
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
Date: Mon, 26 Feb 2024 09:45:14 -0800
Message-ID: <29939.1708969514@famine>

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
>
>Delete null_mac_addr, which is not required anymore in bond_3ad.c, since
>all references to it are gone.
>
>Signed-off-by: Jones Syue <jonessyue@qnap.com>
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

	I'm not sure this is an equivalent swap, as it is replacing a
test for non-empty of the port's partner MAC with a test of the
aggregator's partner MAC.

	In the port case, it is validating that this specific port has
received a response from its link partner.

	In the aggregator case, it's checking that the aggregator as a
whole has received response from the link partners of members of the
aggregator, which does not include the port under consideration for
inclusion into the aggregator.

	As the port is not yet a member of the aggregator, how is
checking the aggregator's MAC for being non-empty an equivalent test to
the one it replaces?

	-J

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

---
	-Jay Vosburgh, jay.vosburgh@canonical.com
