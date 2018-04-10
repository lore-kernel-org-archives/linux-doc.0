Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 63C917E89B
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Apr 2018 14:19:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753154AbeDJOS1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Apr 2018 10:18:27 -0400
Received: from foss.arm.com ([217.140.101.70]:38928 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753421AbeDJOSZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Apr 2018 10:18:25 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 555C480D;
        Tue, 10 Apr 2018 07:18:25 -0700 (PDT)
Received: from [10.1.207.55] (melchizedek.cambridge.arm.com [10.1.207.55])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D45F3F587;
        Tue, 10 Apr 2018 07:18:21 -0700 (PDT)
Subject: Re: [PATCH v11 0/4] set VSESR_EL2 by user space and support
 NOTIFY_SEI notification
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     rkrcmar@redhat.com, corbet@lwn.net, christoffer.dall@linaro.org,
        marc.zyngier@arm.com, linux@armlinux.org.uk,
        catalin.marinas@arm.com, rjw@rjwysocki.net, bp@alien8.de,
        lenb@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, linux-acpi@vger.kernel.org,
        devel@acpica.org, huangshaoyu@huawei.com, zhengxiang9@huawei.com
References: <1523309796-36423-1-git-send-email-gengdongjiu@huawei.com>
From:   James Morse <james.morse@arm.com>
Message-ID: <d94439b6-9b9a-9bd0-ddec-3bb63ede9461@arm.com>
Date:   Tue, 10 Apr 2018 15:15:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1523309796-36423-1-git-send-email-gengdongjiu@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Dongjiu Geng,

On 09/04/18 22:36, Dongjiu Geng wrote:
> 1. Detect whether KVM can set set guest SError syndrome
> 2. Support to Set VSESR_EL2 and inject SError by user space.
> 3. Support live migration to keep SError pending state and VSESR_EL2 value.
> 4. ACPI 6.1 adds support for NOTIFY_SEI as a GHES notification mechanism, so support this
>    notification in software, KVM or kernel ARCH code call handle_guest_sei() to let ACP driver
>    to handle this notification.

Please don't post code during the merge-window, will this apply to v4.17-rc1? We
can't know until its tagged.


This series is doing two separate things, please split it into two series.

But on the ACPI front: I don't see how any OS can support your NOTIFY_SEI when
firmware is ignoring the normal world's PSTATE.A.

The latest lobe of that discussion was on the list here:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1611496.html


As it is, we would need to spot SError being delivered while SError is masked,
spray nasty messages about firmware being horrifically buggy, then panic(). For
a corrected error, this looks bad, but its preferable to letting firmware
silently overwrite the exception registers, causing linux to spin through the
vectors 'eret' with all exceptions masked.
I still think its best to wait for firmware that does the right thing.


Thanks,

James
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
