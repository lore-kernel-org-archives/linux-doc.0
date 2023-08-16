Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA69C001B0
	for <linux-doc@archiver.kernel.org>; Wed, 16 Aug 2023 02:49:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241356AbjHPCtR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Aug 2023 22:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241364AbjHPCtF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Aug 2023 22:49:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3058212B
        for <linux-doc@vger.kernel.org>; Tue, 15 Aug 2023 19:49:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3A0E76360D
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 02:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9FAC433C7;
        Wed, 16 Aug 2023 02:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692154143;
        bh=qozDx4yh9HzHvylBjtuByJEJLEIBEect//jNiGGxz2o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EmK9Pe9lEdckeDcR2yMbK8nW64pC5mh1xQRUdHZHqZt1HfQkyIEa5o1/zIcNlnGMm
         tALfDHHZuyuAoTjGv8mxGbUpJcLmcyKEwN4Ii9EmE795/LqfFvSlv7ajrBBPSEFEXm
         T7JojkGNoDRlpxrNbW7DqPHKbd5WDFHa+Aomj0iR6zboxpN2Xdale/lKikBtMQS2JW
         y1dNoqP/nXnjaPc1DhohiXMTsn3VrCOAzsAHveddOnMlk+V2CYWAl+SuNGHf43Yt2f
         7ZsG+EXXa75bhnBv4PLvtKpeg07heUPxVjxDVGrAzBN0DE9owWTHEosSje9FTKmjA+
         xfcatpUdj89Nw==
Date:   Tue, 15 Aug 2023 19:49:02 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Donald Hunter <donald.hunter@gmail.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        donald.hunter@redhat.com
Subject: Re: [PATCH net-next v2 02/10] doc/netlink: Document the
 genetlink-legacy schema extensions
Message-ID: <20230815194902.6ce9ae12@kernel.org>
In-Reply-To: <20230815194254.89570-3-donald.hunter@gmail.com>
References: <20230815194254.89570-1-donald.hunter@gmail.com>
        <20230815194254.89570-3-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 15 Aug 2023 20:42:46 +0100 Donald Hunter wrote:
> Add description of genetlink-legacy specific attributes to the ynl spec
> documentation.
> 
> Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
> ---
>  Documentation/userspace-api/netlink/specs.rst | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)

Should we merge this with genetlink-legacy.rst?

> diff --git a/Documentation/userspace-api/netlink/specs.rst b/Documentation/userspace-api/netlink/specs.rst
> index 2e4acde890b7..dde70f9674d4 100644
> --- a/Documentation/userspace-api/netlink/specs.rst
> +++ b/Documentation/userspace-api/netlink/specs.rst
> @@ -443,3 +443,50 @@ nest
>  
>  Attribute containing other (nested) attributes.
>  ``nested-attributes`` specifies which attribute set is used inside.
> +
> +genetlink-legacy
> +================
> +
> +The genetlink-legacy schema extends the genetlink schema with some additional
> +properties that are needed to support legacy genetlink families.
> +
> +Globals
> +-------
> +
> + - ``kernel-policy`` - Specify whether the kernel input policy is ``global``,
> +   ``per-op`` or ``split``.

Maybe a few more words:

 Specify whether the kernel input policy is ``global`` i.e. the same for
 all operation of the family, defined for each operation individually 
 (``per-op``), or separately for each operation and operation type
 (do vs dump) - ``split``.

> +   ``per-op`` or ``split``.

> +Struct definitions
> +------------------
> +
> +There is a new type of definition called ``struct`` which is used for declaring
> +the C struct format of fixed headers and binary attributes.
> +
> +members
> +~~~~~~~
> +
> + - ``name`` - The attribute name of the struct member
> + - ``type`` - One of the scalar types ``u8``, ``u16``, ``u32``, ``u64``, ``s8``,
> +   ``s16``, ``s32``, ``s64``, ``string`` or ``binary``.
> + - ``byte-order`` - ``big-endian`` or ``little-endian``
> + - ``doc``, ``enum``, ``enum-as-flags``, ``display-hint`` - Same as for
> +   attribute definitions.

Hm, genetlink-legacy.rst has this:

https://docs.kernel.org/next/userspace-api/netlink/genetlink-legacy.html#structures

But the larger section is called "Other quirks (todo)"
I guess you have tackled most of the items in this section
so we shouldn't call it "todo" ?
