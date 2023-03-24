Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785E8C6FD1C
	for <linux-doc@archiver.kernel.org>; Fri, 24 Mar 2023 16:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbjCXQvB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Mar 2023 12:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbjCXQvB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Mar 2023 12:51:01 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B22158A5
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 09:51:00 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id h11so1158026ild.11
        for <linux-doc@vger.kernel.org>; Fri, 24 Mar 2023 09:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679676659; x=1682268659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R6W/+xSIy2LrHW9iOt6nruh+Qj6F+h5sXjXOMzQkKqc=;
        b=TkwDD8j3zxa46H6s0Y2Cd+cqCjtL8QZFEo4pvrG3FhSyny7CcZlhoKAIPQdbaOhGxw
         eQ1KcRtb/SlQnuljuraLGX38yLSYr67CiNWalVaUK7IPAyd3tUYuUM/JVdvdFrRFLGvr
         pnofxGZMEjNxR5cU0YGOKaWS+LC59OL3ka7Ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679676659; x=1682268659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R6W/+xSIy2LrHW9iOt6nruh+Qj6F+h5sXjXOMzQkKqc=;
        b=hrFJycREhoDYvBb0iaUHz7zdWbF0ZF/Rrsj+GI5Iy6AflVohPzMxrzDYR9zn3xpHyG
         QBtzkHM/sxzDpHLWxBpQSj0uOcZhmX0iqR1f93lnE3pFlU5Ju++KJdMw261QkSU+EsMX
         L9+1lDBwhv5o/Adu7X9UxP7rSGaU6g+D8Rjq+Dd4tIh5CnDuAfSOIKPpDcNSi5+E7r9q
         F4etkefpJH44OJZbIHGrlrj/IyT1Tz5DKEV+1Gj2tmZqLIN0+Y7eORXW+5+k7dsM/amH
         OwUJ6yoGTuYrU41n5/AnGTPARVohRjSzdqrAOJQ9DpU81SG8Apmpbamin4sHN3i36JL0
         SKiQ==
X-Gm-Message-State: AAQBX9cHRGR8h0oqTdxxMPy8TywfAIzY0mfZCN4j3fe8xlX9MHs8JBs3
        clA20ueFcpCw++isoJ4GZn/F0g==
X-Google-Smtp-Source: AKy350bWEnOhZA+41gMK0JwGaYDc47+uvmcqhyuuFaYWlslXE1inLEwmiIOYesAeOcifs1QRRAy0nw==
X-Received: by 2002:a05:6e02:12a8:b0:316:67be:1b99 with SMTP id f8-20020a056e0212a800b0031667be1b99mr1211674ilr.0.1679676659602;
        Fri, 24 Mar 2023 09:50:59 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id g4-20020a05663810e400b003c2b67fac92sm6908450jae.81.2023.03.24.09.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 09:50:59 -0700 (PDT)
Message-ID: <bfa092ee-43c8-c32e-b7f1-7813698861e3@linuxfoundation.org>
Date:   Fri, 24 Mar 2023 10:50:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] docs: add system-state document to admin-guide
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     kstewart@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230322152049.12723-1-skhan@linuxfoundation.org>
 <877cv7cpyj.fsf@meer.lwn.net>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <877cv7cpyj.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/23/23 11:55, Jonathan Corbet wrote:
> Shuah Khan <skhan@linuxfoundation.org> writes:
> 
>> Add a new system state document to the admin-guide. This document is
>> intended to be used as a guide on how to gather higher level information
>> about a system and its run-time activity.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>> Changes since v1:
>> -- Addressed review comments
>>

Thank you for the review and agree with all your comments. I will
send v3 shortly.

thanks,
-- Shuah

