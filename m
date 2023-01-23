Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7292FC25B50
	for <linux-doc@archiver.kernel.org>; Mon, 23 Jan 2023 23:02:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbjAWXCo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 23 Jan 2023 18:02:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231867AbjAWXCl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Jan 2023 18:02:41 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E98C3929C
        for <linux-doc@vger.kernel.org>; Mon, 23 Jan 2023 15:02:14 -0800 (PST)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F3E0A44218
        for <linux-doc@vger.kernel.org>; Mon, 23 Jan 2023 23:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1674514896;
        bh=ws4I49gzal9OMpseAqlgTMxeS+K4PzsbLrV3ypXSgOQ=;
        h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
         Content-Type:Date:Message-ID;
        b=OF6qyqKSeHyRieSa3Q7uqds54yWcgZsaBnF6/GjQQuKXeOtd71Y7Fw2xVskmrpkSw
         YmpWZrwgSauDZNjOpABleR5bWHE9wS3h4L/pKg3wXqPVyCqZWp7OFfW1vPlqI+ILVR
         Y7A1+AFCNyN1K8b2XzGR8p1qJhuEMc9IjdvgF1NOh868kcTqIfukehRCfW7bB9HmI+
         xCJYyQq7EPqenSr7+JKHg9mBS/3+SegQCcp6ZuyIu5NxPDiSjwhXZjOR/y+ZOxtH0M
         jlNkgJU5zF5o3HiAphqEDtf0nHSQjuM60wdVhfK5cTT5+MwnpaZJ6u/bHLpd4x9aVY
         JwlbORBfgBrXw==
Received: by mail-pj1-f71.google.com with SMTP id g23-20020a17090adb1700b0022bbacff147so2931261pjv.7
        for <linux-doc@vger.kernel.org>; Mon, 23 Jan 2023 15:01:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:content-transfer-encoding:content-id:mime-version
         :comments:references:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ws4I49gzal9OMpseAqlgTMxeS+K4PzsbLrV3ypXSgOQ=;
        b=XYFd/b7BNjZgiixEeSJMD51mbZ/KXDM/kuqNKIGdRYOVy/T1SSVYxdL1bhNquuOGhW
         P52W4b8IgXUw3IShU+khICK/+W2ueMsCsSwX712M+y5U4S9s4stObpNVBVpBfA3V58rh
         YAeGXVOjRWMNOcqMrw8+BkHzXEFDAN7O3s9272AvouupmVvawtNLo4oqMGMM08rRUcKS
         FU8vPiozHJFHhpnBme/U855W+dlckk0ssKyTmhaeTt2Oal6QtomfsBJ/H1d4Ep8v6fkK
         rj1WFwSA3dH00qM1m1GXTaWWhtnDcQAWEKCFs+h+bv1YecXeyaGR4vbTYGdOnmN6wPvg
         Me5w==
X-Gm-Message-State: AFqh2kpheWyFdEjW5A45ulR0eR74KXDAAq0dXwxqlykgVoyuDxALgss+
        2FA6Tol6Pc73UkRmLvGX+KWIJgg1Zybj5hSk3U+b0HrPvd4uO6C20LopcIF+B/3jrxlgWMrrtPB
        jmfHNMiQlY25VC9Ymo7x8ym7JAlYcQSWlOnju1Q==
X-Received: by 2002:a62:ab02:0:b0:58d:982a:f1ed with SMTP id p2-20020a62ab02000000b0058d982af1edmr24276309pff.27.1674514894089;
        Mon, 23 Jan 2023 15:01:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv06FZ22qYDSbiHlRRzdN+ym7mY/jj4yLHKaDeEBtmszT7tu35ck+5fnK0SVdJqtyl59pVEFw==
X-Received: by 2002:a62:ab02:0:b0:58d:982a:f1ed with SMTP id p2-20020a62ab02000000b0058d982af1edmr24276280pff.27.1674514893770;
        Mon, 23 Jan 2023 15:01:33 -0800 (PST)
Received: from famine.localdomain ([50.125.80.253])
        by smtp.gmail.com with ESMTPSA id w1-20020aa79541000000b00580fb018e4bsm96558pfq.211.2023.01.23.15.01.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Jan 2023 15:01:33 -0800 (PST)
Received: by famine.localdomain (Postfix, from userid 1000)
        id D1F24604E3; Mon, 23 Jan 2023 15:01:32 -0800 (PST)
Received: from famine (localhost [127.0.0.1])
        by famine.localdomain (Postfix) with ESMTP id C37019FB5C;
        Mon, 23 Jan 2023 15:01:32 -0800 (PST)
From:   Jay Vosburgh <jay.vosburgh@canonical.com>
To:     Leon Romanovsky <leon@kernel.org>
cc:     "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Steffen Klassert <steffen.klassert@secunet.com>,
        Veaceslav Falico <vfalico@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jonathan Corbet <corbet@lwn.net>, oss-drivers@corigine.com,
        linux-doc@vger.kernel.org, Raju Rangoju <rajur@chelsio.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org,
        Ayush Sawal <ayush.sawal@chelsio.com>,
        Simon Horman <simon.horman@corigine.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Saeed Mahameed <saeedm@nvidia.com>,
        Andy Gospodarek <andy@greyhouse.net>
Subject: Re: [Intel-wired-lan] [PATCH net-next 09/10] bonding: fill IPsec state validation failure reason
In-reply-to: <d563de401d6fdc1c52959300eebb2bbb27c6c181.1674481435.git.leon@kernel.org>
References: <cover.1674481435.git.leon@kernel.org> <d563de401d6fdc1c52959300eebb2bbb27c6c181.1674481435.git.leon@kernel.org>
Comments: In-reply-to Leon Romanovsky <leon@kernel.org>
   message dated "Mon, 23 Jan 2023 16:00:22 +0200."
X-Mailer: MH-E 8.6+git; nmh 1.6; Emacs 29.0.50
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5063.1674514892.1@famine>
Content-Transfer-Encoding: quoted-printable
Date:   Mon, 23 Jan 2023 15:01:32 -0800
Message-ID: <5064.1674514892@famine>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Leon Romanovsky <leon@kernel.org> wrote:

>From: Leon Romanovsky <leonro@nvidia.com>
>
>Rely on extack to return failure reason.
>
>Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>Signed-off-by: Leon Romanovsky <leon@kernel.org>
>---
> drivers/net/bonding/bond_main.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_m=
ain.c
>index 686b2a6fd674..00646aa315c3 100644
>--- a/drivers/net/bonding/bond_main.c
>+++ b/drivers/net/bonding/bond_main.c
>@@ -444,7 +444,7 @@ static int bond_ipsec_add_sa(struct xfrm_state *xs,
> 	if (!slave->dev->xfrmdev_ops ||
> 	    !slave->dev->xfrmdev_ops->xdo_dev_state_add ||
> 	    netif_is_bond_master(slave->dev)) {
>-		slave_warn(bond_dev, slave->dev, "Slave does not support ipsec offload=
\n");
>+		NL_SET_ERR_MSG_MOD(extack, "Slave does not support ipsec offload");
> 		rcu_read_unlock();
> 		return -EINVAL;
> 	}

	Why only this one, and not include the other similar
slave_warn() calls in the bond_ipsec_* functions?  That would seem to
make some failures show up in dmesg, and others returned to the caller
via extack.

	-J

---
	-Jay Vosburgh, jay.vosburgh@canonical.com
