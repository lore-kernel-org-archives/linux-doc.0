Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C1CC4338F
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 19:26:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5840160EAF
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 19:26:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhGWSqO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jul 2021 14:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhGWSqN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jul 2021 14:46:13 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D4EC061757
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 12:26:47 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id z6-20020a9d24860000b02904d14e47202cso3103497ota.4
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 12:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=tF88HgyjmBwmY5znnNozRQt7YNRYuw8RYsbOx9ZulPo=;
        b=mHs56eDaFnYYskJ8D2huOxo+F2A0KkufDQLa/T8Ab5FU+zkKavAUIvY+x2beHci8Pu
         1k06C7S27YLI0M/RjKM0Nca/4/iTBv8QVQt86ec/2dpC5PN4YhjAcbQ2KTjAHj/4YlI4
         eHZwE6gHhE2dqx/IBE6fw1ctpUMcYI06C9XKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=tF88HgyjmBwmY5znnNozRQt7YNRYuw8RYsbOx9ZulPo=;
        b=TjwFjx6CHIrYHFXcOqIy1C+rHihLp8MeHEwxmY3VOHijaMC+gGHnq31nuaWjH0vpJF
         oxdJtbGL4bQ1HnuNvE8jIqYEW/46exM0nUGqZXcCZKju2EWRqgcni74gGFKwPOarNHuM
         6XiaY17N/o4UvTIblg05W7f4UScY5IMF3yp3kob5cJfCzOW6ks9XJXVAJ5jmL1etWH9q
         DKTPyEjFSwHcQQ9zINfK6EGk5wmQtnO1rrQK5wIkqFMGOHTVNAr1MgjN4BYSBxh93SQR
         glcwpgmS0w5Doep9jjMYbkngw9wp2JYECNxaZxrXh+px/8LUXcBeXBBzEQH1zLK3TCi8
         hZkg==
X-Gm-Message-State: AOAM532wYVVbLxbvNz0/ZPPtM7e075jFcJmKC2N0e7cYKKX8lewPQ+Hv
        KLmhxEBRdKYNj/HSMqypQCJGeC7DlfmnFiFuA1VZ3A==
X-Google-Smtp-Source: ABdhPJxg/UUfrR4T4A+0xmMqHhfe4qwIZJckxowRHkidCdL7oI4UIdIkEI3DjuqGauq8Zu1wY/w3ssLJo4Oc3/Edv9Y=
X-Received: by 2002:a9d:1b6e:: with SMTP id l101mr4071196otl.34.1627068406542;
 Fri, 23 Jul 2021 12:26:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Jul 2021 19:26:46 +0000
MIME-Version: 1.0
In-Reply-To: <20210722100356.635078-2-ciorneiioana@gmail.com>
References: <20210722100356.635078-1-ciorneiioana@gmail.com> <20210722100356.635078-2-ciorneiioana@gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 23 Jul 2021 19:26:46 +0000
Message-ID: <CAE-0n53Ljsio4sVdwoh+vtBMyWiukCWUEa_-VF3-Loc-p4_Hbg@mail.gmail.com>
Subject: Re: [PATCH 1/4] docs: printk-formats: fix build warning
To:     Ioana Ciornei <ciorneiioana@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-doc@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>,
        Jing Zhang <jingzhangos@google.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Ioana Ciornei (2021-07-22 03:03:53)
> From: Ioana Ciornei <ioana.ciornei@nxp.com>
>
> Add an empty line after the '::' starting the code block so that the
> following lines are properly interpreted.
>
> Without this, the following build warnings are visible.
>
> Documentation/core-api/printk-formats.rst:136: WARNING: Unexpected indentation.
> Documentation/core-api/printk-formats.rst:137: WARNING: Block quote ends without a blank line; unexpected unindent.
>
> Fixes: 9294523e3768 ("module: add printk formats to add module build ID to stacktraces")
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---

I thought this was already fixed? Either way

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
