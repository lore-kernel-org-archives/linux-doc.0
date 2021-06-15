Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0999DC48BE5
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 08:19:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8A936140C
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 08:19:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbhFOIVH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Jun 2021 04:21:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53551 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230332AbhFOIVG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Jun 2021 04:21:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623745142;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lUHU/FeufYPOJef4vAaf4rAQWCgf5JOq7XHb8rD0r8U=;
        b=BnoHRflU1Vh9Al9EOK/Rv0z8/998rMdqEecoqoe9J7IIGo3F4AJeS98ed89PnnZTU2aXM1
        BWxR2PHbX7gMxqiLsSH+/InUeOXujJb7yyIcQXHkxO1Ibq0iRB3UkpgjejUm2+jCQTFvag
        bmls5RAslHAXPjEwniZVNtiAWohckqo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-pY9FHUqxOtGqoo9szYNfVQ-1; Tue, 15 Jun 2021 04:19:01 -0400
X-MC-Unique: pY9FHUqxOtGqoo9szYNfVQ-1
Received: by mail-ed1-f69.google.com with SMTP id h23-20020aa7c5d70000b029038fed7b27d5so21584785eds.21
        for <linux-doc@vger.kernel.org>; Tue, 15 Jun 2021 01:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lUHU/FeufYPOJef4vAaf4rAQWCgf5JOq7XHb8rD0r8U=;
        b=KfFYSuT4dG/UZmg77HG6xJ+VbpUbguX0IWndQZYRY4comcu2Tud24E8Phy3VPgbSmM
         Rsxt1wG0Avs5m39pbVbf0YavuLTbxCNd+l8YqhlKJ/rfUhqhDqil4rnSBxRKD43T8rav
         f8Pln5gtBvdOGhpaaxx0Vfy9MF+t6QLYdE9h0wgBqRBV7COpDJrcE5KDvkEC8dJv2Q01
         jVPVJAyHYr9ZhT0iRqEfyAFepw69Bde5b+xkr5Y6ggfbCtTot1o4wUdSeVitDGi/Pk+e
         I8ccA0rrhqqeQqFZICFV8+6y8g0JZKjGUYEb4wCQp5x5v1vHYD2cKM83DbqKBpSGKOx2
         P47Q==
X-Gm-Message-State: AOAM532pwX+fUOMQUeSKhUGDXroLB7Gr0EBDTx0KcuPfOTy/1XzNtHWV
        eyAn2pGfUAeP7yHHc650KxrmJcjTWNf5R9+6xHzkZeBgQcgFaqj6FK723bM4Lv2dbc6xWy76hKl
        NkG9aohrxinhXuaHwG3ED3rDXKzJigYxAo5iltpgYDLfBQDvlKo09G12vHrzOGIh3dVP+scI=
X-Received: by 2002:a17:906:35db:: with SMTP id p27mr19543465ejb.391.1623745139690;
        Tue, 15 Jun 2021 01:18:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL08lPdhsZYwa0GsII/2uIA5zCZTp4Q+MeQlcbHWnd4zLygHPOy9p6Q1WvQWxzfYUJl8UHkQ==
X-Received: by 2002:a17:906:35db:: with SMTP id p27mr19543442ejb.391.1623745139512;
        Tue, 15 Jun 2021 01:18:59 -0700 (PDT)
Received: from x1.bristot.me (host-79-23-205-114.retail.telecomitalia.it. [79.23.205.114])
        by smtp.gmail.com with ESMTPSA id w8sm3342630edc.39.2021.06.15.01.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 01:18:59 -0700 (PDT)
Subject: Re: [PATCH V3 9/9] tracing: Add timerlat tracer
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-kernel@vger.kernel.org, Phil Auld <pauld@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Kate Carcia <kcarcia@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>, linux-doc@vger.kernel.org
References: <cover.1621024265.git.bristot@redhat.com>
 <b650672b9973887ef1420bc1e76b97940b6522d6.1621024265.git.bristot@redhat.com>
 <20210607213639.68aad064@gandalf.local.home>
 <6bc850eb-14c8-6898-847c-d9f0e67d60f8@redhat.com>
 <20210611164855.252f35fb@gandalf.local.home>
 <80f74da1-a9a7-2af9-dd4f-c22f312214df@redhat.com>
 <20210612190948.4fa93611@rorschach.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <81f6e5bb-1c6d-7c8d-cf83-f7e47c53fd88@redhat.com>
Date:   Tue, 15 Jun 2021 10:18:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210612190948.4fa93611@rorschach.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/13/21 1:09 AM, Steven Rostedt wrote:
> On Sat, 12 Jun 2021 10:47:16 +0200
> Daniel Bristot de Oliveira <bristot@redhat.com> wrote:
> 
>> Thinking only about the instrumentation/events, what they are tracking is the
>> execution time. So how about naming them as:
>>
>> exec_time:thread
>> exec_time:irq
> I guess. I should go and look at your other code.
> 

I have the v4 with all (including hotplug) execpt this name change. But as there
are a lot of changes already, I will send it now, and keep thinking about this...

-- Daniel

