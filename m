Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A866ACCA485
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jun 2022 01:03:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346714AbiFHBBw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Jun 2022 21:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1579391AbiFGXj7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Jun 2022 19:39:59 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ECBE23282B
        for <linux-doc@vger.kernel.org>; Tue,  7 Jun 2022 14:41:49 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id q76so11714678iod.8
        for <linux-doc@vger.kernel.org>; Tue, 07 Jun 2022 14:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Zei+rMtXofDNspSEQfHDdxvw6FwTTwwAkNk8PaYH+Vk=;
        b=gM1q3haoZ8xcG2m/1cV4QlglIObFRuaOTqfk3ZWzwKu4lYch/pviT5/sn6YWsi2Ful
         MUyuJNgKwzjHOT4WiD66Cg7h8YfDvPP7TQ5z4caqZ0/iE2nrwwvmyzkjl1ra6qYZwVji
         +jHM75UnnwV5WsODAILvthjF49P4Hna02u2ZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zei+rMtXofDNspSEQfHDdxvw6FwTTwwAkNk8PaYH+Vk=;
        b=KGt9+tiSa3CZ7jK5Q45jax9wdWf0qYt2onKKhkovKli+5aG7VNEY5rA8LLTTDWm1bD
         RosY2JHCN2ANI0bYIjtYGWIOZTNGXFAdgTrdAnnfikVVRAy7waDimNJ3uvXypabcT2BT
         6v9x6836Tajl/aC0hVqNHdlDmLSFo4QPoAfMg/eyoR7Fvul9wSeLQmZPMExB8qTJ/ZOs
         XtjTi2+m6B3kPBEFcRjMg/9J8aD+8ZHyA3niG63BWrUbOKpGFU5qF4OCUobTI6yntYHE
         oXVUgqQP9/C22uB9PONsTmLuEtQenLyFWTH184Xv+E/Iw7lDeCpc/3U80R6HAUg1qFQ6
         ucTg==
X-Gm-Message-State: AOAM53375aPNonLFJ3aooHu3ZbOkX3s40dGOHhJJSnX+wrxIbdDZNL9W
        8pHduQXXjWzhMa7tCzP1ZpqMFg==
X-Google-Smtp-Source: ABdhPJx71niVTJbfk9wp/5WJhlD+JuQVs7tZ8hmuK9HPnLiZYXzVppCBWspGOgJX6/6yZCG6NS2ztA==
X-Received: by 2002:a05:6638:2105:b0:331:9c7:4e8b with SMTP id n5-20020a056638210500b0033109c74e8bmr17555779jaj.129.1654638108936;
        Tue, 07 Jun 2022 14:41:48 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id g11-20020a02b70b000000b0033136906e1esm7153212jam.18.2022.06.07.14.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 14:41:48 -0700 (PDT)
Subject: Re: [PATCH v2] docs/kselftest: add more guidelines for adding new
 tests
To:     Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     kernel@collabora.com, bagasdotme@gmail.com,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220521073651.4191910-1-usama.anjum@collabora.com>
 <e01f90a0-a3c7-c5fd-ae1f-197c6fec525e@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <63fc263d-c06a-2974-298c-5da80322411a@linuxfoundation.org>
Date:   Tue, 7 Jun 2022 15:41:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e01f90a0-a3c7-c5fd-ae1f-197c6fec525e@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/7/22 6:59 AM, Muhammad Usama Anjum wrote:
> Reminder!
> 

Remember to avoid top posting.

> On 5/21/22 12:36 PM, Muhammad Usama Anjum wrote:
>> Improve and add instructions to add new tests. Add build commands to
>> test before sending the new test patch.
>>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>> Changes in v2:
>> - Updated commit message
>> - Removed dependence of this patch from other patch
>> - Updated instructions
>> ---
>>   Documentation/dev-tools/kselftest.rst | 27 ++++++++++++++++++++++++++-
>>   1 file changed, 26 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
>> index a833ecf12fbc1..ee6467ca8293f 100644
>> --- a/Documentation/dev-tools/kselftest.rst
>> +++ b/Documentation/dev-tools/kselftest.rst
>> @@ -208,6 +208,14 @@ In general, the rules for selftests are
>>   Contributing new tests (details)
>>   ================================
>>   
>> + * In your Makefile, use facilities from lib.mk by including it instead of
>> +   reinventing the wheel. Specify flags and binaries generation flags on
>> +   need basis before including lib.mk. ::
>> +
>> +    CFLAGS = $(KHDR_INCLUDES)
>> +    TEST_GEN_PROGS := close_range_test
>> +    include ../lib.mk
>> +
>>    * Use TEST_GEN_XXX if such binaries or files are generated during
>>      compiling.
>>   
>> @@ -230,13 +238,30 @@ Contributing new tests (details)
>>    * First use the headers inside the kernel source and/or git repo, and then the
>>      system headers.  Headers for the kernel release as opposed to headers
>>      installed by the distro on the system should be the primary focus to be able
>> -   to find regressions.
>> +   to find regressions. Use KHDR_INCLUDES in Makefile to include headers from
>> +   the kernel source.
>>   
>>    * If a test needs specific kernel config options enabled, add a config file in
>>      the test directory to enable them.
>>   
>>      e.g: tools/testing/selftests/android/config
>>   
>> + * Create a .gitignore file inside test directory and add all generated objects
>> +   in it.
>> +
>> + * Add new test name in TARGETS in selftests/Makefile::
>> +
>> +    TARGETS += android
>> +
>> + * All changes should pass::
>> +
>> +    kselftest-{all,install,clean,gen_tar}
>> +    kselftest-{all,install,clean,gen_tar} O=abo_path
>> +    kselftest-{all,install,clean,gen_tar} O=rel_path
>> +    make -C tools/testing/selftests {all,install,clean,gen_tar}
>> +    make -C tools/testing/selftests {all,install,clean,gen_tar} O=abs_path
>> +    make -C tools/testing/selftests {all,install,clean,gen_tar} O=rel_path
>> +
>>   Test Module
>>   ===========
>>   
> 

The change looks good to me. I am catching up on patch backlog after the
merge window and vacation. I can take this through kselftest or if it
goes through doc tree - here is my

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
