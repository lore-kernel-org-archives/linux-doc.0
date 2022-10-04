Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53679C433FE
	for <linux-doc@archiver.kernel.org>; Tue,  4 Oct 2022 10:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbiJDKaO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Oct 2022 06:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiJDKaN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Oct 2022 06:30:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A9D40E1A
        for <linux-doc@vger.kernel.org>; Tue,  4 Oct 2022 03:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664879411;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8Gu6wQbEujqIoRE5ZXJV+VaDyIac1+RR2QAIq/Gjc6A=;
        b=Pnsz/IReNfxujhWbOKgSntFRxI0SkyNZw7xHGj9rr4fy4LxMO2ZcTLGB/8oBiW2znAER+k
        sX/kZiClC/tE28f6iCXXV25v//tvAPOMBpjGDwDWoYuPT6egm8JVbgOWu8xCzReZ7rjoA7
        UNbf7ZuUjf398vJxL/svVC6j4vOeHWk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-348-McSKosWyMJeV1O4J9MzheQ-1; Tue, 04 Oct 2022 06:30:10 -0400
X-MC-Unique: McSKosWyMJeV1O4J9MzheQ-1
Received: by mail-wm1-f72.google.com with SMTP id p24-20020a05600c1d9800b003b4b226903dso10671023wms.4
        for <linux-doc@vger.kernel.org>; Tue, 04 Oct 2022 03:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=8Gu6wQbEujqIoRE5ZXJV+VaDyIac1+RR2QAIq/Gjc6A=;
        b=KmWHOK/wqJsB0G2XwanZYUVWcSj+87lkDihSSTBm+JY+0OSkzg6f1YwQT4lpeqj5iG
         o0YtaZWrhHzZ2p2Hb9m03nvJZb0pI3hjNRzFcLKm7yxhOjzn27om+bCaZ6y6xAiZOd63
         UYRw6DBdCiV7xOdD+a+SbLxY9wjmw4sb1P8yXQmz8S62fjPhwgJ189JtR0gpqVub7ABV
         QVF05ShTgGgI04nDg4Um+pShxgWFwKCXwruUQbZGFgBy2AgI4wbC0TUS82p2+qy5uFZE
         1IJp7I+a6jrPpguBeNCOvjmZT9osoA0rCxvQj3xreZRYMZTJPKiipKrL5FWWWCJBOLVV
         aW3A==
X-Gm-Message-State: ACrzQf0rZgClVcMg204orzRVrMO+5E3cNoMKfMMpboTmKkQmk9KM/vVs
        P1G5AoWTHBpBwn1hxyFNHF0UzGGwyPsL0BdftLfUchUtsNEo58056WWtEih4LU5mSfBdZUgS/Da
        7B7sE1Rq/hBwhEgLxWUY5
X-Received: by 2002:a7b:c7d8:0:b0:3b4:5c41:6a6c with SMTP id z24-20020a7bc7d8000000b003b45c416a6cmr9409905wmk.139.1664879408830;
        Tue, 04 Oct 2022 03:30:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6j5K3VsnjhT+M3kCXnWsc9JNCbQ3kkZoXNNwyk58lzbxcU7C7QTm03zt0B+XOBqRTPmdINxw==
X-Received: by 2002:a7b:c7d8:0:b0:3b4:5c41:6a6c with SMTP id z24-20020a7bc7d8000000b003b45c416a6cmr9409879wmk.139.1664879408568;
        Tue, 04 Oct 2022 03:30:08 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-97-71.dyn.eolo.it. [146.241.97.71])
        by smtp.gmail.com with ESMTPSA id bx10-20020a5d5b0a000000b00228fa832b7asm12557473wrb.52.2022.10.04.03.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 03:30:08 -0700 (PDT)
Message-ID: <6645ba3ba389dc6da8d16f063210441337db9249.camel@redhat.com>
Subject: Re: [PATCH net-next] docs: networking: phy: add missing space
From:   Paolo Abeni <pabeni@redhat.com>
To:     Casper Andersson <casper.casan@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Date:   Tue, 04 Oct 2022 12:30:06 +0200
In-Reply-To: <20221004073242.304425-1-casper.casan@gmail.com>
References: <20221004073242.304425-1-casper.casan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2022-10-04 at 09:32 +0200, Casper Andersson wrote:
> Missing space between "pins'" and "strength"
> 
> Signed-off-by: Casper Andersson <casper.casan@gmail.com>
> ---

The merge window has now started (after Linus tagged 6.0)
and will last until he tags 6.1-rc1 (two weeks from now). During this
time we'll not be taking any patches for net-next so
please repost in around 2 weeks.

Thanks,

Paolo

