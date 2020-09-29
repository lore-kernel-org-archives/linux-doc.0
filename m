Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FC1C4727C
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 20:00:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E335320679
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 20:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601409650;
	bh=Gw+P+aB5MEvxDHylhv7DtdV0AAl5SA7cGhSj8VHRFdk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=fUKzMqyExunIxdm8C5GEO0Gyala0LLhg6HeNhLjfdAavA7f2hl0Ynb99G0F/FVHxl
	 +jH5frZ82If9pmb59y+9G6rVZa/oCa5NDLyflnKyI9k1+e7GdjsU/ANW7YpY/YzpgY
	 e41uMaWuvGwCeS46pcv7lGGKV4QIyVuShVmEUawI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728812AbgI2UAs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 16:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728747AbgI2UAs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 16:00:48 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 742CBC061755
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 13:00:46 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id v20so6888343oiv.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 13:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AmCsi2BDdE0wC8EuTHmuUbDB6XL/3OtoUvlKfVp4OPQ=;
        b=JaM/LYlOqwadQ1GLoLRVv3Oj+9kSXFmsUfgwy1SU33RAhEzLUM/wZq0TfyxQVpePnP
         vpmwQYk+Bm0P5EKjiUf0Jqdxudmx3PqfQXArmHqgth4hxoAtdasEj0YvUB7ENFAI3u5f
         +bLmy9nILEhL2MBiJPYpYGRBg5QDgOdfkE1bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AmCsi2BDdE0wC8EuTHmuUbDB6XL/3OtoUvlKfVp4OPQ=;
        b=E1EsAWhW6wkx0/fQti/tF7V+hHxQszEkCm/1PAG6s4cQUBtCep/w0hc+9j0/12i1KR
         f2xqnMT3kCGJQqKx6AkRJPDgrToQ4V+kkBYWfzUHh/v23vSf8LEOVvhhrhEGO/66Ag2I
         uH4vXbrLEwMJY+MCsxkH2Jj4qRvXAESFucwxLxNoAHROiEycTeHhfRDCnV0AyrQE8wYd
         ndHuom20suwi2gGyyfkk3bB9mbdYzksgQNcZ1zD+pYzwdzJqlNIJpYYm1VXhq/z7sbWm
         idL++p/wSxpy0cyZt6A5zonlLhBQJbVGuYhzQOGuUQmdglwAEbdmPptaZZ1ZeTHurEtv
         eWAQ==
X-Gm-Message-State: AOAM530EGZ5nn7TydHokfUyBlwjzSMSCxRI/g4vbyXt7rZwvw9RxnYMC
        JPq9q7LhafFgbHEhh/OoFtmuAQ==
X-Google-Smtp-Source: ABdhPJyKOoPZmEuXMRYFPdazhGdDQVw44SgQKBs3AgX2hDMLBj6VIr7dd1knTEulo8aEXP6lB2hiUg==
X-Received: by 2002:aca:ab06:: with SMTP id u6mr3475700oie.84.1601409645845;
        Tue, 29 Sep 2020 13:00:45 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id 126sm3124089oof.28.2020.09.29.13.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 13:00:45 -0700 (PDT)
Subject: Re: [PATCH 2/8] selftests/vm: use a common gup_test.h
To:     Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Ralph Campbell <rcampbell@nvidia.com>,
        Shuah Khan <shuah@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-s390@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20200928062159.923212-1-jhubbard@nvidia.com>
 <20200928062159.923212-3-jhubbard@nvidia.com>
 <20200928125739.GP9916@ziepe.ca>
 <6481e78f-c70d-133a-ff4a-325b5cd8fd5d@nvidia.com>
 <20200929163507.GV9916@ziepe.ca>
 <aab477bf-4353-5e6b-4cc9-9872c9376ed2@nvidia.com>
 <20200929175524.GX9916@ziepe.ca>
 <715c49ec-d2a8-45cb-8ace-c6b1b4b8f978@nvidia.com>
 <20200929190816.GY9916@ziepe.ca>
 <3022912c-f11b-f564-3a8a-f516ca259a37@nvidia.com>
 <20200929195356.GZ9916@ziepe.ca>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <64bb5ba7-77f7-2f09-44f0-29ee9329b183@linuxfoundation.org>
Date:   Tue, 29 Sep 2020 14:00:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929195356.GZ9916@ziepe.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/29/20 1:53 PM, Jason Gunthorpe wrote:
> On Tue, Sep 29, 2020 at 12:48:43PM -0700, John Hubbard wrote:
>> On 9/29/20 12:08 PM, Jason Gunthorpe wrote:
>>> On Tue, Sep 29, 2020 at 11:59:55AM -0700, John Hubbard wrote:
>>>> On 9/29/20 10:55 AM, Jason Gunthorpe wrote:
>>>>> On Tue, Sep 29, 2020 at 10:44:31AM -0700, John Hubbard wrote:
>>>>>> On 9/29/20 9:35 AM, Jason Gunthorpe wrote:
>>>>>>> On Mon, Sep 28, 2020 at 01:10:24PM -0700, John Hubbard wrote:
>>>>>>>> On 9/28/20 5:57 AM, Jason Gunthorpe wrote:
>>>>>>>>> On Sun, Sep 27, 2020 at 11:21:53PM -0700, John Hubbard wrote:
>>>> ...
>>>>>> I don't see any "gcc -m" type of dependency generation pass happening
>>>>>> in this relatively simple Make system.
>>>>>
>>>>> It happens with -MD, all the deps are stored in files like mm/.init-mm.o.cmd
>>>>> and sucked into the build.
>>>>
>>>> You are thinking of kbuild. This is not kbuild. There are no such artifacts
>>>> being generated.
>>>
>>> Oh. Really? That's horrible.
>>>
>>
>> Well, yes, it's not a perfect build system down here in selftests/. Are you saying
>> that it is worth upgrading? I'm open to suggestions and ideas for improvements,
>> and at the moment, I have the miniature build system here mostly loaded into my
>> head. So for a brief shining moment I can probably understand it well enough to
>> work on it. :)
> 
> I only remarked because I didn't know it wasn't using kbuild. I
> thought it would have used the existing HOSTCC stuff, not sure why it
> is special.
> 
> The only investment that seems worthwhile would be to switch it to use
> the normal kbuild stuff??
> 

I explored switching to kbuild at the kernel summit last year during
my kselftest where are we talk.

There was push back from several developers. We can definitely explore
it as long as we can still support being able to build and run
individual subsystem tests and doesn't break workflow for developers.

If you are up for it, propose a patch and we can discuss it.

thanks,
-- Shuah

