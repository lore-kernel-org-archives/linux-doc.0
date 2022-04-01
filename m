Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDF1C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  1 Apr 2022 00:19:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243519AbiDAAVb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 31 Mar 2022 20:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243459AbiDAAV0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Mar 2022 20:21:26 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6E43BBD9
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 17:19:26 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id r64so735379wmr.4
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 17:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PlnMpYOXkJb3MsWMx3t3Karvr7oM4CxvFXYgLvSP2H0=;
        b=kbN4drDWXGTqRpuC4U+JxL0qNBRMGx952a73rWLXDa3Hlm4aUdgJ31IqJEf0Jx+ckC
         1aJEH9r0xzziPwQvQ5yR1zUgu8b/A3UaeJj9uHP6ugBk9il8p0uWsatZhH3m63SU1PVb
         LN+cROaanx5Hz6L2eD/KARZEowFji8nqD3SDTP8xKSDNd/A+2m2aG1X7n3oXXmbJXACF
         hWT+lCd9PhmgX7/cm4cn2k1BfRaTONAJdglMtzT2LRzqKs1SgYRqmfcpiohHool4PHfC
         eBuxx0iSCjIKVM+oUt93JFB24big5m2lNXVTPtPBTXmCA350ONdXl0t25CsLDpnjccyz
         jRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PlnMpYOXkJb3MsWMx3t3Karvr7oM4CxvFXYgLvSP2H0=;
        b=ji7mxE4cmGv3/9iWR4boRlDMDm6HZg1yD3y/foNpxgLsDCbV4zetKCQE+sVR6/uvSx
         Opz1+9/2xKA9FOprdGhAEt4P2b31Ujabzvmyhe535AsRjTc10TfGsp2c7Gwnt4Hq7+C6
         bAAKAa2flTClhCATBvxCRBbWyHFLkrgDR47VS/mcBBdYEbmkI9M1cRnYbAKqN19kPf/W
         JcR2SPNSZoSrzQ36v8tSPUvS9EUEjlYVLExbuTnFIWHSGhqQqFKh1cyMK/KEC22D73hY
         CYPk3/ZImjBPQY56L84yiWq6WLINUR27tIr+FU7RVpULY2ojZoyo1ylXI08VWApXuttG
         rU6w==
X-Gm-Message-State: AOAM530JKXE2hlcONuzFFftOOEEz8aNVAVvZrkNQ5BVLztK5Np5e09Je
        bnZ2VWxsw4c8rR2gb9o1Fr1NFKbx4ftttcgVzfKuWA==
X-Google-Smtp-Source: ABdhPJxATEUZYxO0stl0ueoGYAY1YKf0hGiTqAZL1ta/p5x+yRtL2fXZ3p8DLYTHHVSN7tIVp+IEj9AzjRy7KIMBcrY=
X-Received: by 2002:a05:600c:40f:b0:38c:be5c:9037 with SMTP id
 q15-20020a05600c040f00b0038cbe5c9037mr6618416wmb.44.1648772365332; Thu, 31
 Mar 2022 17:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648593132.git.marcelo.schmitt1@gmail.com>
 <11f4750c6d4c175994dfd36d1ff385f68f61bd02.1648593132.git.marcelo.schmitt1@gmail.com>
 <CABVgOSkb5CpnXDF_m7iy=A7RmN+KmY0T38TeZ4hKbmkdQgt6Yw@mail.gmail.com> <20220331081409.GY12805@kadam>
In-Reply-To: <20220331081409.GY12805@kadam>
From:   David Gow <davidgow@google.com>
Date:   Fri, 1 Apr 2022 08:19:13 +0800
Message-ID: <CABVgOS=uaNJq8SivkxY_4L+HRh9bwadGRqF8_tQP_UNGNbmY3g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Documentation: dev-tools: Enhance static analysis
 section with discussion
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Daniel Latypov <dlatypov@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-sparse@vger.kernel.org, cocci@inria.fr,
        smatch@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>, julia.lawall@inria.fr
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 31, 2022 at 4:14 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, Mar 30, 2022 at 10:48:13AM +0800, David Gow wrote:
> > > +
> > > +Smatch does flow analysis and, if allowed to build the function database, it
> > > +also does cross function analysis. Smatch tries to answer questions like where
> > > +is this buffer allocated? How big is it? Can this index be controlled by the
> > > +user? Is this variable larger than that variable?
> > > +
> > > +It's generally easier to write checks in Smatch than it is to write checks in
> > > +Sparse. Nevertheless, there are some overlaps between Sparse and Smatch checks
> > > +because there is no reason for re-implementing Sparse's check in Smatch.
> >
> > This last sentence isn't totally clear to me. Should this "because" be "so"?
> >
>
> I stopped reading your email when you wrote "Cheers, David" but I should
> have scrolled down.
>
> There is not very much overlap between Sparse and Smatch.  Both have a
> warning for if (!x & y).  That is a tiny thing.  The big overlap is when
> it comes to the locking checks.  The Smatch check for locking is
> honestly way better and more capable.
>
> I always run both Sparse and Smatch on my patches.  I should run
> Coccinelle as well, but I'm more familiar with Sparse and Smatch.

Makes sense. I agree that the overlap doesn't seem particularly
important: it's the differences which should be more evident.

v3[1] of the patch cuts this down to just "Nevertheless, there are
some overlaps between Sparse and Smatch checks.", which I think is an
improvement.

Thanks,
-- David

[1]: https://lore.kernel.org/all/62f461a20600b95e694016c4e5348ef2e260fa87.1648674305.git.marcelo.schmitt1@gmail.com/
