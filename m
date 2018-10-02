Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7BA507D981
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 16:34:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728535AbeJBXSn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 19:18:43 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:39171 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728437AbeJBXSm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 19:18:42 -0400
Received: by mail-yw1-f68.google.com with SMTP id v1-v6so1009823ywv.6
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 09:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=79+/1lnmQzDOwK5HjNBMwdoNS2u8Fqf6+NB+3YIyrKs=;
        b=hVKPWYCQf4YO1PzD8ic2zHzeBnAZmrxWciQlXzQW9jE5qrO3YTGORvqcIbtlfPrwRU
         0EE/v1d4SErKRtJ0y7iTO1Wrhw72FZqW796mUgEejUuDXsrRvUfD0wCEY8/YobRlevwi
         eJePZNVgA5yHLLC/7+1X1HX0Ri4k/wqhPkfTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=79+/1lnmQzDOwK5HjNBMwdoNS2u8Fqf6+NB+3YIyrKs=;
        b=TJp/+5/x7+gLgT1inV5kd2Ib9ndLi5jfCXbO5OZofcY3JEglfNqv+ZIAvQvgUoM/7h
         TDiA+49hSuH54Pq8HmDZNg10hfd3dKs/aYBWfXjdxMZpky9RKJJUn6/4vaE4BfVWDK3H
         3SUKEFz5guSo9SrtTgToXAfhVHqlQegnhG4QCVXfArQGTWTT4+omcMzDBRh2aDS7D4YJ
         WORNwIVmmYshw13y7YpPYjmX128a05CzLTjcs7nCdfyhKzfOQ/DcLryrECX6z3Xq3w3P
         ZiOFCotzXLHC8Dj/wnH9D/9C+WrXWgCG3E3CiODkYrB+iR7RR21u7AlfCheWg4cm5W8P
         uOhg==
X-Gm-Message-State: ABuFfogLzuvN/ouwsuxKUZBqKavz7ulNa3e6D51l7P9TIGopC/RFjb84
        fSTqbQJClzLgpKnsArZt8iaRE1RdUNA=
X-Google-Smtp-Source: ACcGV61+0v2sp6NMQF/ALmroAchdpgwWljaNN7wdWIaHAHou70RMKwXbLwGTw7HZQF0aIAw1/hA1jw==
X-Received: by 2002:a81:5846:: with SMTP id m67-v6mr8741014ywb.300.1538498067123;
        Tue, 02 Oct 2018 09:34:27 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id d136-v6sm8613033ywh.33.2018.10.02.09.34.23
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Oct 2018 09:34:23 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id h1-v6so1048259ybm.4
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 09:34:23 -0700 (PDT)
X-Received: by 2002:a25:dd82:: with SMTP id u124-v6mr8866057ybg.171.1538498062769;
 Tue, 02 Oct 2018 09:34:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Tue, 2 Oct 2018 09:34:22 -0700 (PDT)
In-Reply-To: <809f1cfd-077b-ee58-51ba-b22daf46d12b@tycho.nsa.gov>
References: <20181002005505.6112-1-keescook@chromium.org> <20181002005505.6112-24-keescook@chromium.org>
 <CAHC9VhQjMfH6Q+Tif8nBknZojgxrb6x+oDz4vHRiZN8rb8MZ5Q@mail.gmail.com>
 <785ef6a9-ae46-3533-0348-74bcf6f10928@tycho.nsa.gov> <CAGXu5jKNzG3rGUAV39D0w4txHRG3H2qU1Z1e_b+03OgycTaWqA@mail.gmail.com>
 <809f1cfd-077b-ee58-51ba-b22daf46d12b@tycho.nsa.gov>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 2 Oct 2018 09:34:22 -0700
X-Gmail-Original-Message-ID: <CAGXu5jLLg-anBAPmfDzeQA--HYzYAGaRamUiJS8HTt+wMFp_qA@mail.gmail.com>
Message-ID: <CAGXu5jLLg-anBAPmfDzeQA--HYzYAGaRamUiJS8HTt+wMFp_qA@mail.gmail.com>
Subject: Re: [PATCH security-next v4 23/32] selinux: Remove boot parameter
To:     Stephen Smalley <sds@tycho.nsa.gov>
Cc:     Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 2, 2018 at 7:58 AM, Stephen Smalley <sds@tycho.nsa.gov> wrote:
> On 10/02/2018 10:44 AM, Kees Cook wrote:
>>
>> On Tue, Oct 2, 2018 at 6:42 AM, Stephen Smalley <sds@tycho.nsa.gov> wrote:
>>>
>>> On 10/02/2018 08:12 AM, Paul Moore wrote:
>>>>
>>>>
>>>> On Mon, Oct 1, 2018 at 9:04 PM Kees Cook <keescook@chromium.org> wrote:
>>>>>
>>>>>
>>>>> Since LSM enabling is now centralized with CONFIG_LSM_ENABLE and
>>>>> "lsm.enable=...", this removes the LSM-specific enabling logic from
>>>>> SELinux.
>>>>>
>>>>> Signed-off-by: Kees Cook <keescook@chromium.org>
>>>>> ---
>>>>>    .../admin-guide/kernel-parameters.txt         |  9 ------
>>>>>    security/selinux/Kconfig                      | 29
>>>>> -------------------
>>>>>    security/selinux/hooks.c                      | 15 +---------
>>>>>    3 files changed, 1 insertion(+), 52 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt
>>>>> b/Documentation/admin-guide/kernel-parameters.txt
>>>>> index cf963febebb0..0d10ab3d020e 100644
>>>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>>>> @@ -4045,15 +4045,6 @@
>>>>>                           loaded. An invalid security module name will
>>>>> be
>>>>> treated
>>>>>                           as if no module has been chosen.
>>>>>
>>>>> -       selinux=        [SELINUX] Disable or enable SELinux at boot
>>>>> time.
>>>>> -                       Format: { "0" | "1" }
>>>>> -                       See security/selinux/Kconfig help text.
>>>>> -                       0 -- disable.
>>>>> -                       1 -- enable.
>>>>> -                       Default value is set via kernel config option.
>>>>> -                       If enabled at boot time, /selinux/disable can
>>>>> be
>>>>> used
>>>>> -                       later to disable prior to initial policy load.
>>>>
>>>>
>>>>
>>>> No comments yet on the rest of the patchset, but the subject line of
>>>> this patch caught my eye and I wanted to comment quickly on this one
>>>> ...
>>>>
>>>> Not a fan unfortunately.
>>>>
>>>> Much like the SELinux bits under /proc/self/attr, this is a user
>>>> visible thing which has made its way into a lot of docs, scripts, and
>>>> minds; I believe removing it would be a big mistake.
>>>
>>>
>>>
>>> Yes, we can't suddenly break existing systems that had selinux=0 in their
>>> grub config.  We have to retain the support.
>>
>>
>> Is it okay to only support selinux=0 (instead of also selinux=1)?
>
>
> For Fedora/RHEL kernels, selinux=1 would be redundant since it is the
> default.  However, in other distros where SELinux is not the default, I
> think they have documented selinux=1 as the way to enable SELinux.  So users
> may be relying on that as well. I don't think we can safely drop support for
> either one.  Sorry.

Okay. How would you like to resolve this? Should SELinux remain
"enable special", and AppArmor is okay to remove the LSM-specific
enabling?

The trouble is with handling CONFIG_LSM_ENABLE vs lsm.enable=... boot
param vs the SELinux bootparam. I.e. CONFIG_LSM_ENABLE is redundant to
SECURITY_SELINUX_BOOTPARAM_VALUE, and selinux= is redundant to
lsm.enable=. Specifically, how should the kernel distinguish between
the four settings?

-Kees

-- 
Kees Cook
Pixel Security
