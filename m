Return-Path: <SRS0=BeNN=4V=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5555C3F2D7
	for <linux-doc@archiver.kernel.org>; Wed,  4 Mar 2020 14:20:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97F9921741
	for <linux-doc@archiver.kernel.org>; Wed,  4 Mar 2020 14:20:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IEfR2bAD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgCDOUq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Mar 2020 09:20:46 -0500
Received: from mail-qv1-f67.google.com ([209.85.219.67]:33936 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729386AbgCDOUq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Mar 2020 09:20:46 -0500
Received: by mail-qv1-f67.google.com with SMTP id o18so845308qvf.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2020 06:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=i+y/kPMT8bVvrx4fXB/kL/rmkuWZJIQeJMw7GyPIJT0=;
        b=IEfR2bADw8lBvqOToIzYhPXCCPQnjTGxV9itWmAmDGi0+jRUnjOlztVEYh5f2i+sMA
         4Iv8m3Ki6B7bk/uT65rAl34ttdReFvUgCAHwH1qLn/ivTJxa5dNE5d6MGcUi+chM5di/
         jRCFVpQRt8b1ae/N6unuM7+vHAki9g2uKZRctK5ZEJe/B0DGm8xTqP0pRcrOk20usUo4
         +4W3nMoisQGALVLayZ0Hpb69QgYHMx0Yl2cGjTMoliONZJUpu5PidD3HFUUFitbZ7qWj
         VstRWl+2DqoxiMqE1Tt688S1/1+HBCCRaHWgOxdL/SpI2hepShe7FJCwyTQD/dwjaOSa
         IX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i+y/kPMT8bVvrx4fXB/kL/rmkuWZJIQeJMw7GyPIJT0=;
        b=iHmS8ieFOTrq6gfnRLOWFVp8TLJI5/AUlI4cDj0HXUeN7fCPEIr2cuVYZBCJGCck+T
         JVNg5wLu0fT/BS6hVGW1r1gWAn5wu2gPmFo4twX8Ku7aWIC/Oa1YjZ0kxLHAA28NUZ5v
         ikGwv/8YOI5RRSHpdZAk83g4zq5oZEmJJ70d2vs0c3A4EUHi5RBoNRVg9A5RpLZFOrZo
         OmDSTBDs6qTJ0J3+GjzmegfZX+Z8VMKebqG9qKqK5FVf8Poag7NX6AV3ZJhNn0x7bbOk
         F6NvRWknja9CTYyKduKhZqc5jZSag9wJpgHAfAcytDzMKqB3cTPNy60KDTZUR7HsPwWn
         21Kg==
X-Gm-Message-State: ANhLgQ0+JD3X+1pCHg7BgCayVMP1kemoJXHkK1zEf1W1U2kDpXzTZedX
        2m8Y6OqcUBwj8m3nQbiWZAlnJYHTvxYPbOye8r2zb7if
X-Google-Smtp-Source: ADFU+vvFWgi4t6KeCmj3sctTCapMYf1XocPqqoU7xw1lccJfATRkseBw6vBz8PTsAQUZ0XrUe1UHfJiewsa9Qdq/M+4=
X-Received: by 2002:ad4:4e4a:: with SMTP id eb10mr2208184qvb.96.1583331643738;
 Wed, 04 Mar 2020 06:20:43 -0800 (PST)
MIME-Version: 1.0
References: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
 <9ee92407b467fd0b482a680bcce447f907df2278.1583250595.git.mchehab+huawei@kernel.org>
In-Reply-To: <9ee92407b467fd0b482a680bcce447f907df2278.1583250595.git.mchehab+huawei@kernel.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 4 Mar 2020 15:20:32 +0100
Message-ID: <CAMpxmJV=+02F5SDQhDK2p8ZuZrRCgHDJh0y_bXBKYXjfFN-pVw@mail.gmail.com>
Subject: Re: [PATCH 5/9] docs: gpio: driver.rst: don't mark literal blocks twice
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

wt., 3 mar 2020 o 16:50 Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> napisa=C5=82(a):
>
> Two literal blocks there are marked with both "::" and
>
>         .. code-block:: c
>
> This causes Sphinx (2.4.1) to do the wrong thing, causing
> lots of warnings:
>
>     Documentation/driver-api/gpio/driver.rst:425: WARNING: Unexpected ind=
entation.
>     Documentation/driver-api/gpio/driver.rst:423: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:427: WARNING: Block quote en=
ds without a blank line; unexpected unindent.
>     Documentation/driver-api/gpio/driver.rst:429: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:429: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:429: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:433: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:446: WARNING: Unexpected ind=
entation.
>     Documentation/driver-api/gpio/driver.rst:440: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:440: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:447: WARNING: Block quote en=
ds without a blank line; unexpected unindent.
>     Documentation/driver-api/gpio/driver.rst:449: WARNING: Definition lis=
t ends without a blank line; unexpected unindent.
>     Documentation/driver-api/gpio/driver.rst:462: WARNING: Unexpected ind=
entation.
>     Documentation/driver-api/gpio/driver.rst:460: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:462: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:465: WARNING: Block quote en=
ds without a blank line; unexpected unindent.
>     Documentation/driver-api/gpio/driver.rst:467: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:467: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:467: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:471: WARNING: Inline emphasi=
s start-string without end-string.
>     Documentation/driver-api/gpio/driver.rst:478: WARNING: Inline emphasi=
s start-string without end-string.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Patch applied. Thanks!

Bart
