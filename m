Return-Path: <SRS0=92oT=43=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EAAC10F27
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 18:21:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F4D42071B
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 18:21:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgCJSUz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Mar 2020 14:20:55 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53447 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgCJSUz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Mar 2020 14:20:55 -0400
Received: from mail-lf1-f70.google.com ([209.85.167.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <guilherme.piccoli@canonical.com>)
        id 1jBjUr-0005FU-0K
        for linux-doc@vger.kernel.org; Tue, 10 Mar 2020 18:20:53 +0000
Received: by mail-lf1-f70.google.com with SMTP id f3so1574751lfm.14
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2020 11:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a/HvhUt0ysFx0Jm3cdreQunT4799OHITOZy4NURukkw=;
        b=Ix9YLGrrAEDZnCTC8uKtnTJ6KnHSDBOzk06U9kksUBhbk6IfwdK4PinW0gUsqoh4rO
         PMQlC997ZiZIlyd6+gI9l5w9fy4nV8hsgOB4t+y+eJmQvfdBCiSIxplnBGF6FAaTRWan
         AOuxD6UAhWIQBI+AckLoLUhN+8yzehiZ9sN5MS8G1TnyaPCoi3dtfzytaDfWJjru3K05
         OnQgZ8H3jMl7lv/gu3cuoQgqvvfqUTz1O8d1guivLtqsaz21S4zasfcRs3c8EhYsfnw2
         uU2l7yU9JqBD/XWz0EnP/y347F5Nip9+wYAvEhgqM3p4K5U9HrB6baL92uHzTZHVNcae
         qDww==
X-Gm-Message-State: ANhLgQ3xsKmuSsdorsU4xnH4xeZPPOAO5aPsGo2DeTRTYaCWNNUQgohz
        tsrwJG7sRrNcxyPiasNzNUroooeE54XqPEAMHrieUfk0M+hLG929YUNIcdYXnbwtKVJo7q5Frua
        XWAiQToX4jlH4whnQSFFibg6ozKGUAHNE+I49A6QqB1JZLnhWhxZKrw==
X-Received: by 2002:a2e:8e96:: with SMTP id z22mr322953ljk.2.1583864452480;
        Tue, 10 Mar 2020 11:20:52 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv1foG7lISXTxzcKfKe32bPMb6/YSMz1BE1vbeu9A+TuE7+TSTV4C6X+XoeiJI8/tOm0zC6H7DeRMp6mZnlgAU=
X-Received: by 2002:a2e:8e96:: with SMTP id z22mr322946ljk.2.1583864452275;
 Tue, 10 Mar 2020 11:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200310151503.11589-1-gpiccoli@canonical.com> <20200310110554.1fc016ad@lwn.net>
In-Reply-To: <20200310110554.1fc016ad@lwn.net>
From:   Guilherme Piccoli <gpiccoli@canonical.com>
Date:   Tue, 10 Mar 2020 15:20:15 -0300
Message-ID: <CAHD1Q_w26XP5fOcqW_toDLvEU0crt1dUUjiwCyWTn_U1-Nh=1g@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Better document the softlockup_panic sysctl
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        swood@redhat.com, mcgrof@kernel.org, keescook@chromium.org,
        yzaikin@google.com, mingo@kernel.org,
        "Guilherme G. Piccoli" <kernel@gpiccoli.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 10, 2020 at 2:05 PM Jonathan Corbet <corbet@lwn.net> wrote:
> So this doesn't even come close to applying; could you respin it against
> docs-next, please?

Sure, will resubmit soon. I understand docs-next is just linux-next
correct? I couldn't find any specific docs tree on kernel.org ...


>
> ..and while you're at it, make it "*the* kernel.softlockup_panic sysctl" :)


Sure! Thanks for the review,


Guilherme
