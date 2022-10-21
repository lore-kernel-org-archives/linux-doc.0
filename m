Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D86C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 09:30:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiJUJa6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 05:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiJUJa4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 05:30:56 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240DC19A22A
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 02:30:55 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id a67so3519504edf.12
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 02:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IfqknHFplFI4onqgK6NKzTYHK/ieEipqEiBhaLValFc=;
        b=OqMByrkHqHeDikwt1kFSopnsRkgSLfPRDjKMgqQZNoyX7TQvHTrVRizoJ44Bcs0w0W
         iJXLfHd9R9/gmU3uDVckcJo8X6K8aBYx4vOfkR1s7rwQmEzJmVgIJ1+6ZNKaBiu6cYVr
         c61PJ4xT/RauaDjJlbxgc7d/g7tmPhLy9n19Dj17VKpfPWMwqrIURkshea17/tq4ZWiL
         2XrRw/E7jpLs7I/AQAbypLXov371l9onqkWhcGijYoj5GJwuUqCf0iQSnPSvbSl85ogh
         DS1EllBIi+h4w+rThWzjmwy+LqXyweK9tGtiXDrFhg2G0o5meiQQyBJvqqaNT+bcj5Vm
         EV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfqknHFplFI4onqgK6NKzTYHK/ieEipqEiBhaLValFc=;
        b=co7/EKHYGvvPacxWCYFtp7adR0Mq02y30odc3ADYKunTnn+lKsC+1fMRjz8kECT6ZR
         4B92OxlrXuoCSwOvFipe9n8qdqhmMJyd78C3348ubwoPbxVYwdhGnADjO+Vn8IkYOIUu
         lJWMLgPIHcOvgZ+Ji0wQc1YqYaRi0tm9IOlijiV3qdeXNbFmo7tS4IgtbaduJHmpN7D8
         mbtE86CbcD1TykxRxb3CdsLJc5dFTCWa8u3RfRNgDdNKnq1XQVRvu/3TYJM3BjnBKSvl
         7kG5UiP5v1htXfWh51gmCmRkkOsqyLOPF5GMBITw7D6R1a5KwmcXN2Biz9Pu5vnSRrNF
         1CcA==
X-Gm-Message-State: ACrzQf2ENM2pla48S3Fs4jKRGobWxHAM5n0cjLPT+bVzkTHQ8Qq+1RdL
        McCYR6LCDMMM1fRtWb8YMw+d4XvpLaI0QbgJN2cj1g==
X-Google-Smtp-Source: AMsMyM4nu1h7XrH/v5kjc1nM5PjN33Mk7tqMXjE8ARAil+atC4QjbqB6YQOYNakUDq/zL4U1jDbCfDMY+2nUVF59BT8=
X-Received: by 2002:a17:907:16aa:b0:6fe:91d5:18d2 with SMTP id
 hc42-20020a17090716aa00b006fe91d518d2mr15053334ejc.190.1666344653687; Fri, 21
 Oct 2022 02:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com> <20221020175334.1820519-8-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20221020175334.1820519-8-maciej.kwapulinski@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Oct 2022 11:30:42 +0200
Message-ID: <CACRpkdYDYUEx-hWNrUB5cXbH_2oXzRYc2pwn=4u5mivGn14eVw@mail.gmail.com>
Subject: Re: [PATCH v5 07/10] gna: add GNA_COMPUTE ioctl
To:     Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Olof Johansson <olof@lixom.net>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Anisha Dattatraya Kulkarni 
        <anisha.dattatraya.kulkarni@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Maciej,

thanks for your patch!

On Thu, Oct 20, 2022 at 7:57 PM Maciej Kwapulinski
<maciej.kwapulinski@linux.intel.com> wrote:

> From: Tomasz Jankowski <tomasz1.jankowski@intel.com>
>
> This is the ioctl context part of score request + "do nothing" work queue
> implementation. Work queue context actual part will be added by next patch.
>
> signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
> Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
> Co-developed-by: Anisha Dattatraya Kulkarni <anisha.dattatraya.kulkarni@intel.com>
> Signed-off-by: Anisha Dattatraya Kulkarni <anisha.dattatraya.kulkarni@intel.com>
> Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> Co-developed-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
> Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>

This patch start to introduce the actual work processing IIUC.

So there is some funny lingo used here that should be in the commit
message:

- Patches
- Processes
- Scores

These terms are used without any explanation of what it is and what the
purpose is.

"Patches" is especially problematic for kernel developers since we use
it for our development work.

Musicians may start to think about the patch cables used on an old analog
synthesizer and they call the diffferent sound settings "patches" in analogy
with that.

In this case I suspect that "patches" in this context is unrelated to either
concept and rather a new name for "computer program executing in
funny processor", the same way that graphics people insist in calling
their computer programs "shaders". I guess a "process" is one such
"patch" executing in the accelerator? I am just guessing. I need to be
explained to.

If this is accepted lingo then so be it, but bums like me need to have
it spelled out to understand what is going on.

Some examples of patces, processes and scores will be needed in
the commit message.

Yours,
Linus Walleij
