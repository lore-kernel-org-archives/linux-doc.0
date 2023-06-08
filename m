Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BE5C7EE23
	for <linux-doc@archiver.kernel.org>; Thu,  8 Jun 2023 11:51:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236365AbjFHLvn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jun 2023 07:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236258AbjFHLvm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Jun 2023 07:51:42 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 705C31FD5
        for <linux-doc@vger.kernel.org>; Thu,  8 Jun 2023 04:51:41 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-ba8cd61ee2dso2383067276.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Jun 2023 04:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686225100; x=1688817100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUtbBCyg3/ru6fquO7pFhKs4Gtk9wx/uUOHkpEel6iI=;
        b=XczW/2BCQTzxU/efbVnK9I0dKRxLRPzp4a+WFPeB8gNNkp8kaO6d0Bp40CQXKJxmiR
         YXr7gXULOQfvFzpBmUaGR0QwPA4rrm7ybARS382pDkZezBxAcMBp1b/pzhqX16lAApMn
         vFwCq5r46VIBm+zdplCkME8o9AdLyHSg51xHaZO+oPbUYnMapPjFNU+5XIe5oBz9iyPy
         Wv32NnDU72kDU2b2BwTzGEPuxRM8ZM2SUYQI80iSU7OPkzJu8IS0Pj/rEK++42Jt7Mnn
         Viv3kWdBrw172ylgL+YmGSdz9R5cjGPs2misvISqi1zBvAkJ1b0fSvY/ktx2eQjkw0dd
         EmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686225100; x=1688817100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUtbBCyg3/ru6fquO7pFhKs4Gtk9wx/uUOHkpEel6iI=;
        b=MzdpcIijj2xuk9AHCAnjUp8Ao0q3taTe6SCtxnbxWWxhakSvSL3huhtJbo3yMXEFdA
         5fVX8ewrICtxIGTHbN66RNkVT+Cz2Xkps+l7zZIKDD7oiwC4dTln+NHyqNedfeptthuS
         /QD56/qkGkIbrEfeVJzdQnOQMnfDD98faf5YileAsFNkt4idjNWJLZo7jQIvuNWL6Nbz
         YHhSynuW0UONi0UNkgluNrTwleDw9i6MhQYMQsa+esHgtEqVh96wSQxmrz7noObA0sKH
         p/uGnBITDsyNykYctaF1dvRfM7hyMDtrcVFiVUOo09k9llKkYDR3smis6xMJGkO3Ez89
         x8qg==
X-Gm-Message-State: AC+VfDwefXVZxUeGpPwBfbjSq1rVEpHE9uG6JRdbOWV/Rboz9KCv1cco
        xYYvWt1PFGD+oy6HFcEIq5YZi2qSoTk+zZv+Cv6xgJ53ogJhjLub
X-Google-Smtp-Source: ACHHUZ5sVaxM+0CunjDO8KA1s84laXOn+p3BVyjyJZO35Vh2FFb2Wat1WtfICaqy5TqZY4OUGppmO4JcWPUYL47bMXI=
X-Received: by 2002:a81:5f06:0:b0:561:bbb8:2dc3 with SMTP id
 t6-20020a815f06000000b00561bbb82dc3mr1883804ywb.21.1686225100687; Thu, 08 Jun
 2023 04:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230605221035.3681812-1-linus.walleij@linaro.org> <a1690394c1f51875c85600251f7789289c798227.camel@mediatek.com>
In-Reply-To: <a1690394c1f51875c85600251f7789289c798227.camel@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Jun 2023 13:51:28 +0200
Message-ID: <CACRpkdZ7Xn4kUoqvvhRJY7WGbf5Tgo_gvSf81j-on_jRfxPfdA@mail.gmail.com>
Subject: Re: [PATCH] Documentation/mm: Initial page table documentation
To:     =?UTF-8?B?S3Vhbi1ZaW5nIExlZSAo5p2O5Yag56mOKQ==?= 
        <Kuan-Ying.Lee@mediatek.com>
Cc:     "corbet@lwn.net" <corbet@lwn.net>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "rppt@kernel.org" <rppt@kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 8, 2023 at 11:32=E2=80=AFAM Kuan-Ying Lee (=E6=9D=8E=E5=86=A0=
=E7=A9=8E)
<Kuan-Ying.Lee@mediatek.com> wrote:

> > +With a page granularity of 4KB and a address range of 32 bits, pfn 0
> > is at
> > +address 0x00000000, pfn 1 is at address 0x00004000, pfn 2 is at
> > 0x00008000
> > +and so on until we reach pfn 0x3ffff at 0xffffc000.
>
> pfn 1 is at 0x00001000.
> pfn 2 is at 0x00002000.
>
> And so on until we reach pfn 0xfffff at 0xfffff000.

It seems I went immediately for 16K pages... Thanks, I'll fix it up.

Yours,
Linus Walleij
