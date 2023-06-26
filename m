Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB56EB64D7
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jun 2023 17:06:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjFZRGo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jun 2023 13:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbjFZRGn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 13:06:43 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C318E7E
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 10:06:42 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b801e6ce85so8920635ad.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 10:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687799201; x=1690391201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f2t/6AuCGHu+g1mzUi3uHQSoDcB61+uw4A1sl2aTsDM=;
        b=VL9wL2ourXiEvavwXqheIk73JPQwGGIH/H2tda9/Zck/TvRhVxV9oYsIvIrgQb2uoR
         czgVjuZJvSCtc/cyiZpI1tdiOBFAQQxEZNvUpN/teRyo3rlg7ua/6w2MBf4PNwaTjIGC
         NtvQawe+cOaK43vt2lJ5HRfxkQyGbEIAOvS1iFM5Z275b/luF8a5GGF7Lf9NxkJ66W4P
         Ud2s3StNuqd0sR3p6jbbkyzVCnoT9jc3SvLXCJl/SgCqy6x37qogwLNqITcPb1H79Q0Y
         ll7gBl0y8iSAzAvqj/f1e1CjK0Nrbgego8zQl40fh8WlXDSt4H1GSgzTs7teof7ND609
         R+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687799201; x=1690391201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2t/6AuCGHu+g1mzUi3uHQSoDcB61+uw4A1sl2aTsDM=;
        b=ARL3fCvOpRbj0COMnSVCp0MnrM7E/JwNRU+glbHw0OW4f1KTeU7L9555XMgv32LGCB
         AGty8vpqrAFccEo8paEPU7q3nt10Moml0Re4AhVxp9LzZh6KkV+HPnk51zVxDoLFPwZ5
         ASZ1WN5JsgJGaAImkHt+WPOgAK0mAE9jUFHnk5EnnO3hAqyj3cm+QLXxgZnQ5qtu0SEU
         Zqu2vlgSxWSPC25Mn6qn2mz/bAFWUfvEsMLI7jWCGwal5fTYaFo+FqPoU5w/+0zgEilM
         kZV4pTMYehdflhbjDfFdSQNUmmJbe9RLLjtbAcATOztJwnTS4cUZj1rWEhDnV5bC4+yH
         Uo8g==
X-Gm-Message-State: AC+VfDzRn/iRz44ZAWNWidn3/bsUqTpXRu4gm+xyUjWiTi7VC1XktsUw
        dpScJeshjx4PDyEjyZlarWb6nw==
X-Google-Smtp-Source: ACHHUZ6unRv0OlEcCIZYcuG4X+sRKYMWHVWf1+9GkTHOWMxxJlTDQ3OSvpC2peZAtNC3r4ALhBBm7A==
X-Received: by 2002:a17:902:c1d2:b0:1b5:e30:94dc with SMTP id c18-20020a170902c1d200b001b50e3094dcmr8092819plc.7.1687799201193;
        Mon, 26 Jun 2023 10:06:41 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id s12-20020a170902988c00b00198d7b52eefsm4420214plp.257.2023.06.26.10.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 10:06:40 -0700 (PDT)
Date:   Mon, 26 Jun 2023 17:06:35 +0000
From:   Mingwei Zhang <mizhang@google.com>
To:     Xu Yilun <yilun.xu@intel.com>
Cc:     Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jim Mattson <jmattson@google.com>,
        David Matlack <dmatlack@google.com>,
        Ben Gardon <bgardon@google.com>
Subject: Re: [PATCH 2/6] KVM: Documentation: Update the field name gfns in
 kvm_mmu_page
Message-ID: <ZJnFm0gD4K0uc92G@google.com>
References: <20230618000856.1714902-1-mizhang@google.com>
 <20230618000856.1714902-3-mizhang@google.com>
 <ZJTnvuoVWLhv0H0f@yilunxu-OptiPlex-7050>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJTnvuoVWLhv0H0f@yilunxu-OptiPlex-7050>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 23, 2023, Xu Yilun wrote:
> On 2023-06-18 at 00:08:52 +0000, Mingwei Zhang wrote:
> > Update the 'gfns' in kvm_mmu_page to 'shadowed_translation'to be consistent
> > with the code. The more detailed description of 'shadowed_translation' is
> > already inlined in the data structure definition, so no need to duplicate
> > the text but simply just update the name.
> 
> The definition of this field is changed, but apprently the description
> here is for gfns. It leaves some confusion if we just leave them
> unchanged.
> 
> > 
> > Signed-off-by: Mingwei Zhang <mizhang@google.com>
> > ---
> >  Documentation/virt/kvm/x86/mmu.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
> > index 561efa8ec7d7..149dd3cba48f 100644
> > --- a/Documentation/virt/kvm/x86/mmu.rst
> > +++ b/Documentation/virt/kvm/x86/mmu.rst
> > @@ -221,7 +221,7 @@ Shadow pages contain the following information:
> >      at __pa(sp2->spt).  sp2 will point back at sp1 through parent_pte.
> >      The spt array forms a DAG structure with the shadow page as a node, and
> >      guest pages as leaves.
> > -  gfns:
> > +  shadowed_translation:
> >      An array of 512 guest frame numbers, one for each present pte.  Used to
> 
> guest frame numbers -> shadow translation info (gfn + access)

Will add this one. I will avoid the "(gfn + access)" since that is
already described in the comments inline and it may subject to changes,
eg., adding more bits in the future.
> 
> >      perform a reverse map from a pte to a gfn. When role.direct is set, any
> 
> Just "perform reverse mapping" is OK?

I will tend to leave that as is, since it is not a major issue.
> 
> >      element of this array can be calculated from the gfn field when used, in
> 
> May remove the "of gfns"

will do.
>
> Thanks,
> Yilun

Thanks for the comment, will update it in next version.
> 
> > -- 
> > 2.41.0.162.gfafddb0af9-goog
> > 
