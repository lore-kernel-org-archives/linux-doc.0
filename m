Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EB6C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 18:14:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76CDA23435
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 18:14:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbhAMSOU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 13:14:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728016AbhAMSOT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jan 2021 13:14:19 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B86C061786
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 10:13:39 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id j13so1693839pjz.3
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 10:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AyK9sqwZsD063m1ncxreMiuXDXntkqM6cLxiVapbjGw=;
        b=URwQNLcjZ8zEk6hNNLVOV/TTzfMHNRr6tJM3UR8Mj0UoFUTvBpZjhcgwvwfAyW31u5
         TgyAKhncBlMRoPOY8AlchGHqbYqqBd6l8Pd0WI9O7niG/or8xYtmSPHIPSfvM/nni+r/
         qahefVJ5OTLN7hcEj6yNvU14V8eI7iZgqLlpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AyK9sqwZsD063m1ncxreMiuXDXntkqM6cLxiVapbjGw=;
        b=dLlu92EiIg0Mw1U6OaLRO2FA3ZvEMeg3hTAWwJa7A10c1wwhjeym3kC0qIL04ZdZY+
         6NHX+6DP490rS3NpWiPdYdeDXxOMvSBFoxlUjBDlhqWj7sXZRewmYpQir0o57CfmPt7M
         pbtj4lp+eGNcmmL5qbVkGXf8VGlhGmrFWp5X9Kf9Ri246xWLsVzbJMG4m4tt42VoT8tW
         1P/6HTTytFCLFg/ztItCtkVVvpGbeO95PCSpFbQOgImgV1FaoC5xXWLlGIK5dJlEoDjG
         NgrD36yfNcTcW0R4SE/OSqfZPgEkrwH7qbeUVnuIP30eG4GzKsS5ui5A7DLManMz3TAv
         O80A==
X-Gm-Message-State: AOAM531U1dN9uZQieWwWe3EIWrisaC85IQBc35C6xAd7I2d9RxtH2bi/
        RLGodR1cfa+TTTxbOD1gZ674cA==
X-Google-Smtp-Source: ABdhPJwmBaSE9yTIl9eomAMqefN3gOQUSke85JCpZQpXqCOMxeg2SSP5ZjzthbIMkKX1qcI6d9H9fg==
X-Received: by 2002:a17:90a:4817:: with SMTP id a23mr567471pjh.16.1610561619202;
        Wed, 13 Jan 2021 10:13:39 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d6sm3070040pfo.199.2021.01.13.10.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 10:13:38 -0800 (PST)
Date:   Wed, 13 Jan 2021 10:13:37 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Stephen Boyd <sboyd@kernel.org>,
        YiFei Zhu <yifeifz2@illinois.edu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/24] arch/Kconfig: update unaligned-memory-access.rst
 reference
Message-ID: <202101131013.39881611F3@keescook>
References: <cover.1610535349.git.mchehab+huawei@kernel.org>
 <24c3aa427cf7e99e01f49a221a15c2eb5768b63e.1610535350.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24c3aa427cf7e99e01f49a221a15c2eb5768b63e.1610535350.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 13, 2021 at 11:59:18AM +0100, Mauro Carvalho Chehab wrote:
> Changeset 997c798e1444 ("docs: sysctl/kernel: document unaligned controls")
> renamed: Documentation/unaligned-memory-access.txt
> to: Documentation/process/unaligned-memory-access.rst.
> 
> Update its cross-reference accordingly.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
