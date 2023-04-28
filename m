Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9778EC7EE22
	for <linux-doc@archiver.kernel.org>; Fri, 28 Apr 2023 12:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345781AbjD1M0b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 28 Apr 2023 08:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbjD1M03 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Apr 2023 08:26:29 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107214497
        for <linux-doc@vger.kernel.org>; Fri, 28 Apr 2023 05:26:27 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-2f86ee42669so9459739f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 28 Apr 2023 05:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682684785; x=1685276785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ta0l6Lv08itCF3ih3pDrrtQORcFWDgffeo/Lv6j7nWs=;
        b=l/kvU/GHw0avOPKANSxEPurb9FkrW5c6sXEi2BHlm2Y5GYB5+69txZKbvaT6AOqCtV
         bLqaNmHLakLuj8vEtMZfeULYDYmyOdqFqaTSDVHI7tb6eRP2mnxzK3FqjAAHXY5rb/OL
         BfwoZtZBL5OCZ0OrlVcgr47q17VWh+ity76RJudCv0Uu0NZ2/vrnElhg6OS2Hz6cPcc9
         aY95cnaUz25Y8TO4UDkNtDnyUpHkPi08ucqhgM/f+OBLkTwYb8LbetYh0kHggEaUf1sF
         SwVLeBIA6FT6zGCA+XbGx5trbNwvUpZLgQFbOG2oJtvclEZrci8574SccMx4h522wQKX
         PwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682684785; x=1685276785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ta0l6Lv08itCF3ih3pDrrtQORcFWDgffeo/Lv6j7nWs=;
        b=X6yEhY5qZca/w9BZO9Dqt0cNzlu7+cjxkmvO4Sy+puYDNpXVCKc4cERbf3f6nubBb8
         5UN2kzc+iGsKP+iWoV5/1ESluzO6AdR6Bze01vzrV7VrR0hScpAOWx6t/6zSHcmXI+sR
         YzzAHm9L8taVRX6ho9fSRdm07M0AM2Xc2iHCPDaLSQ8Du0GnSIAq5y1by/emKYHnhQDe
         2KbW0jv1pg0jurSnhYuMvqf2mWGzgvU7MZBSBgqrrEEttemTUkuGNhwatMoqDVzb+yzR
         N0aSJ2BuspIwH8iMgnBb9UMHlosf+z1O17To12vyMxQrIm9aFyj2euNUZOc0N2E4PyWf
         b/Lw==
X-Gm-Message-State: AC+VfDwhqnYvGEjEIIEwGmBMeiNEvd8ln/KUpWH3dYXvwZ7XY3OMWNfw
        2+W14jgPDBhwwjJJopLAX+OHdw==
X-Google-Smtp-Source: ACHHUZ539Um3Au7ebr5J25DDcgb29sKe92KDcP8tUre5wahXVbiS2azwg4bFs5ceTkPhZOBWur11+w==
X-Received: by 2002:adf:d4c6:0:b0:2ef:b8e3:46fe with SMTP id w6-20020adfd4c6000000b002efb8e346femr3704585wrk.37.1682684785530;
        Fri, 28 Apr 2023 05:26:25 -0700 (PDT)
Received: from [172.23.2.142] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id f8-20020a5d4dc8000000b002f9e04459desm20930621wru.109.2023.04.28.05.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 05:26:25 -0700 (PDT)
Message-ID: <9b39118b-afc8-034a-67ad-c748cb76fb71@linaro.org>
Date:   Fri, 28 Apr 2023 14:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/7] GenieZone hypervisor drivers
Content-Language: en-US
To:     Yi-De Wu <yi-de.wu@mediatek.com>,
        Yingshiuan Pan <yingshiuan.pan@mediatek.com>,
        Ze-Yu Wang <ze-yu.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arch@vger.kernel.org, linux-mediatek@lists.infradead.org,
        David Bradil <dbrazdil@google.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Jade Shih <jades.shih@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Ivan Tseng <ivan.tseng@mediatek.com>,
        My Chuang <my.chuang@mediatek.com>,
        Shawn Hsiao <shawn.hsiao@mediatek.com>,
        PeiLun Suei <peilun.suei@mediatek.com>,
        Liju Chen <liju-clr.chen@mediatek.com>
References: <20230428103622.18291-1-yi-de.wu@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230428103622.18291-1-yi-de.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28/04/2023 12:36, Yi-De Wu wrote:
> This series is based on linux-next, tag: next-20230427.
> 
> Changes in v2:
> - Refactor: move to drivers/virt/geniezone
> - Refactor: decouple arch-dependent and arch-independent
> - Check pending signal before entering guest context
> - Fix reviewer's comments

You need to be specific about what you changed.

Best regards,
Krzysztof

