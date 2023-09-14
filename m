Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC29EDE983
	for <linux-doc@archiver.kernel.org>; Thu, 14 Sep 2023 06:07:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbjINGHQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Sep 2023 02:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbjINGHP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Sep 2023 02:07:15 -0400
Received: from belinda3.kreativmedia.ch (belinda3.kreativmedia.ch [80.74.158.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81152E3
        for <linux-doc@vger.kernel.org>; Wed, 13 Sep 2023 23:07:10 -0700 (PDT)
Received: from [172.31.17.20] (localhost [127.0.0.1]) by belinda3.kreativmedia.ch (Postfix) with ESMTPSA id 249D952C0897;
        Thu, 14 Sep 2023 08:07:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renenyffenegger.ch;
        s=default; t=1694671628;
        bh=Uyiyz69InGvlBMtUXFJyd27/Z+WctQ0Gekv8bm0Vm6k=; h=Subject:To:From;
        b=wKhf7ywBLMAinuOjNgnDQxLQCIuQNgW1cy/nk9AHBqTrFJgXy9chPHoo9YrGEqHPq
         KyT6L/jHrUHNwkJbdV8s304gXbOPvueOyIr7erejvcVvetQk8mM6PjJSautuxnXNSR
         1JpWTEqBh37yHNLFCJOOT6dNVbRFZdetRGeiaxA0=
Authentication-Results: belinda.kreativmedia.ch;
        spf=pass (sender IP is 31.10.136.30) smtp.mailfrom=mail@renenyffenegger.ch smtp.helo=[172.31.17.20]
Received-SPF: pass (belinda.kreativmedia.ch: connection is authenticated)
Message-ID: <3e593638-fdaa-4f68-86b4-a4c8dae412dc@renenyffenegger.ch>
Date:   Thu, 14 Sep 2023 08:07:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] Documentation: Reference kernel-doc for container_of
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20230901070728.28400-1-mail@renenyffenegger.ch>
 <87ledqm0qs.fsf@meer.lwn.net>
From:   =?UTF-8?Q?Ren=c3=a9_Nyffenegger?= <mail@renenyffenegger.ch>
In-Reply-To: <87ledqm0qs.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/1/23 16:22, Jonathan Corbet wrote:
> René Nyffenegger <mail@renenyffenegger.ch> writes:
>
>> The file include/linux/container_of.h contained kernel-doc but was not
>> referenced in any .rst file. In addition, the file
>> Documentation/core-api/kobject.rst wrongly located the definition
>> of the macro `container_of` in linux/kernel.h while in reality
>> it is defined in linux/container_of.h
>>
>> This patch adds a new .rst file that includes the kernel-doc of
>> container_of.h and rectifies the wrong reference of the header
>> file.
>>
>> Signed-off-by: René Nyffenegger <mail@renenyffenegger.ch>
> Thank you for working to improve the kernel documentation!
>
> There are, though, a few problems with this patch that will need to be
> addressed before it can be accepted.  To start, please cc the maintainer
> (i.e. me) on documentation changes.
>
Thanks for looking at my attempt to patch the documentations.

I tried to create an improved patch:
https://lore.kernel.org/linux-doc/20230902210422.8092-1-mail@renenyffenegger.ch/T/

However, I did not receive any feedback. So, I am wondering if I am
still making mistakes. In order to improve, I'd appreciate a feedback
what I need to change to create the patch.

Thanks

René

