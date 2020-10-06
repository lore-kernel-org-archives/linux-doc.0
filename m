Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBED8C46466
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 15:21:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC99E206F7
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 15:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601997665;
	bh=IA1K0OyWpZasuDj0WuKRfOtYnmC1t0/TdU7crE+gMX8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=z0uUOXY1RSdGle9mhnJKb+0wlKdPgr9wdtuP0aldGcyDmvGaZhGHa1zbKVum2OkHe
	 RLte2H641iQqybMwPf52tl4TuzTqyZLIJnEoh2DsslK4roAEjWDc9Gsj/LnWePv0UM
	 2mvKuHISeUkaGSdsxfEN8EMgf+nT0h8W/gAKGpeA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgJFPVF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 11:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgJFPVF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Oct 2020 11:21:05 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5297C0613D1
        for <linux-doc@vger.kernel.org>; Tue,  6 Oct 2020 08:21:04 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id t18so3922002ilo.12
        for <linux-doc@vger.kernel.org>; Tue, 06 Oct 2020 08:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mmj7x7pJat8UNIIwIa7Sd+SRNOWKvcmn8r90tiL0s1A=;
        b=IXQwwVAi7F6pRyGOUEQ8zaCzPCqLYGzR6fWH1AMiUEwCFiSYJ471FkLdAmCwbx2c54
         ItJ9whV/AqUo+mM2d7MbaozYvKfTm/b80nFjzDVrSdzgt+4L5TPDPIQZWJW4+sAYwEpy
         BbucuKw8YdnI1BxGGqAvEq5di/ZoXDjLG4oTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mmj7x7pJat8UNIIwIa7Sd+SRNOWKvcmn8r90tiL0s1A=;
        b=kWKPbRpr6kJasns7hqPWyCqiLnniDKGvGMoFTIV3PqlTspoXeM2FTA/wlHzqLUB9q/
         DjXHuJrznGwR1jBJDwY6C4MOtmhjfDpv1tRRS05ntntJ/nLNN5VlO+g4wWRaMiiucZ7A
         LG5FFkfNDAubUj48YckHGfSSeajKsMS159mHhdU1l3hPihoIBUWcs6d5bvOpn+nf5ddY
         6zyVaE8oZYfgBGPCSydiS2y0sfKmmMG2GFdu8TML0rw/GN8S23nc1ZHjwiKACx0mEG6g
         LS0LoxZtobDcKTjdeJBuyWWciIyYt5hMbcPGOUVfo8g/7NLusNn1t3ty20KjudioQWmH
         j5CQ==
X-Gm-Message-State: AOAM533v7Fs0xuwacbsbES/tSiCVuiyYe5zFpE6oadzJBMvY6iDC2UP4
        L2ij/tdeAwB+poJ6bMSQNmMFUQ==
X-Google-Smtp-Source: ABdhPJyqEmZz43/2Pp1HykB1ZUp+7my5maxDOMBk3deo+zKUWBRwafPlIzkV/qrgjjh1lVhgQ7y1zw==
X-Received: by 2002:a92:b50b:: with SMTP id f11mr4049407ile.109.1601997664092;
        Tue, 06 Oct 2020 08:21:04 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id z76sm349366ilf.76.2020.10.06.08.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 08:21:03 -0700 (PDT)
Subject: Re: [PATCH 00/11] Introduce Simple atomic and non-atomic counters
To:     Kees Cook <keescook@chromium.org>
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org, shuah@kernel.org,
        rafael@kernel.org, johannes@sipsolutions.net, lenb@kernel.org,
        james.morse@arm.com, tony.luck@intel.com, bp@alien8.de,
        arve@android.com, tkjos@android.com, maco@android.com,
        joel@joelfernandes.org, christian@brauner.io, hridya@google.com,
        surenb@google.com, minyard@acm.org, arnd@arndb.de,
        mchehab@kernel.org, rric@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-acpi@vger.kernel.org, devel@driverdev.osuosl.org,
        openipmi-developer@lists.sourceforge.net,
        linux-edac@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1601073127.git.skhan@linuxfoundation.org>
 <202009260923.9A2606CFF6@keescook>
 <3929a023-eb7a-509c-50e1-ee72dca05191@linuxfoundation.org>
 <202009281612.EDC1C0078@keescook>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <700f0ed4-fe09-7610-b460-89b5ad08452c@linuxfoundation.org>
Date:   Tue, 6 Oct 2020 09:21:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202009281612.EDC1C0078@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/28/20 5:13 PM, Kees Cook wrote:
> On Mon, Sep 28, 2020 at 04:41:47PM -0600, Shuah Khan wrote:
>> On 9/26/20 10:29 AM, Kees Cook wrote:
>>> On Fri, Sep 25, 2020 at 05:47:14PM -0600, Shuah Khan wrote:
>>>>      7. Verified that the test module compiles in kunit env. and test
>>>>         module can be loaded to run the test.
>>>
>>> I meant write it using KUnit interfaces (e.g. KUNIT_EXPECT*(),
>>> kunit_test_suite(), etc):
>>> https://www.kernel.org/doc/html/latest/dev-tools/kunit/
>>>
>>> Though I see the docs are still not updated[1] to reflect the Kconfig
>>> (CONFIG_foo_KUNIT_TEST) and file naming conventions (foo_kunit.c).
>>>
>>
>> I would like to be able to run this test outside Kunit env., hence the
>> choice to go with a module and kselftest script. It makes it easier to
>> test as part of my workflow as opposed to doing a kunit and build and
>> running it that way.
> 
> It does -- you just load it normally like before and it prints out
> everything just fine. This is how I use the lib/test_user_copy.c and
> lib/test_overflow.c before/after their conversions.
> 

I am not seeing any kunit links to either of these tests. I find the
lib/test_overflow.c very hard to read.

I am going to stick with what I have for now and handle conversion
later.

I think it might be a good idea to add tests for atomic_t and refcount_t
APIS as well at some point.

thanks,
-- Shuah
