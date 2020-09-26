Return-Path: <SRS0=ljnh=DD=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BF8C4727E
	for <linux-doc@archiver.kernel.org>; Sat, 26 Sep 2020 00:13:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8845023718
	for <linux-doc@archiver.kernel.org>; Sat, 26 Sep 2020 00:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601079223;
	bh=dO8+9I+CCh6iqMqYiE6bsUKPVGRtxlD4MSSBRH4tTa4=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=adgoUAmHoNrGROa1r/PKQ03kS/VhEjLetcR+4Dyqr/tch1IQeQr6GQEcRs+yYl2qz
	 /vQ7tvgkEx1k5upbCa0aPswZYeY2duv5WX6MEDZR78R9gKftGKbSZPAouuSPzdH7Ja
	 IFes5gQwkyW4u9TGK2/rVUoXzlwfcuBlcP5uo6fo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729448AbgIZANm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Sep 2020 20:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729601AbgIZANl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Sep 2020 20:13:41 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD7DBC0613D5
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 17:13:40 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id q21so3966973ota.8
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 17:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uV0OqNe6fNGB9fHblrzHw8cV18adwvrkpgLxsiNP0V0=;
        b=Itebs+wDAb4wpBvU4vPbCiLJnqG1udHed3DIfGnE4q+RUOWLMv3mGel8E4yijdBKEY
         I9B5MlW3NcLxPV4yZNs0MN9CUGtiqpVaXBemJ5vvVwM93NCjMqEEtaE3pMrenijGh90R
         nX3nRIJ5N6mKMl8WCK7FP09bwZBnRfzV9FTzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uV0OqNe6fNGB9fHblrzHw8cV18adwvrkpgLxsiNP0V0=;
        b=hcgA6UqrZRjwknzC8uAXe5eLL3w5esNj4O3MtLJocMWiZmZVC36ZU2zdCCcN6/xM3y
         2neJ6DxYixFVLO5PQSNCtQvT1wobapdFgk9F72WC/3aKoin4GX1KFqp90znXjOX+B0J+
         Gt3UgVVo+B8nKHor5y6o20R6yckiMU3K/4J1mi0D4mBVx50lZzA5KkP8lYs5IDJlD6x9
         Em0gHkIdNXlmy+8pJdml7p1fBxgoey6P1mPsyplSqqeZNA12WxSbqigYlvd299Sfod/e
         Hm2g7wwGjEmTkXtdXo7sgVqsKCCL7eCamTxL8IOyikJIkiojyftDwC733Ceajm9QYNPL
         wfrw==
X-Gm-Message-State: AOAM531oGdzLFcw09vl8/1f08I5SJL41G/wKMjE6U1czodqCX7hiWzTK
        cZLSHEb+lLAigV076PabnJYfPA==
X-Google-Smtp-Source: ABdhPJy+UJfLmw1XfbHObY0B1wHdW9//e0AKIl4aAw2lTnknEdN9TO9NnMLa3wvcpjkRI2FBogyCmA==
X-Received: by 2002:a9d:6e1:: with SMTP id 88mr1876214otx.279.1601079219831;
        Fri, 25 Sep 2020 17:13:39 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id d63sm958205oig.53.2020.09.25.17.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 17:13:39 -0700 (PDT)
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
 <202009251650.193E2AD@keescook>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <7d8f86ab-4333-afa1-6523-e42ae5c7d9b2@linuxfoundation.org>
Date:   Fri, 25 Sep 2020 18:13:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202009251650.193E2AD@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/25/20 5:52 PM, Kees Cook wrote:
> On Fri, Sep 25, 2020 at 05:47:14PM -0600, Shuah Khan wrote:
>> -- Addressed Kees's comments:
>>     1. Non-atomic counters renamed to counter_simple32 and counter_simple64
>>        to clearly indicate size.
>>     2. Added warning for counter_simple* usage and it should be used only
>>        when there is no need for atomicity.
>>     3. Renamed counter_atomic to counter_atomic32 to clearly indicate size.
>>     4. Renamed counter_atomic_long to counter_atomic64 and it now uses
>>        atomic64_t ops and indicates size.
>>     5. Test updated for the API renames.
>>     6. Added helper functions for test results printing
>>     7. Verified that the test module compiles in kunit env. and test
>>        module can be loaded to run the test.
> 
> Thanks for all of this!
> 
>>     8. Updated Documentation to reflect the intent to make the API
>>        restricted so it can never be used to guard object lifetimes
>>        and state management. I left _return ops for now, inc_return
>>        is necessary for now as per the discussion we had on this topic.
> 
> I still *really* do not want dec_return() to exist. That is asking for
> trouble. I'd prefer inc_return() not exist either, but I can live with
> it. ;)
> 

Thanks. I am equally concerned about adding anything that can be used to
guard object lifetimes. So I will make sure this set won't expand and
plan to remove dec_return() if we don't find any usages.

thanks,
-- Shuah
