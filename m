Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5A6AB7DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 May 2018 21:14:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751840AbeEDVOC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 May 2018 17:14:02 -0400
Received: from mail-vk0-f65.google.com ([209.85.213.65]:44450 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751710AbeEDVOB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 May 2018 17:14:01 -0400
Received: by mail-vk0-f65.google.com with SMTP id x66-v6so9668850vka.11
        for <linux-doc@vger.kernel.org>; Fri, 04 May 2018 14:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=scSw7KY1ZsiwYUMcidsbOJbjPiwJQq1KJv6xsX5+P1w=;
        b=eNilFW2+7vkftSXrLYHZ1FbvqCbSTbx1J9j4PIPE/i7EtKHJhbR4bpG8blbuqcXfoj
         hfWOkeKygzAvrCf7PCIh3tkHomPg1bgZEnPLvmclejKTBkQUvuD0/IOMRfWhd8ifXJCi
         q/HHGxJFz+dVlQ4LqGoM9ltjIu9mY3sVAgJXbxfzC+eALe5nfMHXxy3O0O12Jwd6ET3E
         +TNRsnEHVmWNbanT75U/qLbTblg/L5cPizQWZysKqZ47jvBQ+70bxTBbzTKGibXnFKJ3
         vGxwufdfK/aMOgK4p15H46feHGXyAS+WxCmzClWZjXEc4pt64MFI1r0Y53tdOG0rf5/W
         3mkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=scSw7KY1ZsiwYUMcidsbOJbjPiwJQq1KJv6xsX5+P1w=;
        b=L7LKXAKLqhnEWZTVWMvgLtbXDETG4Me7BYpGC+FVt1I34sGw/AYajTPZaze85pF/LD
         BmYONFh5QPP20cdyzvrmVbiQt2bXD95S6UGz4YmBLB1LNGTZNyEXX1B1Q5662xuJVkiT
         L+xBr5f1pJ/IUqIcUJ4uIvkk12HZqgS9GKaxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=scSw7KY1ZsiwYUMcidsbOJbjPiwJQq1KJv6xsX5+P1w=;
        b=jgsZ8DKzuMIYyA7+oco4s2yFAEEDYkEpOWnrztGuuQfHPVOAKYc0ADzJfMPdIT+67s
         B1Zn4qBilcv3u2tHE0oKPMq2kvSQGFZQeXmZRI9wCOFi8s9ksMGqBIt7eot/o738HSol
         OgEktcNQy/YCYgBY0mX2IwmckVUI29vT2cpLl5OzEk7TRNv+c7BpBOPEf953ypWR/LGl
         s41GqIwxesG7KXfpTMvsN8CAW/WVtF4CxzhRrzKGCBSWR5lJnKhzUxPX9m9rLBSzqdtY
         gFWugW6Nxy59FMHwVzGWOMvkGRjZfnGHUYYB7q0MxjQgRSF+K8xiGjcWWuOJ+ENk1OPw
         h/9g==
X-Gm-Message-State: ALQs6tDGobUCUhnj7RPfsJUh4MndgVAY0uIpJ9MYCFrLjEBiwAzf3BWD
        A64CK5yxEf1UOB4Mrk2dTKDXImvi5f8qhxbDVxBg0Q==
X-Google-Smtp-Source: AB8JxZqQX9HFcwXff8EyM4PwBJPoggHflff7iWVR6HRTfRQj9Imcg4s0qrJmmIPbVl9EjqCU+AMBahlPpYWujxyc7EA=
X-Received: by 2002:a1f:ab47:: with SMTP id u68-v6mr25396320vke.158.1525468440899;
 Fri, 04 May 2018 14:14:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.11.209 with HTTP; Fri, 4 May 2018 14:13:59 -0700 (PDT)
In-Reply-To: <1525468309-5310-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1525468309-5310-1-git-send-email-andrea.parri@amarulasolutions.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Fri, 4 May 2018 14:13:59 -0700
X-Google-Sender-Auth: EquFrQ8Dmr3BjaoqOrK2TghzyfY
Message-ID: <CAGXu5jKHb8-P-Y2ecnH9sd6vWhY9cWPfow1Lx_gzRMbHWusRXg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: refcount-vs-atomic: Update reference to
 LKMM doc.
To:     Andrea Parri <andrea.parri@amarulasolutions.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Elena Reshetova <elena.reshetova@intel.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 4, 2018 at 2:11 PM, Andrea Parri
<andrea.parri@amarulasolutions.com> wrote:
> The LKMM project has moved to 'tools/memory-model/'.
>
> Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
> ---
>  Documentation/core-api/refcount-vs-atomic.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/refcount-vs-atomic.rst b/Documentation/core-api/refcount-vs-atomic.rst
> index 83351c258cdb9..322851bada167 100644
> --- a/Documentation/core-api/refcount-vs-atomic.rst
> +++ b/Documentation/core-api/refcount-vs-atomic.rst
> @@ -17,7 +17,7 @@ in order to help maintainers validate their code against the change in
>  these memory ordering guarantees.
>
>  The terms used through this document try to follow the formal LKMM defined in
> -github.com/aparri/memory-model/blob/master/Documentation/explanation.txt
> +tools/memory-model/Documentation/explanation.txt.
>
>  memory-barriers.txt and atomic_t.txt provide more background to the
>  memory ordering in general and for atomic operations specifically.

Will this get linkified by rst ?

-Kees

-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
