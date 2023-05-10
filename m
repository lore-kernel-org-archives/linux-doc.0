Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B945C7EE22
	for <linux-doc@archiver.kernel.org>; Wed, 10 May 2023 09:55:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbjEJJzP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 May 2023 05:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235606AbjEJJy5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 May 2023 05:54:57 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5295B6593
        for <linux-doc@vger.kernel.org>; Wed, 10 May 2023 02:54:55 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EB3053F4A4
        for <linux-doc@vger.kernel.org>; Wed, 10 May 2023 09:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1683712492;
        bh=BJjlqCchOr90XV+R3svQiAsGeT9XzzKbGjpyD2zoyFc=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=h2ObpTbLH5tl07+HWWoxDB4NW4wgj67r5UAfTYRKVaTqBct+bur6nlQdN7rxGbwy1
         dprSt0XMd7bGbs4vvIz6ys8LZT3a2yn8sxgzDBmaA1RsnKs+MoaeML8FtjJCci3Ux5
         fg/bGChJ3wWjFJNvD378fDiTGsg3zYA8x8cPqgw8XwUuQtR19/AAwO0r1thclvQg3E
         OXc0U3vhc/Y99Y9w79CRLl0L85E45xkkJuWHe5Ms8EsiZFE0remZfTP8TMaPJ1eCd1
         OQTa2/Flbd+UR/RqUB+jpvpOc9fdPd/b6I1hkI/K8ws9SU5PKmxTKAQJmMgo+qJby4
         PtSzJUMxGRNKg==
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-50bc88edf7eso6642917a12.2
        for <linux-doc@vger.kernel.org>; Wed, 10 May 2023 02:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683712492; x=1686304492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJjlqCchOr90XV+R3svQiAsGeT9XzzKbGjpyD2zoyFc=;
        b=EzTZs1kXPyXH3Nz9XhkJwUc11aDAqb9Ep4a2uArf9mH8DksaXSZdE0s4ND7ZyvvFwZ
         GuoiW2jQwX6olXaTqcUYTOeoASzHYqjgWBKV5joMYtLTG7QfNHPkNlrYk3A3PkOvmIuQ
         APrMFSYqUr4TbSjHKQnePrw7h8x+HUBDADmi5d4skt71Rq1BHy3xNjKXBeEoMrG09lKQ
         +2pYx/Kg/7nIrmO94xsghByU3RQ3Rv7Q08pyvxFo3IksFz1IXnn3FtAISJ2/5iqyaIdh
         BklWGCXUw2WvLhrsGaxH01cOjTylwyXdem61Vr5kaTUghhe1HJZ4grUHZhPwpvoN+r5g
         X9gw==
X-Gm-Message-State: AC+VfDxP2eECQl/0Fd5cBJ3JwqjxWpTkcVffAM7Tz+/mrFHKvPidcZCu
        DysdJAm4TxEc6H05WmN4o3PfRFgzgv71fnaj7qO68dl0aogt/I1Q6Txc/qJDpWdo1pv30WN7JiQ
        /jiKUN6kmp1oowpDVQ4hn+A48ETc50+W2NG/Y8A==
X-Received: by 2002:aa7:c7da:0:b0:50b:5211:446f with SMTP id o26-20020aa7c7da000000b0050b5211446fmr12079078eds.6.1683712492448;
        Wed, 10 May 2023 02:54:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7GQB/rM1QJ7LE5/OGTXBSHHyF39/goNARW0LlJbqBeKAPskBIKo5vw5B66r6VL5CnOY8Gr2g==
X-Received: by 2002:aa7:c7da:0:b0:50b:5211:446f with SMTP id o26-20020aa7c7da000000b0050b5211446fmr12079060eds.6.1683712492125;
        Wed, 10 May 2023 02:54:52 -0700 (PDT)
Received: from localhost (host-82-55-56-52.retail.telecomitalia.it. [82.55.56.52])
        by smtp.gmail.com with ESMTPSA id r16-20020aa7cfd0000000b0050bd245d39esm1744797edy.6.2023.05.10.02.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 02:54:51 -0700 (PDT)
Date:   Wed, 10 May 2023 11:54:51 +0200
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Salvatore Bonaccorso <carnil@debian.org>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] timers/nohz: introduce nohz_full_aggressive
Message-ID: <ZFtp67nW5op5q/0x@righiandr-XPS-13-7390>
References: <20230507090700.18470-1-andrea.righi@canonical.com>
 <20230507100852.54a354ca@rorschach.local.home>
 <ZFe1IY+TdzSC0RLZ@righiandr-XPS-13-7390>
 <2161b8c0-b08c-7bf7-4c99-3bb89ca44ad8@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2161b8c0-b08c-7bf7-4c99-3bb89ca44ad8@linutronix.de>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 10, 2023 at 11:03:07AM +0200, Anna-Maria Behnsen wrote:
> On Sun, 7 May 2023, Andrea Righi wrote:
> 
> > On Sun, May 07, 2023 at 10:08:52AM -0400, Steven Rostedt wrote:
> > > 
> > > [ Added Anna-Maria who is doing some timer work as well ]
> > > 
> > > On Sun,  7 May 2023 11:07:00 +0200
> > > Andrea Righi <andrea.righi@canonical.com> wrote:
> > > 
> > > Now, I think what is really happening here is that you are somewhat
> > > simulating the results that Anna-Maria has indirectly. That is, you
> > > just prevent an idle CPU from waking up to handle interrupts when not
> > > needed.
> > > 
> > > Anna-Maria,
> > > 
> > > Do you have some patches that Andrea could test with?
> > > 
> > > Thanks,
> > > 
> > > -- Steve
> > 
> > Thanks for looking at this (and I'm happy to help Anna-Maria with any
> > test).
> 
> I posted v6 of the queue - but forgot to add you to cc list. Here is the
> current version:
> 
>   https://lore.kernel.org/lkml/20230510072817.116056-1-anna-maria@linutronix.de/
> 
> I have to mention, that there is still the issue with the fair scheduler
> which wakes up the CPU where the process_timeout() timer was enqueued,
> because it assumes that context is still cache hot.
> 
> Thanks,
> 
> 	Anna-Maria

OK, will take a look, thanks!

-Andrea
