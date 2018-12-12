Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C60F07D089
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Dec 2018 09:58:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbeLLJ5y (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Dec 2018 04:57:54 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:34157 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbeLLJ5w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Dec 2018 04:57:52 -0500
Received: by mail-vs1-f65.google.com with SMTP id y27so10718117vsi.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Dec 2018 01:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S+5XufIdKH+Z4EliHZJOG6Njz1hoSyCuvV8UrtZVDkg=;
        b=QYGNqPvPzBtNMZNRj6aXIxyVAzdwxMOQHL0yFqGrZ52DTmnZnsU+6GEHygqCSEdPUP
         AhGSw6g0MsRSf7wX0fkZB8TJRidZL7EQovyp9A8nAiDQaWTw8QT6SCdb1o4Wd3hqLk0O
         q4AB/mR4bwVHPwUevehtbBbgsbK+2PKbR9bS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S+5XufIdKH+Z4EliHZJOG6Njz1hoSyCuvV8UrtZVDkg=;
        b=b/nY169hH19a+0DyIoOpJPBaw288kic38s+tMbhW+nTLgIjm5AvC+DeOIPD3+pwS3C
         dU+zxHh35vNdi2STxsPnwBegEQZ2b1BUCPR1viU+9kIN+mDIs81VB1ASKe1HTb0LiRON
         jlC1I+q2Rkusf1zor12aRGJbfLOy7WOAsEafcYoGs3BfNQhgUGdhqNeBlypt9iTXnSgM
         ljdsHBP15GvBI3REiORU69JgmbCPxtx5NZePZ9IZ3mnwnIqToAqxCRirKX/PlPDHCity
         D8snadoIh7Glp2/kXroX1mMerGJDBGKoCbqhr2ry2TtAdxOWhryhFemBnTsrQu1G4mfc
         OYvw==
X-Gm-Message-State: AA+aEWYF/0L0NauZh93+guL+BmjiILDoAjODFwnbmlR15vlIY1B9A9FC
        MoZTwVIUeI4tMmqf3PF0JGQHA3JqvPP0gwXJ0wUK7Q==
X-Google-Smtp-Source: AFSGD/WO3Y4+WiZPQQe/HZoey15rkxnp5921c+XNpOeri09V2Am2P96g8s3Ib2ftNux9r0KJb8Ux5LEr0hIeIrYHbQ0=
X-Received: by 2002:a67:d00f:: with SMTP id r15mr8940351vsi.191.1544608671054;
 Wed, 12 Dec 2018 01:57:51 -0800 (PST)
MIME-Version: 1.0
References: <3514439.dzOWKx1Cjx@aspire.rjw.lan> <20181210122104.GL5289@hirez.programming.kicks-ass.net>
 <CAJZ5v0j-a6cHayRtcsUPbUTBT0iBSUvmcUy6pfSSvUVcTMBxbw@mail.gmail.com>
 <20181210225134.GB24811@worktop.programming.kicks-ass.net>
 <CAJZ5v0jvbDCCgy=nUfb-yZCYGOxe4-XexbvnmeBm8ZPDPBaK4w@mail.gmail.com> <20181212094610.GW5289@hirez.programming.kicks-ass.net>
In-Reply-To: <20181212094610.GW5289@hirez.programming.kicks-ass.net>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 12 Dec 2018 10:57:15 +0100
Message-ID: <CAPDyKFpPGosZ69ZgMZMASGZxTn1kxu5GrJ7rZoXKn8MC05SMTQ@mail.gmail.com>
Subject: Re: [PATCH v2] cpuidle: Add 'above' and 'below' idle state metrics
To:     Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>, dsmythies@telus.net,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        ggherdovich@suse.cz, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 12 Dec 2018 at 10:46, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Dec 11, 2018 at 10:51:48AM +0100, Rafael J. Wysocki wrote:
> > On Mon, Dec 10, 2018 at 11:51 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> > > Dunno; it could be cold cachelines, at which point it can be fairly
> > > expensive. Also, being stuck with API is fairly horrible if you want to
> > > 'fix' it.
> >
> > All of the cache lines involved should've been touched earlier in this
> > code path by the governor.  At least menu and the new one both touch
> > them.
> >
> > The API part I'm not too worried about.  I know it is useful and two
> > other people have told that to me already. :-)
>
> Like said on IRC; I mostly wanted to raise the issue of overhead due to
> stats and ABI -- it's something I've been bitten by too many times :/
>
> If you're confident you're hitting the same lines with the already
> extant accouning (time and usage) and you cannot make the whole lot
> conditional because of ABI (bah) then I'll not stand in the way here.
>
> I agree the numbers are useful, I'm just weary of overhead.

I tend to agree. So then why not move this to debugfs, it seems like
it's really there it belongs. No?

Kind regards
Uffe
