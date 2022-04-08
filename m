Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C56C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  8 Apr 2022 09:33:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbiDHJfH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbiDHJfG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Apr 2022 05:35:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EBD9B121095
        for <linux-doc@vger.kernel.org>; Fri,  8 Apr 2022 02:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649410382;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=e8zy54DaIAQWiqPv3lC1ZWYH7iRSoNT36sbtgj7D0MA=;
        b=hYWTvElLM56FNKI7PlmHjs2dpneFxmCYF6Qh5wOR0G2JFt6innpkO9xLTID0Z9Np9XaeKR
        kds0nDIiDqjHpiNKrbFtcw+h0c3U1ModJyLk6GvO3vVlUbS3nFygYhgqC1kixezrGrmgml
        ao+5Jprsy2GH2YqqCvqFuUFbvs8HzcM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-h8-zO9aANJqOx1GbW8pX1A-1; Fri, 08 Apr 2022 05:32:57 -0400
X-MC-Unique: h8-zO9aANJqOx1GbW8pX1A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D577A811E78;
        Fri,  8 Apr 2022 09:32:56 +0000 (UTC)
Received: from localhost (ovpn-12-202.pek2.redhat.com [10.72.12.202])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id BE8B91402427;
        Fri,  8 Apr 2022 09:32:55 +0000 (UTC)
Date:   Fri, 8 Apr 2022 17:32:52 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        linux-kernel@vger.kernel.org, Dave Young <dyoung@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Eric Biederman <ebiederm@xmission.com>,
        kexec@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Feng Zhou <zhoufeng.zf@bytedance.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Chen Zhou <dingguo.cz@antgroup.com>,
        John Donnelly <John.p.donnelly@oracle.com>,
        Dave Kleikamp <dave.kleikamp@oracle.com>
Subject: Re: [PATCH v21 0/5] support reserving crashkernel above 4G on arm64
 kdump
Message-ID: <YlABRPBEaTldZwuL@MiWiFi-R3L-srv>
References: <20220227030717.1464-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220227030717.1464-1-thunder.leizhen@huawei.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, Lei

On 02/27/22 at 11:07am, Zhen Lei wrote:
> Changes since [v20]:
> 1. Check whether crashkernel=Y,low is incorrectly configured or not configured. Do different processing.
> 2. Share the existing description of x86. The configuration of arm64 is the same as that of x86.
> 3. Define the value of macro CRASH_ADDR_HIGH_MAX as memblock.current_limit, instead of MEMBLOCK_ALLOC_ACCESSIBLE.
> 4. To improve readability, some lightweight code adjustments have been made to reserve_craskernel(), including comments.
> 5. The defined value of DEFAULT_CRASH_KERNEL_LOW_SIZE reconsiders swiotlb, just like x86, to share documents.

5.18 rc1 is already done, do you have plan to post a new version for
reviewing?

Thanks
Baoquan

