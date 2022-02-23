Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59220C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 23 Feb 2022 15:05:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234824AbiBWPGR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Feb 2022 10:06:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234957AbiBWPGQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Feb 2022 10:06:16 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1FC2B82CE
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 07:05:48 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id x18so15570157pfh.5
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 07:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9yHD0zvAwqNw2lJD1hjzy2NCI9/Hnf5Wjr2aUksX+K0=;
        b=q4RGIMg1LCpM10nhlPx00+DmNLvjshSP51Dy17VdrSLgb8wjKHLgWegcYUOmZwE25l
         3avlZwM7EBCAcUjmO8YUS+9+EK/23BIEymwWIPFeOElgNNQzwlKzqJQpGP9qtzLz0WRU
         ayUmo/5rmg/3NioleTElZ8aeFyhMCIV+lJEYAkpMUn+5bJtqMbv8b7P1gx994Yv7wJfw
         H0yUYVaaQTNW3qBZS8Y74doSU1I0//SDn9Tza9N5TbC8K637D5/HlSbKktYlUm5ZHzn1
         0N3SZUju6yomxIGEEAs26VSWHbT7iBIAEkw73la/4kxLqJ344qp+oQz9h9H4K4LyPGV1
         m7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9yHD0zvAwqNw2lJD1hjzy2NCI9/Hnf5Wjr2aUksX+K0=;
        b=NuhnA1fbMdFyMTrPuBG65xA6nahfsMX0hIBIQ0DvMthntM7y/AWT2Ta5AasuD3kCBh
         De0DxDxNngEvRsxAcbfxNX+UatXcoAxm0vLAMtNM2lB0WPFwzBR1UxPbNqHhUqHSO4r4
         Io6zMmEZ+8RxpYpFRqy1QnGQOQUfgq+6SmY26hX/SuCk5LQIu3kpS1oEX5LKfgQoWt9P
         4wuxZuKD5gZycet92R1k92qYFLRUZ8cgsfgwyz7rzpmSzfC4Hw7pxjxT4PDKyEX14qRP
         PaXSxGXJt09ap+q3rh3AUmLFOif7UZ5Unvf7ZVvTNjASRCShXnnz0+1qCJDYESvcvSaa
         gUNQ==
X-Gm-Message-State: AOAM533QOzZINmT8PpRB7Snk5rabU6rryJxnj8a6XTjeykkiVjzmu8Rj
        NLGrwq6NZi52FUEKs7GHn9lQG4yMQG0=
X-Google-Smtp-Source: ABdhPJx34aezyYu9AHI16xINXQzT7b9tyc7j8vgrThVhvNdsasguvFoiiU5e2xjAaNcJZIahBK9QCw==
X-Received: by 2002:a63:474f:0:b0:374:7607:e45 with SMTP id w15-20020a63474f000000b0037476070e45mr5341pgk.234.1645628748281;
        Wed, 23 Feb 2022 07:05:48 -0800 (PST)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id r4sm14355391pgh.27.2022.02.23.07.05.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 07:05:47 -0800 (PST)
Message-ID: <6a057644-7266-8c6b-76be-09b8d205e4d9@gmail.com>
Date:   Thu, 24 Feb 2022 00:05:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 00/11] Transform documentation into POD
Content-Language: en-US
To:     =?UTF-8?B?VG9tYXN6IFdhcm5pZcWCxYJv?= <tomasz.warniello@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>, corbet@lwn.net,
        linux-doc@vger.kernel.org
References: <525f3696-91f4-5a4a-c9ef-24758ccaa2bb@infradead.org>
 <ff98f455-0221-7ff0-08ed-8dea9f08694b@gmail.com>
 <939ef119-8a84-9206-bd7c-cfd215bb0200@gmail.com>
 <20220223135548.27babd85@fuji.fritz.box>
 <1abcb226-dbfd-b3d2-5453-208af7faa0c2@gmail.com>
 <20220223150403.350ba3d0@fuji.fritz.box>
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220223150403.350ba3d0@fuji.fritz.box>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[-CC lkml]
On Wed, 23 Feb 2022 15:04:03 +0100,
Tomasz Warnie=C5=82=C5=82o wrote:
> On Wed, 23 Feb 2022 22:16:30 +0900
> Akira Yokosawa <akiyks@gmail.com> wrote:
>=20
>> When I do "man perl", I want to see a detailed explanation, and
>> somewhat hard-to-parse synopsis is ok.
>>
>> I'm saying that I don't like to see such a thing when I type
>> "./scripts/kerneldoc -h".  I expect a hint to recall which option I
>> should use.  I don't want to scroll back the terminal.
>>
>> It would be nice if the verbose man page can be shown by
>> "./scripts/kerneldoc -v -h" or "perldoc -F ./scripts/kerneldoc".
>=20
> This is an option. But it makes things more complex. I'd rather reduce
> the easy in favour of the difficult.

I'd say _not_ introducing POD is the simplest, but I guess you have
another thought.

>=20
>>>>> I don't see much point for such a non-user-facing script having nic=
e-looking
>>>>> well-structured documentation in the first place. =20
>>>
>>> You're touching the very essence of kernel-doc here. What and who is =
it for?
>>> Not just the script - all of it. =20
>>
>> Sorry, I have no idea what I am being asked.
>> Could you rephrase above for a non-native speaker of English, please?
>=20
> Who is the "user"? Most of Linux users never even browse the source cod=
e.

Apparently, users of ./scripts/kernel-doc are who run "make htmldocs" or
"make pdfdocs", a relatively small portion of Linux kernel development
community, I guess.  Note that they don't have direct interactions with
=2E/scripts/kernel-doc in most (>95% ??) cases.

Normal Linux end-users don't bother with kernel-doc, I guess.

If you are interested in how the kernel dev community works, I'd
recommend starting from "Working with the kernel development community"
at https://www.kernel.org/doc/html/latest/process/index.html, that is
if you have not done so.

        Thanks, Akira

>=20
> Tomasz
