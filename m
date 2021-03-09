Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46573C433DB
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 13:24:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00C1D650ED
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 13:24:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbhCINYG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Mar 2021 08:24:06 -0500
Received: from mxout70.expurgate.net ([194.37.255.70]:55579 "EHLO
        mxout70.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbhCINXx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Mar 2021 08:23:53 -0500
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.90)
        (envelope-from <ms@dev.tdt.de>)
        id 1lJcKv-000AV7-QL; Tue, 09 Mar 2021 14:23:45 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90)
        (envelope-from <ms@dev.tdt.de>)
        id 1lJcKu-0006uV-H8; Tue, 09 Mar 2021 14:23:44 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id 0C0D0240041;
        Tue,  9 Mar 2021 14:23:44 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id 6CB50240040;
        Tue,  9 Mar 2021 14:23:43 +0100 (CET)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
        by mail.dev.tdt.de (Postfix) with ESMTP id DE993200DE;
        Tue,  9 Mar 2021 14:23:41 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 09 Mar 2021 14:23:41 +0100
From:   Martin Schiller <ms@dev.tdt.de>
To:     Xie He <xie.he.0141@gmail.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Halasa <khc@pm.waw.pl>, linux-x25@vger.kernel.org,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next RFC] net: x25: Queue received packets in the
 drivers instead of per-CPU queues
Organization: TDT AG
In-Reply-To: <20210305054312.254922-1-xie.he.0141@gmail.com>
References: <20210305054312.254922-1-xie.he.0141@gmail.com>
Message-ID: <4b30ca506b0d79ef5ba1a5e9ce9cf2cd@dev.tdt.de>
X-Sender: ms@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.16
X-purgate-type: clean
X-purgate: clean
X-purgate-ID: 151534::1615296225-0000B5A4-919C9C8D/0/0
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021-03-05 06:43, Xie He wrote:
> X.25 Layer 3 (the Packet Layer) expects layer 2 to provide a reliable
> datalink service such that no packets are reordered or dropped. And
> X.25 Layer 2 (the LAPB layer) is indeed designed to provide such 
> service.
> 
> However, this reliability is not preserved when a driver calls 
> "netif_rx"
> to deliver the received packets to layer 3, because "netif_rx" will put
> the packets into per-CPU queues before they are delivered to layer 3.
> If there are multiple CPUs, the order of the packets may not be 
> preserved.
> The per-CPU queues may also drop packets if there are too many.
> 
> Therefore, we should not call "netif_rx" to let it queue the packets.
> Instead, we should use our own queue that won't reorder or drop 
> packets.
> 
> This patch changes all X.25 drivers to use their own queues instead of
> calling "netif_rx". The patch also documents this requirement in the
> "x25-iface" documentation.

I've tested the hdlc_x25 driver.
Looks good to me.

Acked-by: Martin Schiller <ms@dev.tdt.de>
