Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D883E7AD58
	for <linux-doc@archiver.kernel.org>; Tue,  3 Oct 2023 15:01:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231916AbjJCPBr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Oct 2023 11:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240363AbjJCPBb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Oct 2023 11:01:31 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A2F2FA7;
        Tue,  3 Oct 2023 08:01:27 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA319C15;
        Tue,  3 Oct 2023 08:02:05 -0700 (PDT)
Received: from [10.57.38.63] (unknown [10.57.38.63])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED4C23F762;
        Tue,  3 Oct 2023 08:01:25 -0700 (PDT)
Message-ID: <e89de62e-e19a-1eeb-d180-a308cbf97c03@arm.com>
Date:   Tue, 3 Oct 2023 16:01:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] tracing: document buffer_size_kb more precisely
Content-Language: en-US
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Zheng Yejian <zhengyejian1@huawei.com>, mhiramat@kernel.org,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <cee6d5cd-e15b-3bb1-f867-de467d96d6b5@arm.com>
 <a1ae1bc0-0677-8284-9f18-1171e1dcb175@huawei.com>
 <efe41cee-42dd-290f-9ec2-ac002e2ec34e@arm.com>
 <20231002110935.2fde6637@gandalf.local.home>
From:   Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20231002110935.2fde6637@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/10/2023 16:09, Steven Rostedt wrote:
> On Tue, 26 Sep 2023 11:38:14 +0100
> Christian Loehle <christian.loehle@arm.com> wrote:
> 
>>>> @@ -191,7 +191,7 @@ of ftrace. Here is a list of some of the key files:
>>>>       A few extra pages may be allocated to accommodate buffer management
>>>>       meta-data. If the last page allocated has room for more bytes
>>>>       than requested, the rest of the page will be used,
>>>> -    making the actual allocation bigger than requested or shown.
>>>> +    making the actual allocation bigger than requested.  
>>>
>>> Hi, the actual allocation should still be bigger than shown due to the
>>> loss of accuracy when doing unit conversion from bytes to kilobytes (see
>>> tracing_entries_read()).
>>>   
>> Right, the sysfs obviously only allows for KB aligned setting, but you're right.
>> If set on the cmdline non-KB multiples are possible and accuracy is lost.
>> Nevermind then.
> 
> I'm assuming this patch can be dropped?
> 
> -- Steve
Yes please drop it, there's probably still some room for improvement for clarity,
but this patch is not correct.
