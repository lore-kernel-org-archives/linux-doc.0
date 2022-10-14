Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66DEC4332F
	for <linux-doc@archiver.kernel.org>; Fri, 14 Oct 2022 13:44:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbiJNNo1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Oct 2022 09:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbiJNNoY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Oct 2022 09:44:24 -0400
Received: from out30-57.freemail.mail.aliyun.com (out30-57.freemail.mail.aliyun.com [115.124.30.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1C11CFC73;
        Fri, 14 Oct 2022 06:44:18 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0VS88kYV_1665755050;
Received: from 30.39.198.88(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VS88kYV_1665755050)
          by smtp.aliyun-inc.com;
          Fri, 14 Oct 2022 21:44:12 +0800
Message-ID: <cda77a7f-470d-21eb-f5ec-dac004b32bc5@linux.alibaba.com>
Date:   Fri, 14 Oct 2022 21:44:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] Documentation: kdump: describe VMCOREINFO export for
 RISCV64
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Conor Dooley <conor@kernel.org>
Cc:     paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, anup@brainfault.org, heiko@sntech.de,
        guoren@kernel.org, mick@ics.forth.gr,
        alexandre.ghiti@canonical.com, bhe@redhat.com, vgoyal@redhat.com,
        dyoung@redhat.com, corbet@lwn.net, Conor.Dooley@microchip.com,
        kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        crash-utility@redhat.com, heinrich.schuchardt@canonical.com,
        k-hagio-ab@nec.com, hschauhan@nulltrace.org, yixun.lan@gmail.com
References: <20221014074810.4471-1-xianting.tian@linux.alibaba.com>
 <20221014074810.4471-3-xianting.tian@linux.alibaba.com>
 <Y0ldrJ91ac0um3++@debian.me> <Y0lfuixXue4k4poY@spud>
 <7353e949-17cc-ed8e-7e98-b3f3e0840623@gmail.com>
From:   Xianting Tian <xianting.tian@linux.alibaba.com>
In-Reply-To: <7353e949-17cc-ed8e-7e98-b3f3e0840623@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/10/14 下午9:23, Bagas Sanjaya 写道:
> On 10/14/22 20:10, Conor Dooley wrote:
>> Without whitespace highlighting, your change threw me for a sec.. But
>> yeah, having the overline is inconsistent with other headings in the
>> doc.
>>
>> What I wanted to ask about was the linelength as I don't know anything
>> about rst. Is it possible to avoid having the ~150 character line or is
>> that a necessary evil?
>>
> I think the section describes correct range exports; however since there
> are many such ranges with distinct purposes, it is better to split the
> section into multiple sections describing each range.
>
> If we go without splitting, the 150-character header is necessary (I don't
> know how to split the header text line without trigger any warnings).

thanks, I send V2 patch, please help review.

https://lkml.org/lkml/2022/10/14/447

>
> Thanks.
>
