Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E0BC5519F
	for <linux-doc@archiver.kernel.org>; Tue, 17 Nov 2020 18:24:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 177872467A
	for <linux-doc@archiver.kernel.org>; Tue, 17 Nov 2020 18:24:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MYQ8o2up"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730486AbgKQSYG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Nov 2020 13:24:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728879AbgKQSYG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Nov 2020 13:24:06 -0500
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F109BC0613CF
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2020 10:24:05 -0800 (PST)
Received: by mail-il1-x144.google.com with SMTP id g15so19471770ilc.9
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2020 10:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hStTG3+2TUli6PQOvC7dPwGocz2+5lnhRaphNDmsF7o=;
        b=MYQ8o2upiR4xRbHNFHnMM/5tlZ2i4zwJ6ippaQFSfmTVahH9uGSxyWJ5RMzkHQcdjC
         dsD+SgEIPreNPuZ1GgQUCsQF2eluVwLU/8ItuBxgd9W3mTjPvqpiJEPaO1/V4Txmejmz
         brLXTEgjcWwJDY27ZGFKF4osENdZL4BHfjj4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hStTG3+2TUli6PQOvC7dPwGocz2+5lnhRaphNDmsF7o=;
        b=YvInTJF/PYRK4VVWI7RjylrE4G+sntH0yJkaa/aVjwWHEJqHpfB22IA9+lVZCPJu2H
         DaT6e+yDYynPC/Sd72vqt1lmHt+tCAEkpckgJV/J7eqFszigYqwR2mQRxQC5+bkrMQAa
         o+bL6n3KGnxwzKAQl/XIE7EsOe8uXgCygNu0EZgCkNjMF78ZGDzP+fSH4FkyHykk7n89
         KPR7mNoHbF0Ep5i9cyWrUqaN1CWCQMsESkr9rB+Kc+NHkjv9sJyarpxObmoG21a8XO+B
         u2j/SBg/cE0/PfPYJZtW2IMpTbsBdrawL/xFh2lM34lVnESvK3bksQCADiBRJgFjcfgj
         lAQA==
X-Gm-Message-State: AOAM531Li1lGIw1k3iATtody3qN93edt3XPUtA8UePvy/iBIW+89/RiH
        /P6nbEXCypuDXOs/r7Qei/fjNQ==
X-Google-Smtp-Source: ABdhPJwx02xrIeI2eECsWwate6BBRxRuaxJV0280nEGDfsUQAnVJOBkwnqep1/S28GiJqt0mSRgT7g==
X-Received: by 2002:a92:c043:: with SMTP id o3mr12909972ilf.201.1605637445112;
        Tue, 17 Nov 2020 10:24:05 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id e13sm14085604ili.67.2020.11.17.10.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 10:24:04 -0800 (PST)
Subject: Re: [PATCH v2 01/13] seqnum_ops: Introduce Sequence Number Ops
To:     Matthew Wilcox <willy@infradead.org>
Cc:     corbet@lwn.net, keescook@chromium.org, gregkh@linuxfoundation.org,
        peterz@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1605287778.git.skhan@linuxfoundation.org>
 <26cbcc431be5e3ab7d8e0e881d522605a27b1312.1605287778.git.skhan@linuxfoundation.org>
 <20201113210327.GJ17076@casper.infradead.org>
 <13467f88-7e22-ce3e-60b6-44e7c3dfa7dc@linuxfoundation.org>
 <20201117173839.GO29991@casper.infradead.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <a256f95f-33aa-5f4b-6471-687514e7bc03@linuxfoundation.org>
Date:   Tue, 17 Nov 2020 11:24:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201117173839.GO29991@casper.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/17/20 10:38 AM, Matthew Wilcox wrote:
> On Tue, Nov 17, 2020 at 09:34:24AM -0700, Shuah Khan wrote:
>>> seqnum_inc() should just return the new value -- seqnum_inc_return is
>>> too verbose.  And do we not need a seqnum_add()?
>>
>> I had the patch series with seqnum_inc() all ready to go and then
>> revisited the choice. My thinking is that matching the current atomic
>> api that has _inc() and inc_return() might be less confusing. That
> 
> No, it's more confusing.  I know you're converting things from using
> atomic_t, but you really need to think about this in terms of "What
> makes sense for this API".  Unless you really want to have inc that
> returns void and inc_return that returns the new value, having only
> inc_return makes no sense.
> 

I am fine with that. As I said I have a patch series saved with just
seqnum_inc() that increments and returns. I anticipated people would
have problems with seqnum_inc() that returns. :)

>> being said, I have no problems with making just _inc(). The reason
>> for 32 and 64 appended is based on comments that it including size
>> in the api makes it very clear.
> 
> By putting 32 and 64 in the name of the API, I would contend you're making
> people think about something that they should not need to think about.
> 

Are you recommending seqnum32_*() for 32bit and seqnum_*() for 64bit
which would make 64bit as a default? We have to make a distinction
for 32bit vs. 64-bit api.

>> No need for atomic_add() - inc_return() is sufficient for this use-case.
> 
> I haven't looked at the various potential users of this API, but there
> are often cases where we account, eg, number of bytes transmitted.
> 
> There are also cases where read-and-zero would be a useful operation
> to have.  I'm thinking about sampling statistics.
> 

The idea is isolating sequence number use-case first and restrict this
api for that.

thanks,
-- Shuah

