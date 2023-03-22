Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209DFC6FD1F
	for <linux-doc@archiver.kernel.org>; Wed, 22 Mar 2023 14:37:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbjCVOhg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Mar 2023 10:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbjCVOhd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Mar 2023 10:37:33 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D01012CFC
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 07:37:32 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id bc5so4236127ilb.9
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679495851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z497ruJqlVfegWF8NRtzXXhznR1xFw36jEr9lMNWtW8=;
        b=ZYK26V2g092icbcstQePXB1TRFPbPQZe1CBwJf7P9Teq6XfzVNhFnnBH7vjC27DghI
         Flp2kk3ZGV9n26FTjrkwHXGuPVJxjMw3X7k33h8nZHDZcl9JirgmckGzyOU79bP1IWG2
         BtLGzrA+Zqqlag+cXqezUxGhi2O8weCKIweq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679495851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z497ruJqlVfegWF8NRtzXXhznR1xFw36jEr9lMNWtW8=;
        b=kToCQ1We7uU5Qa8rS5Phm0Wc5RBzmq/OYdmYKTNdVPt02e1LfWn+Yi2AotQtWwNpNf
         i5Nvlqdbzr03CegDDMdROs4QccW7v6MQujjJzlEjQ3tWcVRqBhgnoZDPpHB3B597UPFF
         O9fG8VqXDpyYcNc6xH4LgGDvQV/GD+VuqATxkJJN0T4CpzL/b5VBZr13w76Jml9nuQlY
         uPVRcI0xadK40s0pcKsAG3ZU2Egv92eWytXAgKyHsiyMY3P0WWPMqs91RNx72rVVF3gY
         /HrjtxfHLLXDq5ErU+xJhVuSV0yBoO5DxZ0qg0Gy4QcqEQjkrf+EKdaFguLXxRJcOZuu
         1GGw==
X-Gm-Message-State: AO0yUKVj49n+A3K8krPK5RnwcGY3SNG9u/JBuMHul5gAjTMUyIsyH6td
        R/5eLP9s/wfX01O7leE4U3JHqA==
X-Google-Smtp-Source: AK7set+IMm0d5HOLmep773OFIQkwLF0SEBX/p2vVLMkBm0RJzPPIpQ2XRR7IV1iJ7KXHFwUF7dxoTw==
X-Received: by 2002:a05:6e02:1354:b0:323:504:cff6 with SMTP id k20-20020a056e02135400b003230504cff6mr3702500ilr.3.1679495851552;
        Wed, 22 Mar 2023 07:37:31 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id f102-20020a0284ef000000b0040631e8bf89sm5063538jai.38.2023.03.22.07.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 07:37:31 -0700 (PDT)
Message-ID: <f8a8890b-7a02-6824-b5aa-957008ebda53@linuxfoundation.org>
Date:   Wed, 22 Mar 2023 08:37:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] docs: add system-state document to admin-guide
To:     Bagas Sanjaya <bagasdotme@gmail.com>, corbet@lwn.net
Cc:     kstewart@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230321231816.31131-1-skhan@linuxfoundation.org>
 <ZBrKcwoFMAhmIn1f@debian.me>
Content-Language: en-US
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ZBrKcwoFMAhmIn1f@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/22/23 03:29, Bagas Sanjaya wrote:
> On Tue, Mar 21, 2023 at 05:18:16PM -0600, Shuah Khan wrote:
>> +scripts/checksyscalls.sh can be used to check if current architecture is
>> +missing any function calls compared to i386.
> 
> i386 is the reference architecture for comparing syscalls, right?
> 

Correct. If you are askig about "function calls" wording, this is coming
right from the checksyscalls.sh

>> +This scripts parses Documentation/features to find the support status
>> +information. It can be used to validate the contents of the files under
>> +Documentation/features or simply list.::
> 
> "... to validate contents of Documentation/features files or simply list
> them::"
> 
>> +Let's do one last sanity check on the system to see if the following two
>> +command outputs match. If they don't examine your system closely. kernel
>> +rootkits install their own ps, find, etc. utilities to mask their activity.
>> +The outputs match on my system. Do they on yours?
>> +
>> +ps ax | wc -l
>> +ls -d /proc/* | grep [0-9]|wc -l
> 

Thanks for catching this.

> The shell snippet above should be in a code block for consistency
> with other snippets.
> 
>> +Linux kernel supports several hardening options to make system secure.
>> +kconfig-hardened-check tool sanity checks kernel configuration for
>> +security. You can checkout the latest::
> 
> "... If you don't have the tool handy, you can clone the repository::"

I can fix it to say "clone the latest"

> 
>> + * https://docs.kernel.org/trace/index.html
> 
> Shouldn't the last ref be internal link (Documentation/trace/index.rst)?
> 

This docs.kernel.org link intentional and it is better to this rendered
version.

thanks,
-- Shuah

