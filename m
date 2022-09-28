Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB3BC32771
	for <linux-doc@archiver.kernel.org>; Wed, 28 Sep 2022 11:48:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232505AbiI1Lsz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Sep 2022 07:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbiI1Lsy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Sep 2022 07:48:54 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 470985300B
        for <linux-doc@vger.kernel.org>; Wed, 28 Sep 2022 04:48:53 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id bq9so19404988wrb.4
        for <linux-doc@vger.kernel.org>; Wed, 28 Sep 2022 04:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=bjCMcNk2k1mllRAzI04a6kjFNlIf6SiOUhCmVwDnypU=;
        b=EEprRf4x8chuULiTsNz2Q3XxGCV+s70c+/lpd1BCCrfb8vQxwnvL8W/N3OTS+8qZdY
         lDB6sB5OJjrKWi/bczbR7OnNjf1eZTYX+FyACjR/ICTprD6G8O3fF0Dcu3/MgLf3C4cj
         t89eVdep4yOiztUjY21mIbmwuNSx5N+tTY/VyKci5sEjbRR7vclX/pGqHR5KLu2rw3Sh
         j7OjTk011U/ENej2mBolNus6xglKbgEwHCJvk6/h0REPpofjPgHWo33uWRFaCQwy/T82
         e5dTOLRE71TQAUVjvjLQQme7XEGpJTuDNwu6L3v/wPf/GxIjOePc3W47w/7ubQLLCimC
         wc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bjCMcNk2k1mllRAzI04a6kjFNlIf6SiOUhCmVwDnypU=;
        b=cBP5XGW6paJ1WQMCcwOaZqWiK6LNqVMENoCYxxn3UX4fGNPId+xxwbweF0QY2Npk08
         uE65hyh9VuaUQ24fsjnJizRkrx6m7wSW0vk0H7oFLJ0EDapQFvVNSkQY8LZVL5UwGQXW
         w3oBuBrF/CU5av3zoWsKw0MW9vdChTOD9sj3cnM1Xa2MGWtze1E4RmVYYN2t3bwcv6+l
         eEs5XaXbiuPf5DeTJ3OhMpIYYRro//Dy9kZ3F1yvKkQJwwybd9YTFetBIu7Afsn4I91e
         UGePsHTyEkpVL4JQhxhnPGt/H9gF/R3x74h1ysjwdZ5C4XoK5K13dqgTCQvHfqN5SkiA
         K3qA==
X-Gm-Message-State: ACrzQf3WPvVAlZGTuL50kPBe3BSK2381qpE6BQYGVRNskOYgZFDfWPYX
        swkdjR/zQ1eiGXyN6FrDmmStnQ==
X-Google-Smtp-Source: AMsMyM4H/TvRVQSzaL0Z6wsePsC5+J+DCR3+YuAAQoGUVtCOqKVDzIYSZx+al4q37O89MzT82YFC1A==
X-Received: by 2002:a05:6000:68c:b0:22a:bde3:f8cc with SMTP id bo12-20020a056000068c00b0022abde3f8ccmr20115407wrb.556.1664365731752;
        Wed, 28 Sep 2022 04:48:51 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p16-20020adfe610000000b00225239d9265sm4222633wrm.74.2022.09.28.04.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 04:48:51 -0700 (PDT)
Message-ID: <9a321c25-32ba-6ea0-67a0-07617a1131b2@linaro.org>
Date:   Wed, 28 Sep 2022 12:48:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] Documentation/process: Add text to indicate supporters
 should be mailed
Content-Language: en-US
To:     Thorsten Leemhuis <linux@leemhuis.info>, corbet@lwn.net,
        konstantin@linuxfoundation.org, krzysztof.kozlowski@linaro.org,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20220928003006.230103-1-bryan.odonoghue@linaro.org>
 <9df735b7-2963-9fca-aa7e-6ae993e8b948@leemhuis.info>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9df735b7-2963-9fca-aa7e-6ae993e8b948@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28/09/2022 05:34, Thorsten Leemhuis wrote:
> On 28.09.22 02:30, Bryan O'Donoghue wrote:
>> Recently when submitting a yaml change I found that I had omitted the
>> maintainer whose tree the change needed to go through.
>>
>> The reason for that is the path in MAINTAINERS is marked as Supported not
>> Maintained. Reading MAINTAINERS we see quote:
>>
>>             Supported:   Someone is actually paid to look after this.
>>             Maintained:  Someone actually looks after it.
>>
>> The current submitting-patches.rst only says to mail maintainers though not
>> supporters. When we run scripts/get_maintainer.pl anybody who is denoted a
>> paid maintainer will appear as a supporter.
>>
>> Let's add some text to the submitting-patches.rst to indicate that
>> supporters should similarly be mailed so that you can't do as I did and
>> mail every maintainer get_maintainer.pl tells you to, without actually
>> mailing the one supporter you need to.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Looks good to me, but while at it, one quick question: Would
> Documentation/process/5.Posting.rst (which sadly covers exactly the same
> topic) benefit from a similar clarification, even if it doesn't mention
> get_maintainers explicitly?

Yes.

> Which leads to two other question: Are there any other places that might
> benefit from such a clarification? Or would it be even make sense to
> change the format of MAINTAINERS to avoid the problem in the first
> place? Maybe something like "Maintained(v)" (Someone volunteered to look
> after it in spare hours.) and "Maintained(p)" (Someone is actually paid
> to look after this.). Ahh, no, that doesn't look good. But you get the idea.

We could update get_maintainer to print out something else

such as

scripts/get_maintainer.pl 
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml

Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
Bjorn Andersson <bjorn.andersson@linaro.org> (maintainer:ARM/QUALCOMM 
SUPPORT)
Konrad Dybcio <konrad.dybcio@somainline.org> (reviewer:ARM/QUALCOMM SUPPORT)
Lee Jones <lee@kernel.org> (maintainer-supporter:MULTIFUNCTION DEVICES 
(MFD))

or say

scripts/get_maintainer.pl 
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
Bjorn Andersson <bjorn.andersson@linaro.org> (maintainer:ARM/QUALCOMM 
SUPPORT)
Konrad Dybcio <konrad.dybcio@somainline.org> (reviewer:ARM/QUALCOMM SUPPORT)
Lee Jones <lee@kernel.org> (supporting-maintainer:MULTIFUNCTION DEVICES 
(MFD))

it would be less churn but, I still think we would need to update the 
documentation to be very explicit that "supporting-maintainer or 
maintainer" needs to be emailed with your patch so that sufficiently 
talented idiots such as myself, know who to mail.

Although thinking about it we would be introducing yet another term 
"supporting-maintainer" to which people would say "what is that"

Feels a little less confusing to me to leave supporter as-is and just 
document expectations for patch submission better.

>> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
>> index be49d8f2601b4..5f97379da41da 100644
>> --- a/Documentation/process/submitting-patches.rst
>> +++ b/Documentation/process/submitting-patches.rst
>> @@ -227,9 +227,11 @@ You should always copy the appropriate subsystem maintainer(s) on any patch
>>   to code that they maintain; look through the MAINTAINERS file and the
>>   source code revision history to see who those maintainers are.  The
>>   script scripts/get_maintainer.pl can be very useful at this step (pass paths to
>> -your patches as arguments to scripts/get_maintainer.pl).  If you cannot find a
>> -maintainer for the subsystem you are working on, Andrew Morton
>> -(akpm@linux-foundation.org) serves as a maintainer of last resort.
>> +your patches as arguments to scripts/get_maintainer.pl).  You should mail
>> +everyone who appears as "maintainer" or "supporter" in the
>> +scripts/get_maintainer.pl output.
> 
> Side note and bikeshedding: Not sure, I wonder if the 'in the
> scripts/get_maintainer.pl output' can be dropped to make things shorter.
> Or maybe even shorter along the lines of 'Mail everyone listed as
> "maintainer" or "supporter"'?
> 
> Whatever, not that important.

Sure NP.

---
bod
