Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2DDD47E686
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Mar 2018 21:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754706AbeCGVVx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Mar 2018 16:21:53 -0500
Received: from mail-io0-f180.google.com ([209.85.223.180]:39089 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754621AbeCGVVw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Mar 2018 16:21:52 -0500
Received: by mail-io0-f180.google.com with SMTP id b34so4658264ioj.6;
        Wed, 07 Mar 2018 13:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=utmY/k038HyPTCNrCTex6Od25OwxnXy4wd8Gc++7/+w=;
        b=NFg+Zd2qVIWegzAkMoH0+sv8YqB5iv8u9UkkWOvWsp9pw0pzd1r6LZHO7dpCCzAk5v
         HduCcdZ4cvO8rCZIpPVnsShZQK8kqiarVneC4fmA/egbAhmw5+Oyv/p1KqjpI4oB7ZFW
         VZrjw5H/c6MEgAvZF13TGEbuCpyyDK1AfPRUhwuyhfJB+hoSomRrn79/26p0L/gRHp/y
         RTyLneBkPOHUW7p6mCJ2rgeZjMlDT9oivNWcSU+xBZnDKw2lyxTZfbxuN7cwNDsjnHJT
         QLLyO+8F5ZWJYWruxZiCwc7PlzcRdOwPw9v5ZvYPs9e1VN9Cu+G8hkuWXJ1oF38A0utK
         f63A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=utmY/k038HyPTCNrCTex6Od25OwxnXy4wd8Gc++7/+w=;
        b=AZyy2dkD0LZ061/jqJFyauJbpqfWh9dQrpiwNyf6hcjCLrhLOk9Gg8K6BIIHY8sfZB
         hFqqAxGKGpVYoZcDS/E5Z6V6Mn3jLt3O9fj1G3rwW3TMJAjLfSufUKktCp6Jw8NsE8UI
         ND0GEhNG44PrDSHMxe9JvBsNJ5y46aqSbAWX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=utmY/k038HyPTCNrCTex6Od25OwxnXy4wd8Gc++7/+w=;
        b=rN0I7jhQr9+e41COK4zkc69k31RFvxbtbmizGbBjB/25lziMjFfYXqiZiSJEpzIRNs
         i5n6iWveD6Kix1lxyG4KlfdvQrGkUk8QMEGsAU49wgToKQRwsjl1EJuIlu53vUHrh52Q
         e/Evzw/7aAk8dgUhB7eH4EcvE2iSGDZJiAwhGSUwOObmLdmBN9dDgx+RE1qIbv9kfJjE
         znNYsCXzyKLgt5U2nrQc0kEtJ0BsOPAhWpluwy60J6yELWdY3Fi/mgHDBvG8lrRTOkb2
         fEL3skb4QWcDWpB3QXng6Qp4IWr7Z1Q3wMO7sPONy47nnJYmYzYgzsN4pKRAQvNVTfRb
         njqA==
X-Gm-Message-State: APf1xPDWsylDe/5xD/xuCHCuWC5r+Sw80oy6l+ZLSYGq2AcocQYx+B8s
        SW2hBOem1emlSU7OhtZyceTfTugSVhJkB3VLtAM=
X-Google-Smtp-Source: AG47ELuYy+yx+pLr4bHPXxeSkLEY9dTEylRNfpNajEESbPicav53ZJtJKxy5rnvGOnxc83AqAdkvBmHhToJ0C0ROeOw=
X-Received: by 10.107.12.213 with SMTP id 82mr27461924iom.48.1520457711313;
 Wed, 07 Mar 2018 13:21:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.135.221 with HTTP; Wed, 7 Mar 2018 13:21:50 -0800 (PST)
In-Reply-To: <20180306233140.268BD8E1@viggo.jf.intel.com>
References: <20180306233140.268BD8E1@viggo.jf.intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 7 Mar 2018 13:21:50 -0800
X-Google-Sender-Auth: A5bZ84qW7lafWqAwLnUulmPvf6M
Message-ID: <CA+55aFzGgtnkKpJEDCvzDmEn7JE6DnOKuHwtkTkeN3AeHjt6dw@mail.gmail.com>
Subject: Re: [PATCH] docs: clarify security-bugs disclosure policy
To:     Dave Hansen <dave.hansen@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Andrew Lutomirski <luto@kernel.org>,
        Kees Cook <keescook@google.com>,
        Tim Chen <tim.c.chen@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 6, 2018 at 3:31 PM, Dave Hansen <dave.hansen@linux.intel.com> wrote:
>
> I think we need to soften the language a bit.  It might scare folks
> off, especially the:
>
>          We prefer to fully disclose the bug as soon as possible.
>
> which is not really the case.

Ack. What we do is definitely not full disclosure. In fact, we often
actively try to avoid disclosing details and leave that entirely to
others.

We disclose the *patches*, and the explanation of the patch, but not
necessarily anything else (ie no exploit code or even any exploit
discussion). We also don't explicitly disclose the discussion of the
patches or the report, although part of it mayt obviously become more
or less public for other reasons.

So we should probably avoid using a term that means something else to
a lot of people.

And for similar reasons, I don't think the fixed verbiage should use
"coordinated disclosure" either, like in your patch. That usually
means the kind of embargoes that the security list does not honor.

So I think it merits clarification, but maybe just specify the two
things relevant to our disclosure: the fact that the patch and
explanation for the patch gets made public (but not necessarily other
effects), and that the timeframe is very limited.

It's not full disclosure, it's not coordinated disclosure, and it's
not "no disclosure".

It's more like just "timely open fixes".

                 Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
