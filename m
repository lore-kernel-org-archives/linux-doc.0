Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF0AC636CC
	for <linux-doc@archiver.kernel.org>; Tue, 31 Jan 2023 22:09:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbjAaWJh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Jan 2023 17:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjAaWJg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jan 2023 17:09:36 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FDB0975E
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 14:09:36 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id x6so22349ilv.7
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 14:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rBLGJQx6U3Tgw7Abv4gboZO0TcxeOMWNzalWr2CRIGY=;
        b=Y/+sPuWv6NFTjcTN7NyBHOQA6LsL+OmKGvQi5xPgAG9lOq5zfPmoTR0RjsYn6tLZBI
         BvxSQCs1AUShjrjA34cKLX92rmLG3lx/nivPMqEPFsahmgd5SOz6GKWy3IHUxRfBIqYD
         RvkSnNXDtNmHzXGAdrHZBeuJtcSLRlzSRyHvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBLGJQx6U3Tgw7Abv4gboZO0TcxeOMWNzalWr2CRIGY=;
        b=WdBqrS3SfwO155L4jWGdARCuTbgFeqElFQ6edoqgWQZNApDgmlxJ2S4CBmG9H2+4CD
         8OTEvmVtvd+kXv5vRWJuWLqEnMaLYMo4P3XwHfDUqEIMCpz0g6pWIPjEsNs/GPREQGnY
         Owf5vyNGL7xoJb+P6TyVYzjW9hCjby1lsHPrKMc5GSECkILiyIAj79B4jdqobhFePsWK
         jv/IZwksDx92MJIoeMOquovvT3L5+MPCFfmHRA4zrZ5mpn+eGYV3GzBYO+PfAfaL1hHL
         J1/fhvO3mr7cxPMpfgShjkhwsED2CdBDyind7VQV1EkwV61my5w+Oh8DcBPWzsnnOJ3F
         M4yA==
X-Gm-Message-State: AO0yUKWTtswUZBPKtyvF0iK3n75C1GLJHnAi0XjgQ1kX4g3qHaHOM9Vd
        J14euEEm+DgAm2pNsiHLLDg3uA==
X-Google-Smtp-Source: AK7set8yhHVyUdj73l+uaKU0eWWN24P3heOt7Sdp/pO4vB2QMwSbursILLenvr9PA2i6PcdAJzbCEw==
X-Received: by 2002:a05:6e02:1ba7:b0:310:b84b:c893 with SMTP id n7-20020a056e021ba700b00310b84bc893mr139162ili.1.1675202975380;
        Tue, 31 Jan 2023 14:09:35 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id z26-20020a056638215a00b003aabed37b1bsm4871646jaj.175.2023.01.31.14.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 14:09:34 -0800 (PST)
Message-ID: <5487c6cd-0156-b79c-4f44-0b897c404049@linuxfoundation.org>
Date:   Tue, 31 Jan 2023 15:09:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] docs: add workload-tracing document to admin-guide
Content-Language: en-US
To:     corbet@lwn.net
Cc:     sshefali021@gmail.com, kstewart@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230131220722.38892-1-skhan@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230131220722.38892-1-skhan@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/31/23 15:07, Shuah Khan wrote:
> Add a new section to the admin-guide with information of interest to
> application developers and system integrators doing analysis of the
> Linux kernel for safety critical applications.
> 
> This section will contain documents supporting analysis of kernel
> interactions with applications, and key kernel subsystems expectations.
> 
> Add a new workload-tracing document to this new section.
> 
> Signed-off-by: Shefali Sharma <sshefali021@gmail.com>
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
> Changes since v2: Addressed review comments on v2
> 
>   Documentation/admin-guide/index.rst           |  11 +
>   .../admin-guide/workload-tracing.rst          | 605 ++++++++++++++++++
>   2 files changed, 616 insertions(+)
>   create mode 100644 Documentation/admin-guide/workload-tracing.rst
> 

Sorry forgot to tag it v3 - will send again with the correct version.

-- Shuah

