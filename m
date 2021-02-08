Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4F5C433E6
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 15:34:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A45B64E50
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 15:34:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233733AbhBHPdp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Feb 2021 10:33:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233887AbhBHPaz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Feb 2021 10:30:55 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D591C06178B
        for <linux-doc@vger.kernel.org>; Mon,  8 Feb 2021 07:30:14 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id o63so10439043pgo.6
        for <linux-doc@vger.kernel.org>; Mon, 08 Feb 2021 07:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EVa5iP/ZP1kIUt+ZL6wEw6hpu9lqQN04bPoh5Ps/O8k=;
        b=SB50xgtOv2drwobrNTCxM8e1R7wRSzKZvSWvf9w54gMrS7FLzMV0SFb5/DSUr9R9xy
         juPcTRQ6i8IJmZvPrNlhOU00XAyhXmzWppXj2SETQbihFRRqrOCjVVAUVjcQT2r31C+U
         2gAlTRD3O7rHE/SEaIAYSVlkvhu6BYsVW1WrrnJ3iLysWw2M/oxe3cHtcBhIh3/0GBm/
         fIXM6Uq/3b/k4v4dcQHagjrUNkX3ilDp0Uh9pnrTyjxnEV3OOKGEoB9jGDArCMzjV+M4
         qBp/3Y3ZDJk2y36OqxRMAh4EKC/Tgns1qBW5sgdlVWztkN3j7MrPNB2e/08kdPjSNJ6R
         FSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EVa5iP/ZP1kIUt+ZL6wEw6hpu9lqQN04bPoh5Ps/O8k=;
        b=gk9LMr7xAq+TlKua1OC5/axH+NF33geuljykbqdxOzLIQn7IFayvLzjYusqmhuxYXl
         UnIkGF/uvGiUgTuAmVxvT5hUWKee5xBXLkkolBvyYfuozsMNvB7ZV7pIDwGCiXRPIOad
         OhkpZLK12NUahI5wJhTXqElWzslGaZf+SL4Aqjs/6FddJZYY1hwRGjAFQJFFa1rjeWX1
         g+Geq/ibOUi43RBLobjsyb7xuh8OKcnQuRyxkcBPtVCAwcQ6b6z65hnU6IMA88Nrd2I5
         sFXsN9lgkTVPvGnrxj+2XEvmj0/HTU6aLK0DbUZZbP/Rj8FSCGzl4JkqBz/uks+l2aOF
         p07g==
X-Gm-Message-State: AOAM530mfxaObItb+HQB6sXYA1tLnjuRDE29uFP2N+oW4RWWPVCET4eW
        00xauDgWUbxEmdFOwQxOkE3BaiS4fYl8HiWNa9mgKA==
X-Google-Smtp-Source: ABdhPJxmRkIV7FEKwi4Ks9SoAI+DtUo1kXi3hGwtraZqD7I2gA+9nHX+iiKNSbI78kk5xN19ZMyxo2ZNGRPJ5UobDXo=
X-Received: by 2002:a63:724a:: with SMTP id c10mr17900352pgn.124.1612798213229;
 Mon, 08 Feb 2021 07:30:13 -0800 (PST)
MIME-Version: 1.0
References: <20210208151437.1357458-1-kaleshsingh@google.com>
 <20210208151437.1357458-2-kaleshsingh@google.com> <20210208152244.GS308988@casper.infradead.org>
In-Reply-To: <20210208152244.GS308988@casper.infradead.org>
From:   Kalesh Singh <kaleshsingh@google.com>
Date:   Mon, 8 Feb 2021 10:30:02 -0500
Message-ID: <CAC_TJvfkZbktznxas7donjrOnHeF4ZmTrsvPwNnWSqkkcORe9Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] procfs/dmabuf: Add inode number to /proc/*/fdinfo
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jann Horn <jannh@google.com>,
        Jeffrey Vander Stoep <jeffv@google.com>,
        Kees Cook <keescook@chromium.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Minchan Kim <minchan@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        NeilBrown <neilb@suse.de>, Anand K Mistry <amistry@google.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Michel Lespinasse <walken@google.com>,
        Bernd Edlinger <bernd.edlinger@hotmail.de>,
        Andrei Vagin <avagin@gmail.com>,
        Yafang Shao <laoar.shao@gmail.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 8, 2021 at 10:22 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Feb 08, 2021 at 03:14:28PM +0000, Kalesh Singh wrote:
> > -     seq_printf(m, "pos:\t%lli\nflags:\t0%o\nmnt_id:\t%i\n",
> > +     seq_printf(m, "pos:\t%lli\nflags:\t0%o\nmnt_id:\t%i\ninode_no:\t%lu\n",
>
> You changed it everywhere but here ...
Ahh sorry I missed this. Will resend with this corrected. Thanks Matthew.
>
