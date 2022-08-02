Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A841C19F2B
	for <linux-doc@archiver.kernel.org>; Tue,  2 Aug 2022 08:31:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235113AbiHBIbT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Aug 2022 04:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235818AbiHBIbS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Aug 2022 04:31:18 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDD926559
        for <linux-doc@vger.kernel.org>; Tue,  2 Aug 2022 01:31:16 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id e15so10879845lfs.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Aug 2022 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=tm9i8Ca6FK9a6ZQOggffT5qJ+C77bjSS2WfM7QIVfdo=;
        b=azwS2h42mZGSBdjobuObfSo6ZuoD+/OU2OJXRzbv56w7gw3DK/mcr1sh9zHBQ6/3sQ
         IQOViz6XnPT8rQncPNNsfZ7ABbLAfoUKFcw6AYqyp9LEAW5Ozl1Ro+oS6WeLeliYSy7j
         jEb9YQkRB30ea0zSHArFfDaCyqsXtukDdlsM/TEI+8n/9wAWu7DtFtrfLCceK10NaJBm
         JTT68ZX8fYNsVoGzcnvoj01eH8XUl7Os2xYm69pCAUVEvY2bF4baFMwYrdlrMifFXFT7
         3Xj7bREip5bIbu14t8VLK58VwmV73XJN3sbkxj4teEBKUCNieos6ThW0Lbo6LayvhKzH
         LOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=tm9i8Ca6FK9a6ZQOggffT5qJ+C77bjSS2WfM7QIVfdo=;
        b=k+pohZlEvBLUOAyvR2DqzNiSfZntRF32D4ufZe/8Agk0SbRAFKTffLo30S3KAuiP0a
         3SXNDSIOFj6stjrw7rOAeRDbsTbB8G25+8iUm3L0FHrTj2KH3npiLINLGc8OFThO0PJE
         icTVzv1PP1Cuzd7eVz5ZsqXzUO4E5p15+spe5iESP4RtQLtSNk+aeavzQFq2GgxS173S
         yYIzp0OQIdS+PUIyzS2u49DqOk+uPiGdwzn6Pqn6FqmeTCOoIO6GqxQ7mc1B+4korBuh
         7ZrYHzlkLeqGY3ssrySyfuJxOzA7h+nl1Djt0RWReHc8RAoQn94OqZoAwR785xVSLIav
         hwbg==
X-Gm-Message-State: ACgBeo1jI7+9h/spifRMpBNEnGcHDcgTbAWl9N4aC/EG0iD15FFhW6Ra
        7c72ZfaDsnobcFE0778dXkSP5A==
X-Google-Smtp-Source: AA6agR77riBL0TF26fwrGfG3qjaYYiLA8HeiMgBQ2jo3Fv1EKYOG23WEFPgxus1COrP2aVEqaBV3KA==
X-Received: by 2002:a05:6512:1095:b0:48b:6f2:6f3a with SMTP id j21-20020a056512109500b0048b06f26f3amr1401771lfg.646.1659429074920;
        Tue, 02 Aug 2022 01:31:14 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v4-20020a056512348400b0048b08f0c4ddsm222421lfr.253.2022.08.02.01.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 01:31:14 -0700 (PDT)
Message-ID: <6388dd1e-ef17-dd64-36da-4e6cc69358ba@linaro.org>
Date:   Tue, 2 Aug 2022 11:31:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 11/11] gunyah: Add tty console driver for RM Console
 Serivces
Content-Language: en-GB
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <20220801211240.597859-12-quic_eberman@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220801211240.597859-12-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/08/2022 00:12, Elliot Berman wrote:
> Gunyah provides a console for each VM using the VM console resource
> manager APIs. This driver allows console data from other
> VMs to be accessed via a TTY device and exports a console device to dump
> Linux's own logs to our console.

Is such 'console' an unidirectional stream of chars or bidirection one? 
IOW, can I have getty on such console?

> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>   Documentation/virt/gunyah/index.rst   |   7 +
>   drivers/virt/gunyah/Kconfig           |  10 +
>   drivers/virt/gunyah/Makefile          |   3 +
>   drivers/virt/gunyah/rsc_mgr_console.c | 405 ++++++++++++++++++++++++++
>   4 files changed, 425 insertions(+)
>   create mode 100644 drivers/virt/gunyah/rsc_mgr_console.c
>

-- 
With best wishes
Dmitry
