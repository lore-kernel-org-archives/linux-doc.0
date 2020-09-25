Return-Path: <SRS0=pZ1j=DC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6574BC47420
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 22:37:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F2D622211
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 22:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601073472;
	bh=TYuTe9g0mwa2Y2IZS451izNtSZ/ugBwYsG+gLW1eHno=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=v367GGlqlTb3RblmpFg/BFq+fy+Dmxi/maCKYSvzkhkCRYpQ0cPmknpxrqyuyxO+t
	 o2Dx655NXzx31VQkgoUwptW5vGahiCv/evnTJqxx1f5udca5dwWufKPxhXDkrx2oTf
	 0ohhRbdcBjX02tunJ+yNL4WHi9a3qiOpURhRamk4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729032AbgIYWhs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Sep 2020 18:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728983AbgIYWhs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Sep 2020 18:37:48 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 109E6C0613D4
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 15:37:48 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id v20so4436249oiv.3
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 15:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1GUnPWZQb3wmsz17jd8cPsFjDlwSIdeaeunn4YKd8bc=;
        b=cUGmiVVab0u8mYTiDe3U8u1ya2bN2aQHwiRyr0oN+SEQeoBac0yel+rVAJpG23d6Cw
         SkWYyhXR+Q0RhmtVczpwc52Ra7P92GEyVfLujifP74L85bN+J8e9V+D07zbcd4hggTWn
         sTf5Y3Nm3Lj+rn13yl8gTMvITuy5xWYxaBBBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1GUnPWZQb3wmsz17jd8cPsFjDlwSIdeaeunn4YKd8bc=;
        b=tzYKBOYkvJGauGq8n0trsFw5+smMfdvvHyJXT/JhauNArZoTHg5lwtMdypbupYYxLx
         br8XcASATErW3xNoIL8hU8kO082y2VxDj8xGREYsl6ij7G+iCfur66Hz2e9WFDWPKONE
         7ksSgjhcBniIfCJPhuNAFcVH0fMD/FJ81h4MSVDDrLzwjQ0YwEDIAynBV8/mKn6Fqeee
         /696y0PlKRKJ79sQF5uUx2+tCOX0TgAixQ5siEZ8npa/sjp8MZc1E0S86OCUWZlQSTow
         mrt1cXzPavJnxKwLvf54sc1USLGzeklbOZeZKhNC39WBocMJHfD1jL2yvoBUaqu22Ugj
         3xJA==
X-Gm-Message-State: AOAM530UfGZkk5dXKajnZgQlc/grywimCnbIVl6iHWQ0vKd78KkpTUXk
        O8PZjQ92Fm2QX01YCrgsNWgSXA==
X-Google-Smtp-Source: ABdhPJzlc9XcIwkgj1jA3voZXHCy+z/zzMdn6CUvY2QhJa2e+80Yy/KlTGUEECczFqtoREwqoRqFAA==
X-Received: by 2002:aca:d693:: with SMTP id n141mr496407oig.26.1601073467264;
        Fri, 25 Sep 2020 15:37:47 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id i7sm983027oto.62.2020.09.25.15.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 15:37:46 -0700 (PDT)
Subject: Re: [PATCHv5 kselftest next] selftests/run_kselftest.sh: make each
 test individually selectable
To:     Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>
Cc:     Hangbin Liu <liuhangbin@gmail.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-doc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, Tim.Bird@sony.com,
        lkft-triage@lists.linaro.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Justin Cook <justin.cook@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200914021758.420874-1-liuhangbin@gmail.com/>
 <20200914022227.437143-1-liuhangbin@gmail.com>
 <CA+G9fYvT6Mw2BamoiVyw=wLUqD-3LB2oaDqcuabOyWfFxEN1qg@mail.gmail.com>
 <202009251414.15274C0@keescook>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <659b23c9-abf5-0387-c4c6-5d0a48e3afdc@linuxfoundation.org>
Date:   Fri, 25 Sep 2020 16:37:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202009251414.15274C0@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/25/20 3:16 PM, Kees Cook wrote:
> On Fri, Sep 25, 2020 at 01:51:53PM +0530, Naresh Kamboju wrote:
>> On Mon, 14 Sep 2020 at 07:53, Hangbin Liu <liuhangbin@gmail.com> wrote:
>>>
>>> Currently, after generating run_kselftest.sh, there is no way to choose
>>> which test we could run. All the tests are listed together and we have
>>> to run all every time. This patch enhanced the run_kselftest.sh to make
>>> the tests individually selectable. e.g.
>>>
>>>    $ ./run_kselftest.sh -t "bpf size timers"
>>
>> My test run break on linux next
>>
>> ./run_kselftest.sh: line 1331: syntax error near unexpected token `)'
>> ./run_kselftest.sh: line 1331: `-e -s | --summary )
>> logfile=$BASE_DIR/output.log; cat /dev/null > $logfile; shift ;;'
> 
> Yes, please revert this patch. The resulting script is completely
> trashed:
> 
> BASE_DIR=$(realpath $(dirname $0))
> . ./kselftest/runner.sh
> TESTS="seccomp"
> 
> run_seccomp()
> {
> -e      [ -w /dev/kmsg ] && echo "kselftest: Running tests in seccomp" >> /dev/kmsg
> -e      cd seccomp
> -en     run_many
>          \
> -ne             "seccomp_bpf"
>          \
> -ne             "seccomp_benchmark"
> 
> -e      cd $ROOT
> }
> 
> 
> 

Will do.

thanks,
-- Shuah
