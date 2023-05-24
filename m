Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002BEC7EE23
	for <linux-doc@archiver.kernel.org>; Wed, 24 May 2023 06:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239211AbjEXG3j (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 May 2023 02:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233886AbjEXG3i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 May 2023 02:29:38 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C67C8198
        for <linux-doc@vger.kernel.org>; Tue, 23 May 2023 23:29:36 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2af177f12a5so7615101fa.2
        for <linux-doc@vger.kernel.org>; Tue, 23 May 2023 23:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684909775; x=1687501775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ADXbD+WyjY/a3C44OvKKZGai/nGC+LFyoWdYlICKXPU=;
        b=VhBc9lZ9orvrj2dcBEqriY0TB/eqwSa95I70QFP2EHC5wHBfSTxeow1P+WLdJww3wX
         6PdfoE25ASVfJ7AhYeeYMXoAROF3x/kvD1q5OoTyo5n0C9aGK5pk/jjnTiLrcolbhkfb
         uKXsRwOzwIaH5yoZ7fX5ni3Lsqp5eg88BdxhacD2Wz6ysu3jCLM5Z0zBF0Vs4Ec0eAbt
         gsng+1J95y0U3iMOOU7O8TIg61aA1o/aj8G4+UHqFDF8L1gBd88//M+b+0dut4jlqrdY
         xp/SCvuiCQFpFPd1DJyPR5+IaT9QAM9HmQp2HABtSUWX7vG9LZOxS15hmqjOk0U/tEbs
         GXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684909775; x=1687501775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADXbD+WyjY/a3C44OvKKZGai/nGC+LFyoWdYlICKXPU=;
        b=fBCpwk1CFHlF1w0bmpFAyEJ/4z7lpVHwjMIwr3Xo2ef6dXllIPFH2yKvntacWInM60
         2SfulQBJmy/vgW1fH7Pdf6StuTP3MR4sKdO/XW4HGU4vlE6cfG/xAw2YWF5BhXgoXFVu
         +3zOM25qrcsamWeau1AjMAqnydKPqw5K43Xpy539Iy8yYJuaWADZG7xUqLdq3MMskPV4
         OtyEQbLcfYQXaEn2NfdcOEKGr52bh/+cqfrvB7yqq0mvTQxRrotC9V9HANvcMnTCnT6V
         ZjuKOt1F5NV7fYBfa28bFNaxmgMBIJP/DiXhb6Pt7uazLDSZ2eQYHNkLWJsr3BUYQx/i
         hNxw==
X-Gm-Message-State: AC+VfDyATDZj6HWnhPVXx3repMuXjabi7e4ghm3H7ltdX5kf3CWXEzKn
        6S2V1tGTIs0Oh7JIfpkF9haOAQ==
X-Google-Smtp-Source: ACHHUZ66Vr30OJ4X4Ex15iX6UaQMJjBYrDgZH3iNJ2pRZpBzlC+ggVVqpBYvZPJm5yH2tY46yIjh4w==
X-Received: by 2002:a2e:a30d:0:b0:2b0:45ff:7959 with SMTP id l13-20020a2ea30d000000b002b045ff7959mr579995lje.51.1684909774956;
        Tue, 23 May 2023 23:29:34 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x26-20020a2e881a000000b002a8b08882dbsm1962672ljh.55.2023.05.23.23.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 23:29:34 -0700 (PDT)
Message-ID: <1dca6efc-3020-ce79-18f1-ae56bef4f688@linaro.org>
Date:   Wed, 24 May 2023 09:29:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v13 05/24] mailbox: Add Gunyah message queue mailbox
Content-Language: en-GB
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Alex Elder <elder@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230509204801.2824351-1-quic_eberman@quicinc.com>
 <20230509204801.2824351-6-quic_eberman@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230509204801.2824351-6-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/05/2023 23:47, Elliot Berman wrote:
> Gunyah message queues are a unidirectional inter-VM pipe for messages up
> to 1024 bytes. This driver supports pairing a receiver message queue and
> a transmitter message queue to expose a single mailbox channel.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>   Documentation/virt/gunyah/message-queue.rst |   8 +
>   drivers/mailbox/Makefile                    |   2 +
>   drivers/mailbox/gunyah-msgq.c               | 212 ++++++++++++++++++++
>   include/linux/gunyah.h                      |  57 ++++++
>   4 files changed, 279 insertions(+)
>   create mode 100644 drivers/mailbox/gunyah-msgq.c
> 
> diff --git a/Documentation/virt/gunyah/message-queue.rst b/Documentation/virt/gunyah/message-queue.rst
> index b352918ae54b..70d82a4ef32d 100644
> --- a/Documentation/virt/gunyah/message-queue.rst
> +++ b/Documentation/virt/gunyah/message-queue.rst

Note, this file is not a part of the patchset. Trying to apply the 
patchset results in rejects. Probably you missed the documentation patch 
when sending this series.

> @@ -61,3 +61,11 @@ vIRQ: two TX message queues will have two vIRQs (and two capability IDs).
>         |               |         |                 |         |               |
>         |               |         |                 |         |               |
>         +---------------+         +-----------------+         +---------------+
> +
> +Gunyah message queues are exposed as mailboxes. To create the mailbox, create
> +a mbox_client and call `gh_msgq_init()`. On receipt of the RX_READY interrupt,
> +all messages in the RX message queue are read and pushed via the `rx_callback`
> +of the registered mbox_client.
> +
> +.. kernel-doc:: drivers/mailbox/gunyah-msgq.c
> +   :identifiers: gh_msgq_init-- 
With best wishes
Dmitry

