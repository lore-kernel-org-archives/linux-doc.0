Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4628C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 24 Jun 2022 22:37:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbiFXWg7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Jun 2022 18:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbiFXWg7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Jun 2022 18:36:59 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E4D88953
        for <linux-doc@vger.kernel.org>; Fri, 24 Jun 2022 15:36:58 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id z7so4078464ioe.11
        for <linux-doc@vger.kernel.org>; Fri, 24 Jun 2022 15:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dzsFi3Tm31RRj46I6v9flRwI9+x4OGkpaqX7IUefLt4=;
        b=CbA4Yl+rqzLWL060P/BveqY+ySvMH5VQeADfk9tQbDsR6KT05Q3kdXRsbqKMlUrxMp
         RCpDwcoQ5cUSAunCOkGD+44dvHVlwM637WKU7gikMgTuArc9v27DnCth8BmxQKfNnDKR
         1WvtRxPF3ObkjonbrKj1or8JlDYUJYHled9qI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dzsFi3Tm31RRj46I6v9flRwI9+x4OGkpaqX7IUefLt4=;
        b=LskWGtOXVSYqwG4YQg5l0Ni/6yPxY/asgIA6w1qOn7so9uSKDMiJqRKHTakISerqoY
         FRDYERAj3tsw20ohYrwho1rk78TDAgBFwT57jzlQyCbtZFLeVna4tugyUw/J73U2lIHe
         WO4VbNUAC1Lz1TSWnnMAGFzp7vOQENXyTVulML/FEq7KimslIhL7d0+AuxRgYcbqqY2/
         n9mawePMoVhhmYSI7F1X1G/U3MwPMS20xgw+ozQr5IR7CgghULY5tokHr7DierufC50k
         oQssu9CBN6ByZYdnrfQFnEc19GBq+K4cLVezMBG1OJWXylnhAdCBaYa+1nCKUKDTnBK6
         ZVWA==
X-Gm-Message-State: AJIora+7BdoPxji3INPZernw7O4TAv0Gok/b0dkMCa1N5n8tNEC8Yo6m
        VqDkuC/DCH4g2DeDbJUsyI/qRg==
X-Google-Smtp-Source: AGRyM1soQp0JvjN7IVr8qbseSCdVVA9ga4KCn7FFVmdaAMD3Wl7xuzZkWZHs68lMctYLlwyGzVc5oA==
X-Received: by 2002:a05:6602:2e8c:b0:66a:4455:f47f with SMTP id m12-20020a0566022e8c00b0066a4455f47fmr682243iow.117.1656110218051;
        Fri, 24 Jun 2022 15:36:58 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id 126-20020a6b1584000000b0066579afd3cbsm1768780iov.50.2022.06.24.15.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 15:36:57 -0700 (PDT)
Subject: Re: [PATCH 1/3] Documentation: kunit: remove duplicate kunit-tool.rst
To:     Jonathan Corbet <corbet@lwn.net>,
        Daniel Latypov <dlatypov@google.com>,
        brendanhiggins@google.com, davidgow@google.com
Cc:     linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20220603195626.121922-1-dlatypov@google.com>
 <87pmix3ktq.fsf@meer.lwn.net>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <2c3399e9-4f4e-a71a-4030-e4e6d72b5d4e@linuxfoundation.org>
Date:   Fri, 24 Jun 2022 16:36:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87pmix3ktq.fsf@meer.lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/24/22 1:47 PM, Jonathan Corbet wrote:
> Daniel Latypov <dlatypov@google.com> writes:
> 
>> The information is duplicated now in run_wrapper.rst, which was added in
>> commit 46201d47d6c4 ("Documentation: kunit: Reorganize documentation
>> related to running tests").
>>
>> You cna compare these pages here:
>> https://www.kernel.org/doc/html/v5.18/dev-tools/kunit/run_wrapper.html
>> https://www.kernel.org/doc/html/v5.18/dev-tools/kunit/kunit-tool.html
>>
>> We should have deleted it in then but it got overlooked.
>>
>> Signed-off-by: Daniel Latypov <dlatypov@google.com>
> 
> So not that long ago these patches were going through Shuah...it seems
> that's not happening anymore?  I can pick up kunit docs patches,
> certainly.  I've taken the silence on these as assent and applied them.
> 

I am still taking ksefltest and kunit doc patches through my tree. I wait
for Brendan to ack at times. This one didn't show up in linux-kselftest
list it appears.

If you cc linux-kselftest and I get an ack from Brendan, I will take this
through kselftest tree.

thanks,
-- Shuah
