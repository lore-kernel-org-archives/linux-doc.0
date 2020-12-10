Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C22C4361B
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 23:30:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EB2023EB0
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 23:30:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgLJX32 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Dec 2020 18:29:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732800AbgLJX3X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 18:29:23 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0D5C061793
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 15:28:43 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id i3so5677651pfd.6
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 15:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=CSt2FPKXtDQTYvs/cAS/t9n4d8NBaXGUQAaM+p/qblA=;
        b=rbTnfKoJCPQv5YrR8jiywKYAw6yNxzB5OGt54Suax/v3IwCjdbe2y9TeXPoDqQFjEI
         RrApWRXo3poxoacnjx30GrodOOetTNe9j0GfqfLceY3SRCOjIO7ZXeIzujWHtcjWrqgH
         IoSs4e0U8DDoqFoeDeT9XszgsQUyiLWFcYJqzdUOfPifGawBI4JX5raHrt1mwmQJVJJJ
         YM9LkcEGmlb8nSFyh3MMxqiqheWtT3szjtL2BezfUKXZvS52VIpeWlGeY/D69fLibcov
         IH2tWxPpnHUYIgW/mlJulN6jkb6XF6BhZkK67CbWJOBQVRMB2nBWtHiuxcThmK94VOL1
         Cdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=CSt2FPKXtDQTYvs/cAS/t9n4d8NBaXGUQAaM+p/qblA=;
        b=hGZz9UxeObtoGAUdvF0RZqyGRvsFP6OI5oSciC5Ltyz6Tt70QXWKs9us3OobT7600l
         z4AHcWORSK1Dw0Q2B9Je6qbJstBR/rU3WW5CYYW1YpIbZArVJNVMUOEWKU41wOpJDUg9
         jBTGi+ExHe4Po7Y1mzQXJXZgTiG/AiJUnky0Pe3k8OPkCCX76aWRGONNTA3D78qmZuxi
         e9Lx5dAu7RRJyQ0Xk2iYmNG3e3o/hjU8yK8C2w2s3Yq6wARQuXIk/XBfIfV8OHq8wKh6
         dkfXKN9XXDFHZ1+sU7sbvl/Edr1gWiAz/F02d5VGZDrk+UA/KiXC1rk+3/irTix97EoS
         a2Mg==
X-Gm-Message-State: AOAM531N7Z/qm1rBfZh3O0ycVA/I1B+7TiZFjzY5/+4Ru3rrztSOFY7K
        jenEzGQVWuozsUT282dTU905Ww==
X-Google-Smtp-Source: ABdhPJwFmOysqtEYH7lJTFtlxPjQzlHC4tPd1ANetiUdf4c0a/EEDaOb7x6HYq2n3bdzbGfoUg5P4A==
X-Received: by 2002:a17:90a:1b0d:: with SMTP id q13mr9917082pjq.21.1607642922731;
        Thu, 10 Dec 2020 15:28:42 -0800 (PST)
Received: from [2620:15c:17:3:4a0f:cfff:fe51:6667] ([2620:15c:17:3:4a0f:cfff:fe51:6667])
        by smtp.gmail.com with ESMTPSA id e31sm7308677pgb.16.2020.12.10.15.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 15:28:41 -0800 (PST)
Date:   Thu, 10 Dec 2020 15:28:41 -0800 (PST)
From:   David Rientjes <rientjes@google.com>
To:     Brijesh Singh <brijesh.singh@amd.com>
cc:     Ard Biesheuvel <ardb@kernel.org>, kvm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        James Bottomley <jejb@linux.ibm.com>,
        Tom Lendacky <Thomas.Lendacky@amd.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Borislav Petkov <bp@alien8.de>,
        John Allen <john.allen@amd.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: [PATCH] KVM/SVM: add support for SEV attestation command
In-Reply-To: <78e18a3d-900b-fac5-19ca-c2defeb8d73a@amd.com>
Message-ID: <e47f69b2-d4ea-1db0-aa13-729baba45b46@google.com>
References: <20201204212847.13256-1-brijesh.singh@amd.com> <CAMj1kXFkyJwZ4BGSU-4UB5VR1etJ6atb7YpWMTzzBuu9FQKagA@mail.gmail.com> <78e18a3d-900b-fac5-19ca-c2defeb8d73a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 9 Dec 2020, Brijesh Singh wrote:

> Noted, I will send v2 with these fixed.
> 

And with those changes:

Acked-by: David Rientjes <rientjes@google.com>

Thanks Brijesh!
