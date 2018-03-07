Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7873F7E686
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Mar 2018 00:30:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753904AbeCGAa5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Mar 2018 19:30:57 -0500
Received: from mail-vk0-f44.google.com ([209.85.213.44]:33916 "EHLO
        mail-vk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753525AbeCGAa4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Mar 2018 19:30:56 -0500
Received: by mail-vk0-f44.google.com with SMTP id z190so331900vkg.1
        for <linux-doc@vger.kernel.org>; Tue, 06 Mar 2018 16:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Y5CiQDT3VzA2kNY1pEiHnrmMfBEpjdyOA40aL+1xUcc=;
        b=q5CO/jiTklct+41GxNz7ZmvByZ3He9VUonqKA+MtMwRYyNxzGvjR94n1QIbQ4OUWgx
         P2b9JCehKrsWs5Mf75xsC8gsL83pRntJt/CQzMMbBNksePa09WO2/NCoJErv3Es3RDX2
         15qq/DO5U2qVNF0U7hT9OLhTDzNlPuC4HJKUoBf/IT1QxAqpDpVa5meslz/oNASnmSJR
         gtnPeIzcVTJSee9jkNnZx1ylhY17oad/jp1yLy878AquD3sXU2/LCJeyk9eLfro9/EyD
         kcY/G1mX5BoCIvcj1QgvIjyIqj094lPZrwWF3pt4JUfj1tD/DvMDuwrwtBeT1E8gZ4ps
         ztcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Y5CiQDT3VzA2kNY1pEiHnrmMfBEpjdyOA40aL+1xUcc=;
        b=FNpe+jDvMhmKvAKf0u47WPyPPxIalrFWrnhYlUijrpR04D59pbnVoJMziv3IkvzRe1
         kvwomAIWslMb+8m1cZra7VSC1S23H3uICdlEknQiuvewaKkg/Tuut3mNTInvbxQ/+GHJ
         UE6xJSyICqVGocQdHeG2EfF4/rJvYStRwzW4b9ks4PKy1Uam8N+AVgB8Cin4HdUI+UhE
         mOZ6OM/v4CkdFqJa7A9QUeQRVY9lakzTpVnTVFWHgz6XIQlwMojBzOE6W5BFLZt29pWu
         9uCe7LM+Crd7b9jevllBH3cxIkRra9x6i/OekejJz38xOnUnlC9MtmQs6Dtdkwp44yHQ
         osGg==
X-Gm-Message-State: APf1xPAJ7qzCMeBTHAIRKFk9eYgs6wT8nAqkL4dKBztp2fby7sS5y/Xi
        kE3QNl/gjjqxoL8CgOuzVWMutRiMamAxZQ1ZmTv7mg==
X-Google-Smtp-Source: AG47ELvN+9WtxFl1nT70vSLdhVqcFrY7IoR8mOEvpWUJ+zQmCB4/TD4OdCNtKxbh3hTT9Gw/I0KzQZQc+BZ8OFQpgHo=
X-Received: by 10.31.83.197 with SMTP id h188mr14520140vkb.84.1520382655435;
 Tue, 06 Mar 2018 16:30:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.242.140 with HTTP; Tue, 6 Mar 2018 16:30:54 -0800 (PST)
In-Reply-To: <20180306233140.268BD8E1@viggo.jf.intel.com>
References: <20180306233140.268BD8E1@viggo.jf.intel.com>
From:   Kees Cook <keescook@google.com>
Date:   Tue, 6 Mar 2018 16:30:54 -0800
Message-ID: <CAGXu5j+LYqK7knp369PmWb00O2rRidyyS7q10NCgiobhCCbP4w@mail.gmail.com>
Subject: Re: [PATCH] docs: clarify security-bugs disclosure policy
To:     Dave Hansen <dave.hansen@linux.intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Andy Lutomirski <luto@kernel.org>,
        Tim Chen <tim.c.chen@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 6, 2018 at 3:31 PM, Dave Hansen <dave.hansen@linux.intel.com> wrote:
>
> From: Dave Hansen <dave.hansen@linux.intel.com>
>
> I think we need to soften the language a bit.  It might scare folks
> off, especially the:
>
>          We prefer to fully disclose the bug as soon as possible.
>
> which is not really the case.  As Greg mentioned in private mail, we
> really do not prefer to disclose things until *after* a fix.  The
> whole "we have the final say" is also a bit harsh.
> [...]
>  ----------
>
> -The goal of the Linux kernel security team is to work with the
> -bug submitter to bug resolution as well as disclosure.  We prefer
> -to fully disclose the bug as soon as possible.  It is reasonable to
> -delay disclosure when the bug or the fix is not yet fully understood,
> -the solution is not well-tested or for vendor coordination.  However, we
> -expect these delays to be short, measurable in days, not weeks or months.
> +The goal of the Linux kernel security team is to work with the bug
> +submitter to bug resolution as well as disclosure.  We prefer to fully
> +disclose the bug as soon as possible after a fix is available.  It is
> +customary to delay disclosure when the bug or the fix is not yet fully
> +understood, the solution is not well-tested or for vendor coordination.
> +However, we expect these delays to typically be short, measurable in
> +days, not weeks or months.
> +
>  A disclosure date is negotiated by the security team working with the
> -bug submitter as well as vendors.  However, the kernel security team
> -holds the final say when setting a disclosure date.  The timeframe for
> -disclosure is from immediate (esp. if it's already publicly known)
> -to a few weeks.  As a basic default policy, we expect report date to
> -disclosure date to be on the order of 7 days.
> +bug submitter as well as affected vendors.  The security team prefers
> +coordinated disclosure and will consider pre-existing, reasonable
> +disclosure dates.
> +
> +The timeframe for disclosure ranges from immediate (esp. if it's
> +already publicly known) to a few weeks.  As a basic default policy, we
> +expect report date to disclosure date to be on the order of 7 days.

This seems reasonable. Though I have two thoughts related to "we have
final say" and why it was there:

Sometimes we get insane embargo requests, and Linus has wanted to go
public ASAP. The wording was chosen to let reporters know that it is
possible for issues that don't need to wait 7 days to not wait 7 days.
For example, letting security@kernel.org know about a flaw and then
tell us to sit on it for 2 months until some public presentation,
that's not going to happen.

Additionally, we frequently make all network bugs immediately public,
since the net subsystem tends to reject embargoes.

So, maybe we could be more explicit about these cases? Or explicitly
describe what "reasonable" means (it's only hinted at).

-Kees

-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
