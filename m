Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D0DC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 30 Mar 2022 01:29:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241634AbiC3Ba4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Mar 2022 21:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238211AbiC3Baz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 21:30:55 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEBDEB1AAA
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 18:29:11 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id e5so19183157pls.4
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 18:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vdcHUSnfczDmZ92O3lL/dDt7YGRkLfEex18Xs8F30qI=;
        b=O1j2QAl7SuyX3NTphMvJj4YeqFmV9fx+UApUt1v9oieM+FJ5/DA4peyz9HQhXBvCLm
         698nxhPVpyhjR2/d8sMfb5aqAgrnS38bfEYmjU4d8Jdscd1zWhe8/xlsLiJdQDjwjMbe
         OdZMpdD0q0Ht/oEDCR6mMbBtRkHZRXOGrh1FBnV1wTCYPsq7I+N+EMJuMqBCezpsujyg
         5q8TZGsnxSvB9ixsWZV7/Qj16cY5F52tfKZfhTZoH/JMFdedkV0SSGh9LmXw82TEoIFa
         VqRb5mK8qBjJ3AGmMUlQ/z1J6vx0t5hk/O3jdRZkpyYK4JvCdccgwNP+ds/GOuZV0LNx
         Uwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vdcHUSnfczDmZ92O3lL/dDt7YGRkLfEex18Xs8F30qI=;
        b=oZ4EzC+G+rmRCEGyUHSn+1B47jfJgWZ0M92LQSd9Y/I4kxqPvqXU67DTAgLq311+NJ
         TUcJiOjBZNKR48BzRDN8y8Ezo4TR+os2zAH6hxDxLgIFGNLja4PNqoQLZu8w9Yz4gfZN
         RPn93A5pOVoqmlVz0849CifjJAy5BBBnrvsiSkbt/+ZJeXFi8wznQu/zGMYWPHVEcACg
         PIY1Af8iqfp8UR7RYBn8NJLtxA0G3OlPRJwuxZr9CBg50IlAqVo/1pxLxv1yR2oVX6gN
         HCMy5VF1oYmPS6Vi9EbGwYGIB4jqXUMxOt5miudN5tF8BKkaXsckT9Sp15b8P23McVUe
         XYYg==
X-Gm-Message-State: AOAM532Q8Hqd36ppr2h1TIiRGgmWLb6HKSeghZsuuM4Th2Jr5lC7v6XB
        gMp4I+QACVypkMvoJX8TsBs=
X-Google-Smtp-Source: ABdhPJxc3oSeAVc1d3oLDs3CSQCoo85+dLQjHIp9SQ+fq31E1ksltTH63GkVvp6HMo/trS4q6VqtBA==
X-Received: by 2002:a17:903:240a:b0:14e:dad4:5ce4 with SMTP id e10-20020a170903240a00b0014edad45ce4mr33874758plo.125.1648603751406;
        Tue, 29 Mar 2022 18:29:11 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id nu16-20020a17090b1b1000b001c77c6a391csm4340571pjb.26.2022.03.29.18.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 18:29:11 -0700 (PDT)
Message-ID: <29a61fd1-d736-4dc2-58d7-3cfec6e2bcfe@gmail.com>
Date:   Wed, 30 Mar 2022 10:29:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] docs: sphinx/requirements: Limit jinja2<3.1
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org
References: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
 <871qyk7p28.fsf@meer.lwn.net>
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <871qyk7p28.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 29 Mar 2022 09:31:43 -0600,
Jonathan Corbet wrote:
> Akira Yokosawa <akiyks@gmail.com> writes:
> 
>> jinja2 release 3.1.0 (March 24, 2022) broke Sphinx<4.0.
>> This looks like the result of deprecating Python 3.6.
>> It has been tested against Sphinx 4.3.0 and later later.
Oh, I made a staccato here.
Thank you for amending it.
> 
> *Sigh*.  I wish this stuff didn't feel like such a house of cards
> sometimes... 
> 
>> Setting an upper limit of <3.1 to junja2 can unbreak Sphinx<4.0
>> including Sphinx 2.4.4.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: linux-doc@vger.kernel.org
>> ---
>> Or we can bump the requirement to Sphinx>=4.0.
>> Thoughts?
> 
> It's probably time to consider a bump there, but that is a bigger one
> than I would want to do at this point.  So I'll just fast-track this
> patch in; dropping it into the stable updates probably makes sense too.

This can be applied cleanly for Linux>=5.15.
For 5.10.x, there is a dependent commit:

    37397b092e7f ("docs: sphinx-requirements: Move sphinx_rtd_theme to top")

Linux 5.4.x needs another one:

    d5afc9640a6d ("docs: update recommended Sphinx version to 2.4.4")

... and so on.

How far do you want to backport this?

        Thanks, Akira
> 
> Thanks,
> 
> jon
