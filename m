Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5646C64E8A
	for <linux-doc@archiver.kernel.org>; Thu,  3 Dec 2020 10:51:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56EB920872
	for <linux-doc@archiver.kernel.org>; Thu,  3 Dec 2020 10:51:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388724AbgLCKvr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Dec 2020 05:51:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387870AbgLCKvq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Dec 2020 05:51:46 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CCC5C061A4D
        for <linux-doc@vger.kernel.org>; Thu,  3 Dec 2020 02:51:06 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id a6so2320210wmc.2
        for <linux-doc@vger.kernel.org>; Thu, 03 Dec 2020 02:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J635piZ/rKtx29aOFmG6FBeR7lY3a126JY0Ld6qBL8E=;
        b=fni8XWXJ65ktP4os0NGZmoCZnWcQlMQwfmVk+oa0QMvzC/S/FiZu5x4NUr6/TfBu2u
         aGL0yFbeRZ+leewJ5jdWZ870HeL1nfnq7hYaQLKPB7AUeIDrnL2/sLEotr4DN2JkzHBT
         pwHykLj1/wxm2FwPVt9ebwwP5LZdSYfrdyvZlYYHfQBYFvg0GEXdqNSiipAaWOtyhQwC
         oq3G8GuN5Z3jcOfF0QT51qncDQ7x5Cy6mzbRYDZ5RmR6unquAdOJIlwLxq5lgUEjQTgp
         akHOiyxmgEY5yWCmR3qVBpFsKv80keuCej/CLKHSQ9v8LQytI21vDmBRO8PTmbn6/fAI
         J+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J635piZ/rKtx29aOFmG6FBeR7lY3a126JY0Ld6qBL8E=;
        b=b8Zia4KEmc6Qu6G7BGxnpy6IEUvnBHrmAG1Y8fBAKmwnI9g3fruizzbuRGn4DillVg
         wWZoTJqPuubVwK4AcFuTbG3gbVQwJ0/rfg9XacLAq5M+gyXWVJOieW+2bjqzT+oJAzmM
         5XnNZiGWR9Kbtt83VbGNEGZprJy/Y632rrr/DB300e+VwOgCbqVNdMRlFbCVicdne5Bn
         F6R/Tjyd0TCCBwU1XhAwj+RMmUQH+ebSX4lm6tua3MghCGegbHHCTASpVrqhQ1D4zyYE
         P6cVov12R1hSG2/8TQXtsoBq9iNNRYs8ecDHYHBAAgdVdJ22mVfblZ08kDMzF4T0t3zc
         hcuA==
X-Gm-Message-State: AOAM530BaLtyeiTsniEiuVwyaLmv1N6kOECSpL0x6aXPObzwul/WnRCe
        oTMwFPEj3agHMCKg7VcAUBAyzw==
X-Google-Smtp-Source: ABdhPJwGxdGvAQwd3g9g/37YjONjS4wKyf5gl3p84BlZU5tkURTC0Xd03MbOOLQNl0Y5+ujoR/UhFw==
X-Received: by 2002:a1c:1b06:: with SMTP id b6mr2603884wmb.101.1606992664603;
        Thu, 03 Dec 2020 02:51:04 -0800 (PST)
Received: from google.com ([2a01:4b00:8523:2d03:5ddd:b7c5:e3c9:e87a])
        by smtp.gmail.com with ESMTPSA id u66sm1073595wmg.30.2020.12.03.02.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 02:51:03 -0800 (PST)
Date:   Thu, 3 Dec 2020 10:51:02 +0000
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
Subject: Re: [PATCH v4 06/26] psci: Add accessor for psci_0_1_function_ids
Message-ID: <20201203105102.zpnjielsqdf3z3ox@google.com>
References: <20201202184122.26046-1-dbrazdil@google.com>
 <20201202184122.26046-7-dbrazdil@google.com>
 <20201203104712.GC96754@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203104712.GC96754@C02TD0UTHF1T.local>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 03, 2020 at 10:47:12AM +0000, Mark Rutland wrote:
> On Wed, Dec 02, 2020 at 06:41:02PM +0000, David Brazdil wrote:
> > Make it possible to retrieve a copy of the psci_0_1_function_ids struct.
> > This is useful for KVM if it is configured to intercept host's PSCI SMCs.
> > 
> > Signed-off-by: David Brazdil <dbrazdil@google.com>
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> 
> ... just to check, does KVM snapshot which function IDs are valid, or do
> we want to add that state here too? That can be a follow-up if
> necessary.

Ah, that's a good point. It doesn't, but can infer that from psci_ops.
