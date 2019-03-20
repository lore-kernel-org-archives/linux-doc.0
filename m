Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A86117D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Mar 2019 01:54:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbfCTByK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Mar 2019 21:54:10 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:45903 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727205AbfCTByK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Mar 2019 21:54:10 -0400
Received: by mail-io1-f65.google.com with SMTP id s7so516363iom.12
        for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2019 18:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hdt+D6p9E7l7lnV6StTuQf0AYgJKugS80mLd0f4DexY=;
        b=h+CutXz8gO4OJgPl4VPG+zVIErRIvBJ8IxVKR32U5P2BVfmfeiaWXN7ZnnV1dGf6fb
         Tk47u6O1mN4D5oYTSKa5XtllNaJr2T7aO4WIG9hhBUaxObEn7tCGDa6n4Hm27rE/gEFj
         d8B6FAW+YaLKbyQsPUaqaZR3n+2QTxBLkja8nEru3FSUt/wECjlLIYZqlA/Yw7VGSJJh
         3hnP5mpWolKnbsea1EaCRevc9gqsr2lSEAfK7tmp2V0kE5D+N4awLn2afGVYdLAWYoky
         s0OH+E3KsStUuymTAzcYImjUKzgt0oQZodQB4Hww8g+JYnFSxi27ETyPUOlkgoioW5eJ
         077w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hdt+D6p9E7l7lnV6StTuQf0AYgJKugS80mLd0f4DexY=;
        b=TZl6g0oSUiUcPcNjKIvvP5FPe7Z1AQAwdNCJ6YrdSyhm+uPJmea0Nyu6v5XzM8fg0X
         HTdFIdktKPCAiPEWyoDLGWOL3TMYpcvx1AFvPhNM7d0zo+QAnhuKlVC0x+lrkaIcpTVP
         oQpTjt8Ukt3fQ4hlp5lKcTKkuf0IBNtFmvwruuo4eUvGlNThlYTUfpHoJVQWE7POVYF1
         TnJiabfB9K3E9q3JaGbq2bewtIEY/wDAtq99bYeIxm1AhPBVkiZRECUMZM7huIwNozWh
         tHYp4C2LpJAmH9PAklhDZeCIm9fHKy/EW8vtg+A8v2vm1TjAGYWon4wwmw7P9t5+M9Nl
         Gt8Q==
X-Gm-Message-State: APjAAAXm4lfYq/EpF/rKSW1efBpSNum3KfkATg+to0bocGEvGRGQdbYq
        KLZmVx7JwWjQBwNGjl14vRNUooEQxpOmXM/Zw+wfPQ==
X-Google-Smtp-Source: APXvYqy58uB1G39PjKRQnEJaHqQLPKQNA3wtlDLGu6OkofTWBgV1yxorPTL6P/pMBq03FauOHAuxprk+ELik8kGEH/U=
X-Received: by 2002:a6b:720c:: with SMTP id n12mr3719620ioc.110.1553046849245;
 Tue, 19 Mar 2019 18:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190319235619.260832-1-surenb@google.com> <20190319235619.260832-2-surenb@google.com>
 <20190320110249.652ec153@canb.auug.org.au> <CAJuCfpFEqv+x2GnSeU_JLQ3ahvfgNVPYyoRAxkDHcvVw-4r=jg@mail.gmail.com>
 <20190320111516.6e151efe@canb.auug.org.au>
In-Reply-To: <20190320111516.6e151efe@canb.auug.org.au>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 19 Mar 2019 18:53:58 -0700
Message-ID: <CAJuCfpHyGmhkF+LThARQTrcpAYf2ASMxLokE56dZcOEOHb7QtQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] psi: introduce state_mask to represent stalled psi states
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejun Heo <tj@kernel.org>, lizefan@huawei.com,
        Johannes Weiner <hannes@cmpxchg.org>, axboe@kernel.dk,
        dennis@kernel.org, Dennis Zhou <dennisszhou@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 19, 2019 at 5:15 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Suren,
>
> On Tue, 19 Mar 2019 17:06:50 -0700 Suren Baghdasaryan <surenb@google.com> wrote:
> >
> > Sorry about that. This particular patch has not changed since then,
> > that's why I kept all the lines there. Please let me know if I should
> > remove it and re-post the patchset.
>
> As long as anyone who is going to apply this patch is aware, there is
> no need to repost just for that.  In the future, if you are modifying a
> patch that you are resubmitting, you should start from the original
> patch (not the version that someone else has applied to their git tree
> or quilt series).

Got it. Thanks!

> --
> Cheers,
> Stephen Rothwell
