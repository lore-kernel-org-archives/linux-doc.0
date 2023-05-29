Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BF4C77B7A
	for <linux-doc@archiver.kernel.org>; Mon, 29 May 2023 10:55:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjE2KzP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 May 2023 06:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjE2KzO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 May 2023 06:55:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34ACB2
        for <linux-doc@vger.kernel.org>; Mon, 29 May 2023 03:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685357673;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=grOKklWJfgNBidyEYtxttC3+almW1iCc1sWq6FJDGw4=;
        b=C0p2XEjdtruSqBFSNJLKPG2ESt0a513r3d166km8d7U9Xp0baQkuwhwjT3q+u9ajksDxNs
        sZsELAX3KtU+d0HWuhYIIi3ym8RHkQrMk87Js2ft6RZalo+eh0r62aZW40KH2JB/QmwS1/
        eShS8GPthdCDFR029aTT0oZWtRVK/1c=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-PSYe7164Ol6_AZgU6dIyQg-1; Mon, 29 May 2023 06:54:31 -0400
X-MC-Unique: PSYe7164Ol6_AZgU6dIyQg-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-39a013fbef3so1314464b6e.3
        for <linux-doc@vger.kernel.org>; Mon, 29 May 2023 03:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685357671; x=1687949671;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=grOKklWJfgNBidyEYtxttC3+almW1iCc1sWq6FJDGw4=;
        b=MimUq8UC5kfdXijb/LVquZEy9JT1Hz2J4tEhpztMwefeFIUz4X+A/HUmYmUB8kx00T
         shbxhwvZjhj8ufkwOAzTGbAK7PhD/szwdJ4w/APJ+VJAuDT4meDHhnBfWfQOrVlOrLK4
         ocgW7Ad8pHCKlVzxHjXbVRJriR1cn30e0ot6tiTL7tcVEqH6HeU3NpGb3P4JCs7pSF9u
         HouhVuIU4468wVow9bJl1ia3ksq/XIGpIJFYJwW9xzMNc3Ae8lE933+ObqbpDWHQJHGL
         EA8ejQfI6YFHq4x0cipdejhrtZpQxMp9aHIUJAUh56R2nlyEKvng4fOI5qqa5Vkcef3E
         nafA==
X-Gm-Message-State: AC+VfDxtqqoWSJxCOLcwr/8JUONOtSAIIJkXz+G4PkBeuQG6RMPIhBRP
        kNFJKkBrlB7O4qR7ciHv+LAjLcYhglZAPfgYFte916AQkEgZVwSo9IRJ/i1G6h+nryMK09Spw7Z
        VkouXVXuROwPrNm8+L3rBHMowbY5yoPhMaKJ6u6A1/uxM
X-Received: by 2002:a05:6808:86:b0:396:fa0:f580 with SMTP id s6-20020a056808008600b003960fa0f580mr4390707oic.59.1685357670957;
        Mon, 29 May 2023 03:54:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7u5ysTTtG8MXesoOo2QoUcVxebdvNNKFiSnguqjoHBhsq433S290gsCzHsOPlsqvBCkHtRBYqSXIVW//gZ4iI=
X-Received: by 2002:a05:6808:86:b0:396:fa0:f580 with SMTP id
 s6-20020a056808008600b003960fa0f580mr4390704oic.59.1685357670767; Mon, 29 May
 2023 03:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230425072644.868535-1-costa.shul@redhat.com>
In-Reply-To: <20230425072644.868535-1-costa.shul@redhat.com>
From:   Costa Shulyupin <costa.shul@redhat.com>
Date:   Mon, 29 May 2023 13:54:19 +0300
Message-ID: <CADDUTFyAFaGrmQCa8NyUTq2ktwFvUX-SC-Hg5faNpH6-ozWveA@mail.gmail.com>
Subject: Re: [PATCH] docs: split subtitle of Submitting patches
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kind reminder

On Tue, 25 Apr 2023 at 10:27, Costa Shulyupin <costa.shul@redhat.com> wrote:
>
> Motivation:
>
> The original long page title in the left Content pane spans three lines:
>
> Submitting patches: the essential
>   guide to getting your code into
>   the kernel
>
> Issues:
> - It is not readable.
> - It further inflates already overpopulated Contents pane.
>
> The solution:
> - Split the long title to title and subtitle.
> - Vertical bar '|' in Sphinx-doc introduces empty line to
>   make the subtitle closer to the title than to the following text.
>
>
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/process/submitting-patches.rst | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 7a5619fecb38..051eba1bbc7f 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -1,7 +1,10 @@
>  .. _submittingpatches:
>
> -Submitting patches: the essential guide to getting your code into the kernel
> -============================================================================
> +Submitting patches
> +==================
> +The essential guide to getting your code into the kernel
> +
> +|
>
>  For a person or company who wishes to submit a change to the Linux
>  kernel, the process can sometimes be daunting if you're not familiar
> --
> 2.40.0
>

