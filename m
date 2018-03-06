Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 99B947E66C
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Mar 2018 17:29:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753065AbeCFR33 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Mar 2018 12:29:29 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:42140 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752784AbeCFR33 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Mar 2018 12:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=71d5G93Tz94/Cn0duObmzymMQA20/xwkCyjhG0S4hks=; b=m64usexfhPn/zPVo/0J+nC3zv
        tNF1YcyxvEGExl1xKzTMN3dw5fQDJuIo5ikDD05FnHNz7SeP0m9WKl4przIOgm/VZiCX+J2POV6gI
        h+4suMISjgVkw0qo0sTLdffO7apH62oSMI4fVoFtWjp48LMLOIqkIKhIo9rfTH5hXn3cFxuC9U+bU
        nrupiJ2RbSv8qkCmCdpAQB/okFOQgm1RRYsxBLrW8JML36LmqbKjYtazw72sv6D2f/5xLFXhtED47
        adHmEIJZkyH/ulITM4bwc78GS3T+FORzyebnwKFZwQ01BQxlQ8my0l0Sc0QQQBdAcBbdnMgK9YWow
        mh2XQTBSQ==;
Received: from 177.43.25.174.dynamic.adsl.gvt.net.br ([177.43.25.174] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.89 #1 (Red Hat Linux))
        id 1etGP1-0001K9-7J; Tue, 06 Mar 2018 17:29:27 +0000
Date:   Tue, 6 Mar 2018 14:29:23 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Mariusz Bialonczyk <manio@skyboo.net>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@redhat.com>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] w1: fix w1_ds2438 documentation
Message-ID: <20180306142923.6364ad2b@vento.lan>
In-Reply-To: <20180302075524.27868-1-manio@skyboo.net>
References: <20180302075524.27868-1-manio@skyboo.net>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri,  2 Mar 2018 08:55:24 +0100
Mariusz Bialonczyk <manio@skyboo.net> escreveu:

> Signed-off-by: Mariusz Bialonczyk <manio@skyboo.net>
> ---
>  Documentation/w1/slaves/w1_ds2438 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/w1/slaves/w1_ds2438 b/Documentation/w1/slaves/w1_ds2438
> index b99f3674c5b4..e64f65a09387 100644
> --- a/Documentation/w1/slaves/w1_ds2438
> +++ b/Documentation/w1/slaves/w1_ds2438
> @@ -60,4 +60,4 @@ vad: general purpose A/D input (VAD)
>  vdd: battery input (VDD)
>  
>  After the voltage conversion the value is returned as decimal ASCII.
> -Note: The value is in mV, so to get a volts the value has to be divided by 10.
> +Note: To get a volts the value has to be divided by 100.

Hmm... I've no idea why you sent this to linux-media and to me...

The proper maintainer seems to be Evgeniy:

 ./scripts/get_maintainer.pl -f Documentation/w1/slaves/w1_ds2438
Evgeniy Polyakov <zbr@ioremap.net> (maintainer:W1 DALLAS'S 1-WIRE BUS)
Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
Greg Kroah-Hartman <gregkh@linuxfoundation.org> (commit_signer:1/1=100%)
Mariusz Bialonczyk <manio@skyboo.net> (commit_signer:1/1=100%,authored:1/1=100%,added_lines:63/63=100%)
linux-doc@vger.kernel.org (open list:DOCUMENTATION)
linux-kernel@vger.kernel.org (open list)



Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
