Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4299C7EE2D
	for <linux-doc@archiver.kernel.org>; Tue, 16 May 2023 21:33:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbjEPVdf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 May 2023 17:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbjEPVdd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 May 2023 17:33:33 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 285767DA5
        for <linux-doc@vger.kernel.org>; Tue, 16 May 2023 14:33:31 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6434e263962so10800971b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 16 May 2023 14:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684272810; x=1686864810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U6hLWOpZXVAPYMdSJJ2ItQN0RBkBNzkcQkwsr4O8qt8=;
        b=i+4YyHlZDcjlkeuWsEXE5awTcv8wCA7UxR1ayg1q4HYWieG0uIijMS0Gn/sofbDPBj
         5RE7Gm3NnZYZaraVIyOUyN5jpLVdP/LxV4E05sIi4sl51TCPajYkqbzDJtO3B22yyi6Z
         Cx4t4oVt+tyX8DxSX3WFaLM2jCHD/zJe27Yu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684272810; x=1686864810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6hLWOpZXVAPYMdSJJ2ItQN0RBkBNzkcQkwsr4O8qt8=;
        b=bhsXmfhnu1I8oGBnls88a0B/b1o5gD3p4spUOCccTpEYOml2FoxJkx25qxCLpjBoqe
         aEhp/jhIooAvwC20oMkY0d36iqmU2qv4gnAsWbFTrWsT45iujeyF6zdeJvXoOlnPzjKO
         g4pEWSxWmvWV/7tg0aE5vyNv9YF/cMJbkOxL+1Yh1KvaLNnrkmKAKXaysNYMncjB7K3Q
         qc1zTzkX7RvXI7f3BjN3xcCpZbClvc1efz5U1Pim9Cpe9W8roGv2pMjSNKLsVeBPbBnD
         HVBqR6WCXSBzr3UDZzj1du8C4U6Wd7NswAVnvnYNO41tEQldgiBJlqTIEBaqywG9Y8DP
         XEcA==
X-Gm-Message-State: AC+VfDzvAnt6SRUYJ/IDdsk7fF+RNCwPua7eIfIjL6nGtbiemCtWQY6e
        AYj1bEf7rQbS7hXkv7noUcsa7WlhHNid75/T04c=
X-Google-Smtp-Source: ACHHUZ5U4ZGbw3JlLZ91DeGnxEGGQ0ONw3/x9vvE0RHGGprBODEjQn/CFkOYL+QWOmfO7dyZdPCR5g==
X-Received: by 2002:a05:6a00:1950:b0:647:2ce5:57c4 with SMTP id s16-20020a056a00195000b006472ce557c4mr34302149pfk.5.1684272810661;
        Tue, 16 May 2023 14:33:30 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h11-20020aa786cb000000b00646ec752fedsm13603713pfo.199.2023.05.16.14.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 14:33:30 -0700 (PDT)
Date:   Tue, 16 May 2023 14:33:29 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org, akiyks@gmail.com,
        linux-doc@vger.kernel.org, kernel-team@meta.com,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH locking/atomic 19/19] docs: Add atomic operations to the
 driver basic API documentation
Message-ID: <202305161433.C015F9E@keescook>
References: <19135936-06d7-4705-8bc8-bb31c2a478ca@paulmck-laptop>
 <20230510181717.2200934-19-paulmck@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510181717.2200934-19-paulmck@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 10, 2023 at 11:17:17AM -0700, Paul E. McKenney wrote:
> Add the include/linux/atomic/atomic-arch-fallback.h file to the
> driver-api/basics.rst in order to provide documentation for the Linux
> kernel's atomic operations.
> 
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
