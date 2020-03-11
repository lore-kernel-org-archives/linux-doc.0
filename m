Return-Path: <SRS0=0k1m=44=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81C2C4CEC3
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 18:50:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9372A206BE
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 18:50:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m+VDswWk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730956AbgCKSt6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Mar 2020 14:49:58 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:51651 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730953AbgCKSt5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Mar 2020 14:49:57 -0400
Received: by mail-pj1-f67.google.com with SMTP id y7so1403983pjn.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2020 11:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1O5mNwRKS3WQZf3p7S3pD40Ezb3WQVwbR9o3MD95weI=;
        b=m+VDswWkn7oQWzwAESTvbUWn0hrwmnnEnt9dMsZtQKuIuHrc/4r8XX+lx3mOiCCcLf
         wm8Cz5DjMVhJvDP2VVG0zJ6SHpUILyY5dzan67JIz+4vG+F5i9SL1nVUXx4dramPRkPf
         S6tllCNLWc9gmhewcz7zNJik0de/BY4hu9fI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1O5mNwRKS3WQZf3p7S3pD40Ezb3WQVwbR9o3MD95weI=;
        b=Q/kWavXFZ77fw/PpmF1U0Jostr2ezs2g2UedOr7PoiizBAQ3omwvse0RahWobHyoPs
         WRXRXz5Z+EGnGAj5LU8dO4vGQHgL84VUio8CFpy4KpkE9hRz1SBOwpy8hfKJD2IpJ51f
         uzTOu2dX4vWTrBVf66Xp/IejM4GQ5Mnhr7zVZMjDm9e/6PTTNOlfbaRhZXX5+vTeKCeS
         qfqV3tDYlF5CRiITtM6jbxdUT+0TaHoo1Z2gEVbeslvxDShYKZ52GN8EC1nVaqXoYUKd
         JjuXF4u4BI3IS6tp/85HYjbPIhYrfrZV5/4fYQwL4hwxINZ4Lg9+6kCWaQZ2SQrrDejC
         EcbA==
X-Gm-Message-State: ANhLgQ12tqjqCxZDe6gIYd2J+zPo5jjMdlnckPeCwileBsnUV9cIL1d2
        kM2KLeItRu4Xdqb4c9EpWhhwTQ==
X-Google-Smtp-Source: ADFU+vuib6jYbHkTB4keLnEAQw9IkBZ0gBuO2NqH2stMX84aRVJNXeHWoxrV2IDBqjWVCcvlTbvu+Q==
X-Received: by 2002:a17:90a:d80b:: with SMTP id a11mr131940pjv.21.1583952596740;
        Wed, 11 Mar 2020 11:49:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 13sm49989285pgo.13.2020.03.11.11.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 11:49:55 -0700 (PDT)
Date:   Wed, 11 Mar 2020 11:49:54 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Jann Horn <jannh@google.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Bernd Edlinger <bernd.edlinger@hotmail.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Oleg Nesterov <oleg@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Andrei Vagin <avagin@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Yuyang Du <duyuyang@gmail.com>,
        David Hildenbrand <david@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        David Howells <dhowells@redhat.com>,
        James Morris <jamorris@linux.microsoft.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shakeel Butt <shakeelb@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Christian Kellner <christian@kellner.me>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Aleksa Sarai <cyphar@cyphar.com>,
        "Dmitry V. Levin" <ldv@altlinux.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>,
        "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sargun Dhillon <sargun@sargun.me>
Subject: Re: [PATCH] pidfd: Stop taking cred_guard_mutex
Message-ID: <202003111148.19578AA@keescook>
References: <877dztz415.fsf@x220.int.ebiederm.org>
 <20200309201729.yk5sd26v4bz4gtou@wittgenstein>
 <87k13txnig.fsf@x220.int.ebiederm.org>
 <20200310085540.pztaty2mj62xt2nm@wittgenstein>
 <87wo7svy96.fsf_-_@x220.int.ebiederm.org>
 <CAG48ez2cUZMVOAXfHPNjKjYsMSaWkjUjOCHo0KYZ+oXQUW4viA@mail.gmail.com>
 <87k13sui1p.fsf@x220.int.ebiederm.org>
 <CAG48ez2vRgaEVJ=Rs8gn6HkGO6syL8MpSOUq7BNN+OUE1uYxCA@mail.gmail.com>
 <CAG48ez1LjW1xAGe-5tNtstCWxG2bkiHaQUMOcJNjx=z-2Wc2Jw@mail.gmail.com>
 <87lfo8rkqo.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lfo8rkqo.fsf@x220.int.ebiederm.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 10, 2020 at 03:57:35PM -0500, Eric W. Biederman wrote:
> So ptrace_attach and seccomp use the cred_guard_mutex to guarantee
> a deadlock.

Well, that's the result, but seccomp uses it because it wants to
be certain that credentials and no_new_privs are changed together
"atomically".

-- 
Kees Cook
