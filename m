Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 522277D584
	for <lwn-linux-doc@archive.lwn.net>; Thu, 27 Sep 2018 16:36:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbeI0Wzg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 27 Sep 2018 18:55:36 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:39632 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727335AbeI0Wzf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Sep 2018 18:55:35 -0400
Received: by mail-yw1-f66.google.com with SMTP id v1-v6so1342264ywv.6
        for <linux-doc@vger.kernel.org>; Thu, 27 Sep 2018 09:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=IK2mbpwVLvXJ888D4txI+JajMjzT21QDDVE/b8HggmE=;
        b=I5QxbZbCsiACM6vRpKmU1LLI7dTAOfWuPHdR1/qEJQN77lem5ZX0+bPOnwnkh9NGZr
         TgsH2qujk+vN83iVM/kilhNWeuv9XoIEJDBHKfr9sghvGx5Vvg43kCKWC7GdOfqbKna0
         Ex9B8KEQiFKU3JRYQd7hpfiaEBJk91IcNulf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=IK2mbpwVLvXJ888D4txI+JajMjzT21QDDVE/b8HggmE=;
        b=kK8brlhMS8a382mVZ73zXtG8SIgH34mOqxFsHYriv4v6nZTYzWDaW+rvW9wv5ESHMY
         MSOMbgZrjhLo4oKHzyrWkv2P/gwSFDL8X4ZQbsviaer10jBhTjpAK6K4WndYckIRphZV
         nRfGsZ9h/YWroGiDFYLnTvcgHgyd3yjDpjes6Zfwkw94L9fVKRP9xInctdt0qPKRvZHH
         MDLKP2H/leqDwQTXp+55QYavm4S/2hDIehQdiEe9foX0xU8sJx4BElPwC+7DhNAAlGKi
         deZk4A5NmQRdGgjOuEAsSetzxNm8Z6bGWsZ3tgdiJj8hdi6k7F50pZOsYThdYojNXW8c
         tR1g==
X-Gm-Message-State: ABuFfoiPW+W+3uL4ACzUgjFcMgXGxH7klikjo6qnWKomiqonw9tWVeXY
        JKQUmuuGAXg10jUSdUMQqbCXgfGorpw=
X-Google-Smtp-Source: ACcGV61nv86mGyp4WM2ifK1GWbFTIVIkZZDj9FGMOUj6Xb6p7DXLgGHY70UD0dYTk8J/j9iYarXDhA==
X-Received: by 2002:a81:1ecf:: with SMTP id e198-v6mr6236266ywe.197.1538066188822;
        Thu, 27 Sep 2018 09:36:28 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id z186-v6sm739000ywa.101.2018.09.27.09.36.25
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Sep 2018 09:36:25 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id c4-v6so1370320ybl.6
        for <linux-doc@vger.kernel.org>; Thu, 27 Sep 2018 09:36:25 -0700 (PDT)
X-Received: by 2002:a25:249:: with SMTP id 70-v6mr6393127ybc.421.1538066184508;
 Thu, 27 Sep 2018 09:36:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Thu, 27 Sep 2018 09:36:23
 -0700 (PDT)
In-Reply-To: <20180927142328.GA4074@redhat.com>
References: <cover.1537936397.git.helen.koike@collabora.com>
 <CAFLxGvzCDOTR4stPmp1TTLkQ39x3e8MQuL=AR754abKc5skhpA@mail.gmail.com> <20180927142328.GA4074@redhat.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Thu, 27 Sep 2018 09:36:23 -0700
X-Gmail-Original-Message-ID: <CAGXu5j+Y5e_oTZVCAHa48XgVcvEKGnVW_74oXZOUyLnfYPAjAg@mail.gmail.com>
Message-ID: <CAGXu5j+Y5e_oTZVCAHa48XgVcvEKGnVW_74oXZOUyLnfYPAjAg@mail.gmail.com>
Subject: Re: [PATCH 0/2] boot to a mapped device
To:     Mike Snitzer <snitzer@redhat.com>
Cc:     Richard Weinberger <richard.weinberger@gmail.com>,
        helen.koike@collabora.com,
        device-mapper development <dm-devel@redhat.com>,
        Alasdair G Kergon <agk@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Will Drewry <wad@chromium.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-lvm@redhat.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 27, 2018 at 7:23 AM, Mike Snitzer <snitzer@redhat.com> wrote:
> On Wed, Sep 26 2018 at  3:16am -0400,
> Richard Weinberger <richard.weinberger@gmail.com> wrote:
>
>> Helen,
>>
>> On Wed, Sep 26, 2018 at 7:01 AM Helen Koike <helen.koike@collabora.com> wrote:
>> >
>> > This series is reviving an old patchwork.
>> > Booting from a mapped device requires an initramfs. This series is
>> > allows for device-mapper targets to be configured at boot time for
>> > use early in the boot process (as the root device or otherwise).
>>
>> What is the reason for this patch series?
>> Setting up non-trivial root filesystems/storage always requires an
>> initramfs, there is nothing
>> wrong about this.
>
> Exactly.  If phones or whatever would benefit from this patchset then
> say as much.

I think some of the context for the series was lost in commit logs,
but yes, both Android and Chrome OS do not use initramfs. The only
thing that was needed to do this was being able to configure dm
devices on the kernel command line, so the overhead of a full
initramfs was seen as a boot time liability, a boot image size
liability (e.g. Chrome OS has a limited amount of storage available
for the boot image that is covered by the static root of trust
signature), and a complexity risk: everything that is needed for boot
could be specified on the kernel command line, so better to avoid the
whole initramfs dance.

So, instead, this plumbs the dm commands directly instead of bringing
up a full userspace and performing ioctls.

> I will not accept this patchset at this time.
>
>> > Example, the following could be added in the boot parameters.
>> > dm="lroot,,,rw, 0 4096 linear 98:16 0, 4096 4096 linear 98:32 0" root=/dev/dm-0
>>
>> Hmmm, the new dm= parameter is anything but easy to get right.
>
> No, it isn't.. exposes way too much potential for users hanging
> themselves.

IIRC, the changes in syntax were suggested back when I was trying to
drive this series:
https://www.redhat.com/archives/dm-devel/2016-February/msg00199.html

And it matches the "concise" format in dmsetup:
https://sourceware.org/git/?p=lvm2.git;a=commit;h=827be01758ec5adb7b9d5ea75b658092adc65534

What do you feel are next steps?

Thanks!

-Kees

-- 
Kees Cook
Pixel Security
