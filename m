Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB66EB64D7
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jun 2023 13:24:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbjFUNYF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Jun 2023 09:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232454AbjFUNYF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Jun 2023 09:24:05 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C296A1998
        for <linux-doc@vger.kernel.org>; Wed, 21 Jun 2023 06:24:02 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-394c7ba4cb5so3875364b6e.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Jun 2023 06:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687353842; x=1689945842;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=77CFlz9TwTlFk4rL1YgfbwtxFKs8v8egG44k3ujctUA=;
        b=nS+b/5jq1z/kJRNoTiGqfITeO9WumeN0/hxEkI3nJmhBtVGi7RrqXd38ZpzgTxueCa
         lbMAVL2eOyH9YyV2kmMGsoA8xQvaZgzzk/DpMzoFiS9UF/29fnC5iBa7XuRvByH3uzsG
         PZZgCqoKOJ9Hm1sbwvk+Y9GmnK3Ky0/acfzVlMci13auc9cel0QMWuNg6Fb/45DkPwCS
         pMij/4KxN1fqQMUReWO4g9YowdUsD1vaP8wZPPto12tCemohGPgVJNrUdsCz8vQ9bXqm
         JEsuqVsZKYtFTZfqRrCE12MI0pOyc5v1fEJC6YHBfxJpRZnPLEVCzDtqMfjbaISe7Dvl
         uxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687353842; x=1689945842;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77CFlz9TwTlFk4rL1YgfbwtxFKs8v8egG44k3ujctUA=;
        b=OKEMRpgBtp58WcBJri8xZ33m6IuMUEFxeowXvoYiiAYV/UCbdqQUbJJeD2f5yenu4W
         n83SSqXB2O1PURWFYUMP8jgDIXHfT0Bxs0Et/IZYmV4l9dxQV2IuKY7D87epjTjMmBlX
         sce/O/MJ6iTIm3sk8rViTxSMwWPxNW4wNXVOI8XUGmDSbIZ+19fdvGZraRe8pJImIkEW
         PETGvazLc/k4mxw5Y2dM9YT2dJEDEG8EgN1JO0vJgAG46Yb0UbEpBUZTl1wRvCPEa7X9
         Lqk/wKB1LTVScY3whQH408QWPhEns+jOrkpW0ICLC3xcKlIrtEEsEEtHKOHGDT/xbGQA
         Sr8w==
X-Gm-Message-State: AC+VfDw/1ChtR3p6zGAAXP5S2aA1Xmb7i1dI5pi3RuOxL1Izv/QDKSiW
        Xlr9POz+8mscmt4bUHaNGkdxBA==
X-Google-Smtp-Source: ACHHUZ5EvsYYC1aM28L+BhJdSyRInfskfoYHS088kDZqSOW9v6mvhxzADB2/cRIPZkyCiRr0Tv+QTA==
X-Received: by 2002:a05:6808:2088:b0:39e:dfd7:162 with SMTP id s8-20020a056808208800b0039edfd70162mr9144606oiw.31.1687353842147;
        Wed, 21 Jun 2023 06:24:02 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.72])
        by smtp.gmail.com with ESMTPSA id y19-20020a63b513000000b0053423447a12sm3091162pge.73.2023.06.21.06.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 06:24:01 -0700 (PDT)
Date:   Wed, 21 Jun 2023 18:53:54 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Alexandre Ghiti <alexghiti@rivosinc.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Conor Dooley <conor.dooley@microchip.com>,
        Song Shuai <songshuaishuai@tinylab.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v2 2/3] Documentation: riscv: Add early boot document
Message-ID: <ZJL56kehoYJm1g2q@sunil-laptop>
References: <20230621072234.9900-1-alexghiti@rivosinc.com>
 <20230621072234.9900-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230621072234.9900-2-alexghiti@rivosinc.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 21, 2023 at 09:22:33AM +0200, Alexandre Ghiti wrote:
> This document describes the constraints and requirements of the early
> boot process in a RISC-V kernel.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Björn Töpel <bjorn@rivosinc.com>
> ---

Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

Thanks!
Sunil
