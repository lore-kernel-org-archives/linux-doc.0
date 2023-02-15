Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D21CC64EC4
	for <linux-doc@archiver.kernel.org>; Wed, 15 Feb 2023 14:57:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbjBOO5t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Feb 2023 09:57:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbjBOO5r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Feb 2023 09:57:47 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416A13A854
        for <linux-doc@vger.kernel.org>; Wed, 15 Feb 2023 06:57:20 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id v6-20020a17090ad58600b00229eec90a7fso4012239pju.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Feb 2023 06:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXiyNpETkYC9z6V5qLWPf0k+7IPR5cZpgLQTFb6RXec=;
        b=NxZSpyUi5aOKG9wEEN6Nqjpnc+7z0Wt/NwdEqoJ1ebur20lHv/oM7Ija1av6J+Kncl
         nOm6T/oa2vCuvOGkM8tfJi3YDwcNnr1gUq/F+Uc+kNbhRuxvLcbvaApeum8euQN5+QuD
         kIp33+3YRSVtlkZc7HllsgFABTiFlh9E6gVNhKUPQVsDNNtCHHu/+ngs1Iy2Q5lyd5pH
         DRNrtW9+envN/knBC5rHyRxzQtWvE6lYEmg5umG07qFxHLh2dxPYNsqO7qXQPxdkAXkk
         kO735u+cYddx2jgMHJxJIGXkLoXLncSk+fH6EGqhIxvAI9NoJohjP93Wy0WeSuWCjztf
         D8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXiyNpETkYC9z6V5qLWPf0k+7IPR5cZpgLQTFb6RXec=;
        b=PmVQdcIjLHSFrCUMCCpdZiBmR1QsqcoMziSpxo3ryh1RIaGj1lATEraEYSCGH83JQA
         xzA2hUngRlIpjNTIbIgJHcbGBDQIvNkYxsrUcuMyQyrKUT7125KwESoe2EA2d2D73eAJ
         16cLfyuyQZlP29LFwk5Ia2gpAkxZvb4sgQfc/WoiV5heBw0EF7kt29J209TU1jr/cv+T
         ODgCuSaI7+w4eJfeh0qKrM/DBvYVHAZ88wxghC52ab6F+7+yZc5fvGxd0PlFn0Wfvbxc
         yOVWLM/OQS6WoPPqwVMhVxd7CFaQV57erWz88rYyNHTBbVzjitaYkkaIRh1TEIW5LQ6Y
         GNiw==
X-Gm-Message-State: AO0yUKVNPz/fuNPjblQJOtR7rxEiGktmFkgAKVVPfLlz1PXWL8iMVAZn
        tQosKYN+rIaWa+mSN1IkrMwk8A==
X-Google-Smtp-Source: AK7set/7P/HtTKptrN8fEWEQBq3y3lZIWLRAPkYVv5DtZxdSAAog0SbdOHfHXa5okdJFu7VPTr4zOA==
X-Received: by 2002:a17:902:f54f:b0:199:26b1:17b3 with SMTP id h15-20020a170902f54f00b0019926b117b3mr2804547plf.28.1676473038684;
        Wed, 15 Feb 2023 06:57:18 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id iw6-20020a170903044600b0019ab6beea1esm3585233plb.87.2023.02.15.06.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 06:57:17 -0800 (PST)
In-Reply-To: <20230104180513.1379453-1-conor@kernel.org>
References: <20230104180513.1379453-1-conor@kernel.org>
Subject: Re: [PATCH v1 0/2] dt-bindings: Add a cpu-capacity property for RISC-V
Message-Id: <167647301916.19800.9191672449999836503.b4-ty@rivosinc.com>
Date:   Wed, 15 Feb 2023 06:56:59 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-e660e
Cc:     Yanteng Si <siyanteng@loongson.cn>, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
        Alex Shi <alexs@kernel.org>,
        Ley Foon Tan <leyfoon.tan@starfivetech.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 4 Jan 2023 18:05:12 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey,
> 
> Ever since RISC-V starting using generic arch topology code, the code
> paths for cpu-capacity have been there but there's no binding defined to
> actually convey the information. Defining the same property as used on
> arm seems to be the only logical thing to do, so do it.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: move cpu-capacity to a shared loation
      https://git.kernel.org/palmer/c/7d2078310cbf
[2/2] dt-bindings: riscv: add a capacity-dmips-mhz cpu property
      https://git.kernel.org/palmer/c/991994509ee9

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>
