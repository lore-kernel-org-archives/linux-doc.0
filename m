Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 741367D099
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Jan 2019 18:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbfA2S0N (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Jan 2019 13:26:13 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:32779 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727607AbfA2S0N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Jan 2019 13:26:13 -0500
Received: by mail-wr1-f66.google.com with SMTP id p7so23269891wru.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Jan 2019 10:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ADwM0lszvaqhduF5I3DNeFvWPeUQTXjMtjOQKUDAPJ8=;
        b=BXh7n98B5xjbeB+aql7MNs/6BjRNZglzr66LB5d1zE4A4IXStoeq7g7volggkOR0jm
         Zw4Ew6E/Mn8x9yOekTa6e3ZeVuRcso8aX3m5+bpoW/SbRmwVAh7PW5CHhPa3QjTpqSWI
         uLYmSvffhC1lccnslt+fRVgCkeoPzinyOXdqCHzx03/tGID0YwW0bRIT+fsW57P472hY
         dIksMeGK073m5vEA30nAIeiNKStj7FtgFsaObHsW4CFEy8wMXyPrYI4K27+VKVl2sh9y
         MmAVuYcOhROvZCyChKdV3QsAE741Ix5ZmCqCkX3aa2Jdi2RMb+Cwe5vou1Ftliov/taq
         +Hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ADwM0lszvaqhduF5I3DNeFvWPeUQTXjMtjOQKUDAPJ8=;
        b=E7CtrfG3YnTEbgxfUDNmsstjAXzf8DBjf3WjKAS8rNJFd5Y0j65fqVIbhZLrfyLxUR
         v9Unge6EOyAFn7xb5avo4AG+EvTlsbOn9ioC+5BeHfek7gjUycmbb/oL/t5Nlm8wvkIJ
         K+20cqXZKAGbD8D83ctIcqkTJv3/H/TzyxPzLf7ybsgNFYNQ3OSu/cvh95inBXmQj7tc
         XPygX+ZnrBBAyeNsdazxKytb+MLbEnLYFFByhfT0eKA36OU21rc4yT5I7BIqmG+1+Rlh
         1qkingtgCDf7B7mSteMVv+C/5jheBHjqyKkyNfx9QLTsmITr1UvDzmxA8ChBRiOyGuJw
         9oTw==
X-Gm-Message-State: AHQUAuY6U+nBZnkee1bIBz31bVgM9OCuQ0AFiTbxNhELToZcu8+5DrB2
        4KB8y1kcbGrBz+7J0xoblUdW/9/apC8+aAIqwCzlGg==
X-Google-Smtp-Source: AHgI3IbJXcwKzyDgm1JDGoKVL5g4uCwu2Dk74NNLxZkW+r/uERASibjooWGTvyTUxd2OI6Moz27ryN1VdshIkuPqAI8=
X-Received: by 2002:adf:dc4e:: with SMTP id m14mr7274623wrj.107.1548786371209;
 Tue, 29 Jan 2019 10:26:11 -0800 (PST)
MIME-Version: 1.0
References: <20190124211518.244221-1-surenb@google.com> <20190124211518.244221-6-surenb@google.com>
 <20190129123843.GK28467@hirez.programming.kicks-ass.net> <20190129151649.GA2997@hirez.programming.kicks-ass.net>
In-Reply-To: <20190129151649.GA2997@hirez.programming.kicks-ass.net>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 29 Jan 2019 10:25:58 -0800
Message-ID: <CAJuCfpHyuY89Aw3YpQpaor2hKvdqJOH5sMoXNZ-yNAnAb+tY6A@mail.gmail.com>
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

On Tue, Jan 29, 2019 at 7:16 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Jan 29, 2019 at 01:38:43PM +0100, Peter Zijlstra wrote:
> > On Thu, Jan 24, 2019 at 01:15:18PM -0800, Suren Baghdasaryan wrote:
> > > +                   atomic_set(&group->polling, polling);
> > > +                   /*
> > > +                    * Memory barrier is needed to order group->polling
> > > +                    * write before times[] read in collect_percpu_times()
> > > +                    */
> > > +                   smp_mb__after_atomic();
> >
> > That's broken, smp_mb__{before,after}_atomic() can only be used on
> > atomic RmW operations, something atomic_set() is _not_.
>
> Also; the comment should explain _why_ not only what.

Got it. Will change the comment to something like:

Order group->polling=0 before reading times[] in
collect_percpu_times() to detect possible race with hotpath that
modifies times[] before it sets group->polling=1 (see Race #1 in the
comments at the top).

> --
> You received this message because you are subscribed to the Google Groups "kernel-team" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
