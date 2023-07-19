Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14EFC001E0
	for <linux-doc@archiver.kernel.org>; Wed, 19 Jul 2023 14:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbjGSO0P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Jul 2023 10:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbjGSO0M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Jul 2023 10:26:12 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E888A1722
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 07:26:09 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fdd31bf179so2197781e87.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 07:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689776768; x=1692368768;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QYVunoFchPUC0OBXPo1j3FS+mazfA++aFluGXeilBDk=;
        b=ex9mlEDgIOJBoi8ZE5Gy9YUPQeUCRyk2JVGKFSKdodeYs/N/NtWwXC/vlNh6FO8dg5
         bT3XYgM30DXywlczVpCpuAXqh9u50yEYN81xkpDJSOW1dN4WyP4QVNlfZbqa5FJy6Ic5
         oaDAu4pTTv96rjmWvUDMCi2lwTXB7s+iciRxaCcQWQAOYr+FGa+2MxvtZh6qQz2CGuEL
         mDtJXY8o3skprV1mr7EbaM9fWdRyhSrhDExbBw6OKs1PoKBNZHdh0QXQMoyz2859AWZA
         Z2eDNNUeVJF4j5j98YSMGCm8kcMqiXqbDRZ61NbqWm4+JOIxpJPgNXCvf/GtdZoS2gM4
         uVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689776768; x=1692368768;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYVunoFchPUC0OBXPo1j3FS+mazfA++aFluGXeilBDk=;
        b=RPcl8tINhiFnN14cMqGEFVqS/1BBbZO0ZC7AoR1dyY8XYQoOsceBHj5/zs3HB/Znlq
         xALCmQddHMvSvFB0YRWrYJF4G2+48d6BkV26KqaNfcLhlx8fKuIl4niz5qqrkcaIkXyg
         O5zO8nkp38KJosu006mi8XbmRzz7eKu2W+cc2PoGkN366vhIQ1stgXQJW1OEEfChVkEH
         7IAiDhn/zBCtzQJ6w3Ps1RhyMFEUcFznAHjMQeAhJ+qXJmbs11s225ZF3AfQXvDeoRPv
         4QK3lzmHO+GRjMTFVrRw56xSlViOjLI3HpgOJjYW8e9OIGjw41ObFusIq42jHXJJIMcj
         8XpQ==
X-Gm-Message-State: ABy/qLaloiB1u2SOLI4P6RRSGTrInE/3dI611+PAcXNAAQCPr+Nnjrxn
        gfLjyRpmC7I6y+4ZcY1sMqwCug==
X-Google-Smtp-Source: APBJJlGi3BabRvugk7R6rQS2y8EhvImMu4QFhIo/YCnkmRrehmGmgHtJngmJ6AEMC2RjxVfWsQOH5g==
X-Received: by 2002:a19:914a:0:b0:4fb:89e2:fc27 with SMTP id y10-20020a19914a000000b004fb89e2fc27mr5864lfj.54.1689776768042;
        Wed, 19 Jul 2023 07:26:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id c15-20020aa7df0f000000b005219de74217sm2741339edy.43.2023.07.19.07.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 07:26:07 -0700 (PDT)
Message-ID: <6c5b594f-96af-8b7a-558c-0ce244634057@linaro.org>
Date:   Wed, 19 Jul 2023 16:26:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] Documentation/process: maintainer-soc: add clean
 platforms profile
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     dsterba@suse.cz
Cc:     Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Nishanth Menon <nm@ti.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
 <20230714084725.27847-2-krzysztof.kozlowski@linaro.org>
 <20230714135914.GI20457@twin.jikos.cz>
 <4963b85c-c0ff-92a1-e5d6-ca76f1882f93@linaro.org>
Content-Language: en-US
In-Reply-To: <4963b85c-c0ff-92a1-e5d6-ca76f1882f93@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17/07/2023 09:51, Krzysztof Kozlowski wrote:
> On 14/07/2023 15:59, David Sterba wrote:
>> On Fri, Jul 14, 2023 at 10:47:24AM +0200, Krzysztof Kozlowski wrote:
>>> +Overview
>>> +--------
>>> +
>>> +SoC platforms or subarchitectures follow all the rules from
>>> +Documentation/process/maintainer-soc.rst.  However platforms referencing this
>>
>> Just a drive by comment, references to highly relevant documents should
>> be clickable, so :doc:`Documentation/process/maintainer-soc` , with
>> exceptions like if the document has been referenced already.
> 
> Is it needed though? The link is anyway detected by sphinx.

And it does not work:

maintainer-soc-clean-dts.rst:10: WARNING: unknown document:
Documentation/process/maintainer-soc

I also tried:
maintainer-soc-clean-dts.rst:10: WARNING: unknown document:
Documentation/process/maintainer-soc.rst


Best regards,
Krzysztof

