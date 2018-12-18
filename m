Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EFCD97D8A8
	for <lwn-linux-doc@archive.lwn.net>; Tue, 18 Dec 2018 01:10:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbeLRBKP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 17 Dec 2018 20:10:15 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35384 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbeLRBKP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Dec 2018 20:10:15 -0500
Received: by mail-wr1-f67.google.com with SMTP id 96so14205784wrb.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Dec 2018 17:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IWqTg7e7BySNj9lmjGI7lNLIjnRegZYKQ+my+yKGfqs=;
        b=S2EgdtpyJLHPh2GZK2JRSXX2DuPbm4Qa8TB+iKtlgxbHhbVIJOfJR+VQ7xFKBBziQr
         vjjazB7I+4dLyyswD3fy+9bSCL5llq+20jnJ1Qa7oFlnhTP/3HGph75JlcvgwZ7+6IZJ
         1s/b3UYNLpenPmORnuzkDmSfiuRODv7l0zt7vQT1ed9PGwj7X3zvF/aIiyvh119ZkM6R
         WbFTiU56mQLwJRANDgm+/i22iIe8nwVZrsGkDAjFlBYL4utfVJnfyQDkHG6lWx5x+CqR
         eK2RWXHiY7x5TpCWK/8chwBirg0TbkUQLBdgJeUedmLxWEbLlEjOvZGBzF/32lZcWE9P
         gE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IWqTg7e7BySNj9lmjGI7lNLIjnRegZYKQ+my+yKGfqs=;
        b=PWaSqXFMP2WqlvSmHv7TyIKTHKWcJ34Yf8hCmzrWFqYPSc2jY6ADSIqN0FAAsOJFN/
         61juRpzRxvS93m5PzTZlauW18JOHSzqlI3cluoJwdrkDDnXoa0Je5SENUTG/o/E4BQXp
         O8y+EAAKF47UPsrrT0wqz20Od6eKluah2SQpkiXxoxXHHbxnePF2FcgLojKoOc0sMBO8
         vH7tGPXYWUnPUKlmzGfWxep2ud9RVRZXaroG9GMmdNe6rfT8DyL2UeJfc6fj3IE8Ry5W
         qe3ZJELC/taw4eKE+Ly/R7gCISLmAc56qE47NODaDSevA4lJFcr1ydEHcrR45xkMPGAQ
         saUg==
X-Gm-Message-State: AA+aEWZAqkpwUzUbByDcoULj+YXdyDS9WWpVVHR+mJTB1HfH9IcQQLHi
        JbOSZX7PdU54mEX6rSLJ+JP/wAVfnjIwQ3ig76Swuw==
X-Google-Smtp-Source: AFSGD/VT3pIKnE0DRGrrGHZB2VCknrdKnps22jRzBKpnof5dKPwDOO5H1ALImO4mKVuYTU16c6KEhrrTFmNFlhUiHbk=
X-Received: by 2002:adf:ee07:: with SMTP id y7mr13108042wrn.187.1545095412728;
 Mon, 17 Dec 2018 17:10:12 -0800 (PST)
MIME-Version: 1.0
References: <20181214171508.7791-1-surenb@google.com> <20181214171508.7791-4-surenb@google.com>
 <20181217145754.GB2218@hirez.programming.kicks-ass.net>
In-Reply-To: <20181217145754.GB2218@hirez.programming.kicks-ass.net>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Mon, 17 Dec 2018 17:10:01 -0800
Message-ID: <CAJuCfpFtqd=RDDW_U5HFXuAZzNh6F+Enrjz3P4jZg=hvyH9RwQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] psi: eliminate lazy clock mode
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejun Heo <tj@kernel.org>, lizefan@huawei.com,
        Johannes Weiner <hannes@cmpxchg.org>, axboe@kernel.dk,
        dennis@kernel.org, Dennis Zhou <dennisszhou@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 17, 2018 at 6:58 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Dec 14, 2018 at 09:15:05AM -0800, Suren Baghdasaryan wrote:
> > Eliminate the idle mode and keep the worker doing 2s update intervals
> > at all times.
>
> That sounds like a bad deal.. esp. so for battery powered devices like
> say Andoird.
>
> In general the push has been to always idle everything, see NOHZ and
> NOHZ_FULL and all the work that's being put into getting rid of any and
> all period work.

Thanks for the feedback Peter! The removal of idle mode is unfortunate
but so far we could not find an elegant solution to handle 3 states
(IDLE / REGULAR / POLLING) without additional synchronization inside
the hotpath. The issue, as I remember it, was that while scheduling a
regular update inside psi_group_change() (IDLE to REGULAR transition)
we might override an earlier update being scheduled inside
psi_update_work(). I think we can solve that by using
mod_delayed_work_on() inside psi_update_work() but I might be missing
some other race. I'll discuss this again with Johannes and see if we
can synchronize all states using only atomic operations on clock_mode.

> --
> You received this message because you are subscribed to the Google Groups "kernel-team" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
