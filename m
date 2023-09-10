Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B86EE57CD
	for <linux-doc@archiver.kernel.org>; Sun, 10 Sep 2023 10:55:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346615AbjIJKz7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 10 Sep 2023 06:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbjIJKz6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 10 Sep 2023 06:55:58 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64448CD7
        for <linux-doc@vger.kernel.org>; Sun, 10 Sep 2023 03:55:53 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-52683da3f5cso4465677a12.3
        for <linux-doc@vger.kernel.org>; Sun, 10 Sep 2023 03:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694343352; x=1694948152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IeB+N3WcU8ZB3iIjHrTen1Ywk3DzscLepUtpPK7KYFU=;
        b=eK/bA1G4SHuERl8nEor0tUdtKM/jLqtVrLBzdl/+4+1nldkN1u/5eRh2IJ/h/xCntj
         x9GFk8vLLiy6nYsIjqWNIiNa+8raziTeaXBhshWg+k2NALAOQon5uvtBkF+7jIR94+ge
         KcBLNnbZUg/oMuWfycnI4lgzv04h7uGhVCybfgFRMGSA07qozXy1l/pUUbFPPku7atOl
         7TDf4JQ7GyoAYaX0GF/aVMrzsebsnxgr5erOaEMutaS/EESZ+36RoE88mtP2SHufpstE
         tjcD8IPu95+kp08PHWSOgtwPZz2GWrQLJni6Pf9fPv0QJ+YKMolvlvUxy1Igh+rTSRxf
         ISpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694343352; x=1694948152;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IeB+N3WcU8ZB3iIjHrTen1Ywk3DzscLepUtpPK7KYFU=;
        b=o9kXRmhDAkeY6FZu7mbe5vZ1mcr+9idvJEJ0vYmw8cs35liIBeyl1od7nhrZF7JUMo
         QaotHOWtYNteBmriDtDN3eGYu/YJzsOUqNfEaKHmiT9SW1FsQ4SZSGT3qmfdHdTFvfmj
         RCsL3XPFOIsF9KykBbVu6OOxFnBHZNWSa5Jq2wz3/qYNTTJTExFx9slKyIYbvINNljUX
         sHHizNdSslVzz4i0qO5b1rc13VneATBBLreSutAZONUM9m5RA64jA2X91s7iRE1kwLZ2
         KjhFBfZXbs1BauzCzrkl1rvl7cYygQs2o5vKj5V923yO5/Mj5ksx5JKbWyGAD0q7X57n
         cjqQ==
X-Gm-Message-State: AOJu0YxmgN44lKJTDrbdGvN2XO8oWDtc4fXF1oM8nttW4ey8ul6/YbRh
        d+mwxDrkNnmKDmMsTSHJQGlURA==
X-Google-Smtp-Source: AGHT+IEtlK6pD6SAm1xa6VHOQmOUl0ygy8p84MgTWmEPdv60Cc5CbO6und2cQ+jM2C8A71j2VvjCZQ==
X-Received: by 2002:a17:906:7393:b0:9aa:1e32:46da with SMTP id f19-20020a170906739300b009aa1e3246damr1818685ejl.37.1694343351858;
        Sun, 10 Sep 2023 03:55:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id d16-20020a17090694d000b00982be08a9besm3692965ejy.172.2023.09.10.03.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 03:55:51 -0700 (PDT)
Message-ID: <eef69aa5-73c2-9789-9f6d-c3300553c44d@linaro.org>
Date:   Sun, 10 Sep 2023 12:55:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH net-next 0/6] Add support for OPEN Alliance 10BASE-T1x
 MACPHY Serial Interface
Content-Language: en-US
To:     Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        corbet@lwn.net, steen.hegelund@microchip.com,
        rdunlap@infradead.org, horms@kernel.org, casper.casan@gmail.com,
        andrew@lunn.ch
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        horatiu.vultur@microchip.com, Woojung.Huh@microchip.com,
        Nicolas.Ferre@microchip.com, UNGLinuxDriver@microchip.com,
        Thorsten.Kummermehr@microchip.com
References: <20230908142919.14849-1-Parthiban.Veerasooran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230908142919.14849-1-Parthiban.Veerasooran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08/09/2023 16:29, Parthiban Veerasooran wrote:
> This patch series contain the below updates,
> - Adds support for OPEN Alliance 10BASE-T1x MACPHY Serial Interface in the
>   net/ethernet/oa_tc6.c.
> - Adds driver support for Microchip LAN8650/1 Rev.B0 10BASE-T1S MACPHY
>   Ethernet driver in the net/ethernet/microchip/lan865x.c.

And why is this RFC? Do you mean by that it is buggy and not finished,
so we should not review?

Best regards,
Krzysztof

