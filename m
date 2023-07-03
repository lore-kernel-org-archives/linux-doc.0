Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C68EB64DC
	for <linux-doc@archiver.kernel.org>; Mon,  3 Jul 2023 14:39:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbjGCOjj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Jul 2023 10:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbjGCOji (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jul 2023 10:39:38 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242C7E60
        for <linux-doc@vger.kernel.org>; Mon,  3 Jul 2023 07:39:37 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A2DA5380;
        Mon,  3 Jul 2023 14:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A2DA5380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1688395176; bh=DtNI+JE74CbZvpRbJ9rXqP0HFi5L3mJkLSbH6Om+UXc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Eoyg2prhr0kmlLXhbImZGRNv0Y9WpoiXhNIsCxcBhh2LPR6YBakm55D69QaRCsr1B
         t14dU8cXVGTYD0gs7J66/ANLJyjYcuiZ7ce9IJVuzYMUW7M1VYZ2Rt4teP3n1Ktk+l
         1NC1CQJeDlkIVZXWA3aIeQnX5qgFHJg5XWLVwHja6DG7Q+dMyTuZros8kdeFZ587Kw
         88L2vv5RjJ5A7gdWPgbsvjkOwVfYk0jgu4hQ6EwBJ0zyDz6JaelYYSDopRDQoZvg9U
         1amXFxNdX/eaDEFT17q0bMtSNmEXDNzE8f2Y/1K4bdC0qhyn9XJyFisdp+2MmImb0P
         U6DMZ1CUnM8cQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Changyuan Lyu <changyuanl@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, linux-doc@vger.kernel.org,
        trivial@kernel.org, Changyuan Lyu <changyuanl@google.com>
Subject: Re: [PATCH] Documentation: KVM: SEV: add a missing backtick
In-Reply-To: <20230624165858.21777-1-changyuanl@google.com>
References: <20230624165858.21777-1-changyuanl@google.com>
Date:   Mon, 03 Jul 2023 08:39:35 -0600
Message-ID: <87a5wdjbyw.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changyuan Lyu <changyuanl@google.com> writes:

> ``ENOTTY` -> ``ENOTTY``.
>
> Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> ---
>  Documentation/virt/kvm/x86/amd-memory-encryption.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> index 487b6328b3e7..995780088eb2 100644
> --- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> +++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> @@ -57,7 +57,7 @@ information, see the SEV Key Management spec [api-spec]_
>  
>  The main ioctl to access SEV is KVM_MEMORY_ENCRYPT_OP.  If the argument
>  to KVM_MEMORY_ENCRYPT_OP is NULL, the ioctl returns 0 if SEV is enabled
> -and ``ENOTTY` if it is disabled (on some older versions of Linux,
> +and ``ENOTTY`` if it is disabled (on some older versions of Linux,
>  the ioctl runs normally even with a NULL argument, and therefore will

Applied, thanks.

jon
