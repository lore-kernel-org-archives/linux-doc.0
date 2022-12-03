Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD01C352A1
	for <linux-doc@archiver.kernel.org>; Sat,  3 Dec 2022 13:40:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiLCNkb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Dec 2022 08:40:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiLCNka (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Dec 2022 08:40:30 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D231DA5B
        for <linux-doc@vger.kernel.org>; Sat,  3 Dec 2022 05:40:29 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id ay27-20020a05600c1e1b00b003d070f4060bso6480907wmb.2
        for <linux-doc@vger.kernel.org>; Sat, 03 Dec 2022 05:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0NMltp6zd8QZS4GQRHIbc7N5NBSDI6lRWzkm44FFSyY=;
        b=UUfJfjLOApqouUil5C5u0XKtTEZpl8XwY/3SKdgCvdtiT0JxyAPJDDPeT8xQIgdpGy
         9VVRhUNCJ++sc0FunLqB1GPKF0L+S26E6ZMQQll1SgD34HtR38716xWRreEr5aF0H58n
         G24m2u2NeyeZ+bmySKprTGl529MndilBQsVDV0UIjcbLlWzhZlcUOaa/Q0A0OuyJzGH2
         CpQEeCSua9EtGa0VtKQ6Q/qtlEY46tosK3mQNLNZ8aRvG1S4F3pvkIu8KGXKUvbqVztq
         z0yRBx0zMrDIw2mmgltQWG/+hmEjlJ83MpejcjfGQrKl5M7Eu11TY+56wDx2VSjqVYTb
         hmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NMltp6zd8QZS4GQRHIbc7N5NBSDI6lRWzkm44FFSyY=;
        b=TrwYNNWoSHpPGo/ryuonRrHP1xBCwl4LMtGBRF40pPQYTXFD//l88s7x/0U+j/Nu33
         zncuOktmM2jwmOwGxemeOHAk48Pp9CmX21gVohyQwl1YQ76ts1gFVqEy86cRaaFJTcAy
         jNktigbxb6vVZtnwXNZY5ov2x7nXaGmfsJjvlijTHwfikbeXBKPJA3MNLBhnXrsXQbnp
         jh/vdcsufzQfHYZAy8X80cHk4bwQ2c9H5kkdxeofqw5UcTtCeq+3rgoRFOs5aglkTTQo
         joEvkasjIot2/wj/XFmSy30sAN1KJiB+qeaGf5fxSRQS2rxxjhunrtOEtCGgtKBvRrAt
         N6ew==
X-Gm-Message-State: ANoB5pkIY84aZJFw4f3RyHdiyCyHFve5kNUfp1a2Ms4pJhHpH7n+yts8
        njU8F2lGc1f/0z0QWFejbARFxoBYMlq0aypx
X-Google-Smtp-Source: AA0mqf4XepvQu8SCbGWIRhoC0afqYPkI2JwH0NCii/cfoqFm0KDy/jm2IcoYPmzBz/6f1YpYvPmQ/g==
X-Received: by 2002:a1c:7504:0:b0:3cf:6b10:ca8d with SMTP id o4-20020a1c7504000000b003cf6b10ca8dmr59256540wmc.44.1670074828017;
        Sat, 03 Dec 2022 05:40:28 -0800 (PST)
Received: from airbuntu (host86-130-134-87.range86-130.btcentralplus.com. [86.130.134.87])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c4f5500b003b4fe03c881sm17130392wmq.48.2022.12.03.05.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 05:40:27 -0800 (PST)
Date:   Sat, 3 Dec 2022 13:40:26 +0000
From:   Qais Yousef <qyousef@layalina.io>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lukasz Luba <lukasz.luba@arm.com>,
        Xuewen Yan <xuewen.yan94@gmail.com>, Wei Wang <wvw@google.com>,
        Jonathan JMChen <Jonathan.JMChen@mediatek.com>,
        Hank <han.lin@mediatek.com>, Paul Bone <pbone@mozilla.com>
Subject: Re: [PATCH v2] Documentation: sched: Add a new sched-util-clamp.rst
Message-ID: <20221203134026.ert6kax2f3okajj2@airbuntu>
References: <20221127142657.1649347-1-qyousef@layalina.io>
 <Y4V5lDHNqYHEzEaI@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y4V5lDHNqYHEzEaI@debian.me>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/29/22 10:16, Bagas Sanjaya wrote:
> On Sun, Nov 27, 2022 at 02:26:57PM +0000, Qais Yousef wrote:
> > The new util clamp feature needs a document explaining what it is and
> > how to use it. The new document hopefully covers everything one needs to
> > know about uclamp.
> > 
> 
> For patch subject, better say "Documentation: sched: Document util clamp
> feature".

ACK.

> 
> > Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> > Signed-off-by: Qais Yousef (Google) <qyousef@layalina.io>
> > ---
> > 
> > Changes in v2:
> > 
> > 	* Address various style comments from Bagas
> > 
> 
> I don't see any of my wording suggestions from [1] being applied. Still
> a rather confused to read (maybe should be applied on top of jon's
> suggestions)?

Apologies! It was an oversight from my side when I revisited the thread and
reworked the patch. I got confused somehow.

All applied now almost as is. There was one tweak that used "40% utilization"
that I replaced with "40% performance level" instead.

Thanks a lot!

Cheers

--
Qais Yousef

> 
> [1]: https://lore.kernel.org/lkml/Y3II59dyKuvQGIhG@debian.me/
> [2]: https://lore.kernel.org/linux-doc/87cz976pwn.fsf@meer.lwn.net/
