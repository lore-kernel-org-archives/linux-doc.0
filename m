Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166F4C4321E
	for <linux-doc@archiver.kernel.org>; Thu, 24 Nov 2022 12:10:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbiKXMK0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Nov 2022 07:10:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiKXMKZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Nov 2022 07:10:25 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EDF2748DD
        for <linux-doc@vger.kernel.org>; Thu, 24 Nov 2022 04:10:24 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id bp12so707923ilb.9
        for <linux-doc@vger.kernel.org>; Thu, 24 Nov 2022 04:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WsnqhIo8OuDtSYALlQhH/obeAFS+XPS7ahZHr0d+yKU=;
        b=YjfJcqXwBHOuVL7wse2ZKsQ5JtVewfVDDfpPUV3ubL2ABHvwcOsMfh/HD/aiEg6gBB
         XX/wR1/utF+we2u4WcBAMai6wjIAhlDokhsEktAsEKxDjH4nIrxXjHdbODGOHBoWnqqk
         Cq2an3iNEkj2a9KY8cKh4PvmX1XJ5yuCdmHkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsnqhIo8OuDtSYALlQhH/obeAFS+XPS7ahZHr0d+yKU=;
        b=T1z+z/lH62R9S13osnr95zd24DNfCe9T62yoQsrVrLCsQvlxEQOpFeNYs6Bk+xYxNd
         Li1IN5qvYrs7iuRKH1GmXxrX5pMXzA97kx7LRg4eTFJZ6C5homRz4aI04MQRszq5KrzI
         ElYrTk1NZ7p1wWhfW3SP6n0sKyG3Tfa7uKt0ZY549UBksRp+Xw6ISDZ53kGToCd0xXja
         4OnTVugMsH6Z+VL5wngmcMsGEQdEyyTZT+O6zFgdPmqsFmZw6jtcnSg4KbinRssN0YAu
         lQfjikiRvx6WG3EQqJZUG2kAdSncFY7fcTG+sCz8HxybnPw6gRGh4MZV1k4x0UDALw/p
         XZEQ==
X-Gm-Message-State: ANoB5pmq60/aT+U5IEZakePfcY9y4GQSiGWa9qzVmRm3h9SN1b8gkjCB
        ZqwhJTPXBTMtBJ9Ez+TowqDbzyb1OXn1Tg==
X-Google-Smtp-Source: AA0mqf5ANJoizT6KfQQQX0zzRmgj0nLf3HsdkzKNuD16HnZiIglLDuXhhaw3O30K5G3wDSuI7FcMFg==
X-Received: by 2002:a92:c64e:0:b0:300:5ae:9041 with SMTP id 14-20020a92c64e000000b0030005ae9041mr14203596ill.26.1669291823551;
        Thu, 24 Nov 2022 04:10:23 -0800 (PST)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id p3-20020a92c603000000b002e85e8b8d1dsm380878ilm.5.2022.11.24.04.10.21
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 04:10:22 -0800 (PST)
Received: by mail-io1-f54.google.com with SMTP id z3so1106729iof.3
        for <linux-doc@vger.kernel.org>; Thu, 24 Nov 2022 04:10:21 -0800 (PST)
X-Received: by 2002:a02:c897:0:b0:374:100a:b0c7 with SMTP id
 m23-20020a02c897000000b00374100ab0c7mr6338879jao.185.1669291821369; Thu, 24
 Nov 2022 04:10:21 -0800 (PST)
MIME-Version: 1.0
References: <20221123-serial-clk-v2-0-9c03ce8940d8@chromium.org>
 <20221123-serial-clk-v2-2-9c03ce8940d8@chromium.org> <140187ba-7d2c-8b7b-e172-7350eed458be@kernel.org>
In-Reply-To: <140187ba-7d2c-8b7b-e172-7350eed458be@kernel.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 24 Nov 2022 13:10:10 +0100
X-Gmail-Original-Message-ID: <CANiDSCvq54Xr7OECNuo230XhNbtY1Pgr8GA+ajreEZGYGucq9Q@mail.gmail.com>
Message-ID: <CANiDSCvq54Xr7OECNuo230XhNbtY1Pgr8GA+ajreEZGYGucq9Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] earlycon: Let users set the clock frequency
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 24 Nov 2022 at 12:19, Jiri Slaby <jirislaby@kernel.org> wrote:
>
> Hi,
>
> On 24. 11. 22, 11:02, Ricardo Ribalda wrote:
> ...
> > --- a/drivers/tty/serial/earlycon.c
> > +++ b/drivers/tty/serial/earlycon.c
> > @@ -120,9 +120,15 @@ static int __init parse_options(struct earlycon_device *device, char *options)
> >       }
> >
> >       if (options) {
> > +             char *uartclk;
> > +
> >               if (kstrtouint(options, 0, &device->baud) < 0)
> >                       pr_warn("[%s] unsupported earlycon baud rate option\n",
> >                               options);
>
> IMO this won't work if there is a comma in options (i.e. your new
> clkrate param). kstrtouint will return -EINVAL in that case.
>
> > +             uartclk = strchr(options, ',');
> > +             if (uartclk && kstrtouint(uartclk, 0, &port->uartclk) < 0)
>
> You are giving ",number" to kstrtouint, right? That won't work either ;).


The fun thing is that it worked because it fell back to the acpi
parameters :). Will send a v3

Thanks!
>
> regards,
> --
> js
>


-- 
Ricardo Ribalda
