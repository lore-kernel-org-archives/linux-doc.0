Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4548CC4708F
	for <linux-doc@archiver.kernel.org>; Sat, 29 May 2021 17:50:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2595961152
	for <linux-doc@archiver.kernel.org>; Sat, 29 May 2021 17:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhE2Rvu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 29 May 2021 13:51:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21996 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229828AbhE2Rvq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 29 May 2021 13:51:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622310609;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mrWvrqIAhcEy96XyBpdIpilGC4jUDh9O1RbAnpp75IY=;
        b=J0+c2qYwfcCcS8HAd2RZUdD9ZwNFdOYjgSUEpG0BV2k648ZKO60FiydBlbL4LCHEZlCLBJ
        dxRVNyIQHpPHY8sU7E/DpAtIgrKiEWkNxT1PR0qSwVpBCLMiiHusvZZynVSVh5lEFg+bSU
        bMDE2eTJyyGlds6+iMUbAjxBdtQkExY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-aW1u2QHcNfmtvUAmr14NLQ-1; Sat, 29 May 2021 13:50:03 -0400
X-MC-Unique: aW1u2QHcNfmtvUAmr14NLQ-1
Received: by mail-wr1-f70.google.com with SMTP id j1-20020adff0010000b0290114b7cf4e83so2588427wro.15
        for <linux-doc@vger.kernel.org>; Sat, 29 May 2021 10:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mrWvrqIAhcEy96XyBpdIpilGC4jUDh9O1RbAnpp75IY=;
        b=JYlUUzq/DSIJaf7EqAe7VHrKrbv7PSmMh8zrr+IR+aAb+Q9MoNCjYZzRt8cnumj7+p
         sR0MJh2alQNgrEh1jswnR1UMVPgGXnZKKrt+0hzR/FJsCzD7oL2FLD92vluJpOMVGjHI
         2ouZODTAO3f7qu7pDHzEcGtYcP1FwG9ZgygMTg3CGczHrtjGBOkWBFdPshRBjAxVMONI
         91yUMItgyIPcS11JKCqOea7nM3D89kgSp3CNHkpzs7br1a43ltUKVhmp18bgmBU18tGY
         0eMwE5zP+PRntobTn/r+Fr7rfhoXokgOlH4Q4ctQKj0u3H4DzywJ6GhZZbfSaaQyaUX8
         iPwg==
X-Gm-Message-State: AOAM530uZfZOvyci06zqf625RNDVjxH8lPt68/ZbNF9M/ZGwVJ99xt66
        gTci479SZyfRuq9ixyxPl7oNks8UAAFtkINHGCPfFmx9CrKlfNBK6kMV1/qMDjKwEYQ5xn0xTgq
        eNKCkeiSe8QC6UrilfWkK
X-Received: by 2002:a5d:6484:: with SMTP id o4mr14109475wri.8.1622310601849;
        Sat, 29 May 2021 10:50:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo3e7yKf5MVxMB5PF7HdlBui/UOcIPiMuU10E1z/Gxod0C57HWLEi0mTREdeLVXjD6g/JlQg==
X-Received: by 2002:a5d:6484:: with SMTP id o4mr14109457wri.8.1622310601651;
        Sat, 29 May 2021 10:50:01 -0700 (PDT)
Received: from [10.0.1.105] ([77.137.128.120])
        by smtp.gmail.com with ESMTPSA id z12sm11163024wrv.68.2021.05.29.10.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 10:50:01 -0700 (PDT)
Message-ID: <a59c8a53d30ef67afef87841031ed98a98f40ccf.camel@redhat.com>
Subject: Re: [PATCH v2 0/6] Introduce KVM_{GET|SET}_SREGS2 and fix PDPTR
 migration
From:   Maxim Levitsky <mlevitsk@redhat.com>
To:     Sean Christopherson <seanjc@google.com>
Cc:     kvm@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" 
        <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Wanpeng Li <wanpengli@tencent.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>
Date:   Sat, 29 May 2021 20:49:57 +0300
In-Reply-To: <YK6M4UwNGn1Gc5Sa@google.com>
References: <20210426111333.967729-1-mlevitsk@redhat.com>
         <YK6M4UwNGn1Gc5Sa@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2021-05-26 at 18:01 +0000, Sean Christopherson wrote:
> On Mon, Apr 26, 2021, Maxim Levitsky wrote:
> > This patch set aims to fix few flaws that were discovered
> > in KVM_{GET|SET}_SREGS on x86:
> > 
> > * There is no support for reading/writing PDPTRs although
> >   these are considered to be part of the guest state.
> > 
> > * There is useless interrupt bitmap which isn't needed
> > 
> > * No support for future extensions (via flags and such)
> > 
> > Also if the user doesn't use the new SREG2 api, the PDPTR
> > load after migration is now done on KVM_REQ_GET_NESTED_STATE_PAGES
> > to at least read them correctly in cases when guest memory
> > map is not up to date when nested state is loaded.
> > 
> > This patch series was tested by doing nested migration test
> > of 32 bit PAE L1 + 32 bit PAE L2 on AMD and Intel and by
> > nested migration test of 64 bit L1 + 32 bit PAE L2 on AMD.
> > The later test currently fails on Intel (regardless of my patches).
> > 
> > Changes from V1:
> >   - move only PDPTRS load to KVM_REQ_GET_NESTED_STATE_PAGES on VMX
> >   - rebase on top of kvm/queue
> >   - improve the KVM_GET_SREGS2 to have flag for PDPTRS
> >     and remove padding
> > 
> > Patches to qemu will be send soon as well.
> 
> How did you want to handle integration with the removal of
> pdptrs_changed()?
> 
> https://lkml.kernel.org/r/68ff1249-2902-43d5-3dfd-35b1f14c4f90@redhat.com
> 

Hi!
Sorry that I missed your mail. I will take a look in a day or so at
this, and I don't envision any significant trouble with removal of
pdptrs_changed, since it is only an optimization anyway.

Thanks,
	Best regards,
		Maxim Levitsky

