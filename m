Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 964697D088
	for <lwn-linux-doc@archive.lwn.net>; Tue, 23 Oct 2018 18:50:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbeJXDPD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 23 Oct 2018 23:15:03 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:42363 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728099AbeJXDPC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Oct 2018 23:15:02 -0400
Received: by mail-yb1-f193.google.com with SMTP id o204-v6so1008779yba.9
        for <linux-doc@vger.kernel.org>; Tue, 23 Oct 2018 11:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=MLwe1V3+WJhm5IZOKBCWNwMrf6D/NJnM+bO9U6nJ9WI=;
        b=PWSrGUObF5SXc5Gy1kASJRkZcqkf5AaV68TJcvLo9+ZpDzbkyyQnt7RGDTsvNkUIpl
         YXGOhnMSilor+kLqcNu0xBBwrk77xeqXIoILYfus1H/+A1kA2ZAXED3/5QYkaKeHU3hA
         MNRhWWUFNF65xWLVx0vrJke+PykxNIFOanEZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=MLwe1V3+WJhm5IZOKBCWNwMrf6D/NJnM+bO9U6nJ9WI=;
        b=VQRcn3faL29QRoeeevMx1f7j/Rc7AeGL/IC1lm5YDqGcC0YmyAD7A0UAXFjlySjILe
         lT4mK6thBGwWTTHI2fTx5BWyfBv2GGplvKx2aZ8rOT6wwoeXBvcqdXwlOcDxOhuP/5V2
         w5SIH4ykjrntaFD9SeM63wpfNj5W1fQ3G6kJjn+IdNbLc1lB5NlwLnq0DttpnUIsWxpK
         WFozX4QfIJd/p2+PJleY8mC5p9S0YLZUTBJUY6iLGo7jtc/dm5X73reAc9ZB8fvOeTGH
         Z7ltAZp854O/FMxZM1+RaNVefjmAK/FzFWmWe3N4mRk41XnSyh2bP2hNHqjLRlVqs5Yk
         9D+g==
X-Gm-Message-State: ABuFfoiLNHy4Xx4/UFTJaz4u5YBtyAj7Msu0YAsXBDGUum0Fy1n7LZTt
        /YIdUvilrWM0RwYbym7OZwqXJgF1wqE=
X-Google-Smtp-Source: ACcGV605zGIAmQZCQlYnFhHOpZFJSyum214Ox4NSk+DNe6sDAdOxi/YUMjEglHfQ6cTPqVasp2VsaA==
X-Received: by 2002:a5b:acd:: with SMTP id a13-v6mr26500865ybr.421.1540320624905;
        Tue, 23 Oct 2018 11:50:24 -0700 (PDT)
Received: from mail-yw1-f48.google.com (mail-yw1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id 207-v6sm527745yww.21.2018.10.23.11.50.22
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Oct 2018 11:50:23 -0700 (PDT)
Received: by mail-yw1-f48.google.com with SMTP id 135-v6so987756ywo.8
        for <linux-doc@vger.kernel.org>; Tue, 23 Oct 2018 11:50:22 -0700 (PDT)
X-Received: by 2002:a81:9b83:: with SMTP id s125-v6mr36333374ywg.47.1540320621970;
 Tue, 23 Oct 2018 11:50:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:3990:0:0:0:0:0 with HTTP; Tue, 23 Oct 2018 11:50:21
 -0700 (PDT)
In-Reply-To: <96e92224-aedf-5026-d6dd-b29121b4dc0d@schaufler-ca.com>
References: <20181011001846.30964-1-keescook@chromium.org> <CAGXu5jLBaHj5MhXaK-8zdu6Rgo2B6rEq+at17xZ1Puct+YUajQ@mail.gmail.com>
 <ZhaXhoElmWQlsxHmgFHpB2xSWzJYFZWBasrSKQNjGj4_T2A4AY2F9v1rP9LkUfilUbZ0ExWXX9koLNjUM8S6baX6xfSSMPXY_CpihbCetVc=@protonmail.ch>
 <CAGXu5j+kekUdcE2EhUu__8MXJ1O+D=-zTXLGNCRVa_VyDxePpw@mail.gmail.com>
 <f68e5f4b-6360-a9e7-597f-89d1d3ca73c1@canonical.com> <32stV62RmME8Dj5jKB8Z03zPe_Et72kMo71D8SpgSOHUo6SaROc8DomMWdk5jDGpyqVd8T63NIIK2NdDw95clpF8Uj47Wca2FBFItXDRh7E=@protonmail.ch>
 <38dde301-d77e-35fd-88d4-5cdc5b570ee8@canonical.com> <_CkJnKYmEZ4ZF0JtsSYuahAd9sgnX9OtcstjXaeqb8wn5uxfimc6S4jomly7If9VqnOXqXwaiCbJ9ttS6NiqE7n6cQUlwLvfO53paLmacvU=@protonmail.ch>
 <8251564f-ba7a-1777-a606-dec472b32f35@canonical.com> <CAGXu5j+2yVZ5DQHyqvJKnSYYqRCzeMtEabBwYFOWkTcwMUWhEw@mail.gmail.com>
 <96e92224-aedf-5026-d6dd-b29121b4dc0d@schaufler-ca.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 23 Oct 2018 11:50:21 -0700
X-Gmail-Original-Message-ID: <CAGXu5jKFqtV_NFRaXPKVgNQt3F1pwFqopDLp1ZQJDGM_Bdid6Q@mail.gmail.com>
Message-ID: <CAGXu5jKFqtV_NFRaXPKVgNQt3F1pwFqopDLp1ZQJDGM_Bdid6Q@mail.gmail.com>
Subject: Re: [PATCH security-next v5 00/30] LSM: Explict ordering
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     John Johansen <john.johansen@canonical.com>,
        Jordan Glover <Golden_Miller83@protonmail.ch>,
        James Morris <jmorris@namei.org>,
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

On Tue, Oct 23, 2018 at 9:48 AM, Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 10/12/2018 12:01 PM, Kees Cook wrote:
>> On Friday, October 12, 2018 3:19 AM, John Johansen
>> <john.johansen@canonical.com> wrote:
>>> It isn't perfect but it manages consistency across distros as best as
>>> can be achieved atm.
>> Yeah, this is why I'm okay with the current series: it provides as
>> consistent a view as possible, but leaves room for future improvements
>> (like adding "+" or "!" or "all" or whatever).
>>
>> I'm curious to see what SELinux folks think of v5, though. I *think* I
>> addressed all the concerns there, even Paul's "I want my distro
>> default to not have extreme stacking" case too.
>>
>> -Kees
>
> Looks like I should go on vacation more often. :)
>
> I am generally opposed to fancy specification languages.
> I support the explicit lsm= list specification because you
> don't have to know any context to create a boot line that
> will work, and be as close to what you've specified as possible
> for the kernel configuration. One need look no further than
> the mechanisms for setting POSIX ACLs for an example of
> how to ensure a feature isn't used.
>
> Had we the foresight to make security= take a list of
> modules when Yama was added we might have avoided some of
> this brouhaha, but there was no reason to expect that stacking
> was ever going to happen back then.

This sounds like an "Ack" for you? :) I'll harass everyone in person
in a couple days.

Did you poke around at my combined series?
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=lsm/ordering-v6-blob-sharing

-Kees

-- 
Kees Cook
Pixel Security
