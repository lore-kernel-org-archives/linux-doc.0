Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6D5C61DA4
	for <linux-doc@archiver.kernel.org>; Mon,  6 Feb 2023 14:15:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjBFOPC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Feb 2023 09:15:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231407AbjBFOOl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Feb 2023 09:14:41 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C285E21A1A
        for <linux-doc@vger.kernel.org>; Mon,  6 Feb 2023 06:14:14 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id v17so12854538qto.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Feb 2023 06:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QSDx7lR4lbIKush7SukTE/OhPs2fEUoC37d6gBX19uU=;
        b=ERC064jLHsU/zmzw8RoyeU8P0SzprwSyrytyxl8CwLx+EClBHm9jC4OIs6DvpVHiKT
         bCVzy3h1qM4tXtLnhXZep+n3YNCG1lFKmdcMhA2cD/gh/QUjtXepRZpyCVeQgGre1X2X
         KnrtRxVQcz4oQRyjwKS6GLKe56g3hydKvlM6r5Ri8d3XJGWpNUnajCefgwTI4WqNL4cU
         sru/1dQ7034KdBpTgZtly4j1p8UzyMfQFsQwIt9qdgyJXub8KYNnDl4XCuVQMqnl8C7N
         nPj0QdiOoP5w7Mhs1gNph2awEUtYHg+xob1ow+eIUvy+fwqgdX0BK68LA16ae23n1gqu
         GhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSDx7lR4lbIKush7SukTE/OhPs2fEUoC37d6gBX19uU=;
        b=Gdi8fJfCqJuaYHeRzWMIDOYd+ZyQiZG+6UGTAXFW3uzGUWqWs3AflinzocMG8CSE0c
         xNwdxK00v1HieG5sM/VXHs8MAGM3iR2SZ4FwqxE/XeXtP0v9Rv2dp5v1eNSIpfBIDShP
         qERh4o7iboHAALJTPJHKNlPDo+7UhrCNmSNmFoVjrvULLfbSSfA2zXW1K9oMxCWhm690
         HwUCKD0wbD6mLGv+Z9SgkikUbEUnQ9I0vJIXO59HK8ysquHYtcdl2ATw7LLXdxqekTdP
         kLws1hNbWfwEZH8AXnW8w+2qyi+bHOj2ZORgIRRp7IUGjyU+m63yoB6xFgX2sjO4lgwR
         1NLw==
X-Gm-Message-State: AO0yUKXbWEBTQWrlNn+NNYGa+gj0jL2wNOJO6Ji9KN+jF3x+XewYSsLO
        pmnH67uZtVJrReTS8/qxSJomdw==
X-Google-Smtp-Source: AK7set/JWkzW8hDZXUKQoVbyq7UY837wooVRU+m9/HcISd93PIQ91tjIFTNU42WVbQ6ZqGK+UUiStg==
X-Received: by 2002:ac8:574f:0:b0:3b9:bd28:bb6c with SMTP id 15-20020ac8574f000000b003b9bd28bb6cmr31965755qtx.36.1675692849691;
        Mon, 06 Feb 2023 06:14:09 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id d136-20020a37688e000000b006fa4ac86bfbsm7475775qkc.55.2023.02.06.06.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 06:14:09 -0800 (PST)
Message-ID: <78e7d084-4e76-c9f1-c627-b1256772ef9d@linaro.org>
Date:   Mon, 6 Feb 2023 08:14:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 09/27] gunyah: rsc_mgr: Add resource manager RPC core
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Murali Nalajala <quic_mnalajal@quicinc.com>
Cc:     Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230120224627.4053418-1-quic_eberman@quicinc.com>
 <20230120224627.4053418-10-quic_eberman@quicinc.com>
 <94d6f57b-de3b-1135-5a30-d1cb156581cb@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <94d6f57b-de3b-1135-5a30-d1cb156581cb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/2/23 5:53 AM, Srinivas Kandagatla wrote:
>>
>> +struct gh_rm_rpc_hdr {
>> +    u8 api;
>> +    u8 type;
>> +    __le16 seq;
>> +    __le32 msg_id;
>> +} __packed;
>> +
> #define GH_RM_RPC_HDR_SZ    sizeof(struct gh_rm_rpc_hdr)
> 
> You could use this in most of the places where sizeof is being called.

I'll repeat my point here.  I see no value in hiding
the size of the structure behind a defined symbol.

Use sizeof(*pointer) (if possible) or sizeof(struct foo) in
the code; it makes it very clear that it's not something
other than a simple object/structure size.

					-Alex
