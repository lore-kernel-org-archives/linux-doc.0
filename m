Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2499C00140
	for <linux-doc@archiver.kernel.org>; Mon,  8 Aug 2022 09:07:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238055AbiHHJHH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Aug 2022 05:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234382AbiHHJHG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Aug 2022 05:07:06 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7592812AE2
        for <linux-doc@vger.kernel.org>; Mon,  8 Aug 2022 02:07:05 -0700 (PDT)
Received: from localhost (unknown [213.194.152.135])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 33D276601C24;
        Mon,  8 Aug 2022 10:07:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1659949623;
        bh=aT4Y4PRWFqoLXt9oUFCYxJFzPEP2F0zu3T57vKLD24o=;
        h=From:To:Cc:Subject:References:In-reply-to:Date:From;
        b=nHT6gKCAsZ4JxG+TFwUKRhh/hjFC+mVec4ufjzbnSR1DnTAQLdf61/NP0tajrTQkE
         k3F7UI1dY3NJlENaiWDg03Dqb5PdJfnigKXFMAQQAImzfQTxvKNPLgB0q5pf6pO/QZ
         BC4HxJEFgc3H/80sjLeSVDkY2Fq62MQhYzIwxpJ1osunJyLAH0JIE6keSBFdfdRA6f
         rfw6pZy3rWtg9d1T325t+l5tgqZdWVPU64wPhI4gvaWaWh/2gisV0MrXuftdSL1m6P
         iIbN6GSQXZV0IMs66DGrBu2nHqFwv2nb5NERmFhKKUeqs6LXDoG2xflX/VZHE2nBwp
         A2cDpqYbdVngg==
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com, cohuck@redhat.com
Subject: Re: [PATCH v2 2/2] docs: driver-api: virtio: virtio on Linux
References: <20220804105914.3707389-1-ricardo.canuelo@collabora.com> <20220804105914.3707389-3-ricardo.canuelo@collabora.com> <Yu4fEEDMVrC7eNY1@debian.me>
In-reply-to: <Yu4fEEDMVrC7eNY1@debian.me>
Date:   Mon, 08 Aug 2022 11:06:59 +0200
Message-ID: <87o7wvqf2k.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Bagas,

Thanks for reviewing the patch, comments below:

On s=C3=A1b, ago 06 2022 at 14:58:08, Bagas Sanjaya <bagasdotme@gmail.com> =
wrote:
> Sphinx citation syntax can be used for external references, like:
>
> diff --git a/Documentation/driver-api/virtio/virtio.rst b/Documentation/d=
river-api/virtio/virtio.rst
> index 4b73c705c94c61..abd682cfd41eda 100644
> --- a/Documentation/driver-api/virtio/virtio.rst
> +++ b/Documentation/driver-api/virtio/virtio.rst
> @@ -50,8 +50,8 @@ similar to the ones used in a network device:
>  All the buffers the descriptors point to are allocated by the guest and
>  used by the host either for reading or for writing but not for both.
>=20=20
> -Refer to Chapter 2.5 ("Virtqueues") of the virtio spec [1] for the
> -reference definitions of virtqueues and to [2] for an illustrated
> +Refer to Chapter 2.5 ("Virtqueues") of the virtio spec [1]_ for the
> +reference definitions of virtqueues and to [2]_ for an illustrated
>  overview of how the host device and the guest driver communicate.
>=20=20
>  The :c:type:`vring_virtqueue` struct models a virtqueue, including the
> @@ -138,13 +138,13 @@ calling a transport-specific ``find_vqs`` method.
>  References
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20=20
> -[1] Virtio Spec v1.2:
> -https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
> +.. [1] Virtio Spec v1.2:
> +   https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
>=20=20
> -Check for later versions of the spec as well.
> +   Check for later versions of the spec as well.
>=20=20
> -[2] Virtqueues and virtio ring: How the data travels
> -https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-trave=
ls
> +.. [2] Virtqueues and virtio ring: How the data travels
> +   https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-tr=
avels
>=20=20
>  .. rubric:: Footnotes

Is that the preferred way to do it? I didn't find any guidelines about
it and the existing docs don't seem to settle on any specific
style. Personally I prefer to keep it as it is in the patch because I
like the bibliography references to look different than footnote links
([] vs superscript).

Cheers,
Ricardo
