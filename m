Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2736FC64E7B
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 17:50:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B21DD217A0
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 17:50:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389259AbgLBRuK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Dec 2020 12:50:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389315AbgLBRuH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Dec 2020 12:50:07 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F21DC0613D6
        for <linux-doc@vger.kernel.org>; Wed,  2 Dec 2020 09:49:21 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id 23so4943591wrc.8
        for <linux-doc@vger.kernel.org>; Wed, 02 Dec 2020 09:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uk3nyFML1nxsvGC9LCY/1s44UaqHe8BVZ1ofT7x457I=;
        b=XO2vQdH95v1HgdI8fzNXcFmkx63nZT1kR7WW07T3iN8xawOcOSjMcaratXT62R6aol
         18Exdx6tN6JQlynTpVUZwWTx5yEfKHqoUXJ8bp5ZP8r4TxRk36V18+/ACCyAmoetPExg
         ZhwuJ1VUm9FX8Tk3peri9lU3HFX5NozCPQXe8tUQi8I5wnwrKylWAmwqb7jEiKk0/PUt
         RA+9v3xK6ufqjU325zvSInvuQG7b6fKJz3s3f5OJPhxqbuBGwDkBUf1LXppH3UkSGxER
         OwcLDErcATCjMiaz7wGjjIGEuop04VGU2IBbBUBqQqdpTuKtFfCYhPUic/OCPb82mYON
         iQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uk3nyFML1nxsvGC9LCY/1s44UaqHe8BVZ1ofT7x457I=;
        b=tlh8Tq62mJOyCEjVkVAGI7I/fbHH+TTAqJdL6gjjAS++f1KC0Fx7tUAUSudJps1u0B
         nHJZ94VdPl9isEmJ7kIBwjsFjM3h/hcUr9M8My6mLscyp4JC6IyoEnnL2xCgHkLGvTF8
         6nZCq4YE/cYKQxqak+ON/JwowTNHOu+uTlYRoOkQH5O5PQpydE2VDWIrpBeaZvwcdEJk
         ZqXD6Bu0ucppQwkGRFKKfv5ypundZXCfuGNjykCz0+1x06XmjEGSZmo4LPPKCTjXZK8C
         ILBVV4VuPeVQzEEZSu8FqbXG6K7H3ExjHrCh9LP2M5U5a6tpTAXLAAF37L5p6sq8ZxS4
         oB6Q==
X-Gm-Message-State: AOAM531vvgOaO7b9Nl4B27YIi7PC6eakX/iFnB5vXyUPlNraU+LWU0j9
        yvbV7TMMPRYp8ZIYzlQGEApK3Q==
X-Google-Smtp-Source: ABdhPJwzHIaRNBQgiYJ4lBdup+j980orHCD3KEsoa4QfsBkkHpXFXQVpATyCsJ/euy7BQTFO2qp3nA==
X-Received: by 2002:a5d:5482:: with SMTP id h2mr4962893wrv.18.1606931359793;
        Wed, 02 Dec 2020 09:49:19 -0800 (PST)
Received: from google.com ([2a01:4b00:8523:2d03:5ddd:b7c5:e3c9:e87a])
        by smtp.gmail.com with ESMTPSA id u23sm2973631wmc.32.2020.12.02.09.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 09:49:19 -0800 (PST)
Date:   Wed, 2 Dec 2020 17:49:17 +0000
From:   David Brazdil <dbrazdil@google.com>
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     kvmarm@lists.cs.columbia.edu, Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@android.com
Subject: Re: [PATCH v3 16/23] kvm: arm64: Forward safe PSCI SMCs coming from
 host
Message-ID: <20201202174917.qey4ju2vrzipy4cn@google.com>
References: <20201126155421.14901-1-dbrazdil@google.com>
 <20201126155421.14901-17-dbrazdil@google.com>
 <20201127101433.GA1061@e121166-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127101433.GA1061@e121166-lin.cambridge.arm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 27, 2020 at 10:14:33AM +0000, Lorenzo Pieralisi wrote:
> On Thu, Nov 26, 2020 at 03:54:14PM +0000, David Brazdil wrote:
> > Forward the following PSCI SMCs issued by host to EL3 as they do not
> > require the hypervisor's intervention. This assumes that EL3 correctly
> > implements the PSCI specification.
> > 
> > Only function IDs implemented in Linux are included.
> > 
> > Where both 32-bit and 64-bit variants exist, it is assumed that the host
> > will always use the 64-bit variant.
> > 
> >  * SMCs that only return information about the system
> >    * PSCI_VERSION        - PSCI version implemented by EL3
> >    * PSCI_FEATURES       - optional features supported by EL3
> >    * AFFINITY_INFO       - power state of core/cluster
> >    * MIGRATE_INFO_TYPE   - whether Trusted OS can be migrated
> >    * MIGRATE_INFO_UP_CPU - resident core of Trusted OS
> >  * operations which do not affect the hypervisor
> >    * MIGRATE             - migrate Trusted OS to a different core
> >    * SET_SUSPEND_MODE    - toggle OS-initiated mode
> >  * system shutdown/reset
> >    * SYSTEM_OFF
> >    * SYSTEM_RESET
> >    * SYSTEM_RESET2
> 
> What about SYSTEM_SUSPEND ?
Oops, forgot that one. Will add a handler similar to CPU_SUSPEND.

