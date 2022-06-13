Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257EFC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jun 2022 18:37:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245458AbiFMSho (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Jun 2022 14:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245743AbiFMShK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 14:37:10 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0EFCBF1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 08:41:02 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id o43so4581340qvo.4
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 08:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=enkNbq51q9NmaofGwmjSLkQ6NWFIaFK12ssrgxeHAC8=;
        b=SojcsQlJmf+83WSJWx1TAUfXvhiLNV2Hjgn7//MtVNo46K6jwRGecv2VNDI1IyDtaD
         8H1yx7mS6VfzlgTSvarKeNqqWMMV49O/yxUwrezf3PMJOivCwQUuXfIRArVFnX0Jhw83
         OeKrvL7WXT5ve+so8DmiTSKUTTKFy2phRi2kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=enkNbq51q9NmaofGwmjSLkQ6NWFIaFK12ssrgxeHAC8=;
        b=Tzc4E/2URZqH094ngOm3+Gog4WmJi6S/oht0/RuPxUIvxHQCKJiRlVsQ8SvQtM3H0w
         DvUpsaWbhjLFJIC9o3fBPa8/AyEz5ge4lp0RsD1+N/flYBqsAiyYACjR+cu+9kMXcmfq
         6Vh5030QRYPzs1bb1HoEXZ7B+f7mX827VepETMc5nSZIMMKW+t3eTv99XjUJMue1obWJ
         30OCVX0X5WLv6KNn0PcljZVnWIUy1kpQ99vS/j5SRFFRI4T+baBqDmo6tKQgq3uw2OPA
         UMMf/zKvvc6eEpsF34F4npsoOixW+Tyt4xc8GXk3eTzcBMbHdzs0IdUVUcz7vQKmzO12
         LvQQ==
X-Gm-Message-State: AJIora+7YFcI/pT9M6113y+ZRgmRIbgP/I4Q7JAIRYgVvjPJzfFicOFt
        vjg3NEXAyWo/xj7eCBaQHmXQwQ==
X-Google-Smtp-Source: AGRyM1sxqteluqnoemEOZakFOjfzhPXbWJMlhouc/S+yRthxrteT0DboTsPzt626TFXWMQRa7Qs5tw==
X-Received: by 2002:a05:6214:20c4:b0:46b:a979:d7e with SMTP id 4-20020a05621420c400b0046ba9790d7emr223572qve.86.1655134861505;
        Mon, 13 Jun 2022 08:41:01 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id t4-20020a05622a01c400b00304ef50af9fsm5487551qtw.2.2022.06.13.08.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 08:41:01 -0700 (PDT)
Date:   Mon, 13 Jun 2022 11:40:59 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Adam Turner <aaturnerpython@outlook.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx pre v3 -- removing support
Message-ID: <20220613154059.oeb2kfp3j2amqat5@meerkat.local>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <877d5xx1xo.fsf@meer.lwn.net>
 <YponOKPBgE8pgBYD@casper.infradead.org>
 <20220603154229.sj5sfeaehbkfzgin@meerkat.local>
 <87tu91vis5.fsf@meer.lwn.net>
 <20220603162615.wto3fywuvs2wlb5r@meerkat.local>
 <871qw5ju1m.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <871qw5ju1m.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 03, 2022 at 03:50:29PM -0600, Jonathan Corbet wrote:
> > Indeed. So, should I go to 3.x, 4.x, or go all new and shiny with 5.x?
> 
> Unless there is some subtle problem in the rendered docs that I'm not
> seeing, I don't think that there is any reason to go with the older
> releases.  5.0.1 seems to build things just fine, so I'd say go with the
> shiniest you can get.

Okay, https://docs.kernel.org/ is now built with Sphinx-5.0.1. At least, the
timestamps on the files are telling me so, because I can't see any other
changes. :)

-K
