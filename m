Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2106DC77B61
	for <linux-doc@archiver.kernel.org>; Mon,  1 May 2023 15:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbjEAPZx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 May 2023 11:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232430AbjEAPZw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 May 2023 11:25:52 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3350171E;
        Mon,  1 May 2023 08:25:44 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6273044A;
        Mon,  1 May 2023 15:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6273044A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1682954744; bh=qwrk/iCFWd7ftOXBVRMr0yxgfCZkKwbi0RzzkBvHVIA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Z3L5EkF8jIFDKTIxRbei/aDiWMmZojPgRLsawzlOq5N8sSraEBTrQ7wYNGn4hIFxQ
         CEqssQmReCn/X8DkCgZd7TJ/xWVwf8LPM2WbftqLB7fpv4LFq6Tm8A8PDubcZddr3E
         FGzawb5aBQPVSY1neqSAHu4uIA/Yxw34jLExeTYpBKfXFMB5U4AyGfqCnjDUlxomF4
         g2nfNyhaobi3t0mX9Z8YNmjBnNqsk3Wmd8OnhpxA9D3MIPzLKsdEg7sQxaeG40Mg/y
         PYx9V7b8BLuW1U06QoOM75xdVUAwLiaLE3BE32R1pdHeZRTJGnU9UFsQWonr2u7ZTB
         pFx/O+vwyP5vg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Costa Shulyupin <costa.shul@redhat.com>, linux-doc@vger.kernel.org
Cc:     Costa Shulyupin <costa.shul@redhat.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: consolidate human interface subsystems
In-Reply-To: <20230501150111.274666-1-costa.shul@redhat.com>
References: <20230501150111.274666-1-costa.shul@redhat.com>
Date:   Mon, 01 May 2023 09:25:43 -0600
Message-ID: <87h6sw9iq0.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Costa Shulyupin <costa.shul@redhat.com> writes:

> to make the page more organized as requested
>
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/subsystem-apis.rst | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem-a=
pis.rst
> index b51f38527e14..287799ee2419 100644
> --- a/Documentation/subsystem-apis.rst
> +++ b/Documentation/subsystem-apis.rst
> @@ -10,6 +10,18 @@ is taken directly from the kernel source, with supplem=
ental material added
>  as needed (or at least as we managed to add it =E2=80=94 probably *not* =
all that is
>  needed).
>=20=20
> +Human interaces

This is the kind of thing that suggests that not a lot of attention is
being paid to the work you are doing.  This might be a worthwhile
change, but let's not introduce obvious typos while we're at it, please?

Thanks,

jon
