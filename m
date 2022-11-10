Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097EAC433FE
	for <linux-doc@archiver.kernel.org>; Thu, 10 Nov 2022 12:40:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbiKJMj7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Nov 2022 07:39:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKJMj6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Nov 2022 07:39:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23566BDDD
        for <linux-doc@vger.kernel.org>; Thu, 10 Nov 2022 04:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668083939;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IaA03jOVzd31zgKd7oHCTW0S56r7zJC93B/TpVDsAp0=;
        b=cXBv7YF94fq+3E60H5gsJ2E3H99KWh0k781xf1nLc3mse9ysq5KwQIFh8s6LPJoL9aXnwQ
        F7+EexmLKgjMkoZ0pMdPAELrm142R4wDSiuLZjVWBuHvFSVXmjijJPCHspcEcBtGu5a4Se
        GNp5WBGwqNItGSdLAxBPYZaVpn5thBM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-527-2_WQrcx3PRaEFSqVuA8_Kg-1; Thu, 10 Nov 2022 07:38:58 -0500
X-MC-Unique: 2_WQrcx3PRaEFSqVuA8_Kg-1
Received: by mail-ej1-f71.google.com with SMTP id nb1-20020a1709071c8100b007ae4083d6f5so1124155ejc.15
        for <linux-doc@vger.kernel.org>; Thu, 10 Nov 2022 04:38:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaA03jOVzd31zgKd7oHCTW0S56r7zJC93B/TpVDsAp0=;
        b=bwvzGHvAHk4IDEHAND9vXzkmM+S2uJnWwYDvBmSPdw/YfXl85np6wwf3XgdMZebLno
         noNP03cHxqTVu7JIOeGalBsCWw23VV4scQ/IHCdlpnoJ/IYA4Ncih90CejitTjgI8KTk
         Rvhxxy26WkwuLwZwDap3eMzZy+h/1Elry/dx9V2iMdFM19jUHR4bPXDaRRndxdnCdLUP
         zcdi7tKmHtQ/K7tgdsuXvjwyjCWTtsSxqSEBU3pom9Zgzuhs4WXb0A9nRtpbUFdlzPaQ
         xH9kt4vcEApDQ/GNvIrAEUoGclxsDJ9HaDvsjbq/Y87PQN99klyZASuJT92feZSLILyQ
         3UzA==
X-Gm-Message-State: ACrzQf0D2EVm0Lv/J0i9pnCLX9grJ2wzIxeIB6KkfEc5f9qXM5iDoDhS
        5O1D+KeLeq2ZGNpwESh9fsOeZ2ML/tavn8Jpg+h6roNm+Nx9QZqVJLzdlqsCHgJBgxvdDGFqlLP
        WpKJHR2JZF3ryCIqbbVK+
X-Received: by 2002:a17:906:cc48:b0:7a8:4a3b:11f7 with SMTP id mm8-20020a170906cc4800b007a84a3b11f7mr60834298ejb.388.1668083936549;
        Thu, 10 Nov 2022 04:38:56 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5wj+sHnBlbkfOl9wABMq59Dy+pHBeFGF3Sqg5hr6qA4gRkqeQ/XoGakBpfsaC+QSpM+8JWyw==
X-Received: by 2002:a17:906:cc48:b0:7a8:4a3b:11f7 with SMTP id mm8-20020a170906cc4800b007a84a3b11f7mr60834253ejb.388.1668083935084;
        Thu, 10 Nov 2022 04:38:55 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id kv3-20020a17090778c300b0077a11b79b9bsm7197104ejc.133.2022.11.10.04.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 04:38:54 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 1C4267826A6; Thu, 10 Nov 2022 13:38:54 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     mtahhan@redhat.com, bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        yhs@meta.com, Maryam Tahhan <mtahhan@redhat.com>
Subject: Re: [PATCH bpf-next v7 1/1] doc: DEVMAPs and XDP_REDIRECT
In-Reply-To: <20221110102950.2633685-2-mtahhan@redhat.com>
References: <20221110102950.2633685-1-mtahhan@redhat.com>
 <20221110102950.2633685-2-mtahhan@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 10 Nov 2022 13:38:54 +0100
Message-ID: <87fseryof5.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

mtahhan@redhat.com writes:

> From: Maryam Tahhan <mtahhan@redhat.com>
>
> Add documentation for BPF_MAP_TYPE_DEVMAP and
> BPF_MAP_TYPE_DEVMAP_HASH including kernel version
> introduced, usage and examples.
>
> Add documentation that describes XDP_REDIRECT.
>
> Signed-off-by: Maryam Tahhan <mtahhan@redhat.com>

Just re-read this, and I think it's much improved over previous versions
- nice work!

With just one nit below, feel free to re-add my:

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

[...]

> +With ``BPF_F_BROADCAST`` the packet will be broadcast to all the interfa=
ces
> +in the map, with ``BPF_F_EXCLUDE_INGRESS`` the ingress interface will be=
 excluded
> +from the broadcast.
> +
> +.. note::
> +    - The key is ignored if BPF_F_BROADCAST is set.
> +    - Multicast can also be achieved using multiple DEVMAPs.

That last bullet was a bit confusing on a first read. Maybe change it
to:

- The broadcast feature can also be used to implement multicast
  forwarding: simply create multiple DEVMAPs, each one corresponding to
  a single multicast group.



-Toke

