Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DAFC19F28
	for <linux-doc@archiver.kernel.org>; Wed,  3 Aug 2022 08:01:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbiHCIBH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Aug 2022 04:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiHCIBG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Aug 2022 04:01:06 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9A7DF0C
        for <linux-doc@vger.kernel.org>; Wed,  3 Aug 2022 01:01:02 -0700 (PDT)
Received: from localhost (unknown [213.194.152.135])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5AADB6601AC9;
        Wed,  3 Aug 2022 09:01:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1659513660;
        bh=D3WfteFQraQ9dA2WneDzidiQ8srag39d4teEo4npJL4=;
        h=From:To:Cc:Subject:References:In-reply-to:Date:From;
        b=BmF1aN/3nnzXpqgWVLgVnNKa0S05JoVstEXzwX/K8Of2W6893kNhO54C4BCqhGWke
         HVr/Ka5TRqbHFoNZtai1FB5eeVHf2Zp36sGEBIryGh8ZV5FboE7SKscV7vbUMw0N6c
         86eAkIQ3YDU9Gl0BwOcSy3USQBBqw7QchF8cLp5w/UmYMp8AsZbVtzeaVzwyZJOSsc
         JmV2vQT4D93MY5OTABkcAlxryPnDJhnfdxJTkoRbn/X38HylHExbSui1xKH1yPiM2t
         d/dyleGHqO2F1Pn70BQXOs1D0TuwXT3jEeu4jFyBpJZF+Z9EovDqg3Bq865baZbA1f
         Ya8bv1z6+Jr3w==
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, jasowang@redhat.com,
        kernel@collabora.com, Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] docs: driver-api: virtio: virtio on Linux
References: <20220802124222.3563378-1-ricardo.canuelo@collabora.com> <20220802090507-mutt-send-email-mst@kernel.org>
In-reply-to: <20220802090507-mutt-send-email-mst@kernel.org>
Date:   Wed, 03 Aug 2022 10:00:56 +0200
Message-ID: <87r11xrc1z.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Michael, thanks for reviewing the patch. Comments below:

On mi=C3=A9, ago 03 2022 at 02:54:28, "Michael S. Tsirkin" <mst@redhat.com>=
 wrote:
> So I'm okay with a high level overview up to this point.
> Below starts getting into details and they are not up to date
> and I don't think we want to maintain a copy here.

I agree I might have gone too much into code details, but I assumed
those were pretty much the elementary and "fixed" parts of the
subsystem, with a slow rate of changes in the fundamental stuff.

If the code is prone to future changes or is outdated it's true we don't
want it mentioned here but leaving this doc as a short intro to virtio
won't add much to what's already available in other resources.

The intention was mostly to illustrate the basic virtio concepts with
the concrete implementation in the kernel. I'll see if I can find a way
to do that without relying so much on specific code fragments.


> the part above is duplicating too much from the spec I think.

Ack.

> The reference to BARs seems bogus.

Got it.

> why gitlab? why not https://git.qemu.org/ then?

According to the QEMU website the official repo lives in gitlab.

> 1.2 is out.

Thanks, I didn't see it when searching for the spec.

Cheers,
Ricardo
