Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 928067DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 16:57:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751629AbeEBQ5N (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 12:57:13 -0400
Received: from mail-ua0-f193.google.com ([209.85.217.193]:47035 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751687AbeEBQ5I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 May 2018 12:57:08 -0400
Received: by mail-ua0-f193.google.com with SMTP id e8so7708248uam.13
        for <linux-doc@vger.kernel.org>; Wed, 02 May 2018 09:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=K8d6C5TrMGgYKyPv72Dl+o5N5VZTWRwTFfwjmFwYVl8=;
        b=lejUOmNWqEHkY4FIlxoVZcMOjHJhCxuOiPZQePicGwK6UIB+2z1UzX7Jh33GfqTSZo
         a44cXgWrLQ1xK8TGJc8N9xBqPZaZUi/wZT196farAxUJWbSx4U4UmlQkODOvj3Sr5ka9
         k+/EherdFWHlWJMskEuPO/feuuDFxnJ7BDa1jymyDve6GX3P9Ide107gFNUwrSU7QWjj
         4LbDBLcrJUPtc2hJ0CU7K/5AolmyeOeKcGRI6AkJM9UR0ivKk18Ky3gm6VR5Cco6wmrh
         m6BASljjAD9rMTbKximRkM8NqA7kILveJm6DV05tqBCZhpvAs+bx4SmUAZhRGNYTwpg0
         xuhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=K8d6C5TrMGgYKyPv72Dl+o5N5VZTWRwTFfwjmFwYVl8=;
        b=G9U3jkKwo3kRYgnZYc3ueAFRwObQOIT6/E//oWNfU1DgY8U2PUwc/6G2A7wdpjDtGo
         dHCMyRi973kGXzb8xdqLYMYW5uXYJ8TH6eMGJFg+1HYaSf1Yt/cZX3l69eAzA6/ODn9U
         3NFMPL3GZ7JDFRrUSf3nEHkmYKIpXbyTFUyo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=K8d6C5TrMGgYKyPv72Dl+o5N5VZTWRwTFfwjmFwYVl8=;
        b=Bu8k6XQv+mgWtCgeEBeCyhgZUP0XU/Vt3UGxqRb/H2xPZaJAZpCFayeCON0J4AceXI
         TSHyd9vdcIXhXX/fluqwdfPHO7dVVkG6x/u0dne0YGgzIaiG/e90RYNhAQY6sNn0ZPbs
         7MbmE4ZxkVvk1JBNWMMKjICIbxEMb9CRnrzrhiEgNUHSz7fn4COE8P/6vSKFrubqs6pn
         uceUFkiMjbRSgqBA/LS/f8voNfXpc6EczXDLXfMBR4KghOWQuQWRJNFezGY7AJ912TQv
         Z59gttedAZO3gy0OyvyrZ1J2jLPJbjEjSLzmGDGO9dTlKhv4GsxuRD+rgHj1rpb+7SXe
         btrA==
X-Gm-Message-State: ALQs6tDtdgeryp7PzIcXwSVVD8Onao1RHbGZADBNogBg1riCjEzhDME1
        OShkPzEd8FAVeHDzTJznj8fFMzVBj3qQam3nyUiBzw==
X-Google-Smtp-Source: AB8JxZrx1YQ172gRVsikCWxQ/PcMG2fC5eXKuslaoQXK4KIioh4tvRBGKhcUpS5onv6tVGQ7kFVC4gflz8uAyUnJlrM=
X-Received: by 10.159.40.35 with SMTP id c32mr19870080uac.193.1525280226376;
 Wed, 02 May 2018 09:57:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.11.209 with HTTP; Wed, 2 May 2018 09:57:05 -0700 (PDT)
In-Reply-To: <1525276400-7161-5-git-send-email-tyhicks@canonical.com>
References: <1525276400-7161-1-git-send-email-tyhicks@canonical.com> <1525276400-7161-5-git-send-email-tyhicks@canonical.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Wed, 2 May 2018 09:57:05 -0700
X-Google-Sender-Auth: GB4wDQPPPhD2zcH22WBY16U0fnE
Message-ID: <CAGXu5jLnD=g=LxR5KTrvcwr1qaYiYXbH-ersvhs5NPRR6JA91w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] seccomp: Don't special case audited processes when logging
To:     Tyler Hicks <tyhicks@canonical.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@redhat.com>,
        Steve Grubb <sgrubb@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Audit <linux-audit@redhat.com>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 2, 2018 at 8:53 AM, Tyler Hicks <tyhicks@canonical.com> wrote:
> diff --git a/kernel/seccomp.c b/kernel/seccomp.c
> index da78835..9029d9d 100644
> --- a/kernel/seccomp.c
> +++ b/kernel/seccomp.c
> @@ -584,18 +584,13 @@ static inline void seccomp_log(unsigned long syscall, long signr, u32 action,
>         }
>
>         /*
> -        * Force an audit message to be emitted when the action is RET_KILL_*,
> -        * RET_LOG, or the FILTER_FLAG_LOG bit was set and the action is
> -        * allowed to be logged by the admin.
> +        * Emit an audit message when the action is RET_KILL_*, RET_LOG, or the
> +        * FILTER_FLAG_LOG bit was set. The admin has the ability to silence
> +        * any action from being logged by removing the action name from the
> +        * seccomp_actions_logged sysctl.
>          */
>         if (log)
> -               return __audit_seccomp(syscall, signr, action);
> -
> -       /*
> -        * Let the audit subsystem decide if the action should be audited based
> -        * on whether the current task itself is being audited.
> -        */
> -       return audit_seccomp(syscall, signr, action);
> +               audit_seccomp(syscall, signr, action);
>  }

This whole series looks great to me. If I can get an Ack from Paul for
the audit bits, I can take it via the seccomp tree. One minor nit on
seccomp_log() above, I'd probably change this to show the "exception"
case as "out of line" of normal code flow. i.e. instead of "if (log)
audit_seccomp", invert it to return early:

...
    if (!log)
        return;

    audit_seccomp(syscall, signr, action);
}

But if there isn't some other need for a v3, I can just make this
change when I commit.

Thanks for fixing this up!

-Kees

-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
