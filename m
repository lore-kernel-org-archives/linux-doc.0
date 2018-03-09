Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2AA627E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri,  9 Mar 2018 21:15:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932451AbeCIVPd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 9 Mar 2018 16:15:33 -0500
Received: from mail-it0-f54.google.com ([209.85.214.54]:55708 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932157AbeCIVPc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Mar 2018 16:15:32 -0500
Received: by mail-it0-f54.google.com with SMTP id n136so4303833itg.5;
        Fri, 09 Mar 2018 13:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=4ZjmX0TK1ENqLidS6E/rBXdBjtyJFf2GLte8k5P5JJE=;
        b=MF3hvXOUhddxnnY3lflPbfYrz9sY2lQ0LD+PYGoKdvW+M5KAwHAibKzt8iBWhkI3g/
         CFAzF+uehTt0ZgbB3VydlE3paY52tsvxt+NNv7Tw29/CAZ/3FiLKsnV37IA94Lex2W/B
         d2Awj28wLGrVjVYa3C6Ow+70ku0PZlU++kbvTJYQmIS7OBN2GvFNkETtKdUfxSO5GjnJ
         FrYjaHL/PLtWExouPug8Zzj0BKCamyxfpPbC8X/IOna7bxgrXj/jyhmju0VMaImzoEYt
         b9uQYVwFzc+fNbVJcxJGlBm9fYRofX0OudVi6vmn/9Y4RbITy6FaOLUBw0u7loh/rw7A
         OHAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=4ZjmX0TK1ENqLidS6E/rBXdBjtyJFf2GLte8k5P5JJE=;
        b=J069GZjPFFz8KkQP1e0Vp4g3y9VwnhvN0S54fBh3jhxkXx6pjFlfFIVcjlI6e7Dpmc
         UpzXeivWJC6SjTqk8u387sR0MYSme1tVoUanRranPWCBt1Ny1FCDQOtH/PfOdf3z6mlT
         NKQypkQ6HCPAphT0e/4HQZ3NYUmP0eg/+zwM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=4ZjmX0TK1ENqLidS6E/rBXdBjtyJFf2GLte8k5P5JJE=;
        b=Ceg6/BCf95tP+oCCjBqSx7kQYvXpY5Lv4tUH9oTBXsDSrdCqesWkfSgpuJVqwhHYBn
         ltyJK6YIIYVPT6SdoFX5lWSQOIeK5ZOd/9CBHpJ4UB4fpAfJRaozc1Gpnot2RdlS1ylZ
         YxcJkBNT4RkIpLun/6KGV0LhS9dBM8NNM7gGIVvmEEWCIyZc2iFIIuz7N+y2cTAU5AF+
         D7RRFZoXoK3xwPkhe0LnpmsoiXfUVyV38TrVF7B+1Mn5/ODZftTcAxxzrSVvI6nAzNcJ
         C+HtTgkgqcfqPhNiQcSMvXHkLo0SAzkmvMrIxIPZeK16x2dHcILENjXtS+dUSGqAx/GG
         p1pg==
X-Gm-Message-State: AElRT7EbraRdbryxSD6GydEW9BvcqzGxNmx0hvTwWB6cZE9J22Jb2CZ+
        HrcezpYOn9hAAxjk2TLNA3/QHLvHTKA1tDvQJ64=
X-Google-Smtp-Source: AG47ELuHJ2AclS7MZZj6lAYb4elzN+xd0R2OahsnPqJW/e/7xd0626suIh8EXtGtpf/oTosGAkxOSGp/MxSMdJseo8g=
X-Received: by 2002:a24:87c3:: with SMTP id f186-v6mr401487ite.100.1520630131676;
 Fri, 09 Mar 2018 13:15:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.135.221 with HTTP; Fri, 9 Mar 2018 13:15:31 -0800 (PST)
In-Reply-To: <20180309204526.56301f43@alans-desktop>
References: <20180307214624.D4361772@viggo.jf.intel.com> <20180309204526.56301f43@alans-desktop>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 9 Mar 2018 13:15:31 -0800
X-Google-Sender-Auth: Nd8ovk0cP8IJpxiYL-sUbOo-_Gk
Message-ID: <CA+55aFw5+KjVqKUpAMF+-BfE6NuXSNb8qdRtmAWDq6apK2v+sA@mail.gmail.com>
Subject: Re: [PATCH] [v2] docs: clarify security-bugs disclosure policy
To:     Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Cc:     Dave Hansen <dave.hansen@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Andrew Lutomirski <luto@kernel.org>,
        Kees Cook <keescook@google.com>,
        Tim Chen <tim.c.chen@linux.intel.com>,
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

On Fri, Mar 9, 2018 at 12:45 PM, Alan Cox <gnomes@lxorguk.ukuu.org.uk> wrote:
>
> If you want to be taken seriously then I think minimum you also need to
> - Give a GPG key for messages to the list

Oh, I don't want to be taken seriously by people who use gpg encrypted email.

It's garbage and should be shunned as such.

I keep quoting this:

   https://motherboard.vice.com/en_us/article/vvbw9a/even-the-inventor-of-pgp-doesnt-use-pgp

and anybody who thinks pgp encrypted email is fine is a clown.

> - State what security is in place (encryption etc) to protect the list
>   itself

That could be stated, but it's worth noting the other rules.

If you have some long corrupt vendor disclosure period and are worried
about any good guys finding out (the bad guys probably already have
it), we're not the list for you anyway.

Keep your "we'll keep security problems under wraps so that they can
be exploited for a long time" emails to yourself, or send them to
/dev/null.

                   Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
