Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E68E77E27F
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 May 2018 02:34:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752110AbeECCdB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 22:33:01 -0400
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36469 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752064AbeECCc6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 May 2018 22:32:58 -0400
Received: by mail-lf0-f68.google.com with SMTP id w8-v6so23737562lfe.3
        for <linux-doc@vger.kernel.org>; Wed, 02 May 2018 19:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=eHvXL6ftbCEXdeeZO8l2ztFukgWRaQWjieZ8EPvCWO0=;
        b=NyoM/A22hlF3E2Eu5M6wcLlv080MzVJZkEKWWxAESiI5DTO+89wp975yc8NfJ7PGZM
         4KMc+pAF/FO+TB2EmPm2kUof1Il59ysLB8Ks0fNzb6b8Ep/3hajZq6DrCbWZpP65EKBW
         c/pcCDFowWFpapdxl3u70HidNpgw2i6bhFMHD4U5C/bPG1Xga7vbt25oPYBOAZhiuslR
         9UrWgQm629b5bwD9oLvww2E2oGJqi9i0UV06PD2j7lU8ZYHx/aX9r+fQEyBCGT8xdQ9A
         7Q0lZZ2uAn+xvXSIqRLpcwvVkMZGfpS0Ms4tWlcjFwze+s/3sLfErceIUQMkQxVXcAc0
         8PLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=eHvXL6ftbCEXdeeZO8l2ztFukgWRaQWjieZ8EPvCWO0=;
        b=tHdN3UgLnQjSVDL8h9ep9JTJ1lpW+4ZDUaCLzdDpo7i8TRj3zQwdqCsqK3HFgaaSNy
         zwFa50Rdx6g924w5DjJWA3MhW0Nc4XsnMwKtQjd9Lge1jARxEFUNpC24MN92yMc5GTtu
         1ClWMp314U3eGyrOJJhiafBzoHNP9mlLsJxAoq+g1d+O3sARZUmWWp97X6Kh7t/Rgvbi
         ozQn05YGKyQQE1Vs87j7CBcNhZJfiEUTU20j6beZqBbVDBC+vpyeoq9SQs2d02w5jq1A
         +vvAlVRbLKo9y3jjcFiPBF33/AGW0UI8k+WnEL32g+y7IP92/ZCL62PaOAxMzdWYHaoL
         yEUg==
X-Gm-Message-State: ALQs6tCXCsulkMWWhBKyyijFE4aIempSAEoQxTzrHOCbuuzXJfeEQMSn
        uLtIsqm5woyUqp+vgK3u6vp4Sg+eYFGWF/51yrMk
X-Google-Smtp-Source: AB8JxZqzluMkPuOuEcnoeD8t7FPqbSEpKi1XbNUaVpCEsBCiKwMrlz8Cepcj5BS+8KwDKgm6hoOHooTVuQ8nlSHMJlI=
X-Received: by 2002:a2e:810a:: with SMTP id d10-v6mr14343972ljg.83.1525314776554;
 Wed, 02 May 2018 19:32:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:c78f:0:0:0:0:0 with HTTP; Wed, 2 May 2018 19:32:55 -0700 (PDT)
X-Originating-IP: [108.20.156.165]
In-Reply-To: <CAGXu5jLnD=g=LxR5KTrvcwr1qaYiYXbH-ersvhs5NPRR6JA91w@mail.gmail.com>
References: <1525276400-7161-1-git-send-email-tyhicks@canonical.com>
 <1525276400-7161-5-git-send-email-tyhicks@canonical.com> <CAGXu5jLnD=g=LxR5KTrvcwr1qaYiYXbH-ersvhs5NPRR6JA91w@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 2 May 2018 22:32:55 -0400
Message-ID: <CAHC9VhQNaYrZeA487DyhuKGc-2GcydFC2Fr7vUrpoDPhbi4v4A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] seccomp: Don't special case audited processes when logging
To:     Kees Cook <keescook@chromium.org>
Cc:     Tyler Hicks <tyhicks@canonical.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>, Eric Paris <eparis@redhat.com>,
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

On Wed, May 2, 2018 at 12:57 PM, Kees Cook <keescook@chromium.org> wrote:
> On Wed, May 2, 2018 at 8:53 AM, Tyler Hicks <tyhicks@canonical.com> wrote:
>> diff --git a/kernel/seccomp.c b/kernel/seccomp.c
>> index da78835..9029d9d 100644
>> --- a/kernel/seccomp.c
>> +++ b/kernel/seccomp.c
>> @@ -584,18 +584,13 @@ static inline void seccomp_log(unsigned long syscall, long signr, u32 action,
>>         }
>>
>>         /*
>> -        * Force an audit message to be emitted when the action is RET_KILL_*,
>> -        * RET_LOG, or the FILTER_FLAG_LOG bit was set and the action is
>> -        * allowed to be logged by the admin.
>> +        * Emit an audit message when the action is RET_KILL_*, RET_LOG, or the
>> +        * FILTER_FLAG_LOG bit was set. The admin has the ability to silence
>> +        * any action from being logged by removing the action name from the
>> +        * seccomp_actions_logged sysctl.
>>          */
>>         if (log)
>> -               return __audit_seccomp(syscall, signr, action);
>> -
>> -       /*
>> -        * Let the audit subsystem decide if the action should be audited based
>> -        * on whether the current task itself is being audited.
>> -        */
>> -       return audit_seccomp(syscall, signr, action);
>> +               audit_seccomp(syscall, signr, action);
>>  }
>
> This whole series looks great to me. If I can get an Ack from Paul for
> the audit bits, I can take it via the seccomp tree.

I got stuck doing some day job things today and didn't get a chance to
look at v2 today, but I'll do that tomorrow.

I'm not sure if you've already got anything queued up in your seccomp
tree Kees, but if not I'm happy to take these patches via the audit
tree; that was my original plan, assuming I got a positive nod from
you.  Either way, as long as it hits Linus' tree eventually I'll be
happy (assuming everything looks good post-review of course).

> ... One minor nit on
> seccomp_log() above, I'd probably change this to show the "exception"
> case as "out of line" of normal code flow. i.e. instead of "if (log)
> audit_seccomp", invert it to return early:
>
> ...
>     if (!log)
>         return;
>
>     audit_seccomp(syscall, signr, action);
> }
>
> But if there isn't some other need for a v3, I can just make this
> change when I commit.
>
> Thanks for fixing this up!
>
> -Kees
>
> --
> Kees Cook
> Pixel Security



-- 
paul moore
www.paul-moore.com
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
