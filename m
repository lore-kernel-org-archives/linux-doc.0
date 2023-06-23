Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60A8C0015E
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jun 2023 15:55:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbjFWPzD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jun 2023 11:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232477AbjFWPyr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jun 2023 11:54:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D222130
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 08:54:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 103AE61A7B
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 15:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D63AC433C0;
        Fri, 23 Jun 2023 15:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687535685;
        bh=IguwuxJ0dsb09c8e2nfsOZK+aHh+L8Vs8LIB77VmCck=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=r0p6EgVbWCveREGvt9V3AtJ1nuw3j9mI09Kb/L6jGVgYXf5/4H5LTw9oV/nOBlOy9
         t+2zaIRayVOJZkbUThmaQ9A03qSuzgHrRX6wxhUuwxzqyL2ik4QqrnHMAh4t4+Qykf
         mbBMehlFOFPqrMB88XtCJ5TUpYzrmoS0A15s+9X5CrtVooiv3f0Pd/uG5qWd8g6tQ7
         +DBLGcSn9H2HpGumHP+cD/GvUl1Y/kMdPyx0IHr9Myg6ikTXPe4kwFbbU+c05l+aWF
         jpllcGDVVhNfnQtLTDkGozQJgZAUuaav1RnWONXpFmcnObYVCSaC2Y5Xm7X4gSCYA6
         iGe4GMGHPJ1vA==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1qCj7T-007nae-05;
        Fri, 23 Jun 2023 16:54:43 +0100
MIME-Version: 1.0
Date:   Fri, 23 Jun 2023 16:54:42 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Quentin Perret <qperret@google.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 00/17] arm64 kernel text replication
In-Reply-To: <ZJW7kvWqLVZV4KVr@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
 <ZH2lUj0zDWFppdJI@shell.armlinux.org.uk>
 <CAMj1kXHn0oho_CZMSc5N1updfdZDq+3VAfzw8kZqzzpTSgkXew@mail.gmail.com>
 <ZJW7kvWqLVZV4KVr@shell.armlinux.org.uk>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d18208d1ae12c81edd2830ac7ca7116a@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: linux@armlinux.org.uk, ardb@kernel.org, qperret@google.com, mark.rutland@arm.com, catalin.marinas@arm.com, corbet@lwn.net, will@kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2023-06-23 16:34, Russell King (Oracle) wrote:
> On Fri, Jun 23, 2023 at 05:24:20PM +0200, Ard Biesheuvel wrote:
>> (cc Marc and Quentin)
>> 
>> On Mon, 5 Jun 2023 at 11:05, Russell King (Oracle)
>> <linux@armlinux.org.uk> wrote:
>> >
>> > Hi,
>> >
>> > Are there any comments on this?
>> >
>> 
>> Hi Russell,
>> 
>> I think the proposed approach is sound, but it is rather intrusive, as
>> you've pointed out already (wrt KASLR and KASAN etc). And once my LPA2
>> work gets merged (which uses root level -1 when booted on LPA2 capable
>> hardware, and level 0 otherwise), we'll have yet another combination
>> that is either fully incompatible, or cumbersome to support at the
>> very least.
>> 
>> I wonder if it would be worthwhile to explore an alternative approach,
>> using pKVM and the host stage2:
>> 
>> - all stage1 kernel mappings remain as they are, and the kernel code
>> running at EL1 has no awareness of the replication beyond being
>> involved in allocating the memory;
>> - host is booted in protected KVM mode, which means that the host
>> kernel executes under a stage 2 mapping;
>> - each NUMA node has its own set of stage 2 page tables, and maps the
>> kernel's code/rodata IPA range to a NUMA local PA range
>> - the kernel's code and rodata are mapped read-only in the primary
>> stage-2 mapping so updates trap to EL2, permitting the hypervisor to
>> replicate those update to all clones.
>> 
>> Note that pKVM retains the capabilities of ordinary KVM, so as long as
>> you boot at EL2, the only downside compared to your approach would be
>> the increased TLB footprint due to the stage 2 mappings for the host
>> kernel.
>> 
>> Marc, Quentin, Will: any thoughts?
> 
> Thanks for taking a look.
> 
> That sounds great, but my initial question would be whether, with such 
> a
> setup, one could then run VMs under such a kernel without hardware that
> supports nested virtualisation? I suspect the answer would be no.

The answer is yes. All you need to do is to switch between the host
and guest stage-2s in the hypervisor, which is what KVM running in
protected mode does.

         M.

-- 
Jazz is not dead. It just smells funny...
