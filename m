Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 48D217D08E
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 14:44:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728449AbeJBV15 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 17:27:57 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:44211 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728422AbeJBV14 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 17:27:56 -0400
Received: by mail-yb1-f196.google.com with SMTP id x5-v6so858307ybl.11
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 07:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=i/m6cNuwDQR65poY90TV5hhjfZE+DR6UM2c0BpvLWSE=;
        b=ate2HoCrzNYmzPqH2d/JSNTq8USy9L1MbApztE5qGuRzFEKc7Q1hNrGn/QfzlwA46Q
         ke4i25NLe+niCaQAXhzkn09GztnpnzOxUyAHTKDsKEOee8apHck502Thnrsom2NdXM9U
         M0+Xr5WZJovKptEMWMcPysnilD58VRDWaoHhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=i/m6cNuwDQR65poY90TV5hhjfZE+DR6UM2c0BpvLWSE=;
        b=NH8afmQ3NrA1iJw8cCDZMIY1FTaVwbDodB0lFgnbEIFYDxKJDz6ZIv/+gA9o2Cw7yd
         WsK4i82Q00FhCejoq8beTckIoDS1r3G4AMO4z7NnmX1sd76ao8zf5GFSiR+vAp57MIg9
         4yEv0E7zuLIlAcRLL4YtNmh03VEahjkko7u5m2RYHHqLB66ubnOwF7AfHLKXJL9NK5j5
         BuUfai7dYVtXBarRcoLV/AnRAlo073G+/+YnXHzb7Lqqq26fRoxMiGKRuqOfvKHCgsm4
         kyxMVLOcETfCjDZSDMQemUl0cLgoIJerFBjOowqNWSJSSbfTqkiT1S/1imuPIyewgIxl
         PGPA==
X-Gm-Message-State: ABuFfogUIrqRFjnMPBs0W2Ye5I/XCKYt5SZUvwD75x7u1oEcgQqpP/fI
        3sg/8PLqZfxFE4xq6XSrOMomAkAaBGs=
X-Google-Smtp-Source: ACcGV62HRLztbMGbd3L7nF0MH/nwMWZxPvEHjZp4tMVwMLYGJFRE+BvVevoPtKKbZTK+VM+mNlfPsQ==
X-Received: by 2002:a25:c696:: with SMTP id k144-v6mr893244ybf.62.1538491450795;
        Tue, 02 Oct 2018 07:44:10 -0700 (PDT)
Received: from mail-yw1-f54.google.com (mail-yw1-f54.google.com. [209.85.161.54])
        by smtp.gmail.com with ESMTPSA id t10-v6sm6568489ywg.74.2018.10.02.07.44.06
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Oct 2018 07:44:07 -0700 (PDT)
Received: by mail-yw1-f54.google.com with SMTP id m129-v6so846948ywc.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 07:44:06 -0700 (PDT)
X-Received: by 2002:a81:2cc3:: with SMTP id s186-v6mr547127yws.168.1538491446427;
 Tue, 02 Oct 2018 07:44:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Tue, 2 Oct 2018 07:44:05 -0700 (PDT)
In-Reply-To: <785ef6a9-ae46-3533-0348-74bcf6f10928@tycho.nsa.gov>
References: <20181002005505.6112-1-keescook@chromium.org> <20181002005505.6112-24-keescook@chromium.org>
 <CAHC9VhQjMfH6Q+Tif8nBknZojgxrb6x+oDz4vHRiZN8rb8MZ5Q@mail.gmail.com> <785ef6a9-ae46-3533-0348-74bcf6f10928@tycho.nsa.gov>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 2 Oct 2018 07:44:05 -0700
X-Gmail-Original-Message-ID: <CAGXu5jKNzG3rGUAV39D0w4txHRG3H2qU1Z1e_b+03OgycTaWqA@mail.gmail.com>
Message-ID: <CAGXu5jKNzG3rGUAV39D0w4txHRG3H2qU1Z1e_b+03OgycTaWqA@mail.gmail.com>
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

On Tue, Oct 2, 2018 at 6:42 AM, Stephen Smalley <sds@tycho.nsa.gov> wrote:
> On 10/02/2018 08:12 AM, Paul Moore wrote:
>>
>> On Mon, Oct 1, 2018 at 9:04 PM Kees Cook <keescook@chromium.org> wrote:
>>>
>>> Since LSM enabling is now centralized with CONFIG_LSM_ENABLE and
>>> "lsm.enable=...", this removes the LSM-specific enabling logic from
>>> SELinux.
>>>
>>> Signed-off-by: Kees Cook <keescook@chromium.org>
>>> ---
>>>   .../admin-guide/kernel-parameters.txt         |  9 ------
>>>   security/selinux/Kconfig                      | 29 -------------------
>>>   security/selinux/hooks.c                      | 15 +---------
>>>   3 files changed, 1 insertion(+), 52 deletions(-)
>>>
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt
>>> b/Documentation/admin-guide/kernel-parameters.txt
>>> index cf963febebb0..0d10ab3d020e 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -4045,15 +4045,6 @@
>>>                          loaded. An invalid security module name will be
>>> treated
>>>                          as if no module has been chosen.
>>>
>>> -       selinux=        [SELINUX] Disable or enable SELinux at boot time.
>>> -                       Format: { "0" | "1" }
>>> -                       See security/selinux/Kconfig help text.
>>> -                       0 -- disable.
>>> -                       1 -- enable.
>>> -                       Default value is set via kernel config option.
>>> -                       If enabled at boot time, /selinux/disable can be
>>> used
>>> -                       later to disable prior to initial policy load.
>>
>>
>> No comments yet on the rest of the patchset, but the subject line of
>> this patch caught my eye and I wanted to comment quickly on this one
>> ...
>>
>> Not a fan unfortunately.
>>
>> Much like the SELinux bits under /proc/self/attr, this is a user
>> visible thing which has made its way into a lot of docs, scripts, and
>> minds; I believe removing it would be a big mistake.
>
>
> Yes, we can't suddenly break existing systems that had selinux=0 in their
> grub config.  We have to retain the support.

Is it okay to only support selinux=0 (instead of also selinux=1)?

-Kees

-- 
Kees Cook
Pixel Security
