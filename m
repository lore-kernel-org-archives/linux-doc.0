Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F3BEB64D7
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jun 2023 13:02:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjFWNCF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jun 2023 09:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjFWNCE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jun 2023 09:02:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C251D1FE9
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 06:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687525278;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Vcu9IDO2pMlCXuz9+9dp8wFxn2b0ImO0mUp8HiDtyZ0=;
        b=PSSdhVQqZTpV5XaDBhiNhP9jORj/pQvxX7/eoMB+tXVeVqUZGKiRmEHj2t/ZltT1jUnzPV
        DFaLyBxeYeKSZltF5gmYzNEsXlWaue36BsvKtXq2V/ql23doI24j2V+9QfgZfI5iDm+lVp
        e8zXpnc9ENdzHtaL6NbVY1aIpLXaiOs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-JZGx3fifPo6mT0POvzF4Tw-1; Fri, 23 Jun 2023 09:01:16 -0400
X-MC-Unique: JZGx3fifPo6mT0POvzF4Tw-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-76545dc12ebso11127685a.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 06:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687525275; x=1690117275;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vcu9IDO2pMlCXuz9+9dp8wFxn2b0ImO0mUp8HiDtyZ0=;
        b=A13Cfj6HN5c/OqAYNC0M2WG/s2HnYmqlc46loYt1e1YuBHHp4Whc9EKNvRo7+/pbMT
         LdB5lrq4T2Tf+4Ri4YM1bVdUqcbUkFBTBJCnNFC/NSmJfGimO2KiWGyhYkfmAunxl5MS
         vrvEm1AzUwBM/8iVW1/D/HiZ/QwkHMbAuuQM8GByXfsGhVSnMSq71ZIY7L1g9+ALjiCQ
         O7dmDLTcHQL6OYjRAOzsVwHvl6nHhAjkPPS/3VvZAHrnHXYg/+p555rTXYgJDImGTgrK
         jMCz7LoMFiUfob9s6yltRsQjJR8HAPgQ9m5avvKIDES99b0r+xAZ8ZkZiip9Xs7pgN0n
         1Kkw==
X-Gm-Message-State: AC+VfDwC97cbPl583Y3SE4Yw69T1HNnyvkPJHFJlliNTZH0IwfY/uSiz
        AFBZhgX4yN6d+m93ZVAYwS42raIfu6xL6UlG6lUlEyt2EzM1+Msjw6ORB3z1SX//Iw6AnSQBl38
        wMKq99w1zCoK6LmrwcnYP
X-Received: by 2002:a05:620a:8fcc:b0:763:a95d:b578 with SMTP id rj12-20020a05620a8fcc00b00763a95db578mr10429919qkn.3.1687525275408;
        Fri, 23 Jun 2023 06:01:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ65g/cWwRlDyAd07dNn5XZg3kkI+SKLStX6DcSCzrFYWBvpxMBMZ2eh/zC2N+DFadQpxllzww==
X-Received: by 2002:a05:620a:8fcc:b0:763:a95d:b578 with SMTP id rj12-20020a05620a8fcc00b00763a95db578mr10429856qkn.3.1687525274650;
        Fri, 23 Jun 2023 06:01:14 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-231-243.dyn.eolo.it. [146.241.231.243])
        by smtp.gmail.com with ESMTPSA id c18-20020a05620a165200b00763a3e5f80dsm4526927qko.15.2023.06.23.06.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 06:01:14 -0700 (PDT)
Message-ID: <71f51047892001e6cdac1de4a6f7c2b9f97c7c8b.camel@redhat.com>
Subject: Re: [net-next Patch 1/3] octeontx2-pf: implement transmit schedular
 allocation algorithm
From:   Paolo Abeni <pabeni@redhat.com>
To:     Hariprasad Kelam <hkelam@marvell.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kuba@kernel.org, davem@davemloft.net,
        willemdebruijn.kernel@gmail.com, andrew@lunn.ch,
        sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com,
        jerinj@marvell.com, sbhatta@marvell.com, naveenm@marvell.com,
        edumazet@google.com, jhs@mojatatu.com, xiyou.wangcong@gmail.com,
        jiri@resnulli.us, maxtram95@gmail.com, corbet@lwn.net,
        linux-doc@vger.kernel.org
Date:   Fri, 23 Jun 2023 15:01:09 +0200
In-Reply-To: <20230622085638.3509-2-hkelam@marvell.com>
References: <20230622085638.3509-1-hkelam@marvell.com>
         <20230622085638.3509-2-hkelam@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 2023-06-22 at 14:26 +0530, Hariprasad Kelam wrote:
> diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/qos.h b/drivers/n=
et/ethernet/marvell/octeontx2/nic/qos.h
> index 19773284be27..0c5d2f79dc15 100644
> --- a/drivers/net/ethernet/marvell/octeontx2/nic/qos.h
> +++ b/drivers/net/ethernet/marvell/octeontx2/nic/qos.h
> @@ -35,6 +35,7 @@ struct otx2_qos_cfg {
>  	int dwrr_node_pos[NIX_TXSCH_LVL_CNT];
>  	u16 schq_contig_list[NIX_TXSCH_LVL_CNT][MAX_TXSCHQ_PER_FUNC];
>  	u16 schq_list[NIX_TXSCH_LVL_CNT][MAX_TXSCHQ_PER_FUNC];
> +	u16 schq_used_index[NIX_TXSCH_LVL_CNT][MAX_TXSCHQ_PER_FUNC];

This struct is already quite big, and you use schq_used_index[x][y] as
a bool. I think you will be better off changing the used type
accordingly.

Side note 'schq_index_used' sounds a little more clear to me, but could
be simply ENONATIVELANG here ;)

Cheers,

Paolo

