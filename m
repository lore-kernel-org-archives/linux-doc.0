Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AC2C83014
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 13:52:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F44420705
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 13:52:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nkgSXV2g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391163AbgLANwU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Dec 2020 08:52:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388093AbgLANwU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Dec 2020 08:52:20 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B23C0613D4
        for <linux-doc@vger.kernel.org>; Tue,  1 Dec 2020 05:51:39 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id s8so2707022wrw.10
        for <linux-doc@vger.kernel.org>; Tue, 01 Dec 2020 05:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EQOI8T+d8gKQ2/dOWJZGivhsk/dAAdxIvvx15lVtny0=;
        b=nkgSXV2gOuBncMrl6+3qDmAAJ4sR0cdviEFX9turKav6mGUBpXp81f6hKbuJBj5J21
         N/LPrBTLq6YzT24g9KYZcIeH/otFXDRLF1bVxLD4QdMx05wn81nclYKmV/Ymr/0lvCGc
         qE+YeW2TSkoqBDMFyBUyHpLNUen/MGvUi3BE1URoNJGKnWdJZgZXgwuckoFZJuXo6fzv
         JxgI7Vipe6a5Q85l7yBv3yg/BIFoAcL1Hhp8J6e86aq7ne5qvATCGBPtB2vx5Ih0JSgX
         ipwQCUb2RNzz9+9u/prs0HS3hKdSabdM+0Oeclxlq/B+fzMfZqHdETKz8L/h71aKuvk2
         QUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EQOI8T+d8gKQ2/dOWJZGivhsk/dAAdxIvvx15lVtny0=;
        b=bSAvvtvYioYVfj8bBrrblqY/QaC0QhTGJwy+6ngwQzAAzejHcDff1lSmHmnXsP1yqG
         PW+LMIk5tNwMyRPyIMljG/tw7LB0BETohbr/ZeJi0jfP+DVoO7A4N4T9NmZ8gd/9Gg1V
         0nnQttKxPeeSJMfLbM9/B1EwRoeejk44jTiRzoNuhODnfAELa6ml+CF69dxZQx5bG8Vz
         WEHglnjsQ7KafJbEBXNy30QtmugYzo3LCxynLj7uF+uAox0zKiugOlfo6QeH2ZAlV4BM
         Q6Q3k4Thhult6Duwuei5DlD2RZjxXqz5ZAN+Vs7nllpvJHpDBTc3guvp1FEOA46ycNQg
         GuLQ==
X-Gm-Message-State: AOAM530RRG/u1yMMPBFbYsbW4v8ETchbibtplDat173OX8acHDlVWLmF
        fELv7TauUB4/Veo8P03oOU4pag==
X-Google-Smtp-Source: ABdhPJwh0+cFKMPciz4Nv7GTSBxYfP4MSIi6pO0Seh9bXRp5bIKM0x+xRWrLyjLNPXBk204l11OtTA==
X-Received: by 2002:adf:a39e:: with SMTP id l30mr3882676wrb.195.1606830698299;
        Tue, 01 Dec 2020 05:51:38 -0800 (PST)
Received: from google.com ([2a01:4b00:8523:2d03:7c5f:5ab5:ac1f:89ce])
        by smtp.gmail.com with ESMTPSA id e3sm3281251wro.90.2020.12.01.05.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 05:51:37 -0800 (PST)
Date:   Tue, 1 Dec 2020 13:51:35 +0000
From:   David Brazdil <dbrazdil@google.com>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     kvmarm@lists.cs.columbia.edu, Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel-team@android.com
Subject: Re: [PATCH v3 19/23] kvm: arm64: Intercept host's CPU_ON SMCs
Message-ID: <20201201135135.ejgqytcxqyiwyic6@google.com>
References: <20201126155421.14901-1-dbrazdil@google.com>
 <20201126155421.14901-20-dbrazdil@google.com>
 <20201127174726.4b6azdyzn5j6qmao@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127174726.4b6azdyzn5j6qmao@bogus>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hey Sudeep,

> > +static unsigned int find_cpu_id(u64 mpidr)
> > +{
> > +	unsigned int i;
> > +
> > +	/* Reject invalid MPIDRs */
> > +	if (mpidr & ~MPIDR_HWID_BITMASK)
> > +		return INVALID_CPU_ID;
> > +
> > +	for (i = 0; i < NR_CPUS; i++) {
> 
> I may not have understood the flow correctly, so just asking:

> This is just called for secondaries on boot right ? 
No, secondaries are booted before KVM is initialized. kvm_arch_init() installs
the hypervisor on each core that is online at that point. That flow does not
touch this code.

But the kernel can later power down some of those cares and then this handler
is called if it tries to power them on again. You can exercise this with:

	# echo 0 > /sys/devices/system/cpu/cpu5/online
	# echo 1 > /sys/devices/system/cpu/cpu5/online

> And the cpumasks are setup by then ? 
Cpumasks are initialized before KVM init, so yes, we could copy that
information up to EL2 and use it here. That comes down to copying `nr_cpu_ids`
because the possible set is logical IDs 0..nr_cpu_ids-1 (see smp_init_cpus()).

> Just trying to see if we can use cpu_possible_mask instead of running through
> all 256/1k/4k cpus(ofcourse based on NR_CPUS config)

I decided to keep things simple because a valid MPIDR should not need to
scan the entire array, at most the first `nr_cpu_ids` entries. An invalid MPIDR
will scan all NR_CPUS entries but that does not seem worth optimizing for.

David
