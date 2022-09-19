Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7EFECAAD3
	for <linux-doc@archiver.kernel.org>; Mon, 19 Sep 2022 19:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiISTyv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Sep 2022 15:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiISTyr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Sep 2022 15:54:47 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40616140C7
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 12:54:46 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id q15-20020a17090a304f00b002002ac83485so327248pjl.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 12:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=g7zNNY89d4k8ugINF0iti3Ty6QBiU6BSa9NeL6oDdnc=;
        b=J46nl8pGcRAq9y7Kxtf00LObEtiZeEnL9MXTH3mBudNAB1pfFaVRAWVEJ3JhnrC6Hs
         Lp0XCwskM8N2p8YqlAQGWOjCPiTwfYw2KW1XHrvT9uJwj5nfl7CFXr/LZ7t4ae2qY+lv
         Sx2le6JkOjOs30KSx3h1B9Z4g5siK4c3wB7e7TulFuRDlcQvmah8UDL5K/xjRRaJxMBX
         5sYkHTZaJOPWRckEKssnGgzjl29DcMaMWIZimZVjGFHBOebvxvbYjMqS6NliczIazC1m
         n9iRrqV6+Ve/lS+byOyYGWzDlvhUNMnHkNk5j2oeVjm33kL4SJzStIKcKXGmspHgr1Cy
         smLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=g7zNNY89d4k8ugINF0iti3Ty6QBiU6BSa9NeL6oDdnc=;
        b=FqCLQA8ExtZhCprWE9nELOX55DTWwBODzB34mYgNkbBRSWDpe93aBitZxe3C1lN+tv
         ToX3STm7opTbj5UmwzjInVpenErOj8rRgvm8dd2kqSLJ9kPmt/EZFU2aemyQ8f01ARN+
         FS92ubpEHel9FliLzs5N4QCEQH7v1ZiWx3S9VhqrYOCHOr/0npVRVndedIowKDWkzhOq
         xV8pOdigEJRFS5s8VprE674qlozb8Za+J5JcRPXAEWpQvYwGeagkqfMSlGWXFzPJyWFD
         XvVFBn9X6A7XEEq6LF9iC7YyEBUfU0GkkLfKp59TP5db+21IT/rbUd92Z/OG8aLndFG4
         vJKw==
X-Gm-Message-State: ACrzQf3p5LkS0V/iC7NPJmzs4li1spItJ9v4bylOPMaXg22l2rGrUxPb
        Mp0slFQ3cmNKlysPsx0LM9pQ+g==
X-Google-Smtp-Source: AMsMyM6aAqjbQN2s6/yxk/aDmjhEYxdJeVSFPaipVSZeL3rirrj/BwqC/Vq8QXJ7EyPXjCVJOlmknA==
X-Received: by 2002:a17:902:e54e:b0:178:5371:5199 with SMTP id n14-20020a170902e54e00b0017853715199mr1320475plf.59.1663617285719;
        Mon, 19 Sep 2022 12:54:45 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 14-20020a17090a0cce00b001fd9c63e56bsm819824pjt.32.2022.09.19.12.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 12:54:44 -0700 (PDT)
Date:   Mon, 19 Sep 2022 13:54:42 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mike Leach <mike.leach@linaro.org>,
        Leo Yan <leo.yan@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] coresight: docs: Fix a broken reference
Message-ID: <20220919195442.GA759648@p14s>
References: <c7f864854e9e03916017712017ff59132c51c338.1659251193.git.christophe.jaillet@wanadoo.fr>
 <20220822160202.GB1583519@p14s>
 <0e5567ee-41ba-2364-5e5a-2a6626c08ed1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e5567ee-41ba-2364-5e5a-2a6626c08ed1@arm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 12, 2022 at 10:52:30AM +0100, Suzuki K Poulose wrote:
> Cc: acme
> 
> On 22/08/2022 17:02, Mathieu Poirier wrote:
> > On Sun, Jul 31, 2022 at 09:06:48AM +0200, Christophe JAILLET wrote:
> > > Since the commit in Fixes: tag, "coresight-cpu-debug.txt" has been turned
> > > into "arm,coresight-cpu-debug.yaml".
> > > 
> > > Update the doc accordingly to avoid a 'make htmldocs' warning
> > > 
> > > Fixes: 66d052047ca8 ("dt-bindings: arm: Convert CoreSight CPU debug to DT schema")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > >   Documentation/trace/coresight/coresight-cpu-debug.rst | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > 
> > Applied.
> 
> fyi, there is another patch fixing the same here.
> 
> https://lkml.kernel.org/r/20815dbff3d27f5d3e6876363f052d2a08ad2e72.1660829433.git.mchehab@kernel.org
> 
> We may have to decide which one goes in.
>

Thanks for pointing that out.  I looked in the documentation's next tree[1] and the
patch hasn't been added there.  As such I suggest to keep Christophe's patch.

Regards,
Mathieu

[1]. git://git.lwn.net/linux.git docs-next

> Cheers
> Suzuki
> 
> > 
> > Thanks,
> > Mathieu
> > 
> > > diff --git a/Documentation/trace/coresight/coresight-cpu-debug.rst b/Documentation/trace/coresight/coresight-cpu-debug.rst
> > > index 993dd294b81b..836b35532667 100644
> > > --- a/Documentation/trace/coresight/coresight-cpu-debug.rst
> > > +++ b/Documentation/trace/coresight/coresight-cpu-debug.rst
> > > @@ -117,7 +117,8 @@ divide into below cases:
> > >   Device Tree Bindings
> > >   --------------------
> > > -See Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt for details.
> > > +See Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml for
> > > +details.
> > >   How to use the module
> > > -- 
> > > 2.34.1
> > > 
> 
