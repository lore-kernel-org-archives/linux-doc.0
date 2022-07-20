Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974B5C43334
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jul 2022 21:15:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbiGTVPg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Jul 2022 17:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiGTVPf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jul 2022 17:15:35 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DACF2B86F
        for <linux-doc@vger.kernel.org>; Wed, 20 Jul 2022 14:15:34 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5210D2B0;
        Wed, 20 Jul 2022 21:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5210D2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1658351734; bh=tm8fSoWgbMhDcMDmYi9tIeui+5KiRvM++zqHvZaDPFU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=TWcLXZRGc/dauJ0O8GzOsW39mfPm/mXTino5XTDlDXF2CV3gKYGAA7OJViVCZa929
         GmHzTLGOEC+BmpNMrC5uLYNsNWLS4L8Wr9xkk1PXV2aBw2yd882O2U0Mmhr8hEZEGt
         HV6xwFR4CNPIwdaWdQzFNWMdx7xXdi0LFFYIrcpfpAPBP/IM+5MZuJcAdgteNyJp/F
         +O8R9oY8t616PbsyM3ucOd+bkoKigeGxong+UPo4G2O3eEvX8Chh4/LqKhUubVeRV5
         tNA/nmliXbx/lMpO88T7zm6KSUVX2IdKMv8XPQPWP4EmhVIuAQXFWwcRADfEOTT30W
         VcI2yOrR2lL+w==
From:   Jonathan Corbet <corbet@lwn.net>
To:     "guomengqi (A)" <guomengqi3@huawei.com>
Cc:     xuqiang36@huawei.com, zhouguanghui1@huawei.com,
        Tang Yizhou <yizhou.tang@shopee.com>,
        Alex Shi <alexs@kernel.org>,
        YanTeng Si <siyanteng@loongson.cn>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH -next v2] docs/zh_CN: add mm transhuge translation
In-Reply-To: <8b7d3e9e-342c-6292-0d66-293531abb18b@huawei.com>
References: <20220628133742.91966-1-guomengqi3@huawei.com>
 <20220705141121.73711-1-guomengqi3@huawei.com>
 <c439e285-a395-16a0-4527-3f868c494440@loongson.cn>
 <8b7d3e9e-342c-6292-0d66-293531abb18b@huawei.com>
Date:   Wed, 20 Jul 2022 15:15:33 -0600
Message-ID: <87czdzo58q.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"guomengqi (A)" <guomengqi3@huawei.com> writes:

> Hi Jon,
>
> Is this patch applied? Is there anything else to be done?

It is applied (now).  However, it took some work on my side.

This patch puts the file into .../zh_CN/mm/, but that directory doesn't
exist in docs-next - that is a change that is sitting in the -mm tree
and won't make it into docs-next until after the merge window.
Interestingly, "git am" somehow found vm/index.html and applied the
relevant change there, but transhuge.rst ended up in the wrong place.

It wouldn't be hard to move it over, but that would introduce another
conflict against -mm.  So the right thing to do, I think, is to hold it
until after the merge window.

In the future, *please* make your changes against docs-next if you're
going to send them to me.

Thanks,

jon
