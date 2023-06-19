Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB540EB64DA
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jun 2023 08:17:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjFSIRN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jun 2023 04:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbjFSIRM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jun 2023 04:17:12 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC22197
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 01:17:08 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5700e993f37so64080527b3.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 01:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687162628; x=1689754628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzzIQhfefWaLN6EvMAN9v4/AfUqiFYRvj/9Q+Gca0Ro=;
        b=fVV81/xl3VN8tmL1vUMt/N4TDLl/KYz8sUyxXU2+JHNSHx+FfpWen/d51/2Y/uMEu0
         r8+mRgG61A2P8vTyS3cjiqW4Pe6bIx1GYS7ZhbSmb8x04O4yZXCuwtGNEaqzB4hOjBAD
         BfvabVm6Nn2/4tCdNLQ9Lt6H/t7FUc3CuiR09ed93A0h0xRl0ltzr/ikGGuJJhJw1ULD
         2rWxfsjWldm9V00JXadIpZfdEVW9Q7MvwNG2ZY3yz1Al4r/lagfr20mEtnkCKllb4zEV
         5Zxg5CHoI7BLjzyGyK8+8UIXYVk1b10R5kD4bC0zsTh3dISPeM0xsnccm6GhasIwUSGk
         OPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687162628; x=1689754628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzzIQhfefWaLN6EvMAN9v4/AfUqiFYRvj/9Q+Gca0Ro=;
        b=ZLCC8lrGnpEJP5sVvxCozbxTdlEX+/CeOq4N3gfsMm+EdQnBjpmOwC90G1aWZ56tNx
         kjSX+psktc9B2C5/m9+E6jo/KNG1DTgDrdNu+EF6zjFGihxlZvffSMxE8OOBWfX5YWjb
         hsc19+b/ucA1HFp1nldH0P28PUkDxGKg87O3EGvuj32uTY7oasFD69lNiWjKRaCdtrAU
         DJfh+Sr3GS+0wDF7KxerCDHIYDTdKk5+irNnARe9u5qLgPaXF0HC3JyMe3VCmZqXJkv1
         0Hboupjn3fE0BYRtfMaMjeCTY90Zqcfbt8fe91JYnuSU8pSAiwNpyxmkBVaAuKQO0LPx
         kh9Q==
X-Gm-Message-State: AC+VfDwGYhHBJGON2isyBy3FDkMLsSp+8RkVuC4I5PT8UhQt9QNJqVbB
        TO4L8qwl9rsaOxhi1bJQQ19PNyluuiKTp7I8P+gg1A==
X-Google-Smtp-Source: ACHHUZ4WeyMp4k2u7pIx5GX95zPzv+JyUpuZBSp3Ww8jNddxu8/o8ze779o2TUNdyQFH4hWZ5IdryAZ6IAnkiGPIZjo=
X-Received: by 2002:a25:dc91:0:b0:bce:bed4:29f6 with SMTP id
 y139-20020a25dc91000000b00bcebed429f6mr5950202ybe.17.1687162628131; Mon, 19
 Jun 2023 01:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230614072548.996940-1-linus.walleij@linaro.org> <3045029.CbtlEUcBR6@suse>
In-Reply-To: <3045029.CbtlEUcBR6@suse>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Jun 2023 10:16:56 +0200
Message-ID: <CACRpkdaDLuryeFwq0tKzDUoyWagRf_w7BfhOuC8K-o-mhk2g_g@mail.gmail.com>
Subject: Re: [PATCH v5] Documentation/mm: Initial page table documentation
To:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mike Rapoport <rppt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jun 18, 2023 at 3:16=E2=80=AFPM Fabio M. De Francesco
<fmdefrancesco@gmail.com> wrote:

> I am writing to express my dissent regarding the proposal to add basic
> information about the role of hierarchical (multi-level) page tables in
> mapping virtual memory to physical page frames.

I have understood that some think this, perhaps the intro could use
some dieting, what about sending a patch to make it look like you
want it to?

> The proposed addition appears to be a combination of trivia and a basic
> Operating Systems I course that one might encounter during their second y=
ear
> as an undergraduate student studying Computer Science or Computer Enginee=
ring.
>
> AFAIK, these concepts are already taught extensively to individuals pursu=
ing a
> B.Sc. degree in Computer Science or a related field, both in Italy, where=
 I
> live, and elsewhere.

Knowing the audience is always the hard part of wording technical
documentation, not the contents per se. I might fail, I might be slight off=
,
my co-developers are there to help.

Assuming that newcomers to the Linux kernel have formal academic
background or specifically operating system education is a bit thick
IMO, suffice to read pages 108-111 of Glyn Moody's book
"Rebel Code" about the background of the network maintainer.
There are a whole bunch of random people attracted to Linux
development.

Memory management may be different though? Mel having written
his PhD thesis about the Linux VMM and all might set the bar higher
for contributors. I don't know really. But the documentation is not there
just for the MM contributors, as the MM primitives are found sprinkled
all over the kernel.

Yours,
Linus Walleij
