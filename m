Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 598617D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 00:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388809AbeIUG0Q (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 02:26:16 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:45263 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388787AbeIUG0Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 02:26:16 -0400
Received: by mail-yw1-f66.google.com with SMTP id p206-v6so4530550ywg.12
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 17:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=SwccCbkUX+HHUBGdWYMks7d98ul3uAqb/zyYWmMv+PQ=;
        b=MNfKiA6Nli4ZGb2UDRvpFWgab/5Ql74SKHXBn49Pf076YnZwIGfY5dLmoueoUGT6D8
         R4saBLjMH79HFud92AUVVkwOf50ItQOGaN8upC4FoOzyxoKgz++S0RB/iU1UfwPvXc5d
         xvjhOvqp0Konvjb9DJA3hjkSKxFkmY3+zKkj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=SwccCbkUX+HHUBGdWYMks7d98ul3uAqb/zyYWmMv+PQ=;
        b=ovzLJ8KDZVaguy3aopUMqIudSp/CSR0hLXfvCiv+OrhCKgCajjFTWi3dNUdvRurMkn
         KGXtyyztmpqSbirjic4z3lZCOuwTOXenIGh3ETZpD+yThu5S1rWB1zy6XNx3okfsZA0n
         6HIrLsxNBR8R8yZK9suygSH2k2tD+OdZOCjsICGb2ZOmTNUtWsBRwL09L9SJc/VMEyRG
         qIEiYs66LSSwIz8gikOWIlK6PGaW4gt0EW/bbirNyOV3A5unL0TQvHtp+8i28+dSaDhQ
         1gkxgFSVllN/49JHx1c2yrqkdqtcB29qLFMGe/f6N7OnaqgdbJNLG7r1iAOgDfkfFfNb
         pHcg==
X-Gm-Message-State: APzg51CcM/6kkUL1KexAD/0RmL+pVOPG2zFn2E8PQT/6737/RCja0q34
        FLzmk8qznCOM8W8YJ+pFMBGgmRizSEk=
X-Google-Smtp-Source: ANB0VdajVZdZ3bnYkQ5MTWO7Bo/FjKGQhYPATJhaLIXltL8xddai+Y0up4+MO137a1jdPpwI09qOAg==
X-Received: by 2002:a0d:eec4:: with SMTP id x187-v6mr19550577ywe.360.1537490404263;
        Thu, 20 Sep 2018 17:40:04 -0700 (PDT)
Received: from mail-yw1-f48.google.com (mail-yw1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id o63-v6sm3543704ywc.36.2018.09.20.17.40.02
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Sep 2018 17:40:02 -0700 (PDT)
Received: by mail-yw1-f48.google.com with SMTP id 14-v6so4545538ywe.2
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 17:40:02 -0700 (PDT)
X-Received: by 2002:a0d:fe87:: with SMTP id o129-v6mr2415541ywf.237.1537490401910;
 Thu, 20 Sep 2018 17:40:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:5f04:0:0:0:0:0 with HTTP; Thu, 20 Sep 2018 17:40:01
 -0700 (PDT)
In-Reply-To: <71f833b8-40cb-83f8-6803-7df26e8fa460@schaufler-ca.com>
References: <20180920162338.21060-1-keescook@chromium.org> <20180920162338.21060-21-keescook@chromium.org>
 <71f833b8-40cb-83f8-6803-7df26e8fa460@schaufler-ca.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Thu, 20 Sep 2018 17:40:01 -0700
X-Gmail-Original-Message-ID: <CAGXu5jLn_=pOTcnAo3m2h5i8yEhwf29qSqbv6N9LPcqdUntKQw@mail.gmail.com>
Message-ID: <CAGXu5jLn_=pOTcnAo3m2h5i8yEhwf29qSqbv6N9LPcqdUntKQw@mail.gmail.com>
Subject: Re: [PATCH security-next v2 20/26] LSM: Introduce "lsm.order=" for
 boottime ordering
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     James Morris <jmorris@namei.org>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
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

On Thu, Sep 20, 2018 at 5:12 PM, Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 9/20/2018 9:23 AM, Kees Cook wrote:
>> Provide a way to reorder LSM initialization using the new "lsm.order="
>> comma-separated list of LSMs. Any LSMs not listed will be added in builtin
>> order.
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> ---
>>  Documentation/admin-guide/kernel-parameters.txt |  5 +++++
>>  security/security.c                             | 15 ++++++++++++++-
>>  2 files changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index 32d323ee9218..5ac4c1056ffa 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -2276,6 +2276,11 @@
>>
>>       lsm.debug       [SECURITY] Enable LSM initialization debugging output.
>>
>> +     lsm.order=lsm1,...,lsmN
>> +                     [SECURITY] Choose order of LSM initialization. Any
>> +                     builtin LSMs not listed here will be implicitly
>> +                     added to the list in builtin order.
>
> Added at the end of the list, or beginning of the list?

Whoops, I had an earlier version that was more clear. I meant to say
"appended" instead of "added" here. Fixed for the next version.

-Kees

-- 
Kees Cook
Pixel Security
