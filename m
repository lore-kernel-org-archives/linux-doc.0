Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B56157D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Nov 2019 22:55:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfKNWzw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Nov 2019 17:55:52 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:41904 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbfKNWzw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Nov 2019 17:55:52 -0500
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1iVO1h-0004jz-Ko; Thu, 14 Nov 2019 23:55:45 +0100
Date:   Thu, 14 Nov 2019 23:55:44 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Anthony Steinhauser <asteinhauser@google.com>
cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Jiri Kosina <jkosina@suse.cz>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] Mention PowerPC in the L1TF documentation.
In-Reply-To: <20191114221634.258799-1-asteinhauser@google.com>
Message-ID: <alpine.DEB.2.21.1911142334250.29616@nanos.tec.linutronix.de>
References: <20191114221634.258799-1-asteinhauser@google.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Anthony,

On Thu, 14 Nov 2019, asteinhauser@google.com wrote:

> From: Anthony Steinhauser <asteinhauser@google.com>
> 
> There is a false negative that L1TF is Intel specific while it affects
> also PowerPC:
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=8e6b6da91ac9b9ec5a925b6cb13f287a54bd547d

Please use the regular

   commit 12-char-sha ("powerpc: .......")

notation. These links are horrible.

> Another false negative is that the kernel is unconditionally protected
> against L1TF attacks from userspace. That's true only on x86 but not on
> PowerPC where you can turn the protection off by nopti.

Missing newline between body and SOB

> Signed-off-by: Anthony Steinhauser <asteinhauser@google.com>
> ---
>  Documentation/admin-guide/hw-vuln/l1tf.rst | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/admin-guide/hw-vuln/l1tf.rst b/Documentation/admin-guide/hw-vuln/l1tf.rst
> index f83212fae4d5..243e494b337a 100644
> --- a/Documentation/admin-guide/hw-vuln/l1tf.rst
> +++ b/Documentation/admin-guide/hw-vuln/l1tf.rst
> @@ -9,10 +9,11 @@ for the access, has the Present bit cleared or other reserved bits set.
>  Affected processors
>  -------------------
>  
> -This vulnerability affects a wide range of Intel processors. The
> -vulnerability is not present on:
> +This vulnerability affects a wide range of Intel and PowerPC processors.
> +The vulnerability is not present on:
>  
> -   - Processors from AMD, Centaur and other non Intel vendors
> +   - Processors from AMD, Centaur and other non Intel vendors except for
> +     PowerPC

No. This needs restructuring. The non Intel vendor means vendors which
produce x86 machines (not really clear TBH), but adding these two PPC parts
above and here does not make it any better.
  
>     - Older processor models, where the CPU family is < 6

Also this suggest that _ALL_ PowerPC processors are affected as there is
no exception list.

So I suggest to structure this like this:

Affected processors
-------------------

 1) Intel processors

    Move the existing list here

 2) PowerPC processors

    Add some meat

Whether a processor is affected or not...

> @@ -125,7 +126,7 @@ mitigations are active. The relevant sysfs file is:
>  
>  /sys/devices/system/cpu/vulnerabilities/l1tf
>  
> -The possible values in this file are:
> +The possible values in this file on x86 are:

That commit you referenced added the sysfs output for powerpc. So that
should be documented properly here as well, right?

>    ===========================   ===============================
>    'Not affected'		The processor is not vulnerable
> @@ -158,8 +159,10 @@ The resulting grade of protection is discussed in the following sections.
>  Host mitigation mechanism
>  -------------------------
>  
> -The kernel is unconditionally protected against L1TF attacks from malicious
> -user space running on the host.
> +On x86 the kernel is unconditionally protected against L1TF attacks from
> +malicious user space running on the host. On PowerPC the kernel is
> +protected by flushing the L1D cache on each transition from kernel to
> +userspace unless the 'nopti' boot argument turns this mitigation off.

Please make this clearly visually separated. Just glueing this together is
hard to read.

What about the l1tf boot param? Is it x86 only? If so, then this wants to
be added to the the documentation as well.

What about the guest to host issue on PPC? Not affected or same mitigation
or what?

We really spent a lot of time to write understandable and useful
documentation. Just sprinkling a few powerpc'isms into it is really not
cutting it.

This needs proper structuring so that it's obvious for the intended
audience (administrators, users) which part is applicable to which
architecture or to both. 

Thanks,

	tglx
