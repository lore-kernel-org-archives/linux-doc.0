Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 61F6D7D082
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Oct 2018 23:09:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbeJLGiw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Oct 2018 02:38:52 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:33696 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726172AbeJLGiw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Oct 2018 02:38:52 -0400
Received: by mail-yb1-f193.google.com with SMTP id u88-v6so4287349ybi.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Oct 2018 16:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=E9Z8YXmyEHkjN2JSkxIYnrk1oOeD6hL6rpGkgyv6Ooo=;
        b=ZlAWMLy7xB9VGuFtLXV9bY21AJDQg6yop286S/xbIdJNCEc3h3BKb1qIkTXGibDO1O
         J3F+/m0Ia1keM4s5AiwIXKF9h5oP7fbZ39giOxryZzEtv2aibOGzP4/rAgvAhGJ+Y4o2
         aNLpJoLo/GfWqFYNhCXz+OV8d0g/b66W6UaJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=E9Z8YXmyEHkjN2JSkxIYnrk1oOeD6hL6rpGkgyv6Ooo=;
        b=GqBaMveOdlm4WlHX/lJcDnhFqGaSF7hOFHdHHAztHqC6tZ9G80eV1lzSO84x9Ps/4W
         +A0XGOkeLcksD1neK5Bi/1xaYOjmrWsn5noD198CHMMeaHvA5As485VVaH+wgyeGVvzR
         SPd+RuCAW6NiG7cFUpWGvZ0BDlJlLepeyAqtFRkPoQPmoH3+JlIlaWdyw1jhmtrXNFa8
         mcqh0rGMjP1XBtwMBjg7SVkYRNSM6oTseqQwhNVn7FbCi6nFEC+Yy2kEUUYLsAx9cue1
         b7jp0k8JiDK8x+ZmJXN9F6wx35+uvb46gnJd7rDupQ8iuG4wEFEQ44hZl2mmwAzdJ1/O
         yYbw==
X-Gm-Message-State: ABuFfoho1jBikcmwfSV/uFmn7GJ42i2SdfkSgimL4xdlo4Z9puXYxaJ0
        XarDJqo6+ddmx0x5EwAYt5C0LDqr9hY=
X-Google-Smtp-Source: ACcGV62suBHdIJPIQTZ25I9DysSgrlVlfJTFpBaYqQihAyDW2hZ2N9zVq95YQtWC7kdYAv5vxMleBQ==
X-Received: by 2002:a25:8589:: with SMTP id x9-v6mr2039082ybk.181.1539299362196;
        Thu, 11 Oct 2018 16:09:22 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id l6-v6sm14310100ywb.15.2018.10.11.16.09.20
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Oct 2018 16:09:20 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id e16-v6so4274694ybk.8
        for <linux-doc@vger.kernel.org>; Thu, 11 Oct 2018 16:09:20 -0700 (PDT)
X-Received: by 2002:a25:3588:: with SMTP id c130-v6mr2077559yba.410.1539299360001;
 Thu, 11 Oct 2018 16:09:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Thu, 11 Oct 2018 16:09:18
 -0700 (PDT)
In-Reply-To: <ZhaXhoElmWQlsxHmgFHpB2xSWzJYFZWBasrSKQNjGj4_T2A4AY2F9v1rP9LkUfilUbZ0ExWXX9koLNjUM8S6baX6xfSSMPXY_CpihbCetVc=@protonmail.ch>
References: <20181011001846.30964-1-keescook@chromium.org> <CAGXu5jLBaHj5MhXaK-8zdu6Rgo2B6rEq+at17xZ1Puct+YUajQ@mail.gmail.com>
 <ZhaXhoElmWQlsxHmgFHpB2xSWzJYFZWBasrSKQNjGj4_T2A4AY2F9v1rP9LkUfilUbZ0ExWXX9koLNjUM8S6baX6xfSSMPXY_CpihbCetVc=@protonmail.ch>
From:   Kees Cook <keescook@chromium.org>
Date:   Thu, 11 Oct 2018 16:09:18 -0700
X-Gmail-Original-Message-ID: <CAGXu5j+kekUdcE2EhUu__8MXJ1O+D=-zTXLGNCRVa_VyDxePpw@mail.gmail.com>
Message-ID: <CAGXu5j+kekUdcE2EhUu__8MXJ1O+D=-zTXLGNCRVa_VyDxePpw@mail.gmail.com>
Subject: Re: [PATCH security-next v5 00/30] LSM: Explict ordering
To:     Jordan Glover <Golden_Miller83@protonmail.ch>
Cc:     James Morris <jmorris@namei.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Paul Moore <paul@paul-moore.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        LSM <linux-security-module@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 11, 2018 at 3:58 PM, Jordan Glover
<Golden_Miller83@protonmail.ch> wrote:
> On Thursday, October 11, 2018 7:57 PM, Kees Cook <keescook@chromium.org> wrote:
>>     To switch to SELinux at boot time with
>>     "CONFIG_LSM=yama,loadpin,integrity,apparmor", the old way continues to
>>     work:
>>
>>     selinux=1 security=selinux
>>
>>     This will work still, since it will enable selinux (selinux=1) and
>>     disable all other major LSMs (security=selinux).
>>
>>     The new way to enable selinux would be using
>>     "lsm=yama,loadpin,integrity,selinux".
>>
>
> It seems to me that legacy way is more user friendly than the new one.
> AppArmor and SElinux are households names but the rest may be enigmatic
> for most users and the need for explicit passing them all may be
> troublesome. Especially when the new ones like sara,landlock or cows :)
> will be incoming. Moreover to knew what you have to pass there, you need
> to look at CONFIG_LSM in kernel config (which will vary across distros
> and also mean copy-paste from the web source may won't work as expected)
> which again most users don't do.
>
> I think there is risk that users will end up with "lsm=selinux" without
> realizing that they may disable something along the way.
>
> I would prefer for "lsm=" to work as override to "CONFIG_LSM=" with
> below assumptions:
>
> I. lsm="$lsm" will append "$lsm" at the end of string. Before extreme
> stacking it will also remove the other major (explicit) lsm from it.
>
> II. lsm="!$lsm" will remove "$lsm" from the string.
>
> III. If "$lsm" already exist in the string, it's moved at the end of it
> (this will cover ordering).

We've had things sort of like this proposed, but if you can convince
James and others, I'm all for it. I think the standing objection from
James and John about this is that the results of booting with
"lsm=something" ends up depending on CONFIG_LSM= for that distro. So
you end up with different behaviors instead of a consistent behavior
across all distros.

Now, in the future blob and extreme stacking world, having the
explicit lsm= list shouldn't be too bad since LSMs will effectively
ALL be initialized -- but they'll be inactive since they have no
policy loaded.

But I still agree with you: I'd like a friendlier way to
disable/enable specific LSMs, but an explicit lsm= seems to be the
only way.

> It's possible that something lime this was discussed already
> but without full examples it was hard to me for tracking things.

It's been a painful thread. ;)

-Kees

-- 
Kees Cook
Pixel Security
