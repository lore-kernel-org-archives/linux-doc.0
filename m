Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7597C4332F
	for <linux-doc@archiver.kernel.org>; Wed, 27 Oct 2021 01:31:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A85161040
	for <linux-doc@archiver.kernel.org>; Wed, 27 Oct 2021 01:31:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237520AbhJ0Bd6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Oct 2021 21:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231575AbhJ0Bd5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Oct 2021 21:33:57 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B009C061570
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 18:31:33 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id y1-20020a17090a134100b001a27a7e9c8dso3398267pjf.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 18:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hx2CTswgytxvss7kxEurcgmP5KcmJvBjnBSk15OJ7pE=;
        b=EXGwIRd4lsCuLvvRdiNRqffudQ8CM9ZJvYGUorXhwpiBZil4EbFzcNtL9Xvx3pz9M4
         WSiggrp/PXpWi6Mld8Kqw/lAltNh9dryQmEgfnyRc04qeulm74CT9Sr5zohzDNhZ/7CY
         74IVE6QNDELB8g1ZyOmVNofiRYPkOVKZhtaD/QFZuHnVHZupzbdN1S8WRVq8+dKd5CON
         +Uru4oNtlzHo5AwIwXu0yt6FD0nwqZxB6SV+ynhIj5hflchXNbyMiJTwFUOUNgM99qLF
         WJrVPzSe01sqhcnxIjKLmdq+dKTy1+LZCVrtbizb2fTdwM9bK4MsL9bVmIiI/n6sW65C
         IE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hx2CTswgytxvss7kxEurcgmP5KcmJvBjnBSk15OJ7pE=;
        b=l0VOSZvrTg4Awa7dZVZxP6ksRk1ygxALFwwploDZEaESYBqo9LZvZr8s6zA/uHyc5W
         qUHbCnhICzuO4jUehBwyVAvtVdNSCrR1Ecmt//8CU9ajcp7eIJ1z6JbYAAvPYdUqvPHs
         S/q3Hgd4ORaDq7yiGSEL4hptt1Z6/wDvjPoLZ2EwmQ7est5fAgEM+nxX+dgFJUyYagfn
         GtmjeresYPUcPezrTuAega9pdi8w7JQ/bwf+PRvzx9QfoJX0azrvyB2bvQx3RaAzMPYw
         XD00PqgFbqyr3M6wlsjAJKm+FCGnKNTKru7PjdHwk2WhEszHKyjdFZmkajn2foOZCQp0
         at0A==
X-Gm-Message-State: AOAM532zm2gKOghFbGk2BzxTy9ddzWDupUwInoABKA5/7kSbMjk9K3np
        V9b4XmsXbjYCyWEnxt0WohbvMIKaYzlHQItiiAYujw==
X-Google-Smtp-Source: ABdhPJyLneM3xQMO3ldQoIW2aan64ir8E90WZfnjCWKqMjRrHioWLmsJ5Yy3Mi1n0G/AD6jIbmJK9F8yKMq3xQEmT3A=
X-Received: by 2002:a17:90a:b288:: with SMTP id c8mr2480230pjr.67.1635298292469;
 Tue, 26 Oct 2021 18:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211025200852.3002369-1-kaleshsingh@google.com>
 <20211025200852.3002369-7-kaleshsingh@google.com> <20211026151451.7f3e09a4@gandalf.local.home>
 <CAC_TJveHgsPZw7p7BWOgQw6h8GNU_Pv_WUjNmw3AUq+wnSzk6Q@mail.gmail.com>
 <20211026201846.08990d1d@rorschach.local.home> <CAC_TJve-mKSojaXtukdFeQKvPz-8TQtS=pgGD0Z18Wt6yJi7dg@mail.gmail.com>
 <20211026211511.403d76ca@rorschach.local.home>
In-Reply-To: <20211026211511.403d76ca@rorschach.local.home>
From:   Kalesh Singh <kaleshsingh@google.com>
Date:   Tue, 26 Oct 2021 18:31:21 -0700
Message-ID: <CAC_TJvdwqQAKrVs3w6NcQNBT+bAgdyqR+8Zt_An7R9AQSSthGA@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] tracing/histogram: Optimize division by a power of 2
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     surenb@google.com, hridya@google.com, namhyung@kernel.org,
        kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 26, 2021 at 6:15 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Tue, 26 Oct 2021 18:09:22 -0700
> Kalesh Singh <kaleshsingh@google.com> wrote:
>
> > >   delta = mult * div / 2^20
> > >
> > > That is if mult is a power of two, then there would be no rounding
> > > errors, and the delta is zero, making the max infinite:
>
> That should have been (as shown in the algorithm)
>
>   delta = mult * div - 2 ^ 20
>
> As mult is 2^20 / div; and the above should end up zero if there's no
> rounding issues, as it would be:
>
>  delta = (2^20 / div) * div - 2^20

Good catch. We're checking if we get back the exact value.

And IIUC max_div is an arbitrary value we decide on that's <= 2^shift?
Is there a rule of thumb for choosing this?

Thanks,
Kalesh
>
> -- Steve
