Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C20F77D8BA
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Oct 2018 16:38:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbeJaBcT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 30 Oct 2018 21:32:19 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:43183 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727411AbeJaBcN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Oct 2018 21:32:13 -0400
Received: by mail-yw1-f65.google.com with SMTP id j75-v6so5173604ywj.10
        for <linux-doc@vger.kernel.org>; Tue, 30 Oct 2018 09:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=VZoNZooRaqDzEWaRLEKdrKAAKC6uL0sBgSFjdygxcXA=;
        b=ht93vtlnvVM4sJvsrLS/XVPam18FZGYWOuKhoG7tTU9zDVRzID1jFV+Pax7TEqCHVT
         dD2GI13/VwJzNEyXB7/8NzOxJcAEhXibtqz87TwTH8gKYu86BY5LT62L3bfaUl77oj3n
         iqMPDW4MiC0cW8YiHyGJXjeza4kPQeL5zjHnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=VZoNZooRaqDzEWaRLEKdrKAAKC6uL0sBgSFjdygxcXA=;
        b=uO/aoZ1nCe0OPRkbkRxyuOziSI4iBpMEKhyYZS6xFSu7ZWFuSJMqBb5FZ4qLLSaVs2
         7LVogtwI/Llcgy83Gs2S+xUgGkeAJGG6C3ZYPDKTx4fS8OPW5TDUiCQbQOVVBkHn45/1
         UTc0JO1SGlaMcVDesZHxHQCWPvA7eGjfOE4u+9gRCkq6le2qaWmwpXJ1jF7hPGSubmvG
         YR0Pmm7K1lY8sO1NdYQXQTRbp07WtW7JEk6iHAIRyTWxcvqukXJDWO2HrdTCYFZRUCRS
         a7TxN3oya4JhCazCjbwa3PfRXVI5E4Jq+XbCgWSihRunSzMZE6JcfnxrsTNROftmSuXI
         JS9A==
X-Gm-Message-State: AGRZ1gJZJZB3n8Rc/mSnSSTRtV7bKoyT/fqVtlfxzLGThkoigqQG8ylu
        nLrbLjDflEyE6GYtuVqvvGyI5b+auH0=
X-Google-Smtp-Source: AJdET5fAlK1/qCSD3O8Qc+SeE5AT72urNHbBU75vAycvpElw/kxpquPoNGkCQMpQPuL2nR9Elk+W+w==
X-Received: by 2002:a0d:c3c7:: with SMTP id f190-v6mr679595ywd.105.1540917480613;
        Tue, 30 Oct 2018 09:38:00 -0700 (PDT)
Received: from mail-yw1-f52.google.com (mail-yw1-f52.google.com. [209.85.161.52])
        by smtp.gmail.com with ESMTPSA id t184-v6sm2194429ywd.37.2018.10.30.09.37.58
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 09:37:58 -0700 (PDT)
Received: by mail-yw1-f52.google.com with SMTP id v199-v6so5187989ywg.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Oct 2018 09:37:58 -0700 (PDT)
X-Received: by 2002:a81:813:: with SMTP id 19-v6mr3464914ywi.168.1540917477794;
 Tue, 30 Oct 2018 09:37:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:3990:0:0:0:0:0 with HTTP; Tue, 30 Oct 2018 09:37:56
 -0700 (PDT)
In-Reply-To: <20181030152641.GE8177@hirez.programming.kicks-ass.net>
References: <20181023213504.28905-1-igor.stoppa@huawei.com>
 <20181023213504.28905-11-igor.stoppa@huawei.com> <20181026092609.GB3159@worktop.c.hoisthospitality.com>
 <CAGXu5jKCs01jvtvpEFS7R8qCR-5iRqK11kJxLJY99NicGWc4aQ@mail.gmail.com>
 <20181028183126.GB744@hirez.programming.kicks-ass.net> <40cd77ce-f234-3213-f3cb-0c3137c5e201@gmail.com>
 <20181030152641.GE8177@hirez.programming.kicks-ass.net>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 30 Oct 2018 09:37:56 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJftJ+Hq+jrZGHX5CTDLWOog7kGsd_Ne=yMvrRs__skSg@mail.gmail.com>
Message-ID: <CAGXu5jJftJ+Hq+jrZGHX5CTDLWOog7kGsd_Ne=yMvrRs__skSg@mail.gmail.com>
Subject: Re: [PATCH 10/17] prmem: documentation
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Igor Stoppa <igor.stoppa@gmail.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Matthew Wilcox <willy@infradead.org>,
        Dave Chinner <david@fromorbit.com>,
        James Morris <jmorris@namei.org>,
        Michal Hocko <mhocko@kernel.org>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-integrity <linux-integrity@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        Igor Stoppa <igor.stoppa@huawei.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Laura Abbott <labbott@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 30, 2018 at 8:26 AM, Peter Zijlstra <peterz@infradead.org> wrote:
> I suppose the 'normal' attack goes like:
>
>  1) find buffer-overrun / bound check failure
>  2) use that to write to 'interesting' location
>  3) that write results arbitrary code execution
>  4) win
>
> Of course, if the store of 2 is to the current cred structure, and
> simply sets the effective uid to 0, we can skip 3.

In most cases, yes, gaining root is game over. However, I don't want
to discount other threat models: some systems have been designed not
to trust root, so a cred attack doesn't always get an attacker full
control (e.g. lockdown series, signed modules, encrypted VMs, etc).

> Which seems to suggest all cred structures should be made r/o like this.
> But I'm not sure I remember these patches doing that.

There are things that attempt to protect cred (and other things, like
page tables) via hypervisors (see Samsung KNOX) or via syscall
boundary checking (see Linux Kernel Runtime Guard). They're pretty
interesting, but I'm not sure if there is a clear way forward on it
working in upstream, but that's why I think these discussions are
useful.

> Also, there is an inverse situation with all this. If you make
> everything R/O, then you need this allow-write for everything you do,
> which then is about to include a case with an overflow / bound check
> fail, and we're back to square 1.

Sure -- this is the fine line in trying to build these defenses. The
point is to narrow the scope of attack. Stupid metaphor follows: right
now we have only a couple walls; if we add walls we can focus on make
sure the doors and windows are safe. If we make the relatively
easy-to-find-in-memory page tables read-only-at-rest then a whole
class of very powerful exploits that depend on page table attacks go
away.

As part of all of this is the observation that there are two types of
things clearly worth protecting: that which is updated rarely (no need
to leave it writable for so much of its lifetime), and that which is
especially sensitive (page tables, security policy, function pointers,
etc). Finding a general purpose way to deal with these (like we have
for other data-lifetime cases like const and __ro_after_init) would be
very nice. I don't think there is a slippery slope here.

-Kees

-- 
Kees Cook
