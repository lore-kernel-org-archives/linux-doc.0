Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E316C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 13 Apr 2022 11:56:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235390AbiDML6Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Apr 2022 07:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235398AbiDML6R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Apr 2022 07:58:17 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5AD31DC2
        for <linux-doc@vger.kernel.org>; Wed, 13 Apr 2022 04:55:51 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id md4so1744919pjb.4
        for <linux-doc@vger.kernel.org>; Wed, 13 Apr 2022 04:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xfZYvIhJusGGTVvcijEi3gEbaY/Gp5sc+QOzlIMW8s0=;
        b=b5cKcqguzqHlSE7L4Tu5eMsjMQWnqD8PblJB1FtfI/xMElSL6Z72EoYQW2tuov5+IH
         m/+CBFSUGN37tR7Z2EYY+462coLXMBmBZ0jdYG2D3SG82CdHXPlTu6+e6HUoXpmuAegN
         4T/dK03rORTBLQpHt1oYauJ+2P5fIc4tHWb/ULqqcz2V2mscoY6a936HUI0VksXVrIMG
         ump0JAe8B6+OZwlxlkr6mz8Rc4SPr0UMcPiuvVRKV7IZHQKktrO9EEn0HbVgMz684Owu
         MGzanrCez3ZT7EFk49yb83auBrVG7eB0BCYHAWNTtqaN5TUcPjgfWYbhvOcbHfJFshzO
         HRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xfZYvIhJusGGTVvcijEi3gEbaY/Gp5sc+QOzlIMW8s0=;
        b=21v1JYu9MexdVIl4JRMRh77Hbcf2hJzejofOEqOEk9rY3rxsXLt3pFvr1L2fCK4t+x
         W4RWF3Wv1hgsYwZ+1zDiMeJeAJU/SEnXN7Qz51XAc8Sg0tkaZcv6ktC9tIfomcogCL3d
         TkxbgdQY9OGuu9BtsxtzxQH8EuQecFSit04n0fQ++3oOvbGP2Ia8x85dzRzFv0gkn/7i
         vi460Wz2JSquY5VQcRWjRlH25I0tAY0B0YdhELjaSFd72JvVV3easii12FcTKReIbGdL
         +fMyEb+9IMAMY7llos7/ghcHDbeMMTbaagwYXUmOLrAHhXiWiHIX9/UkGs2Qtv+7vw4D
         UxgQ==
X-Gm-Message-State: AOAM530mAW2NKi4TGhyWcoRs015afN0GbeoHphJrjZwQ6/KFtm/ZFIaK
        ljMlwGZSWy+Ao6aOdy5XHVW5DPNVUMs=
X-Google-Smtp-Source: ABdhPJyvZrQtTrip19UEpXcSWHuI3ep/OTzTWZArYYpuNbXAWZ7tVBpkvxprU2162MH0qMGpJZFoVQ==
X-Received: by 2002:a17:902:e9d3:b0:158:8521:1e8f with SMTP id 19-20020a170902e9d300b0015885211e8fmr8761230plk.82.1649850951328;
        Wed, 13 Apr 2022 04:55:51 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id mu1-20020a17090b388100b001c77e79531bsm3055591pjb.50.2022.04.13.04.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 04:55:50 -0700 (PDT)
Message-ID: <93f1f2c0-4884-f835-c087-08128164c4bd@gmail.com>
Date:   Wed, 13 Apr 2022 20:55:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Is there any Japanese translation maintainer?
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kosuke Fujimoto <fujimotokosuke0@gmail.com>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <172fa015-26df-c978-853d-3aba67c581cc@gmail.com>
 <15b941a4-c41d-3fc1-c4f8-9a6736f6b874@gmail.com> <Ylazk8qA498v9AKc@kroah.com>
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <Ylazk8qA498v9AKc@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 13 Apr 2022 13:27:15 +0200,
Greg Kroah-Hartman wrote:
> On Wed, Apr 13, 2022 at 08:06:08PM +0900, Akira Yokosawa wrote:
>> [+Cc: Jon, Greg]
>>
>> Hello Fujimoto-san,
>>
>> On Wed, 13 Apr 2022 18:09:59 +0900,
>> Kosuke Fujimoto wrote:
>>> Hello,
>>>
>>> I would like to contact with Japanese documentation maintainer for some 
>>> changes. However, it looks like there is no one listed in MAINTAINERS file.
>>> Is there anyone who is maintaining Japanese documentation?
>>
>> Existing Japanese translation has a note on its first page saying:
>>
>>> This document is maintained by Tsugikazu Shibata <tshibata@ab.jp.nec.com>
>>
>> However, this email address is not reachable any more.
>>
>> I also have a few things I'd like to fix/update in it.
>> I'm glad to know there exists someone else who has similar
>> thoughts.
>>
>> I think I can play a role as a tentative maintainer who can
>> review your changes.
>>
>> Jon, Greg, do you have any idea of Shibata-san's whereabouts?
> 
> Yes, he has retired from NEC and now is doing other Linux-related work.
> I can dig up his email address and send it to you off-list if you like.

I'd really like to contact him!
Please do so.

        Thanks, Akira

> 
> thanks,
> 
> greg k-h
