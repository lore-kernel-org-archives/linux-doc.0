Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4330C433FE
	for <linux-doc@archiver.kernel.org>; Mon, 21 Nov 2022 21:42:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbiKUVm0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Nov 2022 16:42:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231994AbiKUVmC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Nov 2022 16:42:02 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 453C6DB845
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 13:41:54 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A3A8B377;
        Mon, 21 Nov 2022 21:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A3A8B377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1669066913; bh=L31rqfsRwDOZSz+AgtzsoDa8WjVPdfQZ+R8ah/MoVnw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Kc3mKRK17MJTz04/m6S/Yq1b+xIhNVWSbxmvH19M1fCvsCroUgUF5QFdepQ4qNgTd
         dos81jFMMMIEw4RdogP/WLfSVFKIgC54ej+t5jVQnAV3jJZtqgYDXJ0/5agvIbIh5+
         cISIjmAd9v5x6Go6MGgwp7bBduWBbxN3gsH4gfPk8Zu4em6a/Ypm3Fz2ujl2CXl6rP
         /CIjG5yMKFuco4hTidDKmWtAlCtOiQN3sOGIniNxadsXVrgH36/9Q92IQzpJoLCa7M
         lHFYst91aols4ppfDjp/wLcdvxljTExfzMI822AZ7KX0aCEhObgD560S/BtL71ZT/j
         KQ33nEXHqpPhg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>
Cc:     =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: riscv: Document the sv57 VM layout
In-Reply-To: <20221118171556.1612190-1-bjorn@kernel.org>
References: <20221118171556.1612190-1-bjorn@kernel.org>
Date:   Mon, 21 Nov 2022 14:41:52 -0700
Message-ID: <87k03o7zof.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> writes:

> From: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>
>
> RISC-V has been supporting the "sv57" address translation mode for a
> while, but is has not been added to the VM layout documentation. Let
> us fix that.
>
> Signed-off-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>
> ---
> v2: * Cosmestics (Alex)
>     * Corrected kasan address (Alex)
> ---
>  Documentation/riscv/vm-layout.rst | 36 +++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)

Applied, thanks.

jon
