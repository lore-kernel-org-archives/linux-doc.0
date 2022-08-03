Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF00C19F28
	for <linux-doc@archiver.kernel.org>; Wed,  3 Aug 2022 06:48:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237300AbiHCGsb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Aug 2022 02:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbiHCGsa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Aug 2022 02:48:30 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373EF20F4B
        for <linux-doc@vger.kernel.org>; Tue,  2 Aug 2022 23:48:29 -0700 (PDT)
Received: from localhost (unknown [213.194.152.135])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 7830E6601B14;
        Wed,  3 Aug 2022 07:48:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1659509307;
        bh=PIUJHmpgxxfrpQGGhlN2EDOjeTri6mVCxV3nWgqmn7A=;
        h=From:To:Cc:Subject:References:In-reply-to:Date:From;
        b=Gm63wnj9YeuzKEvGabOU8KtRLtvtFv7DA94v4gEY/zCa9M0Pt30Tqp93M0U2X0QTd
         ZTPKPr7jc5HyzMlPe15haHC3OqG/GJxpCNTHgMz3C75QbUHcglGN98kS17rJjUPZu9
         J81Cehv8E94WW9qQ814akIzFqSsJf5DNwxvDq7Xs78lQQxAqBTQJeyKVGo6EUGi7DD
         wxtc1nENpCqjQnHzcjTNtEbI3Et5EQYLoUBHeIq9V4EJ1tJWHPytgjBjvhZUZCl3Lb
         PcBzCORAfYcFgW/bEA/+NQPlTtYR09SLrnUAwyRtI1MSVuPQrEZjMHObVG8cHaAeoR
         Z9+UF/o93G4HA==
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com
Subject: Re: [PATCH] docs: driver-api: virtio: virtio on Linux
References: <20220802124222.3563378-1-ricardo.canuelo@collabora.com> <YuknUeDjmtgKHB0M@debian.me>
In-reply-to: <YuknUeDjmtgKHB0M@debian.me>
Date:   Wed, 03 Aug 2022 08:48:23 +0200
Message-ID: <877d3pstzc.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Bagas,

Thanks for reviewing

Bagas Sanjaya <bagasdotme@gmail.com> writes:
> I can't apply this patch on top of mainline. On what commit (and what
> tree) was it based from?

The patch applies cleanly on recent tags of linux-next (tested on
next-20220802). If this needs to be tested on a different tree/commit
let me know, as I'll have to submit a new version of it.

Cheers,
Ricardo
