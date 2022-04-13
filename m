Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FDFC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 13 Apr 2022 18:40:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237796AbiDMSnL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Apr 2022 14:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237839AbiDMSmt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Apr 2022 14:42:49 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE71A100B;
        Wed, 13 Apr 2022 11:40:27 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id r66so2581266pgr.3;
        Wed, 13 Apr 2022 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3LBgn6ACUz4QhekL4T49WeNCf72u7qnIU81GM5pyQCs=;
        b=NuQYWe4gESAu7j0rawMhaeK/KVpZfEgSM+yq5ixKonNUzIUG3/BlJpxDx2mdLWvVi4
         NDzwYm0cd7aiVBQkta2agOVQ0+tbb5hVivyfs9o/2oCRhHxvST4oY06DoUlkwpc2xVET
         IRIKZahpyMFsgV7R21luhu9pazyMsgMTVjVec04uSzEDtJALw4MfhW57ZX3MygESzRWQ
         0hVJZ1ORoFIGEW2XEwZ9Eb3DBuEb+7E6AQy819NI3UNzoZbh7Fv+haQMw9zguQr+q9/X
         dSNPmefkyG0pMuJjkZi/n5ae/vjw1IXA/bzBGDs7IU+5oKMx24T4pEWlLCcNPXgYDmKT
         kLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3LBgn6ACUz4QhekL4T49WeNCf72u7qnIU81GM5pyQCs=;
        b=1FtEwa8dz0yN4ri34ZyP9ckxoq6WYrtKQrcYga+MulpBgGj26dCENsSEPmzxxmzVN4
         eDwapAeCE9O0u6RlGLRC+TCqLQrtsARekO+ccgMdSV+Stf4hMT24VXFOCFlXs1tT1WmJ
         XgcNO+5Mm2Tvjka8JYx9VnoN1W4HgrJqXnfqNx7mPpriHto3717k1Pxp7LyiUObrsDbH
         6jdKvlPIXrpuSGnyYkJKoSP1BxyXLDmv0x5d57fi8BD1LxfjselUxlzcpX5U6qFS8KYd
         KL7ZA2WK/fisprBELhO2MnsXXpMqUXjwq06I3W231gveqciNNhOz91eYqPMti73SWeV1
         FhAA==
X-Gm-Message-State: AOAM533ZzeyiKR/F3JJmBCdhKyHyWua9e6+ePQ3/p1BjGa/16OUwwiV5
        mKB6OyaElmLFWDcc0ZYvCwN4PixvjT5HlE6IkBY=
X-Google-Smtp-Source: ABdhPJwpPDqvXh33tyjtjY9f/lH9hIakKX0U25M5PcpO3CTrfkAuCS5gzyNviJpylo2QuyPpMWj4Jk/FPltn2lOAuCs=
X-Received: by 2002:a63:3d0b:0:b0:37f:ef34:1431 with SMTP id
 k11-20020a633d0b000000b0037fef341431mr35613269pga.547.1649875227278; Wed, 13
 Apr 2022 11:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220309180148.13286-1-luizluca@gmail.com> <20220309234848.2lthubjtqjx4yn6v@skbuf>
In-Reply-To: <20220309234848.2lthubjtqjx4yn6v@skbuf>
From:   Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date:   Wed, 13 Apr 2022 15:40:16 -0300
Message-ID: <CAJq09z7AT0eZR6hf4H2wHsSbXm5O6m4XTV0xM9r_4xgCOu=rtw@mail.gmail.com>
Subject: Re: [PATCH net-next] docs: net: dsa: describe issues with checksum offload
To:     Vladimir Oltean <vladimir.oltean@nxp.com>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "tobias@waldekranz.com" <tobias@waldekranz.com>,
        "andrew@lunn.ch" <andrew@lunn.ch>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Vladimir,

I sent a v2 with your suggestions.

Regards,

Luiz
