Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ECA6C7D099
	for <lwn-linux-doc@archive.lwn.net>; Fri, 28 Sep 2018 20:54:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbeI2DUH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 28 Sep 2018 23:20:07 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:36337 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbeI2DUG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Sep 2018 23:20:06 -0400
Received: by mail-yw1-f67.google.com with SMTP id e201-v6so3215779ywa.3
        for <linux-doc@vger.kernel.org>; Fri, 28 Sep 2018 13:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=eo/Y9cUiTa2FJkL9XobLvlA6LGBEt5Rqn8JaEc6iKEA=;
        b=KYA1GWYhgim1f3rgeiEzJeYK5w0RKRABJKgJw/mdcckCmjBKBWlUUf1wI6wwy6iBoR
         huHD9F3KL9DOvLGb6Tfn98L8B1ReFdxqUwNKbkJTv8wZA+0aXOY3uhP48jJD/wBMpNCA
         8XRevKKdGAEElqKAfmwnjKOMyv/urFmzixK5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=eo/Y9cUiTa2FJkL9XobLvlA6LGBEt5Rqn8JaEc6iKEA=;
        b=RA7NNudDhvBrB7E+hdYLhkr3SWFxBO6OYxHZAP33yCvkHv1ANetuDSvzv4xuy2Qv2L
         dgyVqc/G6O4YOfeXiEFB3PAyo4JXVCWQ0DM3TyVi5LByzl7Z7CE9oI2jtW1qmReC0NHP
         bctnPVEqOWsRHWP1nXlO0kNVNKMU33g+zy3wfG3K8R8zYE/aTpbI+YwyMXvdplUpUVUD
         n6XXjn5KeqXql0rgVig7ho46RYRf7ykJISdBG3lV6GQk2fVqo5Cp7YhKSG2+Ona2gO0s
         VzFlKmqM/RCP/vivj0jyaASH3uVAuEfUQSfwSCE8cGhHehV+e+ckHAuUYrt2z21JvBw8
         YVvQ==
X-Gm-Message-State: ABuFfohxeMTsb9cy2UhysnWCJi5xPQwIAmhFCGNsqRcC3RoimJFvla/E
        ikrviuPw8//rAhC7nX+R/9/nuRYcln0=
X-Google-Smtp-Source: ACcGV63DEF5zuaoSmpQU3GARtA1aSN/4AJ0WiUGliOPzCAQ6pubVPyP+kCFlDAZv/zbHuKrGhRVHaA==
X-Received: by 2002:a81:7b06:: with SMTP id w6-v6mr203230ywc.167.1538168076053;
        Fri, 28 Sep 2018 13:54:36 -0700 (PDT)
Received: from mail-yw1-f41.google.com (mail-yw1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id x129-v6sm2555270ywg.77.2018.09.28.13.54.34
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Sep 2018 13:54:34 -0700 (PDT)
Received: by mail-yw1-f41.google.com with SMTP id e201-v6so3215696ywa.3
        for <linux-doc@vger.kernel.org>; Fri, 28 Sep 2018 13:54:34 -0700 (PDT)
X-Received: by 2002:a81:2288:: with SMTP id i130-v6mr224963ywi.288.1538168074051;
 Fri, 28 Sep 2018 13:54:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Fri, 28 Sep 2018 13:54:33
 -0700 (PDT)
In-Reply-To: <145fab48-969f-0aed-74e8-ac0a5bb1c79b@tycho.nsa.gov>
References: <20180925001832.18322-1-keescook@chromium.org> <e6122c7d-bd29-d081-3c1e-96b7c369d4fe@schaufler-ca.com>
 <CAGXu5jKQVDW8Wp0ESv2raa0xJnHCCMNqFCzZ5jSVXQ=Dp7FF8A@mail.gmail.com>
 <cb49b4c4-a379-7a8e-41a6-6e6a4afb6fe5@tycho.nsa.gov> <145fab48-969f-0aed-74e8-ac0a5bb1c79b@tycho.nsa.gov>
From:   Kees Cook <keescook@chromium.org>
Date:   Fri, 28 Sep 2018 13:54:33 -0700
X-Gmail-Original-Message-ID: <CAGXu5jKX9VCFqRrchr55_977kOA=1WzdB+YcEZq0y5CPcsp7Zw@mail.gmail.com>
Message-ID: <CAGXu5jKX9VCFqRrchr55_977kOA=1WzdB+YcEZq0y5CPcsp7Zw@mail.gmail.com>
Subject: Re: [PATCH security-next v3 00/29] LSM: Explict LSM ordering
To:     Stephen Smalley <sds@tycho.nsa.gov>
Cc:     Casey Schaufler <casey@schaufler-ca.com>,
        James Morris <jmorris@namei.org>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Paul Moore <paul@paul-moore.com>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        LSM <linux-security-module@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 28, 2018 at 1:33 PM, Stephen Smalley <sds@tycho.nsa.gov> wrote:
> On 09/28/2018 04:25 PM, Stephen Smalley wrote:
>>
>> On 09/28/2018 04:01 PM, Kees Cook wrote:
>>>
>>> On Fri, Sep 28, 2018 at 8:55 AM, Casey Schaufler <casey@schaufler-ca.com>
>>> wrote:
>>>>
>>>> On 9/24/2018 5:18 PM, Kees Cook wrote:
>>>>>
>>>>> v3:
>>>>> - add CONFIG_LSM_ENABLE and refactor resulting logic
>>>>
>>>>
>>>> Kees, you can add my
>>>>
>>>>          Reviewed-by:Casey Schaufler <casey@schaufler-ca.com>
>>>>
>>>> for this entire patch set. Thank you for taking this on, it's
>>>> a significant and important chunk of the LSM infrastructure
>>>> update.
>>>
>>>
>>> Thanks!
>>>
>>> John, you'd looked at this a bit too -- do the results line up with
>>> your expectations?
>>>
>>> Any thoughts from SELinux, TOMOYO, or IMA folks?
>>
>>
>> What's it relative to?  First patch fails for me on current security/next.
>
> Never mind - user error ;)

FWIW, it's against v4.19-rc2.

>> Is there a branch in your repo that has the v3 patches?
>
> But still wondered about this one.

Oops! Sorry, I didn't push to kernel.org. Now pushed!

https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=lsm/ordering-v3

(and "preview" v4 also with Reviewed-bys added and a cosmetic fix.)

-Kees

-- 
Kees Cook
Pixel Security
