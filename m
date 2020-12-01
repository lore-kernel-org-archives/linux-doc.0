Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880BFC71156
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 13:56:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36324206A5
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 13:56:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eUJWOYMj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391514AbgLAN4C (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Dec 2020 08:56:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387582AbgLAN4B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Dec 2020 08:56:01 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF42C0613CF
        for <linux-doc@vger.kernel.org>; Tue,  1 Dec 2020 05:55:20 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id v14so2989912wml.1
        for <linux-doc@vger.kernel.org>; Tue, 01 Dec 2020 05:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+PwXtTlcdJC6Kz6wHrFVenV3uj6g4mhzGOO7PCwpUDQ=;
        b=eUJWOYMj7hUEXl+QsjBQLb4Ml91vgJpJhCrjpxbqM+50vIH2ZQr0o0DZ8eYxOZyD2o
         qwK6VPbpB7r9OpI2pQzstBVO51hojkHH/0EuWCbkVWnDnxeTGQwxo7VZuIIWqFp8HMiM
         HVgkn/F6eMzurxhiSQXvv2Die4eIq572mY627xAt4ltupWKvoFDcjH8wfMXyaRjTxDbK
         P2fC1SvegV0bW8P/NfopNX6pZGUs2h4/HoDwq+NF7H6ZGOjbQupT8yplG2TwaL5YU7QG
         05vaH8BrE584TyNyIOq9F5K2WiZHXZ6N946VYV9SAcc566zeIk1Xid5fVDSMBBlJVcV6
         Khrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+PwXtTlcdJC6Kz6wHrFVenV3uj6g4mhzGOO7PCwpUDQ=;
        b=fO/G+2H2Y1mGdkyZUGXr2xioV/XJDZKaqwea0fTAsqAeyu7yGS5QPbSYzvvvv0ot+b
         N8nDHKJOysYlAhJj0lbx3Ne0O+v5D9P4WciHi94MZytHX0j+YwPP9ZRRrgfKRp/ldv7g
         QSGvHLq+XhMl25Y0z8dixdKHl2iRB+JY+7MWTzuRJLph9Co0sS2R3PQCiQkwbqhYEzmx
         BmQdjbqg81r7ED93X0Ld7gMOix5TBh77xS1rubsRKaJAN6da2bg/b+36d4g9nsdUTGXv
         XmXHDCeoBRxV4cgY70PnrDLw7D1304qCQTQb5hQlEpy0JEB/salFmdDSJM8Qh8UiLJqy
         OnKQ==
X-Gm-Message-State: AOAM531GzCmUB6NoLVQdaq7RvX4D/6KGmE+B+CXHyO3v42ZJ4ckWoIwv
        VKKWUopj95KYcL8ryWwb/HeCzA==
X-Google-Smtp-Source: ABdhPJx0qfzSScy1bKvaj9lSd/UJsODYPKOs6sdmtZoDpxlKzd7namARNALtRyqKWoGJ6kLRj1q4lA==
X-Received: by 2002:a1c:e042:: with SMTP id x63mr2861883wmg.68.1606830918697;
        Tue, 01 Dec 2020 05:55:18 -0800 (PST)
Received: from google.com ([2a01:4b00:8523:2d03:7c5f:5ab5:ac1f:89ce])
        by smtp.gmail.com with ESMTPSA id b12sm10194961wmj.2.2020.12.01.05.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 05:55:17 -0800 (PST)
Date:   Tue, 1 Dec 2020 13:55:16 +0000
From:   David Brazdil <dbrazdil@google.com>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     kvmarm@lists.cs.columbia.edu, Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@android.com
Subject: Re: [PATCH v3 05/23] arm64: Extract parts of el2_setup into a macro
Message-ID: <20201201135516.3ksifw3ynlxyok7k@google.com>
References: <20201126155421.14901-1-dbrazdil@google.com>
 <20201126155421.14901-6-dbrazdil@google.com>
 <20201126180608.GF38486@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126180608.GF38486@C02TD0UTHF1T.local>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hey Mark,

> In the head.S code, this was under an ifdef CONFIG_ARM_GIC_V3, but that
> ifdef wasn't carried into the macro here, or into its use below. I'm not
> sure of the impact, but that does seem to be a functional change.
> 
> > +
> > +.macro __init_el2_hstr
> > +	msr	hstr_el2, xzr			// Disable CP15 traps to EL2
> > +.endm
> 
> Likewise, this used to be be guarded by CONFIG_COMPAT, but that's not
> carried into the macro or its use.
> 
> If the intent was to remove the conditionality, then that should be
> mentioned in the commit message, since it is a potential functional
> change.

Apologies, and well spotted. Marc suggested removing the ifdefs as redundant
during his review of v2. I'll update the commit message to reflect that.

David
