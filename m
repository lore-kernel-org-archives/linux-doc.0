Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767E3C3A5A7
	for <linux-doc@archiver.kernel.org>; Wed,  7 Dec 2022 00:07:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiLGAHD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Dec 2022 19:07:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiLGAHA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Dec 2022 19:07:00 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 664AB131
        for <linux-doc@vger.kernel.org>; Tue,  6 Dec 2022 16:06:59 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3b56782b3f6so169438757b3.13
        for <linux-doc@vger.kernel.org>; Tue, 06 Dec 2022 16:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HXgLDr1n/+xAVukg6gKX/0TpU9mRimvh3G5TlxnBz6g=;
        b=exXeum7wqVGnbRYbAY94VKseR8t66PoiNTCRjhOGL/vlm2QFvt3vuqCTXZGjwEKndU
         OmlWvpPP7jQLFPDVRSdkBN4AvuazSC2Ms4+zr/ZinuI5FdHTdaprcsJIbtOIehN7ZHEO
         gjRrhK3l9HMImsfvw4e72Et0ELcVyvvq3/bQDlRtCt3LlHJYP38mqb9pUm3dNsR/bx4r
         Jp68TCQNz6gaVaSfi0rl9oOrawK/lPrzGdraukItASK8mYqeSredcJ7NTN30kAdxMmiD
         Vq7RKEbvEneN6XNwKWQm7cuGUlYTzWrfOYcHnLoqgz/0IwEO3JHSaAzWoHuELVrv0/vD
         x3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXgLDr1n/+xAVukg6gKX/0TpU9mRimvh3G5TlxnBz6g=;
        b=IO6jjsUq1gL9sAdp0xf8JyIH1jPuSaUibQIcXwTESc6oJAB9zlXN/atVQlQALuwShq
         4vPXR568ZlHHOleRNADRsullLi9x11AIE7cQF5Fnb1RROxZIh7uPsurBkKWbVaswMk61
         exAmp1rXj5mxNY1pCZbfq+n6aOrT5t5t7yFDjE6HOmrdTVtFELt08KxwnuOdfEEGHmum
         YLXUyPxkt+AfI9xg3xTR1/QbtKq6meF4YEa/0+22LGDG9T9GWVhD1Q93twmQ7lnWYFvE
         4lN+2uVLu2Fyrq+zm8mYyo0PM73sCYdRbGUFe5gnIOUE1TyZatucZQkVW/vXra6mQ5aN
         +8DQ==
X-Gm-Message-State: ANoB5pm+q+OZNXqCcYfHGJc6PktmTniP93Xq21JpEpnVe8B098kp/W4D
        qn+iIgyoKQ04d+HRxt8Dl5LN/GMHe309N9uv59OyxA==
X-Google-Smtp-Source: AA0mqf4cnAiozi/iWQDnrGVKXZ+2ZUzCBo8345aoW0itQwcsuYnRsud83YCR6WxeMt6XiOBmd49ALiNgx93e6J+m2M0=
X-Received: by 2002:a0d:d751:0:b0:3e8:76df:4afd with SMTP id
 z78-20020a0dd751000000b003e876df4afdmr14015886ywd.380.1670371618632; Tue, 06
 Dec 2022 16:06:58 -0800 (PST)
MIME-Version: 1.0
References: <20221130155519.20362-1-andriy.shevchenko@linux.intel.com>
 <20221130155519.20362-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdaQWZE6=BNEh5hSH9=jBK=TcLoD1uUb=JyNYmHFvaSAfg@mail.gmail.com> <Y41MxPthLjitvzEl@sol>
In-Reply-To: <Y41MxPthLjitvzEl@sol>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Dec 2022 01:06:46 +0100
Message-ID: <CACRpkdb67ygsEuZhRZ9TGmmNXhiU2LsuefD0-48xtCLx3fq-KA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] Documentation: gpio: Add a section on what to
 return in ->get() callback
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 5, 2022 at 2:43 AM Kent Gibson <warthog618@gmail.com> wrote:

> My preference would be for the driver API to be extended with a new
> callback for the output buffer, say get_output(), and have the existing
> get() always return the input buffer.

This has a certain elegance to it, as it cuts to the bone of the
problem and partition it in two halves, reflecting the two pieces
of hardware: input and output buffer. Also follows Rusty Russells
API hierarchy.

Yours,
Linus Walleij
