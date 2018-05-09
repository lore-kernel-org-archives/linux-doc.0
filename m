Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 547D47DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 12:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934272AbeEIMEJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 08:04:09 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43832 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751052AbeEIMEI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 May 2018 08:04:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=1xsbx8XYrO7lKjX3u6zDVdrlbA4DLMwjKcdrKeLlwus=; b=aLS69hzDC1WFLT75Ufb9s82Wr
        YUTKZpICYeOvgynLCo6bevY60yW49ihDAs7sA7M0ty1Cp50Fl8+1JXynQQDnxvL5C8z5KEVoGKLLS
        qOPPzt3iqBdV5OnDEa5Uds2YCTUzm5Sln0z61sMzfC259knvaaGgD7uJlK91qrOwDLOeAUoxJELG5
        2MZ0D/W1lQJjG21RaFxTRHSkGkInyKkcmnqcdB0jKOhfuHgkIIu1X9EMXibjkn8nDf00kW0t99UDz
        GzDzg1Td3VTsnBDkboA37+RsRUbbdZGnRJ/xXYeih/2f/iw7QlytecEaJBYLMPEk3RjCVjb33q7jL
        aPldiNRgA==;
Received: from 177.41.96.165.dynamic.adsl.gvt.net.br ([177.41.96.165] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGNpF-0007OI-4k; Wed, 09 May 2018 12:04:05 +0000
Date:   Wed, 9 May 2018 09:04:00 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Johannes Berg <johannes@sipsolutions.net>
Cc:     Kalle Valo <kvalo@codeaurora.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        "David S. Miller" <davem@davemloft.net>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 09/18] net: mac80211.h: fix a bad comment line
Message-ID: <20180509090400.0156c0c8@vento.lan>
In-Reply-To: <1525696706.6049.7.camel@sipsolutions.net>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <cover.1525684985.git.mchehab+samsung@kernel.org>
        <1b14ef4f63547c86c544e112b74acfff2b41f4af.1525684985.git.mchehab+samsung@kernel.org>
        <87fu334p5v.fsf@purkki.adurom.net>
        <1525696706.6049.7.camel@sipsolutions.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Mon, 07 May 2018 14:38:26 +0200
Johannes Berg <johannes@sipsolutions.net> escreveu:

> On Mon, 2018-05-07 at 15:37 +0300, Kalle Valo wrote:
> > Mauro Carvalho Chehab <mchehab+samsung@kernel.org> writes:
> >   
> > > Sphinx produces a lot of errors like this:
> > > 	./include/net/mac80211.h:2083: warning: bad line:  >
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>  
> > 
> > Randy already submitted a similar patch:
> > 
> > https://patchwork.kernel.org/patch/10367275/
> > 
> > But it seems Johannes has not applied that yet.  
> 
> Yeah, I've been super busy preparing for the plugfest.
> 
> I'll make a pass over all the patches as soon as I can, hopefully today
> or tomorrow.

Thanks. I'll drop it from my patchset, assuming that you'll
be applying Randy's version or mine via your tree.

Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
