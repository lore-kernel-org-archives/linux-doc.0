Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A7BC74A4B
	for <linux-doc@archiver.kernel.org>; Mon, 13 Mar 2023 19:19:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbjCMTTd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Mar 2023 15:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbjCMTTK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Mar 2023 15:19:10 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9865550A
        for <linux-doc@vger.kernel.org>; Mon, 13 Mar 2023 12:18:34 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id r11so1362029edd.5
        for <linux-doc@vger.kernel.org>; Mon, 13 Mar 2023 12:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1678735103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jzQHLH+czFdrkdirmcmRjGKRMXSK18PVFqhOp6lwdI=;
        b=QsWgw9kBrVnin7kxkUV6/DSRmwHT6AIQV3oz377JmlslGnbmhWZfWjagVAK9+2YH4+
         m7ovB5rqA3be1T6dKrbvP8Mtu5luoRvUq/s0qvYiuAWjrR+hVosvWeUfl+cGYlswn77O
         V8KDNFr+PJW9L7MlEA5OZ+boh/p+gLR1pnQfgX7rQ6ZpGxlznAfYYeEMNnW7WBJyZv7P
         QFdMeUY5nHjU/CKnIJd3B6YPCMolP4ooAy6tE7ttlS1avDVlPtEkb5OZngfP31JFhuBS
         d+JooudLa97bWheIQYYV7BhxGmqO3BbRXEkEICJZACdsKuBqvUqPdQTKPKP2yA/AfdjY
         sFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678735103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jzQHLH+czFdrkdirmcmRjGKRMXSK18PVFqhOp6lwdI=;
        b=a5WOJPQTI6Sg0txaapRGXKW2yjMrqbGVs2WnZOBTgJmxy5sLBTph6DV3z4I5e3jmXt
         UwGWkdnLj7GWEMweAyZcKOTQEy5Txn6B+XP+O4UyzJh1cJhrHQPB3hho1jwj6aNpJ1dg
         ncZvNFXYS0XLvgfYVm8W5eBGXoxF1GRqUiEHlM1DsEBODkCD4h4TGnH/FbtxB15Q8i0H
         4xGjt3DPnZkpGqkmktQaYMifb8hSYEsQ1v/tjSBjfrPoe9W4KxUYfJrVeNNtlK90uYDV
         e1ABIX+c13BMGijWY/AnV4bgDYiM0Kugj2vOV5BRah+hg69THmOm1T6eixU/gAqqGMbT
         v7dg==
X-Gm-Message-State: AO0yUKW53DZXZTKWGJ5gDrD65+xdsfKvgJq459H2MoBx+qfQDNpw5g5X
        aOYUwbwL/KY8JD3N8vRaOpX4bnES+aTGQrKu0vPDFw==
X-Google-Smtp-Source: AK7set9iHKb6Bre4RqW3221gyWUC4UjEXzVE8fpYLJqP1GDRCMYCrtwk4fHPFHQkY4jgZozb2tRZ1crzU/LyT0PA6zI=
X-Received: by 2002:a17:906:7803:b0:8db:b5c1:7203 with SMTP id
 u3-20020a170906780300b008dbb5c17203mr18275513ejm.11.1678735103127; Mon, 13
 Mar 2023 12:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230312190600.324573-1-joe@isovalent.com> <ZA6ecdQl3STWVAH6@debian.me>
In-Reply-To: <ZA6ecdQl3STWVAH6@debian.me>
From:   Joe Stringer <joe@isovalent.com>
Date:   Mon, 13 Mar 2023 12:18:12 -0700
Message-ID: <CADa=Ryyp10=ki5ctVTVbeUFy23uyRbi+ZgJE5JpxX3UFWvQcyw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3] docs/bpf: Add LRU internals description and graph
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     bpf@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, ast@kernel.org, corbet@lwn.net,
        martin.lau@linux.dev, maxtram95@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Mar 12, 2023 at 8:54=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On Sun, Mar 12, 2023 at 12:05:59PM -0700, Joe Stringer wrote:
> > +Even if an LRU node may be acquired, maps of type ``BPF_MAP_TYPE_LRU_H=
ASH``
> > +may fail to insert the entry into the map if other CPUs are heavily co=
ntending
> > +on the global hashmap lock.
>
> "Even if an LRU node can be acquired, ..."

Ack.

> > +
> > +This algorithm is described visually in the following diagram. See the
> > +description in commit 3a08c2fd7634 ("bpf: LRU List") for a full explan=
ation of
> > +the corresponding operations:
> > +
> > +.. kernel-figure::  map_lru_hash_update.dot
> > +   :alt:    Diagram outlining the LRU eviction steps taken during map =
update
> > +
> > +   LRU hash eviction during map update for ``BPF_MAP_TYPE_LRU_HASH`` a=
nd
> > +   variants
> > +
> > <snipped> ...
> > +The dot file source for the above figure uses internal kernel function=
 names
> > +for the node names in order to make the corresponding logic easier to =
find.
>
> Shouldn't the figure note above be in :alt:?

Do you mean alt or caption? Alt will hide the information from most develop=
ers.

> Otherwise LGTM.

Thanks for the review!
