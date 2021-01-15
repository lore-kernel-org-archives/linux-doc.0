Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBBDC433E0
	for <linux-doc@archiver.kernel.org>; Fri, 15 Jan 2021 13:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB76E23877
	for <linux-doc@archiver.kernel.org>; Fri, 15 Jan 2021 13:50:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732908AbhAONuc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Jan 2021 08:50:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730027AbhAONuc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Jan 2021 08:50:32 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8369CC061794
        for <linux-doc@vger.kernel.org>; Fri, 15 Jan 2021 05:49:51 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id m4so9331275wrx.9
        for <linux-doc@vger.kernel.org>; Fri, 15 Jan 2021 05:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MwCX+/EyTCSrIqzhCqb0Nu6BiuSsXwge34YVzpiECe0=;
        b=VjcRitv3CMagFa+Y7oRVGMasNu01QTKQOEf0nTvP/3Gf7ptnuYGCzLsSwd4RgU49js
         Hbayh4yJok2iWQK0tnOUUxD1sCExux557Y6uSOFgciPZT2WdibqllBlaw5Ozc/Gux4RY
         0zK1YMhvvRHRuG7I5gh/9rOF5S1jL2u3SzCt9Guvcn4cNGRmKLLcp5y03BqiLej5joDJ
         csyWpzfB2gbMbiSmuQy+tSiqIshEK2RoKzOKo6Qrl/n5bVn+GyOgPtDQvJqaRG3TI+ZA
         RYGWC8y0itpOLoOLuBRTTo47SoYe2e3Vkg53qQHpN93jQM5SUom5gl/w0C3X+mvityFc
         3row==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MwCX+/EyTCSrIqzhCqb0Nu6BiuSsXwge34YVzpiECe0=;
        b=s92KeNWXtW58WRFuITk1DQvYlCPZStmGUkaqKo4pnxCVsj3EoklZLOPiBZltDS6NGR
         Wn9orNSwpu6ZIdyUoyKwEUdYphYIEVviIsZdpMfiQgTGj9V/nS0STO14xYyPGmBf8hDM
         Z6BE1L0M6HfxxHYdlZRwbVSfflZG+fxFiHEPs5q4EqhS7akZgFfQWryp+uxftAFtn/5b
         ESTji3VuBK8NDZ2vHkBtHyqyJ8M6jJxOKnoCmjeAJQdboyYnhknx2KzSvU8bBreI7zde
         sVN8Cduq9l80bnRriV7o8SYr0M2NJFbkk5FgLGffB43QbKdpb8OTsb+nN2xwxdAbCkKi
         EISg==
X-Gm-Message-State: AOAM530dDa6RIIxRoR5ZOEGsUbSwrh8nsZPY3b6Ej0/YwC9tvGD4Wljz
        udo8LGplzxmTkEpfcCOqVLDbqg==
X-Google-Smtp-Source: ABdhPJx47DQQ53eBz7+PoVimJvsC9mL4EpotLvljQhU4GRwnkF9psc1KK7JJxJzzrvfpgYnJnct4xQ==
X-Received: by 2002:adf:f707:: with SMTP id r7mr13767163wrp.113.1610718590179;
        Fri, 15 Jan 2021 05:49:50 -0800 (PST)
Received: from google.com (230.69.233.35.bc.googleusercontent.com. [35.233.69.230])
        by smtp.gmail.com with ESMTPSA id g192sm12929770wme.48.2021.01.15.05.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 05:49:49 -0800 (PST)
Date:   Fri, 15 Jan 2021 13:49:46 +0000
From:   Quentin Perret <qperret@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:KERNEL VIRTUAL MACHINE (KVM)" <kvm@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Cc:     android-kvm@google.com, kernel-team@android.com
Subject: Re: [PATCH] KVM: Documentation: Fix spec for KVM_CAP_ENABLE_CAP_VM
Message-ID: <YAGdek8Ns9nRU478@google.com>
References: <20210108165349.747359-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108165349.747359-1-qperret@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Friday 08 Jan 2021 at 16:53:49 (+0000), Quentin Perret wrote:
> The documentation classifies KVM_ENABLE_CAP with KVM_CAP_ENABLE_CAP_VM
> as a vcpu ioctl, which is incorrect. Fix it by specifying it as a VM
> ioctl.

Anything I should do on this one?

Thanks,
Quentin
