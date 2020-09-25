Return-Path: <SRS0=pZ1j=DC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEB4C4741F
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 16:40:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 550FF206BE
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 16:40:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m5NtFveS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbgIYQkX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Sep 2020 12:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728011AbgIYQkV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Sep 2020 12:40:21 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27D8C0613CE
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 09:40:20 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id o8so2901544otl.4
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 09:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=adS2w4MfZVtQ+JdOzVjFl88CdbAyPhM8+osYUFtdj/U=;
        b=m5NtFveSMLhfuRJGGdkLfEMup8cEopZ/jbnqb7UUZO0HMgcTV545eLiYK19f2Rtic9
         XnixmPOvGbambOL+DhjMVQ9mGnjHwL1P63lW23ZeaEO5CtuX7BJVAuDISt87ZaFzaqji
         +TQjVytRPzlc/f3cs+CnYLbe28QaWc/I3Y0KTEmvF+sQfXu+M9+G5B4+IG9tJkm66rVa
         LssiqNZHVitPn5b4xTv8RcqNDD6hXDLkYK1+zwQcydYyoFgi6iBfLBm8BNH2WMTlsoAi
         tCmQl5+2u9BjRUgBdaRT/uOKAwywJ/Qoc9DxSCWSzydl0lJh1NbwKzGeQbxoDOP7vrQP
         gOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=adS2w4MfZVtQ+JdOzVjFl88CdbAyPhM8+osYUFtdj/U=;
        b=X0YuoPS7IbGVpPOZHnrPL36k3cDwUMBvtzin4pRXEN2UnBt4u4FuVdlBHlSPTSLklK
         ddvMGwOOu5qJ54TH6nomV7CDSDfczqpWLZBGHb6G0B8X1w4O8q+ZT1auHzTfxICvRgUz
         bzehknLKp641s5W8foTbI64LdyJN3PLz4t28GgsoFEB3l10KY4rcvwGc3unV3wVijjQN
         dxvCBWk/zYrk7Le3Uc+laALLZv6Ok9cGv/IOxvKg9XIMI1RyCgnEPUqYWFU2kx64izs1
         wApDNVzVNGRfOR4cF7bN6LcjIlmjqakF/XsglsP3tYAWCJdwzrhnHhuaQ82JXggv6AfK
         m/jg==
X-Gm-Message-State: AOAM53045MFTtwpy9xw7fWkcgg8T31hPfPxMlODGf/ecDHXpqMKsAytF
        pEEDhyfMlMnqB0Sq0Ii0ZYTnoAovpTLCh/xA7lENfA==
X-Google-Smtp-Source: ABdhPJy/QdDf8ZZphXLshFnr46sMAVEmrQ6ga42OUf0dnO02EpnX+XXwrzbC1TlH5wbcBksxHK3/H9KCAGjVDCAkWbM=
X-Received: by 2002:a05:6830:164e:: with SMTP id h14mr894858otr.56.1601052020022;
 Fri, 25 Sep 2020 09:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200925143422.21718-1-graf@amazon.com> <20200925143422.21718-2-graf@amazon.com>
In-Reply-To: <20200925143422.21718-2-graf@amazon.com>
From:   Jim Mattson <jmattson@google.com>
Date:   Fri, 25 Sep 2020 09:40:08 -0700
Message-ID: <CALMp9eSDH1F70i=-3wrC55ipz91qygrsPtw7RL4iCi09A-Da6A@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] KVM: x86: Return -ENOENT on unimplemented MSRs
To:     Alexander Graf <graf@amazon.com>
Cc:     kvm list <kvm@vger.kernel.org>,
        Aaron Lewis <aaronlewis@google.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Joerg Roedel <joro@8bytes.org>,
        KarimAllah Raslan <karahmed@amazon.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 25, 2020 at 7:34 AM Alexander Graf <graf@amazon.com> wrote:
>
> When we find an MSR that we can not handle, bubble up that error code as
> MSR error return code. Follow up patches will use that to expose the fact
> that an MSR is not handled by KVM to user space.
>
> Suggested-by: Aaron Lewis <aaronlewis@google.com>
> Signed-off-by: Alexander Graf <graf@amazon.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
