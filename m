Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12D4C56201
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 00:06:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 708A6206C0
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 00:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aW/vxIjX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbgKZAFz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 Nov 2020 19:05:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbgKZAFz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Nov 2020 19:05:55 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2670DC061A51
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2020 16:05:55 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id f17so157200pge.6
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2020 16:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EyRWgsCsWzd7GS7feF4xpXXG7fpSnCNWLmqNXluILiU=;
        b=aW/vxIjX7r6+dEWr5RCMGzYCnQyNtDQDHMu83ev+2zbCUOkNuVOuBtDV5UX1LUE23h
         WsnHe+lDoQZMfL1V2jP4lUkIbz9wzlCU+yTjXlQNk5wZOUMy4d7m73U1enBMnLVGXDw/
         XLQWmDOQGHB7CON5824EggMipT7n3Rcw5jKqaEqd5SgRzHrWW/Jj6rSNwMrz7mzeAILo
         Z370H+aE8KSbLl9P1ZkFqqvpS9pbhF94xYbRP3HWCNO8y/BWcAdng5Ase6TPLXEvKr0R
         Q8ttgfFtjSAgh3gEP//Gm3mMIPtHDLm44Be3+fY7GFp5N/UonPqXmVcYxQ7QytWuu2Pv
         0O2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EyRWgsCsWzd7GS7feF4xpXXG7fpSnCNWLmqNXluILiU=;
        b=EiWATcu1ViRPBfdhOQSYHn9qkrszqDtiUZQkdJMbfBUi34czO0M8wOP5mulL5a4Rtu
         n4Da7nmrQ34ptwyBSjzlKDa5/uRzAmq/1ziv+Lry5VGYN1IT1OUvwbH0DNp3QoQtIxan
         waAcbnLVWFni7mEHnq2vYwDxoug37eme+z9OPXXj28QgIeuDzo0kPRL2NkFbxPW+bb0v
         RTNtDukRsDEsh709Lwh3Hl8U4ZcPvxVQyWFmWZwOnISFaNqd9StvpR1/Wqr4lATN8+wE
         Mtt5g1iiVByj14h6ZgsmRxzrgdbqWYHfRi4vNbnmdfvmE5EUCWpMYvyM1aPlNcsb3Vvj
         Yqkw==
X-Gm-Message-State: AOAM532+6Xg4ah4KRGRwh5ND6pkH4fr8uv7Ff6xLEVj9Si82ZzUnXImJ
        XxE3m4ECkZVVb7i6OoLRChqoJg==
X-Google-Smtp-Source: ABdhPJwBXTMSc5udFknAAI9pVHPZm6e1jtl2G1dym6ZaM3JWgTp7ubqiMcA3QW/Wti3cC+yO+/VhDw==
X-Received: by 2002:a62:2b4e:0:b029:197:96c2:bfef with SMTP id r75-20020a622b4e0000b029019796c2bfefmr398437pfr.46.1606349154408;
        Wed, 25 Nov 2020 16:05:54 -0800 (PST)
Received: from google.com (242.67.247.35.bc.googleusercontent.com. [35.247.67.242])
        by smtp.gmail.com with ESMTPSA id 85sm2924588pfv.197.2020.11.25.16.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 16:05:53 -0800 (PST)
Date:   Thu, 26 Nov 2020 00:05:49 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Lai Jiangshan <jiangshanlai@gmail.com>
Cc:     linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        Lai Jiangshan <laijs@linux.alibaba.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Avi Kivity <avi@qumranet.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] kvm/x86/mmu: use the correct inherited permissions to
 get shadow page
Message-ID: <20201126000549.GC450871@google.com>
References: <20201120095517.19211-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120095517.19211-1-jiangshanlai@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 20, 2020, Lai Jiangshan wrote:
> From: Lai Jiangshan <laijs@linux.alibaba.com>
> 
> Commit 41074d07c78b ("KVM: MMU: Fix inherited permissions for emulated
> guest pte updates") said role.access is common access permissions for
> all ptes in this shadow page, which is the inherited permissions from
> the parent ptes.
> 
> But the commit did not enforce this definition when kvm_mmu_get_page()
> is called in FNAME(fetch). Rather, it uses a random (last level pte's
> combined) access permissions.

I wouldn't say it's random, the issue is specifically that all shadow pages end
up using the combined set of permissions of the entire walk, as opposed to the
only combined permissions of its parents.

> And the permissions won't be checked again in next FNAME(fetch) since the
> spte is present. It might fail to meet guest's expectation when guest sets up
> spaghetti pagetables.

Can you provide details on the exact failure scenario?  It would be very helpful
for documentation and understanding.  I can see how using the full combined
permissions will cause weirdness for upper level SPs in kvm_mmu_get_page(), but
I'm struggling to connect the dots to understand how that will cause incorrect
behavior for the guest.  AFAICT, outside of the SP cache, KVM only consumes
role.access for the final/last SP.
