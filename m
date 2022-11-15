Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7888EC4332F
	for <linux-doc@archiver.kernel.org>; Tue, 15 Nov 2022 11:58:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbiKOL6x (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Nov 2022 06:58:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232649AbiKOL6v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Nov 2022 06:58:51 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D48B7E3E;
        Tue, 15 Nov 2022 03:58:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A7DBB616E4;
        Tue, 15 Nov 2022 11:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1476AC433D6;
        Tue, 15 Nov 2022 11:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668513525;
        bh=v7WQwVwUrmsME8ycelaHX9JZWXOub138m3ehvZfVnW8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tE8J2hmdAW5zvK1kAOaeYoesuixtZPOIdomObZYKaTefyMR/hydRm4BlGwc56roLJ
         /u7KoTeA+18aoBMrZxe+RGf0l92p73zBs4mONKVLWwoDDn0gOnXBxwXf9r5X1cluCx
         /N3sDQO9LjwFypL81BFALJmDECtmzdMpo2/AzzpBERPXh1HUEHnMOG7iu2n9O8VgUy
         zfIOXnW3c8kBFWjsNfmfMHYzTqavbwm4o7Lw5US9wnLwfAOoLyhc3RMPt6hKOJz+ZZ
         abYTh+CIdGkouoYhp+nGMrzVlwNkQvDnnnMs8mAZDnc4oZfbxUPA+bcoOoUuhYpcqe
         5dMZdRNJKOFZg==
Date:   Tue, 15 Nov 2022 11:58:38 +0000
From:   Will Deacon <will@kernel.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Feng Zhou <zhoufeng.zf@bytedance.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Chen Zhou <dingguo.cz@antgroup.com>,
        John Donnelly <John.p.donnelly@oracle.com>,
        Dave Kleikamp <dave.kleikamp@oracle.com>
Subject: Re: [PATCH v3 0/2] arm64: kdump: Function supplement and performance
 optimization
Message-ID: <20221115115837.GE32523@willie-the-truck>
References: <20220711090319.1604-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711090319.1604-1-thunder.leizhen@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 11, 2022 at 05:03:17PM +0800, Zhen Lei wrote:
> v2 --> v3:
> 1. Discard patch 3 in v2, a cleanup patch.

Do you plan to respin this series, addressing the various comments on v3?

Will
