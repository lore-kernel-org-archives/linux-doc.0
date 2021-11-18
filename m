Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCBFC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 18 Nov 2021 15:32:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FE31613D3
	for <linux-doc@archiver.kernel.org>; Thu, 18 Nov 2021 15:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbhKRPfj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Nov 2021 10:35:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbhKRPfj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Nov 2021 10:35:39 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1539C061574
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 07:32:38 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id w33-20020a17090a6ba400b001a722a06212so6922888pjj.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 07:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ooIKBw0rJzYPaIbsEt+IczztIFmaInAx2wjxzlVBBT4=;
        b=l3J33nqrIyN6zumztnxskDXu0IXRcAbBLHSP+OW6N0yMliHKsEyHIFuHNtPiI956+y
         9bFI8EDTEMP0UQD+otFhNSLgjtUmoR4CTigP03oLIzjL8PXxGE/KQnXyyZNOTO07/u+C
         AAL0blwDFaePVLLKI0sYNCBfTJqfq7Y6f5Z2x37hsxZ/EzcS/a9oEcRGOmY1rb/4wGHb
         d1dCHoVkqC+MUORT1dMAWIoXkdA5zILky4PrZFUcw9xAyK0kyPFEp5yJ03N2ligBLzvm
         zKchwnCh1ddz0BxegcjAs3cYHm54RS4J4xxafk+uP9re4FOrapoxf8ICQyjFjX+wxKU5
         YOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ooIKBw0rJzYPaIbsEt+IczztIFmaInAx2wjxzlVBBT4=;
        b=4kEqMjST4qFHWRVUY9eyqcuoiPhQdaW0+QM/0f7h9Wlqh8clOa3FFSs+tNfMWwgNC0
         x7VVAxLnjgpSTvASVp0v5oXLJtuBwxkMV379zlLpelw4EuuW4bS0+DlrGJEeMTgZocp5
         pOoxsa0IW7j8WEuzdIs2AkRCLOPHWqTtrPcyfiaNimb3CsL9x+5qS/zBgCtLs8F/TMnW
         U7NP+QPuYR50mZJmRtEtouVQjlOGjm/Vp4MmrbPPBqwhDgjPWViHB7h41wYJL7WWp7Md
         l9c0dZmYTRSbqUCK2TD2/U+CEExdBAgXWrSM37o3liKyK21wgPvagEk+UcLlo74F6YG8
         zMrg==
X-Gm-Message-State: AOAM532a0DNJw0phU4HGmXXXYlZfqMQ2A3BLPkGTlJiaTbZCohgFSmf3
        Bd2/89hFI1w65DLVoUUyY6DVJw==
X-Google-Smtp-Source: ABdhPJwQrkN07XsN67RIXSJyxPcM2HgT97zNqu+ZVGDs6Xjncgez9VeTtyPa8V7QFcq9p6K8xb+/0g==
X-Received: by 2002:a17:90b:1c8d:: with SMTP id oo13mr11797986pjb.239.1637249558350;
        Thu, 18 Nov 2021 07:32:38 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id t8sm58047pgk.66.2021.11.18.07.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 07:32:37 -0800 (PST)
Date:   Thu, 18 Nov 2021 15:32:34 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Juergen Gross <jgross@suse.com>
Cc:     kvm@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 4/4] x86/kvm: add boot parameter for setting max
 number of vcpus per guest
Message-ID: <YZZyEgvYLRFHh2iz@google.com>
References: <20211116141054.17800-1-jgross@suse.com>
 <20211116141054.17800-5-jgross@suse.com>
 <YZVsnZ8e7cXls2P2@google.com>
 <b252671e-dbd6-03a3-e8b5-552425ad63d3@suse.com>
 <YZZrzSi1rdaP0ETF@google.com>
 <d5c57c27-e237-ef84-96c7-f50619597023@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5c57c27-e237-ef84-96c7-f50619597023@suse.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 18, 2021, Juergen Gross wrote:
> On 18.11.21 16:05, Sean Christopherson wrote:
> > the partner isn't running a vanilla distro build and could set it as they see fit.
> 
> And here you are wrong. They'd like to use standard SUSE Linux (SLE).

Huh.  As in, completely off-the-shelf kernel binaries without any tweaks to the
config?
