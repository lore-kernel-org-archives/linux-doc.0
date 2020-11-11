Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1F5C388F9
	for <linux-doc@archiver.kernel.org>; Wed, 11 Nov 2020 13:57:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 627EE2074B
	for <linux-doc@archiver.kernel.org>; Wed, 11 Nov 2020 13:57:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H5qdSKlM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgKKN4O (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Nov 2020 08:56:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60258 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727013AbgKKNzA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Nov 2020 08:55:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605102899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aMaHhSCKMeHb+h3vdBSxeg5btyZh1RbkohyGRVpWKe0=;
        b=H5qdSKlMzRPWnzXFx9OqAxeA9HuQAZNoy0atPJOp5Z9C++pZ+T8I6vv5pKPVEJTBfVIyzm
        eDu3x4bY0mGaGbd1ScTUiDmOmvMRwdx6lt7Pz0TJEMoxBQJfYSvEmvqmRDqlRJdZcDpIPe
        jEdOjN3wxLU7H2CmbEkz2mMgoVL2hFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-IJvfncXCMY6jcUTWaZWueA-1; Wed, 11 Nov 2020 08:54:58 -0500
X-MC-Unique: IJvfncXCMY6jcUTWaZWueA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 159C11087D6A;
        Wed, 11 Nov 2020 13:54:55 +0000 (UTC)
Received: from localhost (ovpn-12-35.pek2.redhat.com [10.72.12.35])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A1F507366E;
        Wed, 11 Nov 2020 13:54:50 +0000 (UTC)
Date:   Wed, 11 Nov 2020 21:54:48 +0800
From:   Baoquan He <bhe@redhat.com>
To:     chenzhou <chenzhou10@huawei.com>
Cc:     tglx@linutronix.de, mingo@redhat.com, dyoung@redhat.com,
        catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
        John.P.donnelly@oracle.com, bhsharma@redhat.com,
        prabhakar.pkin@gmail.com, wangkefeng.wang@huawei.com,
        arnd@arndb.de, linux-doc@vger.kernel.org, xiexiuqi@huawei.com,
        kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, horms@verge.net.au, james.morse@arm.com,
        linux-arm-kernel@lists.infradead.org, huawei.libin@huawei.com,
        guohanjun@huawei.com, nsaenzjulienne@suse.de
Subject: Re: [PATCH v13 6/8] arm64: kdump: reimplement crashkernel=X
Message-ID: <20201111135448.GF8486@MiWiFi-R3L-srv>
References: <20201031074437.168008-1-chenzhou10@huawei.com>
 <20201031074437.168008-7-chenzhou10@huawei.com>
 <20201111015926.GD24747@MiWiFi-R3L-srv>
 <23389389-2855-50fd-25b7-4f7d4246bf0c@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23389389-2855-50fd-25b7-4f7d4246bf0c@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/11/20 at 09:27pm, chenzhou wrote:
> Hi Baoquan,
...
> >>  #ifdef CONFIG_CRASH_DUMP
> >>  static int __init early_init_dt_scan_elfcorehdr(unsigned long node,
> >> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >> index 1c0f3e02f731..c55cee290bbb 100644
> >> --- a/arch/arm64/mm/mmu.c
> >> +++ b/arch/arm64/mm/mmu.c
> >> @@ -488,6 +488,10 @@ static void __init map_mem(pgd_t *pgdp)
> >>  	 */
> >>  	memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
> >>  #ifdef CONFIG_KEXEC_CORE
> >> +	if (crashk_low_res.end)
> >> +		memblock_mark_nomap(crashk_low_res.start,
> >> +				    resource_size(&crashk_low_res));
> >> +
> >>  	if (crashk_res.end)
> >>  		memblock_mark_nomap(crashk_res.start,
> >>  				    resource_size(&crashk_res));
> >> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> >> index d39892bdb9ae..cdef7d8c91a6 100644
> >> --- a/kernel/crash_core.c
> >> +++ b/kernel/crash_core.c
> >> @@ -321,7 +321,7 @@ int __init parse_crashkernel_low(char *cmdline,
> >>  
> >>  int __init reserve_crashkernel_low(void)
> >>  {
> >> -#ifdef CONFIG_X86_64
> >> +#if defined(CONFIG_X86_64) || defined(CONFIG_ARM64)
> > Not very sure if a CONFIG_64BIT checking is better.
> If doing like this, there may be some compiling errors for other 64-bit kernel, such as mips.
> >
> >>  	unsigned long long base, low_base = 0, low_size = 0;
> >>  	unsigned long low_mem_limit;
> >>  	int ret;
> >> @@ -362,12 +362,14 @@ int __init reserve_crashkernel_low(void)
> >>  
> >>  	crashk_low_res.start = low_base;
> >>  	crashk_low_res.end   = low_base + low_size - 1;
> >> +#ifdef CONFIG_X86_64
> >>  	insert_resource(&iomem_resource, &crashk_low_res);
> >> +#endif
> >>  #endif
> >>  	return 0;
> >>  }
> >>  
> >> -#ifdef CONFIG_X86
> >> +#if defined(CONFIG_X86) || defined(CONFIG_ARM64)
> > Should we make this weak default so that we can remove the ARCH config?
> The same as above, some arch may not support kdump, in that case,  compiling errors occur.

OK, not sure if other people have better idea, oterwise, we can leave with it. 
Thanks for telling.

