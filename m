Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A360C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 00:06:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DE9D61613
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 00:06:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhEKAHH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 May 2021 20:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbhEKAHG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 May 2021 20:07:06 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D2BCC061574
        for <linux-doc@vger.kernel.org>; Mon, 10 May 2021 17:06:01 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id q6so9340286qvb.2
        for <linux-doc@vger.kernel.org>; Mon, 10 May 2021 17:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lUM6GCiWQ87fBmMe4R6b3VuwWCudO1qdVICMp3zaKIc=;
        b=KFj5l6zhdrS0fLCWMGjmr/xO4BlTFtZoz3C0X6f4yXPAPd4QFYCKQ6VCRUB/RhrcYc
         /aNljSGJlQqpYw9kb4Ei54tqu7LZbNffzPVR359jRbFKseto3PQlwou2i3Frh18gwxLZ
         83EJdcrxGqEoNBrlRvGIOn9J8VC7CuWrNZTlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lUM6GCiWQ87fBmMe4R6b3VuwWCudO1qdVICMp3zaKIc=;
        b=LWlBMt2fi+x7hmLNgg2AZqwx47bSB54uG9WbF281dVm1UH1I8t+dwcNiHAqjsY2ynl
         rzeqkpMST535JU/RZBSraWYxONLMGhh0ssdfuAxNxxR00QbVNfRwEo7T3Z58uM3iBC44
         z9u2Z2aophv0lF33Q5P6q/guPJbKVGB35GJedLEPShAHyjx8eCvVozExr98BzQ7jxNeS
         WhQuKddLK9e/ibOrjOT0FGINtQbqRQQNkAtxr7IrpYPUylwXPcIU2MEROarLtjOhGrS5
         PpFl25OBpksUfr3omm1zFp+W86VD+X93QtnvZr6v2XT9u6C+8c5g3fpahzE73tq7gy5b
         ToRg==
X-Gm-Message-State: AOAM532oJ/uQJncCK8qDW8hvAtmNJElui6+wJkC3eXp0OMiEvkKsHJrd
        FGGlflOjCFXJrXRJKY+AUaNuOUE98ieNPA==
X-Google-Smtp-Source: ABdhPJxfo/rMZU1EkUYzpYib7Ul8RtYvgUtxadoYIPeQmgO/hJUrTIaldFn4vnl7c/FzI5X5BWFw1Q==
X-Received: by 2002:a0c:b28c:: with SMTP id r12mr23836806qve.32.1620691560235;
        Mon, 10 May 2021 17:06:00 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id n21sm5909394qka.114.2021.05.10.17.05.58
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 17:05:59 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 82so24006088yby.7
        for <linux-doc@vger.kernel.org>; Mon, 10 May 2021 17:05:58 -0700 (PDT)
X-Received: by 2002:a5b:8cc:: with SMTP id w12mr37539122ybq.32.1620691558469;
 Mon, 10 May 2021 17:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com> <20210510150413.59356-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210510150413.59356-2-andriy.shevchenko@linux.intel.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 10 May 2021 17:05:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VpuyYBv2tj5AHLx7U7vfCpH1A6hfG_amscZ6OupRwEHg@mail.gmail.com>
Message-ID: <CAD=FV=VpuyYBv2tj5AHLx7U7vfCpH1A6hfG_amscZ6OupRwEHg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] kdb: Switch to use %ptTs
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Petr Mladek <pmladek@suse.com>, JC Kuo <jckuo@nvidia.com>,
        Joe Perches <joe@perches.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-tegra@vger.kernel.org, linux-nilfs@vger.kernel.org,
        kgdb-bugreport@lists.sourceforge.net,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ryusuke Konishi <konishi.ryusuke@gmail.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Mon, May 10, 2021 at 8:04 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Use %ptTs instead of open-coded variant to print contents
> of time64_t type in human readable form.
>
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: kgdb-bugreport@lists.sourceforge.net
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  kernel/debug/kdb/kdb_main.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

I kinda doubt anyone would really care if we just switched kdb to just
the old "%ptT". Probably no machines are parsing this string.

...but in any case, now that the nifty new format is there we might as
well use it. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
