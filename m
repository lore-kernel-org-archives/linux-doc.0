Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E9A777D099
	for <lwn-linux-doc@archive.lwn.net>; Tue, 23 Apr 2019 10:52:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbfDWKwW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 23 Apr 2019 06:52:22 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37608 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfDWKwT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Apr 2019 06:52:19 -0400
Received: by mail-lj1-f195.google.com with SMTP id v13so504817ljk.4
        for <linux-doc@vger.kernel.org>; Tue, 23 Apr 2019 03:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jjHJWj5FeXe18WchV2bn8F7Pb/3Z1VsLWjcSEKmeIAU=;
        b=uHUxSxzuPKxxVAA87jIdgcZeG2i8ehbZ5AKsl7ok4ibVNub+BR7/bfbP6XrHYLG57T
         +A7T9Dr3dk5ZAzaCGoXAYQxdXyMXYuzQLD3ZpF2yOi8VvbH5i3H14nFBlc9Gm/CVkVCQ
         GFjSCbIU8WkGFKyWURIa4HpSI52+nTmpV3DX9M3ycnsQqJ72jL5Bh0e850P0TobJTb3r
         3RxPG5h65NnLGeMDUM3Q1HINi2OTlTzjSKIWlazhkyWF5k7q0EjrmosSf+tKg2ZHSymR
         Q1CUzOrwOD9FCUbbBj/MiooXltXWCgYw/r6BBHTEIVh69jERNersfFGN8ifxnJhKeIxT
         b5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jjHJWj5FeXe18WchV2bn8F7Pb/3Z1VsLWjcSEKmeIAU=;
        b=LlfwUGMFdoweoQRS7I2+sckGDpWfLiXgYgZWuX4v1Gk8TCtPhsPk5Ksbg+Tk6+TluC
         QcxmAB8QUmddBO9uPu8jnBkV5L6i+23lZFF+zEUWKkjReEiCQqFakB4j60UH11y3p+eR
         o0zhyJ4JKgCtpCMgq5+OuhQdR5CUVY1am/DJqqiHKcDMAiMyEjlu50EmwQUCiatU3BX0
         fWHABJ3DDqNynGRfO9jrw+Zn/ttDacHbfLxd54vmn/+Mx3S3pApWeyQqsyXuzT/jVLHV
         Xj6CN42e7zwBs7cVjuoU7OcQlrG5y1EpLUlz5QpODNPSa6Tggg16y07PxSYHtDv/E92q
         BHlA==
X-Gm-Message-State: APjAAAUkKzaUYgwf1FheCzSy5XYQ2GhzMSu/xH7QPpc8JGSr7mJP3D1A
        hHa4/6M6CX9Shwkna36Vv9PRZqYt6sPlW7nnj5t4eg==
X-Google-Smtp-Source: APXvYqwMt5uT1pB7M8THZUlaySgjL6nMPPyMuWushg7nGzWH2zl+JqyBRVsNZIanc80nK4eKsAUkFlYxgigeOTc4Qww=
X-Received: by 2002:a2e:834d:: with SMTP id l13mr13669579ljh.97.1556016737041;
 Tue, 23 Apr 2019 03:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555382110.git.mchehab+samsung@kernel.org> <0f2d522a80f96391d3f7b51389d08b4afaedb618.1555382110.git.mchehab+samsung@kernel.org>
In-Reply-To: <0f2d522a80f96391d3f7b51389d08b4afaedb618.1555382110.git.mchehab+samsung@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 23 Apr 2019 12:52:04 +0200
Message-ID: <CACRpkdYQeEoyE9sAAo2KZjurx9sH4w+bzM-_-_h6U4w7PeX7eg@mail.gmail.com>
Subject: Re: [PATCH 15/57] docs: gpio: convert it to ReST
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 16, 2019 at 4:56 AM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:

> The API described at sysfs.txt is deprecated.
>
> Still, as it is still part of the Kernel (and will likely be
> there for some time, as we don't simply remove APIs). So,
> it makes sense to keep it there.
>
> The conversion of this file is trivial.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Mauro will you merge this or do you want me to merge it?

Yours,
Linus Walleij
