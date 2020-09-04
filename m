Return-Path: <SRS0=2c8a=CN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A119BC433E2
	for <linux-doc@archiver.kernel.org>; Fri,  4 Sep 2020 03:04:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 780DF206D4
	for <linux-doc@archiver.kernel.org>; Fri,  4 Sep 2020 03:04:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZYjuyont"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729620AbgIDDEp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Sep 2020 23:04:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36596 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729036AbgIDDEp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Sep 2020 23:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599188683;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pq7ni1SWjFvAGCdjXQ8UT6nTLstPuPhVRwHdTLDTLgg=;
        b=ZYjuyontmMa3Y/GFJhkluQQ38Exz6Z8gPNVrGM5Rl4ieBoRQs6ADIcbPqcmLlIMeYytV6d
        Kr/j/3Id0lscHO2SrC2htEj9gg1kPIU4UIAWGcFiJo3XVUBaQWGWC/XAjlt0/jHQTT3/rU
        d5ReW0gio78hV7s1eGS8eNrgRnyeB8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-N7250dg9MM2jP_8tS0m4cw-1; Thu, 03 Sep 2020 23:04:41 -0400
X-MC-Unique: N7250dg9MM2jP_8tS0m4cw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B8A11006708;
        Fri,  4 Sep 2020 03:04:38 +0000 (UTC)
Received: from dhcp-128-65.nay.redhat.com (ovpn-13-47.pek2.redhat.com [10.72.13.47])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D21515D9CC;
        Fri,  4 Sep 2020 03:04:28 +0000 (UTC)
Date:   Fri, 4 Sep 2020 11:04:24 +0800
From:   Dave Young <dyoung@redhat.com>
To:     chenzhou <chenzhou10@huawei.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
        james.morse@arm.com, tglx@linutronix.de, mingo@redhat.com,
        bhe@redhat.com, corbet@lwn.net, John.P.donnelly@oracle.com,
        prabhakar.pkin@gmail.com, bhsharma@redhat.com, horms@verge.net.au,
        robh+dt@kernel.org, arnd@arndb.de, nsaenzjulienne@suse.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        guohanjun@huawei.com, xiexiuqi@huawei.com, huawei.libin@huawei.com,
        wangkefeng.wang@huawei.com
Subject: Re: [PATCH v11 3/5] arm64: kdump: reimplement crashkernel=X
Message-ID: <20200904030424.GA11384@dhcp-128-65.nay.redhat.com>
References: <20200801130856.86625-1-chenzhou10@huawei.com>
 <20200801130856.86625-4-chenzhou10@huawei.com>
 <20200902170910.GB16673@gaia>
 <f33a0ce6-552e-2f1a-e720-4f7124f15d1e@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f33a0ce6-552e-2f1a-e720-4f7124f15d1e@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/03/20 at 07:26pm, chenzhou wrote:
> Hi Catalin,
> 
> 
> On 2020/9/3 1:09, Catalin Marinas wrote:
> > On Sat, Aug 01, 2020 at 09:08:54PM +0800, Chen Zhou wrote:
> >> There are following issues in arm64 kdump:
> >> 1. We use crashkernel=X to reserve crashkernel below 4G, which
> >> will fail when there is no enough low memory.
> >> 2. If reserving crashkernel above 4G, in this case, crash dump
> >> kernel will boot failure because there is no low memory available
> >> for allocation.
> >> 3. Since commit 1a8e1cef7603 ("arm64: use both ZONE_DMA and ZONE_DMA32"),
> >> if the memory reserved for crash dump kernel falled in ZONE_DMA32,
> >> the devices in crash dump kernel need to use ZONE_DMA will alloc
> >> fail.
> >>
> >> To solve these issues, change the behavior of crashkernel=X.
> >> crashkernel=X tries low allocation in ZONE_DMA, and fall back to
> >> high allocation if it fails.
> >>
> >> If requized size X is too large and leads to very little free memory
> >> in ZONE_DMA after low allocation, the system may not work normally.
> >> So add a threshold and go for high allocation directly if the required
> >> size is too large. The value of threshold is set as the half of
> >> the low memory.
> >>
> >> If crash_base is outside ZONE_DMA, try to allocate at least 256M in
> >> ZONE_DMA automatically. "crashkernel=Y,low" can be used to allocate
> >> specified size low memory.
> > Except for the threshold to keep zone ZONE_DMA memory,
> > reserve_crashkernel() looks very close to the x86 version. Shall we try
> > to make this generic as well? In the first instance, you could avoid the
> > threshold check if it takes an explicit ",high" option.
> Ok, i will try to do this.
> 
> I look into the function reserve_crashkernel() of x86 and found the start address is
> CRASH_ALIGN in function memblock_find_in_range(), which is different with arm64.
> 
> I don't figure out why is CRASH_ALIGN in x86, is there any specific reason?

Hmm, took another look at the option CONFIG_PHYSICAL_ALIGN
config PHYSICAL_ALIGN
        hex "Alignment value to which kernel should be aligned"
        default "0x200000"
        range 0x2000 0x1000000 if X86_32
        range 0x200000 0x1000000 if X86_64

According to above, I think the 16M should come from the largest value
But the default value is 2M,  with smaller value reservation can have
more chance to succeed.

It seems we still need arch specific CRASH_ALIGN, but the initial
version you added the #ifdef for different arches, can you move the
macro to arch specific headers?

Thanks
Dave

