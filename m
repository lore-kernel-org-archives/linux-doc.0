Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CEBFC77B73
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 13:14:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbjE3NOJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 09:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjE3NOI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 09:14:08 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E0BA92
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 06:14:07 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5149aafef44so3737013a12.0
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685452446; x=1688044446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fUH9XtAzWIRgOsb1MqDJfvd6qVENrkssqR4+2VADmQU=;
        b=iLSrL45SV8BP5SNaj9ihAs/HG1rHntKH8UaPf63oqwFqxFSR3voahRiA6NEluOhKtu
         ZTWv7fK83uKK5C7t5jOu7RMYdZ0qCXslmYTpIm+t+1WULQ0dTV+ziS/8Isu6K3DlYOjz
         8TG5F71WCuwaE7AwHpS7Zj7M1Lo5T+UykhITrpppwUN8RqIsUUf4Iee/kT71bNlhbuuF
         /XkTcRCmJr1HZNRZeq17NBZww56GGHJllapgC0nC/bEuBsHqLQzx+zttBSsa5qMY8IR0
         OIlVyz9O7ET9giNoKqD+fXIkU923lQIPOBa2AmO4BtTdrIgWdhXOVkNilDHJjMDJY/hn
         y/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685452446; x=1688044446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUH9XtAzWIRgOsb1MqDJfvd6qVENrkssqR4+2VADmQU=;
        b=IgHkQQu4Tcxb2NJ3JhrOATjK4ePYNDB2RI5/mBU8a09sR0WO2mA04tIclXCSdHazFz
         ODrsaWDf5HIS9EAKa2uacszpkDnAyQMQOGwaNAqapgZ7Jp2eEARVOvu60SQZZW7naTRL
         Wt40ZVdhEfU3oK8da02b5K0pXqgLDPVf+L8TDRzIf/TuPEpbiVOX3S/Jcuk0qimdVIb4
         YjoIv2UUfgAM5cQA8/gRlra8TSC15tmi9nzoMaQBTHcSxZuX3Zh22YIzSak2ebgWZWyp
         iFC9kxyiWbPdy22ML/LwiEYaMcsxjSwzd4o8tNeAeQuReSYJlxi7HUuEMdOPKznet0fn
         IZ6A==
X-Gm-Message-State: AC+VfDyv+mscovkPZ3fVaeeGCNwsIo4FycXvQjJ7/AlP+s1DZz0Y3xix
        HLzmqNexCMpQp4eP1LeAWUUXpQ==
X-Google-Smtp-Source: ACHHUZ71bUnQXRzAkoYWkylcW0WPdqFvOlzeWjYH5TDzER83v471t24VZ6980CJNywvjLuGF0XQLiA==
X-Received: by 2002:aa7:d8cb:0:b0:514:9474:f4b7 with SMTP id k11-20020aa7d8cb000000b005149474f4b7mr1588818eds.31.1685452445895;
        Tue, 30 May 2023 06:14:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id j2-20020a50ed02000000b0050bc4600d38sm3929947eds.79.2023.05.30.06.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 06:14:05 -0700 (PDT)
Message-ID: <34864c2f-dbe2-8598-ad4c-f9c3acc13164@linaro.org>
Date:   Tue, 30 May 2023 15:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] Documentation/process: add soc maintainer handbook
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>, soc@kernel.org
Cc:     conor@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        olof@lixom.net, palmer@dabbelt.com, robh+dt@kernel.org,
        arnd@arndb.de
References: <20230530-multiple-whooping-ee5706fceb67@wendy>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230530-multiple-whooping-ee5706fceb67@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30/05/2023 14:49, Conor Dooley wrote:
> Arnd suggested that adding a maintainer handbook for the SoC "subsystem"
> would be helpful in trying to bring on board maintainers for the various
> new platforms cropping up in RISC-V land.
> 
> Add a document briefly describing the role of the SoC subsystem and some
> basic advice for (new) platform maintainers.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v2:
> - add Krzysztof's suggested method for avoiding inter-branch
>   dependencies
> - explicitly mention that tags should be signed
> - link to the devicetree abi document, rather than trying to explain it
>   here & reword that whole section
> - fix some typos, capitalisation & unify bullet style
> 
> The devicetree abi doc feels quite out of date at this point, and could
> probably do with a spring clean - but it also feels like hallowed groun

Yep, but that's another topic.

> d
> on which one should tread lightly, so I won't go near that til Rob is
> back.

Thanks!

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

