Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBC3EB64D7
	for <linux-doc@archiver.kernel.org>; Fri, 30 Jun 2023 18:14:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbjF3SOJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Jun 2023 14:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbjF3SOI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jun 2023 14:14:08 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF753AA7
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 11:14:07 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3a3790a0a48so1322100b6e.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 11:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688148847; x=1690740847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LqwqIDNUlZeN2SG9uV7xSJv9crwhQD0n5IxeEUkTYuI=;
        b=DjVunBjtXA+IlIrHX2uS4TSPyJzImNA53G/sm5ANqU45Ugwr9wu0WvO3aVlTFTyi0h
         Cr7iLMvBY2u/WobiM7YerMhPQirHcMKa1gsajCUE/9agQ1lmpmDts2IjmCb7DOjhnW9m
         7T7Rb1oiMNvtqh9p7BsFQ++qXWTn1OHa7bfps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688148847; x=1690740847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqwqIDNUlZeN2SG9uV7xSJv9crwhQD0n5IxeEUkTYuI=;
        b=CcaqGQJnSKey9PAw1313vRbSH8mx/vLbEpsD+OQan+LLN9JPe3RP+r8vku0Zyk+IVt
         azXPquIvrcZSM0+uYAlX8RVCyVFdSdB/o1nnW7SkxRGK+CXca0YUT1SseVoL0jl6PSNH
         CsqReLJ4XnZm2RqO/LWI+BPgSdiFMOkX3agXaBR+fzq/iNpD61QA7hzFDY07F5QYj9WA
         qhFLji5aNkswu94kLcNNZWO2PZDhtnMQv6EMluojwBdWxCvNfFeHQ8hUYxWllKAnXCo/
         ZoLihqQDLC7hPI9ixRlxt5/Lvc8Yp3FU6NDslZCTEqemUXnXMHm5rZ4LGH5593Xu3l47
         35bQ==
X-Gm-Message-State: AC+VfDyVg0mvQBu/20cv/Vn3iJXU9dQpoKVG+5U2xDhC4HSGwakQElsu
        KwRRwmcRshCFh3l08owYeJ+bZg==
X-Google-Smtp-Source: ACHHUZ4aY95gxLXv4IKjVUVD3VfvFAYTpE5ZOFpn2RyICbZ110rHSSituQlAMJubXooG4QyorbIDnw==
X-Received: by 2002:aca:6708:0:b0:3a3:6423:bf7d with SMTP id z8-20020aca6708000000b003a36423bf7dmr3158875oix.10.1688148846907;
        Fri, 30 Jun 2023 11:14:06 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 14-20020a17090a098e00b0025c2c398d33sm6250986pjo.39.2023.06.30.11.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:14:06 -0700 (PDT)
Date:   Fri, 30 Jun 2023 11:14:05 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        security@kernel.org, corbet@lwn.net, workflows@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: security-bugs.rst: update preferences
 when dealing with the linux-distros group
Message-ID: <202306301113.FA8FD533@keescook>
References: <2023063020-throat-pantyhose-f110@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023063020-throat-pantyhose-f110@gregkh>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 30, 2023 at 09:14:20AM +0200, Greg Kroah-Hartman wrote:
> Because the linux-distros group forces reporters to release information
> about reported bugs, and they impose arbitrary deadlines in having those
> bugs fixed despite not actually being kernel developers, the kernel
> security team recommends not interacting with them at all as this just
> causes confusion and the early-release of reported security problems.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Yeah, this is good. It might make sense to explicitly detail the
rationale in security-bugs.rst (as you have in the commit log), but
perhaps that's too much detail.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
