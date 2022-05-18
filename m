Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2198FC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 18 May 2022 21:42:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbiERVmn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 May 2022 17:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241208AbiERVkm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 May 2022 17:40:42 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671F425472D
        for <linux-doc@vger.kernel.org>; Wed, 18 May 2022 14:39:03 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2fee9fe48c2so38816477b3.3
        for <linux-doc@vger.kernel.org>; Wed, 18 May 2022 14:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PBIrlSQE12gvPFa7zkkM4tDGDVAeqw2ipOzY6yT3Gn8=;
        b=Z4CCjdz4Ztbb0NVM4uDMRXAY00Zi5dpgHs32O3Id0pgMZ+fA5/d4SfZ+W12twf+Ny0
         ISE7+CRp8iOk0qc/dDmL6ikhH6aQtb+2M7CEj9ZhMKrpYbZ21C8xF0J/gWkYPdeK/z+O
         cKYXzZJb2UT/YA/78WyvArYWWUXAXiji1yOSvJ3V7KqVuPlFM8bySE6BoS9BDZSFkiLx
         0rXBKXjE1EwV3SRA3lmqUz0Q8OKq8JkBbwtctIqZK6qNaVn2/8r1Sjvq+hICd8mBu323
         pFgkuNKkbWc5nrgtEB/R8AgiL1FGxUX/lDgcXaUk4cWvItpXE/0dhY7yDdomgpYoGtXs
         oRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PBIrlSQE12gvPFa7zkkM4tDGDVAeqw2ipOzY6yT3Gn8=;
        b=LKu92goHlVMGjcu4WY1pMwdobJG+TAlfxh8TEei6h01NvBgYupif5pLnIa2UHPAlZY
         d51YBVz64iyTzJAiGd14ss/+p9KKh7H3sLB/MkXDeym567ig7DycyN4nN0xyjxIZAbRk
         oOaspa4+9rcImgexTdMrZ8D4MmGK3PD1gf03l1gLTnX5FHbgFwzs1x/oNA5u9J/84QIn
         nimbWFIdtGowYl7Sgv7xNVLH6o4nLRka5mW4sNjAfcXqRqZnfyXUH2WaVVmSZ2iME0Sa
         SwpyTz7FpHexDr7IMyJQz2aCvHYi7mxlnEJHB88rlZcmbev6adJFGixQPyTiiiPpS8B9
         ojhg==
X-Gm-Message-State: AOAM531PLX/BbCbunMV1hmhq0APqKRwfJQ6X5i9DhUfe6lrzMR2nDxXQ
        OIkqVy4vhKSCZKV5LGf8/LxuoGwPlbxREFlW7GRCP3uqq0Maqw==
X-Google-Smtp-Source: ABdhPJyQ6OJnGRodmtdSkbIEtacOW2HBQm/kkdhMJgg8I+azQyxYiCNNglJzyxQJwSNGvKwCZ19Cm6PuA6z8VxML7WI=
X-Received: by 2002:a81:bd4:0:b0:2eb:994d:ace7 with SMTP id
 203-20020a810bd4000000b002eb994dace7mr1503289ywl.514.1652909942462; Wed, 18
 May 2022 14:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220516033524.3130816-1-chenwandun@huawei.com>
 <30b37eeb-e77b-882e-fc24-3367321a8ca3@gmail.com> <CAJuCfpE7fBsp8ntYVeLsW7Cd0Z09OmxN75X9Az_Qco0GJrz3Wg@mail.gmail.com>
 <CAJuCfpH-BDqsft1YvGFhkbR60VC0TJgfXKRVN+80e0iqQdhxpA@mail.gmail.com>
 <3a31521f-a68a-b2a9-baae-9a458ee17033@huawei.com> <070fe87d-43a0-5e4f-e4c7-c44782c2c195@gmail.com>
In-Reply-To: <070fe87d-43a0-5e4f-e4c7-c44782c2c195@gmail.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Wed, 18 May 2022 14:38:51 -0700
Message-ID: <CAJuCfpH1mTxe5hmzZTe+AbPFse9heenx8uhGzCXE6fAh5G8SzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] psi: add support for multi level pressure stall trigger
To:     Alex Shi <seakeel@gmail.com>
Cc:     Chen Wandun <chenwandun@huawei.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 18, 2022 at 3:29 AM Alex Shi <seakeel@gmail.com> wrote:
>
>
>
> On 5/17/22 20:46, Chen Wandun wrote:
> >>>> This breaks the old ABI. And why you need this new function?
> >>> Both great points.
> >> BTW, I think the additional max_threshold parameter could be
> >> implemented in a backward compatible way so that the old API is not
> >> broken:
> >>
> >> arg_count = sscanf(buf, "some %u %u %u", &min_threshold_us,  &arg2, &arg3);
> >> if (arg_count < 2) return ERR_PTR(-EINVAL);
> >> if (arg_count < 3) {
> >>      max_threshold_us = INT_MAX;
> >>      window_us = arg2;
> >> } else {
> >>      max_threshold_us = arg2;
> >>      window_us = arg3;
> >> }
> > OK
> >
> > Thanks.
> >> But again, the motivation still needs to be explained.
> > we want do different operation for different stall level,
> > just as prev email explain, multi trigger is also OK in old
> > ways, but it is a litter complex.
>
> In fact, I am not keen for this solution, the older and newer
> interface is easy to be confused by users, for some resolvable
> unclear issues. It's not a good idea.

Maybe adding the max_threshold as an optional last argument will be
less confusing? Smth like this:

some/full min_threshold window_size [max_threshold]

Also, if we do decide to add it, there should be a warning in the
documentation that max_threshold usage might lead to a stall being
missed completely. In your example:

echo "some 150000 350000 1000000" > /proc/pressure/memory

If there is a stall of more than 350ms within a given window, that
trigger will not fire at all.
Thanks,
Suren.

>
> Thanks
> Alex
