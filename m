Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71258C7619A
	for <linux-doc@archiver.kernel.org>; Mon, 27 Mar 2023 13:05:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjC0NFW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Mar 2023 09:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbjC0NFV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Mar 2023 09:05:21 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75125AF
        for <linux-doc@vger.kernel.org>; Mon, 27 Mar 2023 06:05:18 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id cn12so35928450edb.4
        for <linux-doc@vger.kernel.org>; Mon, 27 Mar 2023 06:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google; t=1679922317;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUedMoE14JQ28fok10enBbyDNKiAv+6x2jhiRaNAMrQ=;
        b=q3g2IUSeGBLtR4VAoubgIg8uzHTrexKkK19JfvoK50i3hZgdovxZoLoelnLSXQonTU
         5835oKTmd3bkY3veUkU2BaWjOTFaErD8ndQALmRjuMEQWA5JgVX25TsxgwRVFWlYbwfv
         zsB3bp1e1RUWEttMSJvOyKS7GRv5NYLlXtjFi/XUCBYBmngWCJ/fOf2Zl3CaEmWOut6P
         l/RFjGqHPn3fpUUw/Y3xI3jKnsFFbueEWtXrq7dRbr7t1ydqfV0pbXCnQXIV0PhEF6wa
         ZLvQ1YS88ycDtak3To96ECqux0DDRyZiAGZc4BJp7LLmJof3VZYQXdU4twNzj7Yh1FkP
         1fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679922317;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUedMoE14JQ28fok10enBbyDNKiAv+6x2jhiRaNAMrQ=;
        b=2o1Ow6ghUtBaiYQ/Ecr73U4eObvUZaOJTjlImE1ov3ui8vq9alr1Dy6tVRwCK0ziF/
         SCtWywhHUyp4eoP8bKZJfjXey43EWVIl9Ek1NhxjHcvTWQt84jiVdd5xgXucCVe3erfj
         f3E3+Iczz4OuQjTn3YrljKAn0glWf2IjARpyZ7YeDdZbQzoLHQ90ceGDfwjXtNV9UcMU
         G0ff+CKKmyIj/TfVoIWHa+3FhDx3FfCR0fXMCK/qHaFvTJ932cOtAYnTcjapPkkC7pcH
         E8J0ERDkkGRASXRh8DZpl1K21YAAGkbGhL43Em52eHJHyEeG1QZsvTYe+QaejI7Vvu5r
         nsSA==
X-Gm-Message-State: AAQBX9dmY3HR2FEKqQSoiHqHltbd+9DCGkJORn7+WlGLZ2/VifcAT5hN
        QnGoCSjQgbMgXPUdB9hwqFKCdQ==
X-Google-Smtp-Source: AKy350b8SuxITm8TpdYemMwCmE2tqKvi1KpZiRhxEdvVPCZnD0RBwmihbZkQCZjH4l2/Lo8nVTxYDw==
X-Received: by 2002:a17:906:7e4a:b0:93d:f7a6:219b with SMTP id z10-20020a1709067e4a00b0093df7a6219bmr11766956ejr.65.1679922316865;
        Mon, 27 Mar 2023 06:05:16 -0700 (PDT)
Received: from [10.44.2.5] ([81.246.10.41])
        by smtp.gmail.com with ESMTPSA id sd24-20020a170906ce3800b00931024e96c5sm14247420ejb.99.2023.03.27.06.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 06:05:16 -0700 (PDT)
Message-ID: <9462668e-dbaf-8df8-8ba2-86f9511294ac@tessares.net>
Date:   Mon, 27 Mar 2023 15:05:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/2] docs: process: allow Closes tags with links
Content-Language: en-GB
To:     Thorsten Leemhuis <linux@leemhuis.info>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        =?UTF-8?Q?Kai_Wasserb=c3=a4ch?= <kai@dev.carbon-project.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mptcp@lists.linux.dev
References: <20230314-doc-checkpatch-closes-tag-v2-0-f4a417861f6d@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v2-1-f4a417861f6d@tessares.net>
 <29b2c9c1-f176-5e42-2606-94b4bc6d4c45@leemhuis.info>
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <29b2c9c1-f176-5e42-2606-94b4bc6d4c45@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Thorsten,

Thank you for your reply!

On 26/03/2023 13:28, Thorsten Leemhuis wrote:
> On 24.03.23 19:52, Matthieu Baerts wrote:
>> Making sure a bug tracker is up to date is not an easy task. For
>> example, a first version of a patch fixing a tracked issue can be sent a
>> long time after having created the issue. But also, it can take some
>> time to have this patch accepted upstream in its final form. When it is
>> done, someone -- probably not the person who accepted the patch -- has
>> to remember about closing the corresponding issue.
>>
>> This task of closing and tracking the patch can be done automatically by
>> bug trackers like GitLab [1], GitHub [2] and hopefully soon [3]
>> bugzilla.kernel.org when the appropriated tag is used. The two first
>> ones accept multiple tags but it is probably better to pick one.
>>
>> [...]
>>
>> diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
>> index 7a670a075ab6..20f0b6b639b7 100644
>> --- a/Documentation/process/5.Posting.rst
>> +++ b/Documentation/process/5.Posting.rst
>> @@ -217,6 +217,15 @@ latest public review posting of the patch; often this is automatically done
>>  by tools like b4 or a git hook like the one described in
>>  'Documentation/maintainer/configure-git.rst'.
>>  
>> +Similarly, there is also the "Closes:" tag that can be used to close issues
>> +when the underlying public bug tracker can do this operation automatically.
>> +For example::
>> +
>> +	Closes: https://example.com/issues/1234
>> +
>> +Private bug trackers and invalid URLs are forbidden. For other public bug
>> +trackers not supporting automations, keep using the "Link:" tag instead.
>> [...]
> 
> This more and more seems half-hearted to me.
> 
> One reason: it makes things unnecessarily complicated for developers, as
> they'd then have to remember `is this a public bug tracker that is
> supporting automations? Then use "Closes", otherwise "Link:"`.
> 
> Another reason: the resulting situation ignores my regression tracking
> bot, which (among others) tracks emailed reports. It would benefit from
> "Closes" as well to avoid the ambiguity problem Konstantin brought up
> (the one about "Link: might just point to a report for background
> information in patches that don't address the problem the link points
> to"[1]. But FWIW, I'm not sure if this ambiguity is much of a problem in
> practice, I have a feeling that it's rare and most of the time will
> happen after the reported problem has been addressed or in the same
> patch-set.

Even if they are rare, I think it might be good to avoid false-positives
that can be frustrating or create confusions. Using a dedicated tag plus
some safeguards help then be required. (And it is not compatible with
existing forges.)

> I thus think we should use either of these approaches:
> 
> * just stick to "Link: <url>"
> 
> * go "all-in" and tell developers to use "Closes: <url>"[2] all the time
> when a patch is resolving an issue that was reported in public
> 
> I'm not sure which of them I prefer myself. Maybe I'm slightly leaning
> towards the latter: it avoids the ambiguity, checkpatch.pl will yell if
> it's used with something else than a URL, it makes things easier for
> MPTCP & DRM developers, and (maybe most importantly) is something new
> developers are often used to already from git forges.

I think it makes sense not to restrict this tag to bug trackers with
automations as long as they are public of course. After having looked at
the comments from v1, I didn't feel like it would have been OK to extend
its usage but I can send a v3 taking this direction hoping to get more
feedback. After all, thanks to regzbot, we can also say that there are
some automations behind lore.kernel.org and other ML's :)

If we do that, would it be blocking to have this included in v6.3?

> [1]
> https://lore.kernel.org/linux-doc/20230317185637.ebxzsdxivhgzkqqw@meerkat.local/
> 
> [2] fwiw, I still prefer "Resolves:" over "Closes". Yes, I've seen
> Konstantin's comment on the subtle difference between the two[3], but as
> he said, Bugbot can work with it as well. But to me "Resolves" sounds
> way friendlier and more descriptive to me; but well, I'm not a native
> speaker, so I don't think my option should count much here.

As a non-native speaker, I'm open to use either of them. But as a
developer, I feel like I'm more used to see the "Closes:" tag than the
"Resolves" one.

When looking at the Git history, the "Closes:" tag with a link has been
used ~500 times, compared to ~14 times for "Resolves:". Maybe "Closes:"
is more natural for developers who first want to have their assigned
tickets being "closed" automatically than issues being "resolved"? :)

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
