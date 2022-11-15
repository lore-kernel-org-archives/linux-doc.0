Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A273EC4332F
	for <linux-doc@archiver.kernel.org>; Tue, 15 Nov 2022 13:30:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbiKONah (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Nov 2022 08:30:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiKONag (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Nov 2022 08:30:36 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 25A3AE88;
        Tue, 15 Nov 2022 05:30:34 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE28D13D5;
        Tue, 15 Nov 2022 05:30:40 -0800 (PST)
Received: from arm.com (C02TF0J2HF1T.cambridge.arm.com [10.1.32.164])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EE183F73B;
        Tue, 15 Nov 2022 05:30:31 -0800 (PST)
Date:   Tue, 15 Nov 2022 13:30:27 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Cc:     Will Deacon <will@kernel.org>, Dave Young <dyoung@redhat.com>,
        Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
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
Message-ID: <Y3OUc1N7Kif1pnZv@arm.com>
References: <20220711090319.1604-1-thunder.leizhen@huawei.com>
 <20221115115837.GE32523@willie-the-truck>
 <6c1751be-9957-0765-5e68-2eb78adc9a94@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c1751be-9957-0765-5e68-2eb78adc9a94@huawei.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 15, 2022 at 08:18:21PM +0800, Leizhen (ThunderTown) wrote:
> On 2022/11/15 19:58, Will Deacon wrote:
> > On Mon, Jul 11, 2022 at 05:03:17PM +0800, Zhen Lei wrote:
> >> v2 --> v3:
> >> 1. Discard patch 3 in v2, a cleanup patch.
> > 
> > Do you plan to respin this series, addressing the various comments on v3?
> 
> Yes, I haven't figured out where to make DEFAULT_CRASH_KERNEL_LOW_SIZE generic.

Do we need to? I'd just go with something like 128MB, specific to arm64,
and we can increase it later if anyone comes up with a good argument.

-- 
Catalin
