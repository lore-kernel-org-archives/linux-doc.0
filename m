Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E50DC636D7
	for <linux-doc@archiver.kernel.org>; Mon, 30 Jan 2023 23:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbjA3XUf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Jan 2023 18:20:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbjA3XUe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Jan 2023 18:20:34 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA0E27D40
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 15:20:33 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id r6so2584966ioj.5
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 15:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QoWJBPlhONEo27DBkPSJxofFyjuxznuCdFDDNuIYoVA=;
        b=K2eGncq5rm8WUagXiXHcL9i2X7JWgHlub+RvFMn2ALoI6HP73WLm4haHMRafCzbO47
         l8ZDxzZNsqqGXbKsbCv086D1hGfCqwp3KZk+8L6vbQpDcvRsYyQeq7kYsHZM6tzNFXtm
         7rRCtxdMr9qwRUHVQEUl0K7MGB20Ad6/mrGIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QoWJBPlhONEo27DBkPSJxofFyjuxznuCdFDDNuIYoVA=;
        b=GlOkbRg+HyC5C5ukrMGpS3Qo8iZ1MXt4WtDHcUj5Utp6LukX2VOl8avk3WsbrSeuXq
         khq5SP0gp+G3HhcTAavo8gmyCIlRe5+LT6q7H79W3Jzc1syFgqdsQrFJm0c+HCImXxAK
         DpwflnQnVrpc1nHAcq53JYZkuMoRE05E5Jx2yKYrTwpc9A+KuwFRJGg6S0LoBWCSvFPN
         q3fLDInOqUMH2Us6m8hXsKdt2uNeVOwVQ+sJPYH0mgxoAJ+FDyXiHfrkA07IzjccLGSD
         zeVNHHBPfXIZ+5xT3Y6R1ZuEnRw2jSzyahIu1cA3dj7IenUxbKmqiOzYPBC+1PbO/n4x
         QxOg==
X-Gm-Message-State: AFqh2koBfwQsPpM6RrgnZljJ+GyR+S/vVZxr6C1/yd+TQI/dwti96orv
        SGFjQ8+DgMz3lwTulQYGx64sNA==
X-Google-Smtp-Source: AMrXdXvQAGzB2SQuB2Udtkj3pF9mBQbBcfaP1Vnr1bkh3W45zfQsX2tCVAfrJZPxB33Uhs1zcGLKvA==
X-Received: by 2002:a05:6602:341a:b0:704:d91f:9932 with SMTP id n26-20020a056602341a00b00704d91f9932mr8807276ioz.0.1675120833103;
        Mon, 30 Jan 2023 15:20:33 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id h13-20020a056638062d00b003a970f21f9asm4210310jar.78.2023.01.30.15.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 15:20:32 -0800 (PST)
Message-ID: <68594f1d-25e3-4eab-98cb-8691d01719c7@linuxfoundation.org>
Date:   Mon, 30 Jan 2023 16:20:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] docs: add workload-tracing document to admin-guide
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>, corbet@lwn.net
Cc:     sshefali021@gmail.com, kstewart@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230127234616.55137-1-skhan@linuxfoundation.org>
 <25089707-b037-4cce-367b-819ddd239b17@infradead.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <25089707-b037-4cce-367b-819ddd239b17@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/27/23 22:40, Randy Dunlap wrote:
> Hi--
> 
> On 1/27/23 15:46, Shuah Khan wrote:
>> Add a new section to the admin-guide with information of interest to
>> application developers and system integrators doing analysis of the
>> Linux kernel for safety critical applications.
>>
>> This section will contain documents supporting analysis of kernel
>> interactions with applications, and key kernel subsystems expectations.
>>
>> Add a new workload-tracing document to this new section.
>>
>> Signed-off-by: Shefali Sharma <sshefali021@gmail.com>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>> Changes since v1:
>> - Addressed review comments on v1 on long lines, rst syntax, license
>>
>>   Documentation/admin-guide/index.rst           |  11 +
>>   .../admin-guide/workload-tracing.rst          | 591 ++++++++++++++++++
>>   2 files changed, 602 insertions(+)
>>   create mode 100644 Documentation/admin-guide/workload-tracing.rst
>>
> 

Thank you for the review. I will send v3 to address them.

thanks,
-- Shuah

