Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 56EC77D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 Jan 2019 18:02:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbfA3SCx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 Jan 2019 13:02:53 -0500
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:59120 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725770AbfA3SCx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Jan 2019 13:02:53 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4217F80D;
        Wed, 30 Jan 2019 10:02:53 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 935993F557;
        Wed, 30 Jan 2019 10:02:50 -0800 (PST)
Date:   Wed, 30 Jan 2019 18:02:47 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Jeremy Linton <jeremy.linton@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, stefan.wahren@i2se.com,
        Jonathan Corbet <corbet@lwn.net>, mlangsdo@redhat.com,
        linux-doc@vger.kernel.org, suzuki.poulose@arm.com,
        marc.zyngier@arm.com, catalin.marinas@arm.com,
        julien.thierry@arm.com, will.deacon@arm.com,
        linux-kernel@vger.kernel.org, steven.price@arm.com,
        ykaukab@suse.de, dave.martin@arm.com, shankerd@codeaurora.org
Subject: Re: [PATCH v4 01/12] Documentation: Document arm64 kpti control
Message-ID: <20190130180247.15ab0577@donnerap.cambridge.arm.com>
In-Reply-To: <20190125180711.1970973-2-jeremy.linton@arm.com>
References: <20190125180711.1970973-1-jeremy.linton@arm.com>
        <20190125180711.1970973-2-jeremy.linton@arm.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 25 Jan 2019 12:07:00 -0600
Jeremy Linton <jeremy.linton@arm.com> wrote:

Hi,

> For a while Arm64 has been capable of force enabling
> or disabling the kpti mitigations. Lets make sure the
> documentation reflects that.
> 
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt
> b/Documentation/admin-guide/kernel-parameters.txt index
> b799bcf67d7b..9475f02c79da 100644 ---
> a/Documentation/admin-guide/kernel-parameters.txt +++
> b/Documentation/admin-guide/kernel-parameters.txt @@ -1982,6 +1982,12
> @@ Built with CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=y,
>  			the default is off.
>  
> +	kpti=		[ARM64] Control page table isolation of
> user
> +			and kernel address spaces.
> +			Default: enabled on cores which need
> mitigation.

Would this be a good place to mention that we enable it when
CONFIG_RANDOMIZE_BASE is enabled and we have a valid kaslr_offset? I
found this somewhat surprising, also it's unrelated to the
vulnerability.

Cheers,
Andre

> +			0: force disabled
> +			1: force enabled
> +
>  	kvm.ignore_msrs=[KVM] Ignore guest accesses to unhandled
> MSRs. Default is 0 (don't ignore, but inject #GP)
>  

