Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9D4C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 01:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242548AbiCQBNv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Mar 2022 21:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbiCQBNu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Mar 2022 21:13:50 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2FD1D313
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 18:12:35 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id w8so3197247pll.10
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 18:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:cc:references:subject
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=c2v6g9kNzFsmkyuqUh8l9rtwzjVM9fq/KxPr5NbkIAs=;
        b=e9AKGXXtjzizIENIcwCaWdrTwfytf5bMZf40wvz+UWOHrpqrfFY2A1CEHvjImudEOk
         LI5cT+7SMYg2Fe0qbmQE0NqzCS+4NsC5nS1cY2fch5UOeymVYbC3Mv42oRcXTEn83kyS
         ven1vTq/6fmAiPSvLEk5WSjqKQ7DF9nXAC9nDMoP65j1b1/0wsyYGETLE/Y8ie6dQOaC
         7KkFYCIRmduvW9mcQZ6AkpO6Zdy3Lyu/yt6AQncxJkwFbp+o7nP0OIugNfQpOtUZbwNk
         Y0XF9GNm6hWILI8WhXK+qtol+Uyb2AFH8teqYNOkjovozLgmbH7M941L3WMOeg49wUxk
         yTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
         :references:subject:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=c2v6g9kNzFsmkyuqUh8l9rtwzjVM9fq/KxPr5NbkIAs=;
        b=sfEY9I4NC6vKrhNL2PzdVQTjZdZKb66rQH2dqIqrnb1HvabTpOSv7rYHY+7jajBdj9
         YhyjNmuEwLwECi1eyXVLFZJZO1e5yE0VsygteC3SfsMnc6L+KpZZ5XnZ/iP68wX8jYpe
         eNtNvBcuUPr56u3GgNaL9qgTx2HZQEfbvjGjxUdGbdRmv6XDS6gLpHBPm6K4Ft+WoxEd
         aP/7ahOAyfG0eDTqCe6HQ6RU9n4sLjnGYL7F7dELqKJQKXo+VhaDJqJUt1EAx/QpsFjA
         EPI8Khn0trbvKXZGq2ScOFzMfAQcUndmRde+XNdVtFHN2F8bRMhf5n7NgMq4eptEMVLS
         jwIg==
X-Gm-Message-State: AOAM530vJyro/8gN3e2/VZb4+jDRnj+Jw+OIXuOPAmsO2UYfBs0AzYX7
        zvcDGxed0EDpqxct7N3zt2I=
X-Google-Smtp-Source: ABdhPJyzuWpgfqgqGQjZKI1AqhBlzu0rC4tKGt7bMpC9iXR/pvnNB02mtPpYIg+jODJFlcQ41cfn0g==
X-Received: by 2002:a17:90a:ccd:b0:1bc:76eb:ea73 with SMTP id 13-20020a17090a0ccd00b001bc76ebea73mr13041865pjt.178.1647479554678;
        Wed, 16 Mar 2022 18:12:34 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id x7-20020a17090a1f8700b001bf1db72189sm3752063pja.23.2022.03.16.18.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 18:12:34 -0700 (PDT)
Message-ID: <8c36fd06-b378-409b-6772-972b76cf630c@gmail.com>
Date:   Thu, 17 Mar 2022 10:12:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
        siyanteng01@gmail.com, siyanteng@loongson.cn,
        tangyeechou@gmail.com, tangyizhou@huawei.com, zhengbin13@huawei.com
References: <871qz1txmp.fsf@meer.lwn.net>
Subject: Re: [PATCH v2] docs: scheduler: Convert schedutil.txt to ReST
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <871qz1txmp.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

On Wed, 16 Mar 2022 15:07:10 -0600
Jonathan Corbet <corbet@lwn.net> wrote:
> Tang Yizhou <tangyizhou@huawei.com> writes:
> 
>> All other scheduler documents have been converted to *.rst. Let's do
>> the same for schedutil.txt.
>>
>> Also fixed some typos.
>>
>> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
>> ---
>> v2:
>> Remove unnecessary space-to-tab conversions.
>>
>>  Documentation/scheduler/index.rst             |  1 +
>>  .../{schedutil.txt => schedutil.rst}          | 30 +++++++++++--------
>>  2 files changed, 18 insertions(+), 13 deletions(-)
>>  rename Documentation/scheduler/{schedutil.txt => schedutil.rst} (92%)
> 
> I have applied this version.

Jon, I think you missed Peter'z (implied) Nak on this conversion.

Quote from Peter's message [1]:

> As I'm sure you're aware, I'd *love* to convert the whole lot to plain
> text again :-)
> 
> People, throughout the ages, have been able to read plain text, I don't
> see why it should be made more difficult than that.

I'd recommend you to drop this from docs-next for now.
I think this should go through -tip.

I don't want to see another unfortunate removal of doc.
Remember what happened to atomc_opt.txt:

  - conversion [2]
  - addition of alternative plaintext docs [3] (See final words in the changelog.)
  - removal [4]

[1]: https://lore.kernel.org/r/20220312114017.GA6235@worktop.programming.kicks-ass.net
[2]: 326bc876fed4 ("Documentation/atomic_ops.txt: convert to ReST markup")
[3]: 706eeb3e9c6f ("Documentation/locking/atomic: Add documents for new atomic_t APIs")
[4]: f0400a77ebdc ("atomic: Delete obsolete documentation")

        Thanks, Akira
 

> 
> Thanks,
> 
> jon
