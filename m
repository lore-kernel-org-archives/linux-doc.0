Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C9C517D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Oct 2018 22:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbeJRGtT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 18 Oct 2018 02:49:19 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:33602 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbeJRGtT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Oct 2018 02:49:19 -0400
Received: by mail-yb1-f196.google.com with SMTP id u88-v6so11087620ybi.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Oct 2018 15:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=9EIVAGdeAV6Bg/PPh56IRt+ZYwMbFdtVfvHVjxDcryg=;
        b=RslRXyWJ87wRkFRYQoUukRB6NxkMTGgp4deuD/fhe7BRU3VohixtgZ1WJKm6AuuDrR
         rZCur8DLr2xr64AYWzav5YDCQxWRPgvbAfcYb3S7mneuEmCJi9A+TF/fCs5qI60F5Vpy
         ugD0lyDrtNEVAICV7ugQy/U56p4F+tgBAjyGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=9EIVAGdeAV6Bg/PPh56IRt+ZYwMbFdtVfvHVjxDcryg=;
        b=X1XvwKQ8OzSmIchhU9NjLOAqocGV9nQmTa0bnGTuacozF7wHT2cRYjrcb6T72+i42p
         UDZbVWYFYwgSpdo9sHW21gotB0EUuZ1BKwmvhtPLLIiYhtKjqD6LPlQtlD+r0CdrY17Z
         CR7aL7y5sQu+Kzy7IUknlQvapaz4lrqTsl60KfnHsVLx8opG9L94I0quq9CNqAfIp6BI
         5AgBDXVZy/5AIRJBgznRnpwQYtfdU1v4VSEaoZv9HZGuK+YEnx9FMCRj10iev497uS3p
         e3+XyRKyI4VUUzyVEWUv8OSLAzLDchqdl1Fcb4dAkmEsuQuqDAvskvkm5JGMZ85CRkDs
         H5Og==
X-Gm-Message-State: ABuFfoj8myOrS6tki7toNMWCodIOI1PhuouLnUqkzTrZvKIJhjS0RmhG
        OxdXUiZr5OskGZFRzUJwCN5MuEO3+Zo=
X-Google-Smtp-Source: ACcGV60+JzYluSbpgrrVMhWBUOXDPOZR3WurPGQNBD1Vz4igeBOK9sj9TQHvVrLAINMXzOi3onN1OA==
X-Received: by 2002:a25:600b:: with SMTP id u11-v6mr16846326ybb.499.1539816685141;
        Wed, 17 Oct 2018 15:51:25 -0700 (PDT)
Received: from mail-yw1-f42.google.com (mail-yw1-f42.google.com. [209.85.161.42])
        by smtp.gmail.com with ESMTPSA id e2-v6sm4513546ywh.86.2018.10.17.15.51.23
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Oct 2018 15:51:24 -0700 (PDT)
Received: by mail-yw1-f42.google.com with SMTP id l79-v6so11056469ywc.7
        for <linux-doc@vger.kernel.org>; Wed, 17 Oct 2018 15:51:23 -0700 (PDT)
X-Received: by 2002:a0d:fec6:: with SMTP id o189-v6mr17253859ywf.237.1539816683309;
 Wed, 17 Oct 2018 15:51:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Wed, 17 Oct 2018 15:51:22
 -0700 (PDT)
In-Reply-To: <20181017065011.40ad8b24@lwn.net>
References: <20181017021708.GA22211@beast> <20181017065011.40ad8b24@lwn.net>
From:   Kees Cook <keescook@chromium.org>
Date:   Wed, 17 Oct 2018 15:51:22 -0700
X-Gmail-Original-Message-ID: <CAGXu5j+CP9aqGNxO9HvbMgR9rJHx1d1=5vS7id8S-bUWRASw_g@mail.gmail.com>
Message-ID: <CAGXu5j+CP9aqGNxO9HvbMgR9rJHx1d1=5vS7id8S-bUWRASw_g@mail.gmail.com>
Subject: Re: [PATCH] docs: Introduce deprecated APIs list
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 17, 2018 at 5:50 AM, Jonathan Corbet <corbet@lwn.net> wrote:
> On Tue, 16 Oct 2018 19:17:08 -0700
> Kees Cook <keescook@chromium.org> wrote:
>
>> As discussed in the "API replacement/deprecation" thread[1], this
>> makes an effort to document what things shouldn't get (re)added to the
>> kernel, by introducing Documentation/process/deprecated.rst. It also
>> adds the overflow kerndoc to ReST output, and tweaks the struct_size()
>> documentation to parse correctly.
>
> Seems like a good idea overall...a couple of quick comments
>
>> [1] https://lists.linuxfoundation.org/pipermail/ksummit-discuss/2018-September/005282.html
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> ---
>>  Documentation/driver-api/basics.rst  |  3 +
>>  Documentation/process/deprecated.rst | 99 ++++++++++++++++++++++++++++
>>  Documentation/process/index.rst      |  1 +
>
> I wonder if "process" is the right place, or core-api?  I guess we have a
> lot of similar stuff in process now.

Totally up to you. It seemed better suited for "process" (here's
things NOT to do) than "core-api" (here's things to use).

>
> [...]
>
>> +open-coded arithmetic in allocator arguments
>> +--------------------------------------------
>> +Dynamic size calculations (especially multiplication)
>> +should not be performed in memory allocator (or similar)
>> +function arguments.
>> +
>> +For example, do not use ``rows * cols`` as an argument, as in:
>> +``kmalloc(rows * cols, GFP_KERNEL)``.
>> +Instead, the 2-factor form of the allocator should be used:
>> +``kmalloc_array(rows, cols, GFP_KERNEL)``.
>> +If no 2-factor form is available, the saturate-on-overflow helpers should
>> +be used:
>> +``vmalloc(array_size(rows, cols))``.
>> +
>> +See :c:func:`array_size`, :c:func:`array3_size`, and :c:func:`struct_size`,
>> +for more details as well as the related :c:func:`check_add_overflow` and
>> +:c:func:`check_mul_overflow` family of functions.
>
> I think this should say *why* developers are being told not to do it.  Does
> this advice hold even in cases where the dimensions are known, under the
> kernel's control, and guaranteed not to overflow even on Alan's port to
> eight-bit CPUs?

I will attempt to explain this better. When all factors are constants,
the compiler will warn if there is an overflow. If, however, anything
is a dynamic size, we run the risk of overflow. It's not true in all
cases (e.g. u8 var * sizeof()) but it's more robust to globally avoid
it. (What happens when that u8 becomes a u64 at some future time?)

> To me it's also a bit confusing to present the arguments to kmalloc_array()
> as "rows" and "cols" when they are really "n" and "size".

That's true, though I used rows * cols as an example because people
aren't always thinking about their multiplications as having n-many
sizes. e.g. "I just want a full screen of pixels." Let me see if I can
adjust it...

Thanks for the feedback!

-Kees

-- 
Kees Cook
Pixel Security
