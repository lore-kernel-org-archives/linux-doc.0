Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A909EEB64D9
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jun 2023 17:55:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbjFZRzl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jun 2023 13:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbjFZRzK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 13:55:10 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3A710D0
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 10:55:08 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-66615629689so3199476b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 10:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687802108; x=1690394108;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aQQSDBr5oatmPC3jRYA52hLZn7olUfljW9YDHvW1zAM=;
        b=V2GYqB5ZQKGlBdGq4Ggv2HY9SnXrvS+6OQvar/tPaSl8v1rTUd9eo+OUWlhFfPVPG5
         TGS0qUSoBeb2t39d9BAjPi8XnBSRP905tos6b6nJlFup7RpRn1ogqPkikP9uDkMTqx6Z
         4UCmTXYnSIYE3MclrgU36J1AyaPBuorg6mUGcJgYEiu2CttmuUFFs+9egk0mex0tW4xS
         7gchAvfYnRtXV1lveCg00na72TrbNbbNlg8rx/EQOxQ9NXoMlkYkU0Ut6ghgwdp/467d
         3Z0kW9QXnIksBQJsBfIkOh05l8Bv+FocfBmGOXHsbVoS2CXWJx1GW31R52ED6wT86jDB
         pJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687802108; x=1690394108;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aQQSDBr5oatmPC3jRYA52hLZn7olUfljW9YDHvW1zAM=;
        b=D2rS1qx1apku1wewyvg9lNlDgF6HQJtCHhXOXe9mPLlXY5YDlHTu9Mfn++DSS5xGLz
         qfnhlpOo1pgy2Pn1oH8qWxeEdeVyaMAJ7oF3YAPjQHwHXvKOWuKTfAXFNq41LGwCupl9
         j5+mHt+uit8VKpWFhr64rg0w2kfLD0YxGG+aLB4aPNAXwR7X/YeA54eYDL5Zx3Gqn7fG
         LSUNCzfe+oWGfKaugU8rhWqIYr7FTc1NDOqffMJ2WI1DOlexG+VcycQvTwdraXTHMH25
         UTTgJFCkdkz3tIbjJ7GUvtKLImh3X0+1xaNioulolPsL7V1g5pA3nG9Cw54W+bqxRWlr
         4rMA==
X-Gm-Message-State: AC+VfDxbzSwJK2RUjHk2KHMgfkr7gS1M7buWx2suDpT3pp3NSL1z2TZw
        qqMq1G3BQrtmF5i2ygai78AUwg==
X-Google-Smtp-Source: ACHHUZ56YKQ0psWle33+Ep3NAFri1ZgeDSD/fhC7v/Y4sIg81RSp2vNIPzt8E+8LzDLkd08G0/E0OQ==
X-Received: by 2002:a05:6a20:7da4:b0:11f:3f4b:9687 with SMTP id v36-20020a056a207da400b0011f3f4b9687mr33878996pzj.56.1687802107970;
        Mon, 26 Jun 2023 10:55:07 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id w16-20020a634750000000b00530621e5ee4sm4459318pgk.9.2023.06.26.10.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 10:55:07 -0700 (PDT)
Date:   Mon, 26 Jun 2023 17:55:03 +0000
From:   Mingwei Zhang <mizhang@google.com>
To:     "Huang, Kai" <kai.huang@intel.com>
Cc:     "pbonzini@redhat.com" <pbonzini@redhat.com>,
        "Christopherson,, Sean" <seanjc@google.com>,
        "jmattson@google.com" <jmattson@google.com>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dmatlack@google.com" <dmatlack@google.com>,
        "bgardon@google.com" <bgardon@google.com>
Subject: Re: [PATCH 4/6] KVM: Documentation: Add the missing
 tdp_mmu_root_count into kvm_mmu_page
Message-ID: <ZJnQ9w5deFHhElu9@google.com>
References: <20230618000856.1714902-1-mizhang@google.com>
 <20230618000856.1714902-5-mizhang@google.com>
 <1af0f4de320fd5ba96d63b7f0bdbbb061a7466f2.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1af0f4de320fd5ba96d63b7f0bdbbb061a7466f2.camel@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 22, 2023, Huang, Kai wrote:
> On Sun, 2023-06-18 at 00:08 +0000, Mingwei Zhang wrote:
> > Add tdp_mmu_root_count into kvm_mmu_page description. tdp_mmu_root_count is
> > an atomic counter used only in TDP MMU. Its usage and meaning is slightly
> > different with root_counter in shadow MMU. Update the doc.
> > 
> > Signed-off-by: Mingwei Zhang <mizhang@google.com>
> > ---
> >  Documentation/virt/kvm/x86/mmu.rst | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
> > index 36bfe0fe02bb..3dce2426ad6d 100644
> > --- a/Documentation/virt/kvm/x86/mmu.rst
> > +++ b/Documentation/virt/kvm/x86/mmu.rst
> > @@ -230,6 +230,12 @@ Shadow pages contain the following information:
> >      A counter keeping track of how many hardware registers (guest cr3 or
> >      pdptrs) are now pointing at the page.  While this counter is nonzero, the
> >      page cannot be destroyed.  See role.invalid.
> > +  tdp_mmu_root_count:
> > +    An atomic reference counter in TDP MMU that allows for parallel
> 					     ^
> Please explicitly say "TDP MMU root page" ?
>
> > +    accesses.  Accessing the page requires lifting the counter value. The
> > +    initial value is set as 2 indicating one reference from vCPU and one
> 			    ^
> 			    to ?
> 
> > +    from TDP MMU itself. 
> > 
> 
> 
> > While this counter is nonzero, the page cannot be
> > +    destroyed. 
> > 
> 
> I guess this sentence is implied by "reference counter" mentioned in the first
> sentence.
> 

Will make the changes in next version.

-Mingwei
