Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471A1EB64D0
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jun 2023 14:53:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242850AbjFMOxS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Jun 2023 10:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237019AbjFMOxR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Jun 2023 10:53:17 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4559F173F
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 07:53:16 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-43de86a069fso329966137.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 07:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686667995; x=1689259995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aj9On63tZGT4xZHZRbn4kNAEZXg6WSSzte0QQ5DFG5Y=;
        b=3xz+2W3O1cEmUosWRClgJqLxl0RaLvVadqpzTPvT27Bjy1/yeTJfSOMsG0D7X0iH5o
         KzX/+z8/VC+rShQubEE/VWKrIyoN8QvzBgqS0+P+gzuMDwG2uuiMKQNdJ2eTNqYu+MaU
         P+wY2VwAJRMgCg+VbM31WFoOirbEbUKbIVp99SgYmsgjUjHp/9PlvRgETuYgt7l4pIrw
         lpcgVQIqnHllPbvDsAbALV3GDuBLMOQT0rpRWdnghItx3SNqTwglIa2ZAFhANA6IrrAQ
         HUA8KJNWZZ+7RJl7qtzwp22HsQazZ2H6FahZGeNmNAzxVORq2tbBkfFGiqOhiXscImN7
         jHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686667995; x=1689259995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aj9On63tZGT4xZHZRbn4kNAEZXg6WSSzte0QQ5DFG5Y=;
        b=LVtljIAI3RCRrauy0WL02Gd0WCoELA3vTwawpgQ/D7uk9wt0vEH25NlBqcu4DmaHG5
         MCJutX4BmKAJ/I3dC9u/2p3Q3MSCCTJfFBOTb9XB0UpNYKgM1y6Io8tUPLxoEj4ijp1I
         joAusUyqYaYOG6Z4NDUC0GeKOKZLS8XsmfbhvOfRtZ+ZB1gxmecqdXDrKSx4MYr74mJQ
         wLDALp8S8HsiE0opG3892GFMI9Z9mFRp93lv9dSp++8bEx6J4PM28SegqCQn8fm6P2YK
         XqMM4mCooLhhLOgo6CjeycL7utbLawmOkEAiCl1ou7guRPROGzI+bctRSZjZvjzKvExc
         PT2w==
X-Gm-Message-State: AC+VfDw4d71a06VSQ6xR/0TXlvwK//CTVm6jbKzkYYDsbBQ0S/Qhtwqk
        CkXcvHipxZLuMyTomYDK1+aRi7h9ikfok4NcxAW9BA==
X-Google-Smtp-Source: ACHHUZ756bnFHTg62RATpM6wA8I/VVqR/uhiSiA71IFDFVJY4JyUcDi5z39sBzm7jpDc1KvVUBsrTNtF6uxgL2g4exY=
X-Received: by 2002:a05:6102:3a71:b0:43b:3e78:9886 with SMTP id
 bf17-20020a0561023a7100b0043b3e789886mr4214600vsb.26.1686667995404; Tue, 13
 Jun 2023 07:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230605125411.60378-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230605125411.60378-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Jun 2023 16:53:04 +0200
Message-ID: <CAMRc=Mcg62aoeiwG_3aUAGqL9MeoYjWvL4mxRTEPUPw3RbAUjw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: Remove unused gpio_cansleep()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 5, 2023 at 2:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> There is not a single user in the entire kernel of this deprecated API,
> kill it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks!

Bart
