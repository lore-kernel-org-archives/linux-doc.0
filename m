Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F6FC43334
	for <linux-doc@archiver.kernel.org>; Thu,  2 Jun 2022 22:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237148AbiFBWi6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Jun 2022 18:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235656AbiFBWi5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Jun 2022 18:38:57 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ADFB37A2A
        for <linux-doc@vger.kernel.org>; Thu,  2 Jun 2022 15:38:56 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id n28so8027597edb.9
        for <linux-doc@vger.kernel.org>; Thu, 02 Jun 2022 15:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nbEMe/VqX4BtSXdufcZaue+MMZI7HwKcEvhZX2CcJd0=;
        b=PuoMbW99wR4ZUnrC6Hqp2QjyC7ln0P+6g7hWih7VEokSWZq5mHe4pcF4WVVJI3k+VP
         c+xuxCEGdlS0n3jYuNdmwEBKEKKtL33A24JVzWZfeyAuNys0EfDX8d5O6nzmICZuAUsf
         2JF4JGecY/LDwd+SB6dFlTVTQ9UvxOga80cqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nbEMe/VqX4BtSXdufcZaue+MMZI7HwKcEvhZX2CcJd0=;
        b=uy9AWe03gVSz3dSgOCqEaD5tuiZO1yyNOho14/5Bqvuu61GsjOk4x6YNsi2xYWF4pE
         PlPT/oVZGI2bsnuNB2xiuqJzFthwcdE2MxHSSV0xLPIB/WQCty7hvwqxL8HHxiD4/gtN
         QCRPbMO1iG3NOzTsTiInMwbmm4nDQrB7WWAr/a4ifAI8tPLSzIPLy7beEEcLfnsv6Kdz
         pr5JfBzWLYjNJzRsp997dH4hKWHw6KZ0revR/6FUZoakLadteiXMKKim4zxPwZpWTuSn
         PHt6ASt3oFEMXf1xp9QauV1bRylotTadUe7Gc0Zc++Xb49DOoWUobQRAGHywHaXLvYcO
         XRKg==
X-Gm-Message-State: AOAM530gJO2Nxiu8EEZOpCjcrR5BdMiVEKZ42Vac5qKxPeTZaxGb0VkP
        NYczf5BUfBXPX4MzmtASiZy6/qZwQDWqLwkY658=
X-Google-Smtp-Source: ABdhPJxgANcfL294qgfITXDuxgAsgRt4Evfkab22zToKHGPUV7H1r41n15cy3b5wDVUOyXUUzUiwVw==
X-Received: by 2002:a05:6402:3514:b0:42d:d4ec:4a35 with SMTP id b20-20020a056402351400b0042dd4ec4a35mr7812916edd.62.1654209534373;
        Thu, 02 Jun 2022 15:38:54 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id cf4-20020a0564020b8400b0042d6d8ec1d5sm2988845edb.60.2022.06.02.15.38.53
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 15:38:53 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id q7so8197428wrg.5
        for <linux-doc@vger.kernel.org>; Thu, 02 Jun 2022 15:38:53 -0700 (PDT)
X-Received: by 2002:a05:6000:16c4:b0:20f:cd5d:4797 with SMTP id
 h4-20020a05600016c400b0020fcd5d4797mr5429578wrf.193.1654209533417; Thu, 02
 Jun 2022 15:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <875yliycfi.fsf@meer.lwn.net>
In-Reply-To: <875yliycfi.fsf@meer.lwn.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 2 Jun 2022 15:38:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgvfqS+mVYzSKWqdt1D=-WmyEQZi18Ym4tDy=9d-sn0EA@mail.gmail.com>
Message-ID: <CAHk-=wgvfqS+mVYzSKWqdt1D=-WmyEQZi18Ym4tDy=9d-sn0EA@mail.gmail.com>
Subject: Re: [GIT PULL] Documentation fixes for 5.19
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 2, 2022 at 2:37 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> A handful of late-arriving documentation fixes and the addition of an SVG
> tux logo which, I'm assured, we're going to want.

Heh. I guess it is long overdue, whether we are "going to want" it or not.

                 Linus
