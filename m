Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2824C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 29 Mar 2022 14:08:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236587AbiC2OKU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Mar 2022 10:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235996AbiC2OKU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 10:10:20 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956B162E3
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 07:08:35 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id j8so7546284pll.11
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 07:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fSzpUQbRwHRGbPWeSORzt+RYqF3DUc3kCsoJMuZ3omg=;
        b=RSNV/BrLLk0F7CnHXVmRWTySCtMe2PssRBz1fG/d+2d2KXEshs5GqtsnHeIajJHlL1
         5Dtvwhl3VfigwdzPaMwEIichLw+BfyHJfJ05F4z4yrbMi4Eij3oG9siiJrpYkEcTSTop
         TgazRbDJLpT1o0nY+HfEtzCU1RaMZZ9WrMcEVfILNVAf9bnBC2iV8x8uB37WpMnpzh0V
         d9jZouLtYAYkbuQNUJjntlSIdC3NI7L7cRNZ9jo1hUv0Woa6W0DAoYFWu7P7ZZWq1KYS
         gQHyR4BYLePS9KDFHZxJR33vPEnxh3XRWQQay9ztU0IdzIHAqUJ4OUrPsmijZkDfcnKP
         RtyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fSzpUQbRwHRGbPWeSORzt+RYqF3DUc3kCsoJMuZ3omg=;
        b=CgIz6JDfa70MxXcCtkWWWIGwRDrmScS5xYt76d3K4vgvLOb95ZWDS8/ViN0XawVuEH
         Fo7SXTN7wmNl7oJo2yPbok/l99YE7sP8U0QWmW57vFYiXZAPnxJ1e2il1GDxJjSKOmDE
         q45+GV4VZa3404zJNg5pT5P4vrem47And0Ja4rMkX8A0HERne4nAhypeSKSYMhqJigIO
         jkPjeskVvoulG+v491QGgn6e0D0BrjlMHWclhlGtGNyY4kjDIoWU1uJmWzQNHYdAFW9E
         UpJ+5B0WCPUXoDfoJBg+QuPya0YCSiknyAPUNSFCglqdiEtyl/auHaHivtu916yGdwXl
         SaXg==
X-Gm-Message-State: AOAM530bemUTEJQhQLSTUCxtRgT5leIdKlHA3lM5LF2AYaEqxSpKNZIY
        OluRQtgW5KnKbk8+BO/A0cUCr+hV7TQ=
X-Google-Smtp-Source: ABdhPJxd8Oj+XvJu8qtnxJyKjEPH8egLbeto6zvX7WAn2UAP3ujdcKhz6Dw5x826HoWmsDRSu+UvXg==
X-Received: by 2002:a17:902:ea04:b0:154:54f0:172b with SMTP id s4-20020a170902ea0400b0015454f0172bmr30756339plg.149.1648562915071;
        Tue, 29 Mar 2022 07:08:35 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id v8-20020a056a00148800b004fa9bd7ddc9sm20127601pfu.113.2022.03.29.07.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 07:08:34 -0700 (PDT)
Message-ID: <3cf78b3e-3336-b0fa-6f2f-5b4e64c73302@gmail.com>
Date:   Tue, 29 Mar 2022 23:08:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] docs: sphinx/requirements: Limit jinja2<3.1
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org
References: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
 <02a00556-d885-7532-64ad-14027a4b5e33@gmail.com>
 <87ee2k7t9m.fsf@meer.lwn.net>
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87ee2k7t9m.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 29 Mar 2022 08:00:53 -0600,
Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> 
>> On 29/03/22 13.07, Akira Yokosawa wrote:
>>> diff --git a/Documentation/sphinx/requirements.txt b/Documentation/sphinx/requirements.txt
>>> index 9a35f50798a6..2c573541ab71 100644
>>> --- a/Documentation/sphinx/requirements.txt
>>> +++ b/Documentation/sphinx/requirements.txt
>>> @@ -1,2 +1,4 @@
>>> +# jinja2>=3.1 is not compatible with Sphinx<4.0
>>> +jinja2<3.1
>>>   sphinx_rtd_theme
>>>   Sphinx==2.4.4
>>>
>>
>> I see that we had already pinned the exact Sphinx version to 2.4.4 (or am
>> I read the requirements wrong?), so this only matters when people use Sphinx
>> from distribution packages, rather than using virtualenv as recommended.
> 
> We have been suggesting 2.4.4 simply because it's much faster than the
> later releases, but it's not a requirement.

There was a time when Sphinx 3.x.x was memory hungry and slower than 2.4.4.
Nowadays, Sphinx 4.x.x is getting much better and actually is much faster
than 2.4.4 in my experience.  Might depend on the underlying Python
release, though.

Sphinx 4.5.0 released yesterday works just fine.

        Thanks, Akira

> 
> Thanks,
> 
> jon
