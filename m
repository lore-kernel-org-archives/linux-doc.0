Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 69F2B7D099
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Jan 2019 18:18:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbfA2SSe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Jan 2019 13:18:34 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44997 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726919AbfA2SSd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Jan 2019 13:18:33 -0500
Received: by mail-wr1-f68.google.com with SMTP id z5so23141367wrt.11
        for <linux-doc@vger.kernel.org>; Tue, 29 Jan 2019 10:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+GxBm8s8C6x84ozFyjXoCsKwNqijbNBimqTvowaT6HA=;
        b=wU/63d3BqpbaETl1R60YuKHDVlM6oWOlycD365weCHPw8D4pDzyh2VmzYqavACHnQy
         2E0vBCvdlWBdD0etwek0HhdNqKvPtKLOAlQFgRzID0mB2cjaCZJAIigmbf1v4lWqUmwF
         JYp4Lm4pJN4DP1NeOojB4yAKbERZnHYyTY/xV0SnPKvVMxwa0YihtVntVY4dx1P0s7Xv
         4qCpYp2b+meS9qpg6uaMXpF6iwtg2kmE0QFWzaul4ag1gf7tCHOCDFeIDiSALdVR1tN1
         YAYiKWKxmIsV+dTX2MeLcYGkNN7xNy2V9BjAvc+Yg3lghhd8r0GW1PvEMaDY7CwEZJHL
         Tr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+GxBm8s8C6x84ozFyjXoCsKwNqijbNBimqTvowaT6HA=;
        b=i+XTciDMCxfcn08vF4GHDirHUqHkPHf2lf9rVUKCdb8bREN2OWj5FzY+Pq/JbSUZmn
         SU2bqF/wSKOkrEqaBFWlRxgJnP0mYHTDCdM7IGmnc7CogKLSlVq2kQDjjDKDr0ABsYN5
         /iSDKt0n0ZligeZOsYvq6ULYB03ZxyKIV86w2gznT7xX/buMbfvpzEQjpbNzcuVm28TS
         e1oWm52jUNmNZeiVASamofYYbc8wPKbws3Fd7HSFfIZxAFT9U/PCrwDMKE2bHmDtNXas
         rkcRGTGrXzscDXgvaTyUCOsEy1MaiVg+e+khvjlxgBxYEUi3QU7UK3NLaIkZeUt5Ppuk
         EC9w==
X-Gm-Message-State: AJcUukfOVFU0j6C6cYjh2XVu3ySpkGohYm8WXLKdocIDWPh4S2WH6GqR
        sEGqUYpKVWucc0psAaWrOPw70MO4bH9WfQt6Ka3uIQ==
X-Google-Smtp-Source: ALg8bN4cRFK+VVM41OOXWUgll/3WKZxT3SdKfFLzYyHoHPggY6R004Qc5iemMNf5Igp61Tl5EGthoyMNhU9XqAws9iQ=
X-Received: by 2002:a5d:4e82:: with SMTP id e2mr26340980wru.291.1548785911774;
 Tue, 29 Jan 2019 10:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20190124211518.244221-1-surenb@google.com> <20190124211518.244221-6-surenb@google.com>
 <20190129123843.GK28467@hirez.programming.kicks-ass.net>
In-Reply-To: <20190129123843.GK28467@hirez.programming.kicks-ass.net>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 29 Jan 2019 10:18:20 -0800
Message-ID: <CAJuCfpGxtGHsow002nd8Ao8mo9MaZQqZau_NLTMrZ8=aypTkig@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] psi: introduce psi monitor
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

On Tue, Jan 29, 2019 at 4:38 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Jan 24, 2019 at 01:15:18PM -0800, Suren Baghdasaryan wrote:
> > +                     atomic_set(&group->polling, polling);
> > +                     /*
> > +                      * Memory barrier is needed to order group->polling
> > +                      * write before times[] read in collect_percpu_times()
> > +                      */
> > +                     smp_mb__after_atomic();
>
> That's broken, smp_mb__{before,after}_atomic() can only be used on
> atomic RmW operations, something atomic_set() is _not_.

Oh, I didn't realize that. After reading the following example from
atomic_ops.txt I was under impression that smp_mb__after_atomic()
would make changes done by atomic_set() visible:

/* All memory operations before this call will
* be globally visible before the clear_bit().
*/
smp_mb__before_atomic();
clear_bit( ... );
/* The clear_bit() will be visible before all
* subsequent memory operations.
*/
smp_mb__after_atomic();

but I'm probably missing something. Is there a more detailed
description of these rules anywhere else?

Meanwhile I'll change smp_mb__after_atomic() into smp_mb(). Would that
fix the ordering?

> --
> You received this message because you are subscribed to the Google Groups "kernel-team" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
