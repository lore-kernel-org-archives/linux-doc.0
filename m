Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76375C433FE
	for <linux-doc@archiver.kernel.org>; Sun, 22 May 2022 09:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiEVJ2H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 22 May 2022 05:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235099AbiEVJ2G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 22 May 2022 05:28:06 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8BFFD2D
        for <linux-doc@vger.kernel.org>; Sun, 22 May 2022 02:28:06 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id h9so3083616pgl.4
        for <linux-doc@vger.kernel.org>; Sun, 22 May 2022 02:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LwB/xKU4WY/enzth1i6WfKkNPiEwIyP54h87i5koXm8=;
        b=OBeVDOz9F+LMSZwFEC78KULTc7uW1vAIboN/9alGHWZrGGdsPXAUa0NU0El4vDy1lY
         ZbgqhwdPx7Ojexlt7V4L7WWDH7iv/kXFxvHDZb6Htw/E9Xtpwa7SlyImby8mhp69Z6AS
         YROj1IpWpGw+2+wh9cnD8MNJkv3DbD351MHQf8EuqrfqpF19ZuDsb/J+JOrhepRwOgHj
         MocBWyNvezADoi+dqIi1ufOdsCq1rVBc5lZ6igHwxunK0wGtP1aJA5D63QyF3yzDKhZp
         3TMN5cOYJDvw9OJOC507NwiqrWjFgO9ABGqZ9J9dMDNnKtjTyMG5zIIU7M9uo3mAWXv2
         BoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LwB/xKU4WY/enzth1i6WfKkNPiEwIyP54h87i5koXm8=;
        b=E0X6kPo7gMT0fMSJmDAgqwJ6TC8kKY9Db1O9wOpUt6/ftG5gwU/HQW6p3OVrTdPifv
         4YFB5WrxsZKWbmOO+MH2Xj0u3qlv5hNsSEg3Q2YyDLQDnZCfCkpKB2O0V+01e3tBWpO5
         1Dy6w62vS4au9XvXOhPkKc/B/zmS4Xe2tnwvIevaaeAvqOC2i7vcRp7GKHcPEWrPNlCt
         Ia7Muf/pdQzaWkzxcGO4tp82TRyrLe0CmbgCr3ejdVAFn+K//0hkucJfhFVgHxxTDu7M
         Cfk/3aVkf3zaMjE+mlXf9v5C+f7wSZhJ820GJHrd3V9J6TPSPk1ZZI96m/NVIHkFPMlq
         kTfg==
X-Gm-Message-State: AOAM530bHxmvPC+XLBfFVBclay6PNa6rtv/sD3WMToAjMlVOziR+pu5k
        /qVXrah9HeXJEy8ZHBqRC4mJUTcqxEo=
X-Google-Smtp-Source: ABdhPJyiXw6MFxfmdxDTWuPWeXbnlyfqFsxXlqGYTIYLC5gccjRO7MQJx/SRBXk+s7cAVk0gVnUacA==
X-Received: by 2002:a05:6a00:140f:b0:4e0:6995:9c48 with SMTP id l15-20020a056a00140f00b004e069959c48mr18284247pfu.59.1653211685533;
        Sun, 22 May 2022 02:28:05 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id k193-20020a633dca000000b003f60a8d7dadsm2657428pga.15.2022.05.22.02.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 May 2022 02:28:04 -0700 (PDT)
Message-ID: <57a0cd2a-b4fb-2063-d3a7-09a6e292b2c7@gmail.com>
Date:   Sun, 22 May 2022 18:28:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: "WARNING: Duplicate C declaration" from recent Sphinx (was Re:
 [PATCH] docs: sphinx/requirements: Limit jinja2<3.1)
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Akira Yokosawa <akiyks@gmail.com>
References: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
 <871qyk7p28.fsf@meer.lwn.net> <20220330022534.10ac0a50@coco.lan>
 <ed2690db-84ae-5c85-f65d-e08021f5f562@gmail.com>
 <20220330190724.1596e01a@coco.lan>
 <edf80179-4776-773d-0c4a-e75a1824bfba@gmail.com>
 <564cbd05-8788-9223-1ecc-59e7fc41b46a@gmail.com>
 <20220521114629.6ee9fc06@coco.lan>
 <6476f6e7-0fc9-a55a-cafc-7b2fc31f6d51@gmail.com>
 <20220522070707.313e6558@coco.lan>
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220522070707.313e6558@coco.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 22 May 2022 07:07:07 +0200,
Mauro Carvalho Chehab wrote:
> Em Sun, 22 May 2022 09:57:45 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
> 
>> On Sat, 21 May 2022 11:46:29 +0200,
>> Mauro Carvalho Chehab wrote:
>> [...]
>>>
>>> Sphinx 4.0 and above: it is now possible to add a namespace. This allows
>>> fixing things like read() system calls that have different meanings on
>>> different subsystems.
>>>
>>> On other words, only with Sphinx 4.0 and above, the cross-references
>>> for C domain symbols should all be OK.  
>>
>> So, I noticed there is a PR at https://github.com/sphinx-doc/sphinx/pull/8313
>> which is still open.
> 
> Are you sure? I always believed that this (or a variant of it) got 
> merged on 4.0.

Hmm, I'm afraid I don't think it has ever did.

In the discussion of the PR, you commented on 15 Oct 2020 at
https://github.com/sphinx-doc/sphinx/pull/8313#issuecomment-708977457:

> On a quick test, the remaining warnings I was getting with the Linux
> Kernel docs with Sphinx 3.x have gone after this patch set.
> 
> Thanks!
>
> I'm looking forward to see those patches applied to 3.2.2 ;-)

So you might have thought that the issue was already resolved.

> 
>>
>> This PR is supposed to resolve "WARNING: Duplicate C declaration"
>> due to struct and function with the same name, isn't it?
>>
>> Are you sure the issue is resolved in Sphinx 4.0 and later?
> 
> You need to ping Sphinx C domain maintainer to be sure. This was
> the author of the PR by the time I looked into it, but I'm not
> tracking Sphinx development, so things might have changed.

Later on in the discussion, @jakobandersen reported the status of
the PR on 2 Apr 2021 at:
https://github.com/sphinx-doc/sphinx/pull/8313#issuecomment-812408069.

If I understand the complex comment correctly, there is another PR at
https://github.com/sphinx-doc/sphinx/pull/8929 as a prerequisite
to PR 8313.

PR 8929 now belongs to the 5.x milestone (missed 5.0.0). PR 8313 has never
had a milestone assigned.  So it looks to me like things are progressing
very slowly and we need to wait another release or two at least.

Of course, all of this is just my interpretation without knowing any
of Sphinx development and might be wrong in many aspects.

        Thanks, Akira

> 
> Thanks,
> Mauro
