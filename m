Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B67C3DA78
	for <linux-doc@archiver.kernel.org>; Tue, 17 Jan 2023 20:39:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235499AbjAQUib (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Jan 2023 15:38:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233616AbjAQUgg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Jan 2023 15:36:36 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D062BF1E
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 11:21:15 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id v6so6359236ilq.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 11:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X6QGAdbpO4js38m8kqmMNfNj0cJL5DAjxA6pYUNKH30=;
        b=EGBN80wbBUdJj7Z/jkUWK5AFLeZOZLo5xHgOEl0PgXYrOSfBG/7dnDJbzvQhOya/ow
         +jy6ommn0FNq4Wqq83QTFAnhPeX4dDoMUIcfN2dIoY9l4OGUdsYixaaM17Ae+x1IkV8X
         xGy/1xQdE/J2mTBTSTAwy0GrYJTbaUjoANEguiNcpC5TV2IqfcMURDnsGu5H6RmCm7RY
         ZlSXTTrU34trY64Y/VT6wmqHwm+9puSKKQDZBIjr3mHpp+++7lx7kTP1g7LiYlDtyZso
         zzQmejXLekCZG+ZaIwtd1vNYDstgwiSpx9kTxioziEPC6gexAocnuxZtPD1IJrJLBlRe
         RuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6QGAdbpO4js38m8kqmMNfNj0cJL5DAjxA6pYUNKH30=;
        b=rXQrdyTh7c/r9+97y1q9TvY0Rc7DgctEX5gAk+IF6G4rSewyOg11agMFHesaqk2Rzw
         kg3gD8BgV7Tix1He26UKua50s144s3JKAlH3IkMguOv00uRyL13OSjbMa4SjMTzSPpsN
         4jjZZNdHtkqZj1LGUn9PY3AZk5povFU+7rWitaPgWwR/vyd1ukNkObJcc8q2/z+EGJnK
         srg8m3649pIyGTEqAeRaeYmd/zJe0DzaSOw/R1bw69MXnYAJrU1H87U0n6OyQvLHcNuj
         RQsDLuoqKcO2YAEDtSfkK0xKkW0BMzv4bz+IiS7x+oQ0HcwDRQAkY8sTDBz6p+SdJFSB
         x5Dg==
X-Gm-Message-State: AFqh2kq6QYlIyNLylCDuWhCrl45T8vzsy8qAJQ0D0loHzsHjX+Q3S+5c
        eE/ThhRNwdNy96wY+i+f4e/Nvg==
X-Google-Smtp-Source: AMrXdXuSn9Mn8FTmXSuDHirPKGy73AMn7jIeXgtlejcuD7V+SVsgxxuOefJLK0Qin4xwXGaY2YwGSA==
X-Received: by 2002:a92:d6c6:0:b0:304:c91b:4a5c with SMTP id z6-20020a92d6c6000000b00304c91b4a5cmr3292929ilp.24.1673983274699;
        Tue, 17 Jan 2023 11:21:14 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id l3-20020a056e0205c300b0030f1be2e051sm811189ils.39.2023.01.17.11.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 11:21:14 -0800 (PST)
Message-ID: <65af5abc-3719-95fe-041c-67d1d146aba1@linaro.org>
Date:   Tue, 17 Jan 2023 13:21:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From:   Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v8 09/28] mailbox: Add Gunyah message queue mailbox
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Alex Elder <elder@linaro.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
References: <20221219225850.2397345-1-quic_eberman@quicinc.com>
 <20221219225850.2397345-10-quic_eberman@quicinc.com>
 <4e064b55-22fd-5f29-620b-715a5d822a75@linaro.org>
 <f626a867-7293-fd70-00d7-706d43342f5f@quicinc.com>
Content-Language: en-US
In-Reply-To: <f626a867-7293-fd70-00d7-706d43342f5f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/10/23 12:16 PM, Elliot Berman wrote:
>>> +    ret = gh_hypercall_msgq_send(msgq->tx_ghrsc->capid, 
>>> msgq_data->length,
>>> +                    (uintptr_t)msgq_data->data, tx_flags, &ready);
>>> +
>>> +    /**
>>> +     * unlikely because Linux tracks state of msgq and should not 
>>> try to
>>> +     * send message when msgq is full.
>>> +     */
>>
>> Is it just unlikely, or is it impossible?
>>
> 
> This would require multiple mailbox controllers interacting with the 
> same message queue.
> 
> The only way I can think this is possible is if the Gunyah drivers are 
> unloaded when the message queue is full; drivers are then re-loaded 
> before the receiver processes the messages. The initial internal state 
> of the message queue controller assumes that there is space in the 
> message queue. We would get a Tx vIRQ once space becomes available and 
> the message would then be attempted to sent again. Since there's a safe 
> flow to recover from a inconsistent internal state and it's very 
> unlikely to start in that state, I don't think we need to add calls to 
> check if the message queue is full during initialization.

First, your explanation is appreciated but more than what I
was looking for...  I just mentioned it because if it were
impossible, then there's no point in having this code handle
something that literally can't happen.

But as far as your explanation, I *hope* if the Gunyah drivers
are unloaded, everything gets fully cleaned up before that
completes.  There should be no in-flight activity, or
any "previous generation" messages that could be processed.

In any case, I think my question is answered.  Thanks.

					-Alex
