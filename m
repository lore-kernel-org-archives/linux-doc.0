Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD08C4363A
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 18:20:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D56D822255
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 18:20:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="K4uLjNuh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750863AbgJWSUz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 14:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S465177AbgJWSUz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Oct 2020 14:20:55 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D62C0613CE
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2020 11:20:55 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id z2so2269104ilh.11
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2020 11:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tGH0KxAuUfEqEQSA/wPpDyz3C0EygW5ob8CmE2nbYgE=;
        b=K4uLjNuhKf2aARCJKa8vDLkfPOrqIxz2vtYLaCdcDz+Kfp840MDLnJznSeI1L0tPsz
         zbQ50bHxmwsrJsTbH1w/h0hFTq8nHwYnCp2p+O1p/LffHc34xImzz7vzQ2qFsfc5cCqH
         MPLmH4WY/J7X55OtA4wzI6T9s0mP8nNBVcp+e+7IWgCjDAf7BnVh+65RyvttF04BVAAH
         tOuP9GFT5UK2agbEXI0JJAgmzHF3aYtKj9C9NmHmp/7gKpuiA2e0MswY6vuaONg/tWMd
         ulrEj7MxrJPSRdur933rkqHgfs8eCjlZ0zQgxrSNAFu2MkYtCnGFXK32FU9jU62+H8v9
         E8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tGH0KxAuUfEqEQSA/wPpDyz3C0EygW5ob8CmE2nbYgE=;
        b=Ej8LfYal+v6DxtDEhuqPFAtUPxlVLwwzfZa/0B3NBGCEdck6NsIJvwPp898efMlBIR
         bvVbXZZHbwkeK1JPNW7DA2oxCG2ED9i1U8Sg1lSGdZUkq2bEWjzpG0FmCIzmJt6ZI2jI
         eCQx6f9JM5f6i0x5JzERz3O11CreQQMGA6gJbQ7aTYnu/5+/OSsH/h45UUnl8n16ke7f
         urQcF72nfmwbOqo1hOuheWcejcw2N4dS/PYqBHjQe10yACpCpQg9c36u0Vdx53YCkhgZ
         DwZTW7NsVp1ELj5Fd0+ZySXzBi7AK9P/nSfENwbJpmHXOcTWq9hdx99pPaWWjZcETL3V
         SufQ==
X-Gm-Message-State: AOAM533cKxArW+oddKHGtkRQDlZLtJQ8Cu6eXVrurAeOPJZtpVLFwu/Q
        tLRbp6cvnP2Cwjrgs0jAHDLaXWFZ89ivyg==
X-Google-Smtp-Source: ABdhPJzmGb8eQvwa+DPW7bgcyfKJWuCVzKCSBgN5Wb0Pk4tUujzEqRpN/81g5tA793qs8MP+CWmizw==
X-Received: by 2002:a92:5b46:: with SMTP id p67mr940694ilb.150.1603477254496;
        Fri, 23 Oct 2020 11:20:54 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id w70sm1321978ila.87.2020.10.23.11.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2020 11:20:53 -0700 (PDT)
Subject: Re: [PATCH v3 07/56] block: blk-mq: fix a kernel-doc markup
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <da771fd9e5281537f39c6e927a199b681ff6204f.1603469755.git.mchehab+huawei@kernel.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <05f72376-6f3e-e216-ec15-8f5ce9d6e55c@kernel.dk>
Date:   Fri, 23 Oct 2020 12:20:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <da771fd9e5281537f39c6e927a199b681ff6204f.1603469755.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/23/20 10:32 AM, Mauro Carvalho Chehab wrote:
> Fix a typo:
> 	blk_mq_run_hw_queue -> blk_mq_run_hw_queues

Applied, thanks.

-- 
Jens Axboe

