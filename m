Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C7AC7EE23
	for <linux-doc@archiver.kernel.org>; Thu,  8 Jun 2023 13:31:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235905AbjFHNb3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jun 2023 09:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234860AbjFHNb1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Jun 2023 09:31:27 -0400
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD9E2132;
        Thu,  8 Jun 2023 06:31:27 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-53f8da65701so274990a12.1;
        Thu, 08 Jun 2023 06:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686231086; x=1688823086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRqj58C8pYpu1XDpc+2hHsnEGG/QxXyNU9pVD74tezk=;
        b=T8c6z+/meJJfExc1XZ6IqoB6w5/Ds9X+eEzZJFPggvHZVZsC45gaPPP2Ek29EftnVW
         HqBw6FS+Y0ayd/BnERL5F+NXkZrEeIXrq19wSxV7SQ53NYYvf2pKNAc9LoTS2R+lBws/
         cWIXVAv3GhCS4JvoEN6wT8z3u+X/2trxuGNWDD+BazBVvyLm08NpSWbgjl4qxAyErukv
         DHGgw732HNDeS6AfTJg1IfrHQpPGK+E8Wd6dcaQchwSzPs/fOl3cvbNN17BBCBS0H5pb
         aEQbDm4QChdM6s05wsHIFn0wdqOyOFZJ5YcGqmaP7Xj5ZUYcjkKOHxuE8Vu4r1Ob31sB
         rVBg==
X-Gm-Message-State: AC+VfDyaIGPHDT/A9v7H9pRxieEQ5m1UVeo+BidtaOv6PC+/IIJyCGiu
        mA6N2Sjmy+1M5oX/C1a+xd3Lx4QUlA==
X-Google-Smtp-Source: ACHHUZ7zfEDBaz7TitVH801t5XSqvDe56RLQsqFwWxTkOgQ8TaBd5ZsgN50RZIkbgPcTYx/PUVg/JA==
X-Received: by 2002:a6b:e218:0:b0:77a:c808:3c89 with SMTP id z24-20020a6be218000000b0077ac8083c89mr3795158ioc.20.1686231065546;
        Thu, 08 Jun 2023 06:31:05 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id k19-20020a02cb53000000b0040fad79ac08sm277037jap.89.2023.06.08.06.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 06:31:04 -0700 (PDT)
Received: (nullmailer pid 2431996 invoked by uid 1000);
        Thu, 08 Jun 2023 13:31:02 -0000
Date:   Thu, 8 Jun 2023 07:31:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] docs: dt: fix documented Primecell compatible
 string
Message-ID: <20230608133102.GA2357591-robh@kernel.org>
References: <9e137548c4e76e0d8deef6d49460cb37897934ca.1682333574.git.baruch@tkos.co.il>
 <878regbbr7.fsf@tarshish>
 <9569ef0d-0d94-3ff9-468b-152fe949e7b5@linaro.org>
 <878re8741n.fsf@tarshish>
 <03806421-73ac-0d82-f1cb-e54c2e8f27e9@linaro.org>
 <87o7mt6grr.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o7mt6grr.fsf@tarshish>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 09, 2023 at 11:36:18AM +0300, Baruch Siach wrote:
> Hi Krzysztof,
> 
> On Mon, May 01 2023, Krzysztof Kozlowski wrote:
> > On 01/05/2023 12:01, Baruch Siach wrote:
> >> On Mon, May 01 2023, Krzysztof Kozlowski wrote:
> >>> On 25/04/2023 10:31, Baruch Siach wrote:
> >>>> On Mon, Apr 24 2023, Baruch Siach wrote:
> >>>>> Only arm,primecell is documented as compatible string for Primecell
> >>>>> peripherals. Current code agrees with that.
> >>>>
> >>>> Once again my patches do not show up in patchwork. But they do show in
> >>>> lore:
> >>>>
> >>>>   https://lore.kernel.org/linux-devicetree/9e137548c4e76e0d8deef6d49460cb37897934ca.1682333574.git.baruch@tkos.co.il/
> >>>
> >>> You used subject prefix which targets Doc subsystem, but did not Cc Doc
> >>> maintainers (get_maintainers do not print them). If you target Rob's
> >>> Patchwork, probably you need to fix subject prefix. There is no "dt" prefix.
> >> 
> >> Thanks for the tip.
> >> 
> >> All previous commits touching Documentation/devicetree/usage-model.rst
> >> use 'docs' for subject prefix, including one from Rob. I followed this
> >> example.
> >
> > Hm, I see Rob and others indeed used "dt:". I guess Rob's filters might
> > need some updates?
> 
> With the merge window behind us, is there anything more I need to do to
> get these trivial patches applied?

Sorry about this. There's a few things that PW doesn't capture and this 
is one of them. And then I've been out the last month.

Both applied now.

Rob
