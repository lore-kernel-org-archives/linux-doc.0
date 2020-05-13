Return-Path: <SRS0=G6vI=63=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6EEC433DF
	for <linux-doc@archiver.kernel.org>; Wed, 13 May 2020 20:15:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88A072065C
	for <linux-doc@archiver.kernel.org>; Wed, 13 May 2020 20:15:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nMo2mfTP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390859AbgEMUPd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 May 2020 16:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2390674AbgEMUPd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 May 2020 16:15:33 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0BDBC061A0F
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2020 13:15:32 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id z15so2150099pjb.0
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2020 13:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Gcu03BapccXbGC0ugrF7HAKsX8s/rikPdyRfZ2v+7/A=;
        b=nMo2mfTPsCwPQuL3Wy/MlcZIMWxFkdw9LhCDLY5nhwMM21OCJKIkBr/jaFfSBwIN1Y
         akIlzTecdhLNLgKpEWYDBQ0mN/XX7L2NRzU4azhQL5vDsth352qYFB19f+vz5xYZdL9J
         F/FtSTYPzv3A5YmLLP2aadn9GW2+VRNqnIS0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gcu03BapccXbGC0ugrF7HAKsX8s/rikPdyRfZ2v+7/A=;
        b=XMzFp4kt1AEkYd+yLaljmyYL3U/8xhb12yZK7ozO3VIK3I9f/Duv1oZJHSsikBhhM5
         PVNugRxbTemTAGkfOaYa4CFZTr4kd67wgulS+887Z1K6b4o9kpHboZLIvAQVm9DXKo8k
         ga7+EkfCJa4MS643/Wa4h1NhysnVkLAtv8i9mu/15zAIm4QWI9FEOKg7mOQkT0F3EBJ1
         sS2U7NSBIn4IdUJqILMPhqt5c8Pi4e6ntkQ2Uqz7KEdX0R6hzsKCisfBF9PQjady0ZX9
         C05D9kfEx6EYsYAto1xMH5NQtjV+sACAh7K5Lsz/E1IXMwLmkAN4ziPtR9D39frUbdu+
         unVA==
X-Gm-Message-State: AGi0PuZ5cxlEpU0A8ZX8wwbnbftrpS7ud1LcIr7wmkD2L5UH1s6aop3s
        09f/UtUFieT5FU6d8HJ9HpEw4Q==
X-Google-Smtp-Source: APiQypLWtkrar0+R60VQFnxu1If/r6w1THO5SU46GXyv2coXCgkwRIlLIk7e/Jx6iO/X9WDaTCI0SQ==
X-Received: by 2002:a17:90a:cb86:: with SMTP id a6mr37392232pju.127.1589400932263;
        Wed, 13 May 2020 13:15:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y16sm355662pfp.45.2020.05.13.13.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 13:15:30 -0700 (PDT)
Date:   Wed, 13 May 2020 13:15:29 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     Petr Mladek <pmladek@suse.com>, Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        James Morris <jmorris@namei.org>,
        Sasha Levin <sashal@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/6] allow ramoops to collect all kmesg_dump events
Message-ID: <202005131315.5CEA90C@keescook>
References: <20200506211523.15077-1-keescook@chromium.org>
 <20200512131655.GE17734@linux-b0ei>
 <CA+CK2bBMUxxuTBicQ7ihKpN3jK94mMjcNCXhnAXUaODce09Wmw@mail.gmail.com>
 <20200512155207.GF17734@linux-b0ei>
 <202005121111.6BECC45@keescook>
 <20200513073448.GG7340@linux-b0ei>
 <202005130045.EF013D12E@keescook>
 <CA+CK2bAPv5u1ih5y9t5FUnTyximtFCtDYXJCpuyjOyHNOkRdqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CK2bAPv5u1ih5y9t5FUnTyximtFCtDYXJCpuyjOyHNOkRdqw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 13, 2020 at 10:35:16AM -0400, Pavel Tatashin wrote:
> > >   + reason: panic, oops, emergency, shutdown    (ordered by severity)
> > >   + handling: restart, halt, poweroff
> > >
> > > Or we might just replace KMSG_DUMP_RESTART, KMSG_DUMP_HALT,
> > > KMSG_DUMP_POWEROFF with a single KMSG_DUMP_SHUTDOWN.
> > >
> > > Then the max reason variable would make sense.
> >
> > That would work for me, yeah. Pavel, is that enough granularity for you?
> >
> 
> Yes, I like the second approach: where we combine all shutdown type
> events into a single type.
> max_reason will have 4 levels:
> 
>    KMSG_DUMP_PANIC,
>    KMSG_DUMP_OOPS,
>    KMSG_DUMP_EMERG,
>    KMSG_DUMP_SHUTDOWN,
> 
> If needed it is possible to determine from dmesg logs what kind of
> shutdown was taken, because there is a message logged right before
> every kmsg_dump() for these events:
> 
> 249   if (!cmd)
> 250   pr_emerg("Restarting system\n");
> 251   else
> 252   pr_emerg("Restarting system with command '%s'\n", cmd);
> 253   kmsg_dump(KMSG_DUMP_RESTART);
> 
> 276   pr_emerg("System halted\n");
> 277   kmsg_dump(KMSG_DUMP_HALT);
> 
> 294   pr_emerg("Power down\n");
> 295   kmsg_dump(KMSG_DUMP_POWEROFF);
> 
> Kees, I will submit a new series with these changes soon.

Great; thanks!

-Kees

-- 
Kees Cook
