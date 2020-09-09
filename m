Return-Path: <SRS0=2XaJ=CS=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1C5C43461
	for <linux-doc@archiver.kernel.org>; Wed,  9 Sep 2020 18:57:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB2BC2080A
	for <linux-doc@archiver.kernel.org>; Wed,  9 Sep 2020 18:57:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgIIS52 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Sep 2020 14:57:28 -0400
Received: from ivanoab7.miniserver.com ([37.128.132.42]:37544 "EHLO
        www.kot-begemot.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgIIS51 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Sep 2020 14:57:27 -0400
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6] helo=jain.kot-begemot.co.uk)
        by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <anton.ivanov@cambridgegreys.com>)
        id 1kG5HY-0008Dp-Sn; Wed, 09 Sep 2020 18:57:25 +0000
Received: from madding.kot-begemot.co.uk ([192.168.3.98])
        by jain.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <anton.ivanov@cambridgegreys.com>)
        id 1kG5HW-000248-F8; Wed, 09 Sep 2020 19:57:24 +0100
Subject: Re: [PATCH v2] docs: add a new User Mode Linux HowTo
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-um@lists.infradead.org, linux-doc@vger.kernel.org,
        richard@nod.at
References: <20200907092124.17599-1-anton.ivanov@cambridgegreys.com>
 <20200909115532.42a96ddc@lwn.net>
From:   Anton Ivanov <anton.ivanov@cambridgegreys.com>
Organization: Cambridge Greys
Message-ID: <9f512b92-c75d-995f-a75d-33d2cc560749@cambridgegreys.com>
Date:   Wed, 9 Sep 2020 19:57:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909115532.42a96ddc@lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Clacks-Overhead: GNU Terry Pratchett
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/09/2020 18:55, Jonathan Corbet wrote:
> On Mon,  7 Sep 2020 10:21:24 +0100
> anton.ivanov@cambridgegreys.com wrote:
> 
> Sorry, I'd missed the fact that there's a v2; my comments from v1 still
> apply, though, it seems.
> 
>> diff --git a/Documentation/virt/uml/user_mode_linux.rst b/Documentation/virt/uml/user_mode_linux-2.4.rst
>> similarity index 99%
>> rename from Documentation/virt/uml/user_mode_linux.rst
>> rename to Documentation/virt/uml/user_mode_linux-2.4.rst
>> index de0f0b2c9d5b..ed5a698cd710 100644
>> --- a/Documentation/virt/uml/user_mode_linux.rst
>> +++ b/Documentation/virt/uml/user_mode_linux-2.4.rst
>> @@ -10,6 +10,10 @@ User Mode Linux HOWTO
>>   This document describes the use and abuse of Jeff Dike's User Mode
>>   Linux: a port of the Linux kernel as a normal Intel Linux process.
>>   
>> +*Note: - this howto is historic and correct as of kernel versions
>> +~ 2.4. For more up-to-date information please refer to the newer
>> +user_mode_linux_howto_v2.*
> 
> So why are we keeping this version around?  The 5.x kernel doesn't need to
> document what was happening in 2.4... ?

I am OK for it to be removed if everyone agrees to switch to the new one.

> 
> Thanks,
> 
> jon
> 


-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
https://www.cambridgegreys.com/
