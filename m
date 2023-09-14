Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129C9EEAA71
	for <linux-doc@archiver.kernel.org>; Thu, 14 Sep 2023 21:08:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjINVIe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Sep 2023 17:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjINVId (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Sep 2023 17:08:33 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8273D269D
        for <linux-doc@vger.kernel.org>; Thu, 14 Sep 2023 14:08:29 -0700 (PDT)
Received: from localhost (cm-staticip-85-152-42-27.telecable.es [85.152.42.27])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 92F5160A;
        Thu, 14 Sep 2023 21:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 92F5160A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1694725709; bh=kR9e4S/RNB8zocHUioWuHoToYEzeErosm4K3eciMUAA=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=PpIfeG0wdk9SQQdg7VyYJcHHIS0BjhhjwQ9s4NgBh3bvDz+JAMPqPi14PjTuEppS+
         p+trVLd8Ing1fC8UBCW35BDF0aEgsqzf8vsZ+FP3BeqsIIq5mRaIZxJTtxGrHAm8ly
         QiavMlRPkeRre8xOqnCrZ0FQygdffpaOux3gd8yPREUjLFM3XQIdZRY54kSYdXJKIX
         qOtv01NDzKRiTp2vfYz8BmD0sUNL1Jru/4ElZlnuFWIgYZSL4GAFf+HooO9adqIO17
         9Ttha/GZbZLbGnsyCVArNsn9GAOTOa6rW5ZNUgg3Q8NFzk0nbBK7RKhhsMqxc2q57q
         UYhPx08ByprIw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     =?utf-8?Q?Ren=C3=A9?= Nyffenegger <mail@renenyffenegger.ch>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: Reference kernel-doc for container_of
In-Reply-To: <3e593638-fdaa-4f68-86b4-a4c8dae412dc@renenyffenegger.ch>
References: <20230901070728.28400-1-mail@renenyffenegger.ch>
 <87ledqm0qs.fsf@meer.lwn.net>
 <3e593638-fdaa-4f68-86b4-a4c8dae412dc@renenyffenegger.ch>
Date:   Thu, 14 Sep 2023 15:08:26 -0600
Message-ID: <87edj0fool.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ren=C3=A9 Nyffenegger <mail@renenyffenegger.ch> writes:

> On 9/1/23 16:22, Jonathan Corbet wrote:
>> Ren=C3=A9 Nyffenegger <mail@renenyffenegger.ch> writes:
>>
>>> The file include/linux/container_of.h contained kernel-doc but was not
>>> referenced in any .rst file. In addition, the file
>>> Documentation/core-api/kobject.rst wrongly located the definition
>>> of the macro `container_of` in linux/kernel.h while in reality
>>> it is defined in linux/container_of.h
>>>
>>> This patch adds a new .rst file that includes the kernel-doc of
>>> container_of.h and rectifies the wrong reference of the header
>>> file.
>>>
>>> Signed-off-by: Ren=C3=A9 Nyffenegger <mail@renenyffenegger.ch>
>> Thank you for working to improve the kernel documentation!
>>
>> There are, though, a few problems with this patch that will need to be
>> addressed before it can be accepted.  To start, please cc the maintainer
>> (i.e. me) on documentation changes.
>>
> Thanks for looking at my attempt to patch the documentations.
>
> I tried to create an improved patch:
> https://lore.kernel.org/linux-doc/20230902210422.8092-1-mail@renenyffeneg=
ger.ch/T/
>
> However, I did not receive any feedback. So, I am wondering if I am
> still making mistakes. In order to improve, I'd appreciate a feedback
> what I need to change to create the patch.

Sorry, I do have feedback, but between the merge window and travel I've
fallen behind on things.  I'll get there, honest.

Thanks,

jon
