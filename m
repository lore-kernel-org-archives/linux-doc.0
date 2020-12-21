Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D93C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 21 Dec 2020 18:10:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E1B2230FC
	for <linux-doc@archiver.kernel.org>; Mon, 21 Dec 2020 18:10:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgLUSKf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Dec 2020 13:10:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgLUSKe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Dec 2020 13:10:34 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F1FC061793
        for <linux-doc@vger.kernel.org>; Mon, 21 Dec 2020 10:09:53 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id 4so6018326plk.5
        for <linux-doc@vger.kernel.org>; Mon, 21 Dec 2020 10:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oKzr3FPkUPe+aYLEEdAws7uUObKGbIl98KSfBYhptN8=;
        b=soNsn/OEkcxcg3tdMLUK8S9ZfkM2t2yqDVZhgO18mjV+PiB93rs9nVs4/WOxCehg/l
         Zg1AKon2Kp22DOxk79DHwR6nf3NMY2EigMyBBHYEATgEmmoIAESPB5ryNAeJdcC/ABow
         gu2QCIJsK3kY5FV0rUzPAZKM+Vu5PA9N1h2mZkoKFe5opMbOQqNy5Nv+ZylxufnFJNgp
         M9n+UFZYYDVCrgxz1RYf1f7reW9o1Uj/tCIUJeJghbf4yqPqoHRS6HDcSsdLMgXS3j5C
         il7Nm9zO2lJUTh3QxS6ymYW9gn3wf4DgrEL+jOFyt3bn8Bjnh1bYfSBVesfBWDPaEQ27
         tqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oKzr3FPkUPe+aYLEEdAws7uUObKGbIl98KSfBYhptN8=;
        b=C4otknzuTZ09U4Nk4HBEuxVzsOx7cGa8iGgFHwV+vlAtHBYw+u/dP3LVMk8wLKCrcU
         5AH3NgONEfrWfohVw/KqJfSW8UfQnS7vh90i3FRM/We/RPaoL4MUCSKBmsxGN9EaygzS
         OsknXumoNagAO/eYH5O1W+HKoiSCeDeuLB++wmAQ+Wra5HL+D7OHa6MUWtswCYpu4Lzo
         mu74+JgYx+F7y9CBtyLRtY4Xcazo40Tsf+4wQQeqsO+l3nQlAfUUAdznhM2GwJHwIjJh
         YtkTmpudzbyL7qc1hIbeCaN/ujWuUW3Nv03/iysaxCGF359y7lPWnz1vP9XJB8lI9RUy
         1HLQ==
X-Gm-Message-State: AOAM531Ml9QWbh6+2/i5FJrczUoWb6wDeteSLEgu0e9MLHJyGCODW2y5
        LfCDgMAXMVEMJgqXHnz2hQxeWLYg1z/a7g==
X-Google-Smtp-Source: ABdhPJztnTinUeHX3LcXJVPOkssICjBjG1WnlYcFyNRW4VUcZrVDlmsc2+SKAtrnjnsK75mEEiyg7Q==
X-Received: by 2002:a17:902:5581:b029:da:a817:1753 with SMTP id g1-20020a1709025581b02900daa8171753mr17030542pli.76.1608574193380;
        Mon, 21 Dec 2020 10:09:53 -0800 (PST)
Received: from [192.168.1.70] (ip72-195-250-206.ph.ph.cox.net. [72.195.250.206])
        by smtp.gmail.com with ESMTPSA id w63sm17017843pfc.20.2020.12.21.10.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Dec 2020 10:09:52 -0800 (PST)
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: Add LOCK and UNLOCK flag bit
 support
To:     mdalam@codeaurora.org
Cc:     vkoul@kernel.org, corbet@lwn.net, agross@kernel.org,
        bjorn.andersson@linaro.org, dan.j.williams@intel.com,
        dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        sricharan@codeaurora.org
References: <1608215842-15381-1-git-send-email-mdalam@codeaurora.org>
 <6c85436d-e064-367e-736b-951af82256c8@linaro.org>
 <9769c54acf54617a17346fea60ee38b6@codeaurora.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <8c86f4db-9956-10d1-b380-a207137b50ef@linaro.org>
Date:   Mon, 21 Dec 2020 13:09:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9769c54acf54617a17346fea60ee38b6@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 12/21/20 2:35 AM, mdalam@codeaurora.org wrote:
> On 2020-12-19 09:05, Thara Gopinath wrote:
>> On 12/17/20 9:37 AM, Md Sadre Alam wrote:
>>> This change will add support for LOCK & UNLOCK flag bit support
>>> on CMD descriptor.
>>>
>>> If DMA_PREP_LOCK flag passed in prep_slave_sg then requester of this
>>> transaction wanted to lock the DMA controller for this transaction so
>>> BAM driver should set LOCK bit for the HW descriptor.
>>>
>>> If DMA_PREP_UNLOCK flag passed in prep_slave_sg then requester of this
>>> transaction wanted to unlock the DMA controller.so BAM driver should set
>>> UNLOCK bit for the HW descriptor.
>> Hi,
>>
>> This is a generic question. What is the point of LOCK/UNLOCK with
>> allocating LOCK groups to the individual dma channels? By default
>> doesn't all channels fall in the same group. This would mean that
>> a lock does not prevent the dma controller from not executing a
>> transaction on the other channels.
>>
> 
> The Pipe Locking/Unlocking will be only on command-descriptor.
> Upon encountering a command descriptor with LOCK bit set, the BAM
> will lock all other pipes not related to the current pipe group, and keep
> handling the current pipe only until it sees the UNLOCK set then it will
> release all locked pipes.

So unless you assign pipe groups, this will not work as intended right? 
So this patch is only half of the solution. There should also be a patch 
allowing pipe groups to be assigned. Without that extra bit this patch 
does nothing , right ?


-- 
Warm Regards
Thara
