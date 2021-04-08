Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC9AC433ED
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 17:38:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E7C4610F8
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 17:38:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232658AbhDHRi5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Apr 2021 13:38:57 -0400
Received: from ms.lwn.net ([45.79.88.28]:56972 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232202AbhDHRi5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Apr 2021 13:38:57 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D7D7E52BA;
        Thu,  8 Apr 2021 17:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D7D7E52BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1617903526; bh=79ycmCiWqP8WlQMaUXP3Qz+ghtKeLejU2i2G9Tz2xRE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=KVFklNwq7VpJLQnLrJwOpBU3ZBm3nT9HG42IZTCCEbClcdfxfHM1xtWULcs6GC2zR
         uA6B44HL1mbY/lpgsnL+S896tFyimkU3C3GlyzRuANf8i7rLKyzbvv6NPp27iQtrbZ
         2mex3gLJXA8810G/2Y73Rvc4dxDsumoOSKxgZRoOmQCr+rbRTjkIz5M3WcNyfyf3t5
         fnX/piJC2iQY2pZxe91ue/+RVuGHyMaWHYDVvLQVo8AcLND2xDO3qk1YpEDeZpiiEs
         luimY0cyluC15EjYrO9BEhTuVRIiI1Bz6VmUXPHfJIz4Y3Y8JH15cshEawSIQKKaUz
         HAhQlER5b17+Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     =?utf-8?Q?St=C3=A9phane?= Blondon <stephane.blondon@gmail.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: Minor spellcheck in spi documentation
In-Reply-To: <CAOy+up7EdTf4ouh5onVy_ZzXFWGBEP+P6CPqY-=E+1UFwCeq8w@mail.gmail.com>
References: <CAOy+up7EdTf4ouh5onVy_ZzXFWGBEP+P6CPqY-=E+1UFwCeq8w@mail.gmail.com>
Date:   Thu, 08 Apr 2021 11:38:45 -0600
Message-ID: <87a6q8znfe.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

St=C3=A9phane Blondon <stephane.blondon@gmail.com> writes:

> Hello,
>
> I attached a patch fixing the wrong spelling ('ciruit' to 'circuit').
>
> I temporarily subscribed to the linux-doc mailing list if replies are nee=
ded.

People will always copy you on replies, so you don't have to subscribe
to any specific list.

I've applied this but ... please look at our documentation on submitting
patches for any future changes.  In particular, the patch should not be
sent as an attachment, that makes extra work on the receiving side.

Thanks,

jon
