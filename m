Return-Path: <SRS0=vG9z=DM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C05C4363A
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 17:09:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13E3520796
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 17:09:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgJERJp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Oct 2020 13:09:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:39844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726615AbgJERJp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 5 Oct 2020 13:09:45 -0400
Received: from gaia (unknown [95.149.105.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3241E2078E;
        Mon,  5 Oct 2020 17:09:41 +0000 (UTC)
Date:   Mon, 5 Oct 2020 18:09:38 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     John Donnelly <john.p.donnelly@oracle.com>
Cc:     Chen Zhou <chenzhou10@huawei.com>, will@kernel.org,
        james.morse@arm.com, tglx@linutronix.de, mingo@redhat.com,
        dyoung@redhat.com, bhe@redhat.com, corbet@lwn.net,
        prabhakar.pkin@gmail.com, bhsharma@redhat.com, horms@verge.net.au,
        robh+dt@kernel.org, arnd@arndb.de, nsaenzjulienne@suse.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        guohanjun@huawei.com, xiexiuqi@huawei.com, huawei.libin@huawei.com,
        wangkefeng.wang@huawei.com
Subject: Re: [PATCH v12 0/9] support reserving crashkernel above 4G on arm64
 kdump
Message-ID: <20201005170937.GA14576@gaia>
References: <20200907134745.25732-1-chenzhou10@huawei.com>
 <e9b1b5db-a848-468e-6baf-2f7b4d658805@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9b1b5db-a848-468e-6baf-2f7b4d658805@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Sep 12, 2020 at 06:44:29AM -0500, John Donnelly wrote:
> On 9/7/20 8:47 AM, Chen Zhou wrote:
> > Chen Zhou (9):
> >    x86: kdump: move CRASH_ALIGN to 2M
> >    x86: kdump: make the lower bound of crash kernel reservation
> >      consistent
> >    x86: kdump: use macro CRASH_ADDR_LOW_MAX in functions
> >      reserve_crashkernel[_low]()
> >    x86: kdump: move reserve_crashkernel[_low]() into crash_core.c
> >    arm64: kdump: introduce some macroes for crash kernel reservation
> >    arm64: kdump: reimplement crashkernel=X
> >    kdump: add threshold for the required memory
> >    arm64: kdump: add memory for devices by DT property
> >      linux,usable-memory-range
> >    kdump: update Documentation about crashkernel
[...]
> I did a brief unit-test on 5.9-rc4.
> 
> Please add:
> 
> Tested-by:  John Donnelly <John.p.donnelly@oracle.com>

Thanks for testing.

> This activity is over a year old. It needs accepted.

It's getting there, hopefully in 5.11. There are some minor tweaks to
address.

-- 
Catalin
