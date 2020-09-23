Return-Path: <SRS0=6mJA=DA=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E53C2D0A8
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 21:19:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F38DD21D43
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 21:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600895952;
	bh=8qbqOq2bIlvC038Bqbo3kwPZ44UzfVfhfBdxPH1AUgU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=HEbKyHRKUO5y/q5JQGYTFc0Wuc8FvA6dz4CD6KxIYusVXJZbYJwG54Pvfm8cmdKOR
	 U7lEaoQcbHcSf5IwJC+l60+apEkSOsfGOCo0CET57X0DVEp8mJz+0SSk36Jc+rPSZ6
	 XIUNQXdIWGfP3rBUTAEJcVqBOyxGGSQIIBQFKJdM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgIWVTL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Sep 2020 17:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgIWVTK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Sep 2020 17:19:10 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2F9C0613CE
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2020 14:19:10 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id n61so1104710ota.10
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2020 14:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=76bE4TBEk9oRvBu9iAhm7JLXdHzFi0Vc2Hd7Dse6DE4=;
        b=gQJcjND014aKi3pGkWiRscEmRXnjH9MQHXhXMZz2MqX62he6u1xthqIncnsPFer1Oo
         SexshlHVx9WGFtnzObHeDkyA+PQ9LrgmMYwuGF/zaaFmbXlrwZHxITTxmevVhi6RJLrE
         1JbymauFWwJV4VyFMluSX4s39RBFURyDm6JGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=76bE4TBEk9oRvBu9iAhm7JLXdHzFi0Vc2Hd7Dse6DE4=;
        b=E1m4z8Wh0BDXKjJyHVQnUDvFdm0ZLOqkc42AVHFGsFXo63yIfujdVC/x+0sm3xYdgO
         lrlP54sLugeyTyQ6fflttZJCJ+MnJuSZJj5gZn+hDdW11wrGTl2d6BiiAcAqolyS14aC
         lj53sQZXtctcO5d49MvbHaRgLqZR9ScyfncMVd9c0TwsjggM42JWup7TPIS4SfxIpRBO
         /N5f14/a2u+BiVLjGPnBBsAD3ds9cGn2mqvIIvqSQAG0bdvJGT3FenkOVFhIrYVJ5CXL
         DI1XBR34PtrxQLXplRwV1tVYikyMbkPX07R1s9lpRPCF7Sy8nZ2idPoHj7mhtALDAWI8
         IhQA==
X-Gm-Message-State: AOAM530WTusOh93c6PYMiYhpZWANQ0bkjWKgYpm4F+CnaXBeEBU1QTRR
        2KKccw8HYJAIruT+vtZ+JGhfxA==
X-Google-Smtp-Source: ABdhPJxxkXdW6hd7/WvGygoQDyeZw1wsRb1Qn5tnKgpsnVAOHRMnnb5wm3PYuqARYCq910vYaXkaMQ==
X-Received: by 2002:a05:6830:196:: with SMTP id q22mr1004057ota.221.1600895949954;
        Wed, 23 Sep 2020 14:19:09 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id i23sm257156oos.17.2020.09.23.14.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 14:19:09 -0700 (PDT)
Subject: Re: [RFC PATCH 01/11] counters: Introduce counter and counter_atomic
To:     Kees Cook <keescook@chromium.org>
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1600816121.git.skhan@linuxfoundation.org>
 <e57eb89132000b255b5a7952cb82725ec2f3e4e0.1600816121.git.skhan@linuxfoundation.org>
 <202009231152.5023C4656F@keescook>
 <599e3faa-4228-f867-46f1-66566297256b@linuxfoundation.org>
 <202009231354.3456CB141@keescook>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <4ec035ae-efbf-d4b9-cf11-d6e3819a7edc@linuxfoundation.org>
Date:   Wed, 23 Sep 2020 15:19:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202009231354.3456CB141@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/23/20 2:58 PM, Kees Cook wrote:
> On Wed, Sep 23, 2020 at 02:48:22PM -0600, Shuah Khan wrote:
>> On 9/23/20 1:04 PM, Kees Cook wrote:
>>> On Tue, Sep 22, 2020 at 07:43:30PM -0600, Shuah Khan wrote:
>>> I would really like these APIs to be _impossible_ to use for object
>>> lifetime management. To that end, I would like to have all of the
>>> *_return() functions removed. It should be strictly init, inc, dec,
>>> read.
>>>
>>
>> Yes. I am with you on making this API as small as possible so it won't
>> be used for lifetime mgmt. That means no support for:
>>
>> *_test, add_negative etc.
>>
>> I started out with just init, inc, dec, read. As I started looking
>> for candidates that can be converted to counters, I found inc_return()
>> usages. I think we need inc_return() for sure. I haven't come across
>> atomic_dec_return() yet.
> 
> What are the inc_return() cases? If they're not "safe" to use inc() and
> then read(), then those likely need a closer look at what they're doing.
> 

3 in this series I sent. I would say I barely scratched the surface
when it comes to finding candidates for converting.

drivers/android/binder.c
drivers/acpi/acpi_extlog.c
drivers/acpi/apei/ghes.c

These uses look reasonable to me. Having this inc_return() will save
making _inc() followed by _read()

>>>> +There are a number of atomic_t usages in the kernel where atomic_t api
>>>> +is used strictly for counting and not for managing object lifetime. In
>>>> +some cases, atomic_t might not even be needed.
>>>
>>> Why even force the distinction? I think all the counters should be
>>> atomic and then there is no chance they will get accidentally used in
>>> places where someone *thinks* it's safe to use a non-atomic. So,
>>> "_atomic" can be removed from the name and the non-atomic implementation
>>> can get removed. Anyone already using non-atomic counters is just using
>>> "int" and "long" anyway. Let's please only create APIs that are always
>>> safe to use, and provide some benefit over a native time.
>>>
>>
>> I am with Greg on this. I think we will find several atomic_t usages
>> that don't need atomicity.
> 
> If you want to distinguish from atomic and create a wrapping "int", how
> about making "counter" be the atomic and name the other "counter_unsafe"
> (or "counter_best_effort", "counter_simple", ...) etc?
> 

I will change counter to counter_simple and add a warning that this
should only be used when atomic isn't needed. I can outline some
tips for choosing the right one.

thanks,
-- Shuah



