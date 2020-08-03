Return-Path: <SRS0=MCi+=BN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A3A3C433DF
	for <linux-doc@archiver.kernel.org>; Mon,  3 Aug 2020 16:23:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A8B220719
	for <linux-doc@archiver.kernel.org>; Mon,  3 Aug 2020 16:23:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X2X2zOxV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgHCQXK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Aug 2020 12:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbgHCQXH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Aug 2020 12:23:07 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F694C061756
        for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2020 09:23:07 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a79so2610588pfa.8
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2020 09:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DuAzZZbtTCD/FunpRik00QhyAGnIAetc0b9NRlFShwk=;
        b=X2X2zOxVAHLGT14KTEzVrxN+YVOkB2JZ0AWCYwVkpNrjN6xpv7uJnHGDexGy1sYLXG
         u/2rrBX3dMh04chIdQxxkJZchGHaLBKxcZhngBPpI1VFasSgC4v1CV7ao/cPQ61yQjy5
         ei0pqTZOsbFHSlEAAvLyJh1RUzkIfIjxAaqWt3bX0QCKKb22uShKmM1/tC5A0sQV9bLo
         QHCzx1vKs8h0kr/EDTHq8Cf9LqsmD8iZjyzKETpTtAK5K04DbnFqrnx1to7mISTevhDg
         GejktA8vH2oS1es01S5SLWtAQx5+3/6aT9BW6iASea+uli0QssQRtAcK331OucnyZJcl
         +Qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DuAzZZbtTCD/FunpRik00QhyAGnIAetc0b9NRlFShwk=;
        b=PEKUncZU7hcJ+uY0of5eWgnVVz0Mzb573VX4rX+zI7gF1tAVfp8vTwIYCF82zUvG6i
         K/ycR+dbmcQ3sMw84MCwtF8DKOli4eyLHixuhtS5qGJ1V5ncYyv8EDmTAtfVn15MV9L8
         bQl/S2iMwJKYpMh6Be734B4WHZvOYFwMyXzKn9kihWCuSY2Ci5MeNUZhejOuE2iCw5bU
         lGvsfeO8xgsZ5QTtNXuLF4OHHA+hOxT1eURfukn2L1Lzh6xvrjdRsslnNVrc6AvUtodO
         W5SD35t2XrEF840bNmOP6cr0GamZiM2R8nVpAK1Z92GxQS/a13NGTDTk0jcKlf4gMkIu
         xtsQ==
X-Gm-Message-State: AOAM531RlbeEUOUMJiv3NEPCGquFl8Mi2bZbMiQIofomJcvoscP9kTLJ
        soHiq0iYIwms7ond1hOvXGtoPuNrAPWHorGF3mMPloXhHLo=
X-Google-Smtp-Source: ABdhPJw4q/ZXP9VLpgKpRjolRWqGRWM7lRrYpiraKWz+WS2rqxzSA2J4h04p9yxEq05Q+UN+KZ6A3bHJZXLviXDzUZw=
X-Received: by 2002:a67:6441:: with SMTP id y62mr12434936vsb.82.1596471784607;
 Mon, 03 Aug 2020 09:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-3-kaleshsingh@google.com> <20200803154125.GA23808@casper.infradead.org>
 <CAJuCfpFLikjaoopvt+vGN3W=m9auoK+DLQNgUf-xUbYfC=83Mw@mail.gmail.com> <20200803161230.GB23808@casper.infradead.org>
In-Reply-To: <20200803161230.GB23808@casper.infradead.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Mon, 3 Aug 2020 09:22:53 -0700
Message-ID: <CAJuCfpGot1Lr+eS_AU30gqrrjc0aFWikxySe0667_GTJNsGTMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dmabuf/tracing: Add dma-buf trace events
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Kalesh Singh <kaleshsingh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org,
        Hridya Valsaraju <hridya@google.com>,
        Ioannis Ilkos <ilkos@google.com>,
        John Stultz <john.stultz@linaro.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 3, 2020 at 9:12 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Aug 03, 2020 at 09:00:00AM -0700, Suren Baghdasaryan wrote:
> > On Mon, Aug 3, 2020 at 8:41 AM Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > On Mon, Aug 03, 2020 at 02:47:19PM +0000, Kalesh Singh wrote:
> > > > +static void dma_buf_fd_install(int fd, struct file *filp)
> > > > +{
> > > > +     trace_dma_buf_fd_ref_inc(current, filp);
> > > > +}
> > >
> > > You're adding a new file_operation in order to just add a new tracepoint?
> > > NACK.
> >
> > Hi Matthew,
> > The plan is to attach a BPF to this tracepoint in order to track
> > dma-buf users. If you feel this is an overkill, what would you suggest
> > as an alternative?
>
> I'm sure BPF can attach to fd_install and filter on file->f_ops belonging
> to dma_buf, for example.

Sounds like a workable solution. Will explore that direction. Thanks Matthew!
