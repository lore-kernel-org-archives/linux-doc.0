Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2006A7D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Nov 2018 16:49:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387833AbeKPC6J convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Nov 2018 21:58:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:37450 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726534AbeKPC6J (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Nov 2018 21:58:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id AC246AFB4;
        Thu, 15 Nov 2018 16:49:33 +0000 (UTC)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] arm64: Make kpti command line options x86 compatible
From:   Alexander Graf <agraf@suse.de>
X-Mailer: iPhone Mail (16A404)
In-Reply-To: <20181115154738.GB2062@brain-police>
Date:   Thu, 15 Nov 2018 17:49:31 +0100
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Brown <rbrown@suse.de>,
        Matthias Brugger <mbrugger@suse.com>, yousaf.kaukab@suse.com
Content-Transfer-Encoding: 8BIT
Message-Id: <215607E6-DF71-436C-92FA-AC4716777CA9@suse.de>
References: <20181113152906.55802-1-agraf@suse.de> <20181115154738.GB2062@brain-police>
To:     Will Deacon <will.deacon@arm.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> Am 15.11.2018 um 16:47 schrieb Will Deacon <will.deacon@arm.com>:
> 
>> On Tue, Nov 13, 2018 at 04:29:06PM +0100, Alexander Graf wrote:
>> I've already stumbled over 2 cases where people got confused about how to
>> disable kpti on AArch64. In both cases, they used existing x86_64 options
>> and just applied that to an AArch64 system, expecting it to work.
>> 
>> I think it makes a lot of sense to have compatible kernel command line
>> parameters whenever we can have them be compatible.
>> 
>> So this patch adds the pti= and no_pti kernel command line options, mapping
>> them into the existing kpti= command line framework. It preserves the old
>> syntax to maintain compatibility with older command lines.
>> 
>> While at it, the patch also marks the respective options as dual-arch.
>> 
>> Reported-by: Richard Brown <rbrown@suse.de>
>> Signed-off-by: Alexander Graf <agraf@suse.de>
>> 
>> ---
>> 
>> v1 -> v2:
>> 
>>  - Actually make it compile. Sorry for the sloppy v1.
>> ---
>> Documentation/admin-guide/kernel-parameters.txt |  6 +++---
>> arch/arm64/kernel/cpufeature.c                  | 20 +++++++++++++++++++-
>> 2 files changed, 22 insertions(+), 4 deletions(-)
> 
> This patch doesn't help though, right, because kpti= has already been
> included with backports etc so the ship has sailed?

Not necessarily. We can always mark this as stable and have distros pull it in. Consistency is definitely useful for everyone.

> Yeah, it's not ideal,
> but we went over this before:
> 
> http://lists.infradead.org/pipermail/linux-arm-kernel/2018-August/598395.html

Ah, I mist havd missed that. But if you already have 2 people sending very similar patches, there is probably something to it :).

> 
> The thing we really need is the sysfs interface hooking up so you can easily
> check the state of the mitigation. Still waiting for a follow-up on that ;)
> 
> http://lists.infradead.org/pipermail/linux-arm-kernel/2018-September/603412.html

That one is very much needed as well, yes.

Alex

> 
> Will

