Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AEFC433DB
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 23:11:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96CC765007
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 23:11:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232463AbhCDXL6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Mar 2021 18:11:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbhCDXLw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Mar 2021 18:11:52 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C569EC061756
        for <linux-doc@vger.kernel.org>; Thu,  4 Mar 2021 15:11:50 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id w1so52797717ejf.11
        for <linux-doc@vger.kernel.org>; Thu, 04 Mar 2021 15:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BE32Kfi4kj+ZAdJIcPt+s2HaEM0hO57R8c+yyi9e21g=;
        b=atcs3Qrf55HohHsaCh8HMvMzQuAaS7TmIGvNvghisxEdnQ/LGkArNBQhtJ0WeEfn6e
         Bq5+Zp/g3CBKhk4DF+fIGlKWqLb1wm718t+t6qn4viF487VfAMkPFAPAbIlc8xm3adBk
         xtAC8EN0NMaS+8FmuFnjjltMGViue0cHf96o8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BE32Kfi4kj+ZAdJIcPt+s2HaEM0hO57R8c+yyi9e21g=;
        b=HDQaGaTjKIKhBi+HwKCKAFwX/lkoOhg7ndWAv/CdvwOsOG26EH6xjdn/n2zFSNvUHT
         /tZZ+vRaLHnwznZORJZlGAQZq6sdDY7JcZqCIaxH7Ewx5bu998SFeLMIVN8nf5GhmGm+
         FBD/pU/GAovg6ETMwWhUxo8MbEgviIl+QUVKb/WRYxxOgwpq3E40jw4dfqF8cAxFdVwP
         lQR6X+d4aQz8yRLeiSGRFjnEI9Wmv+74p1iSOFyFykeLus3eWzdtuRFJY/+8/G4gJDjw
         tgQIAkdIvyYrKgC05Ee9Rfdmz54KMbHRhpi3ng3NC8D6peb0VdSYZMqUU1Vs5O2+mhEH
         UJzQ==
X-Gm-Message-State: AOAM532b5iM//jFDM5ByK68RMBS2AEO/aZBG0fdkieAAOsZv/fNAYnp1
        4XAO9cN7ZreqYzfcyem4dnXPzHacB2seKQ==
X-Google-Smtp-Source: ABdhPJz2r/KaoCDk/RFGF+DnUOSC4E+TysAwdut12JzaS2aFTJq1asshybOBQBCy7zSRuUJw5ta81w==
X-Received: by 2002:a17:906:d9c9:: with SMTP id qk9mr6485585ejb.504.1614899509299;
        Thu, 04 Mar 2021 15:11:49 -0800 (PST)
Received: from [192.168.1.149] ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id oy8sm398597ejb.58.2021.03.04.15.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 15:11:48 -0800 (PST)
Subject: Re: [PATCH 5/7] printk: Make %pS and friends print module build ID
To:     Stephen Boyd <swboyd@chromium.org>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-doc@vger.kernel.org
References: <20210301174749.1269154-1-swboyd@chromium.org>
 <20210301174749.1269154-6-swboyd@chromium.org>
 <20210304170052.GK2723601@casper.infradead.org>
 <161488534185.1478170.10285681551102444519@swboyd.mtv.corp.google.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <95e58426-c7ab-6ba5-17ea-392754899959@rasmusvillemoes.dk>
Date:   Fri, 5 Mar 2021 00:11:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161488534185.1478170.10285681551102444519@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/03/2021 20.15, Stephen Boyd wrote:
> Quoting Matthew Wilcox (2021-03-04 09:00:52)
>> On Mon, Mar 01, 2021 at 09:47:47AM -0800, Stephen Boyd wrote:
>>> Example:
>>>
>>>  WARNING: CPU: 4 PID: 3255 at drivers/misc/lkdtm/bugs.c:83 lkdtm_WARNING+0x28/0x30 [lkdtm] (ed5019fdf5e53be37cb1ba7899292d7e143b259e)
>>
>> Would the first 12 characters instead of all 40 make it more palatable
>> without reducing its utility?
> 
> I can't seem to request debuginfo from debuginfod without the full 40
> characters. It's not a git sha1 hash. 
> 
>> And I feel it should be within the [], so maybe this:
>>
>> WARNING: CPU: 4 PID: 3255 at drivers/misc/lkdtm/bugs.c:83 lkdtm_WARNING+0x28/0x30 [lkdtm ed5019fdf5e5]
>>
> 
> Sure I could put the hex numbers inside the brackets. I suspect changing
> %pS or updating the "Modules linked in:" line isn't going to be
> palatable. I've decided to introduce another printk format %pT to print
> the stacktrace 

Can you avoid claiming a new "top-level" %p modifier? Isn't it better to
add a new flag to '%pS', say '%pSb' to include build-id?

Rasmus

