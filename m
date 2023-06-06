Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BD6C77B73
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jun 2023 02:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233706AbjFFCSj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 22:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232034AbjFFCSi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 22:18:38 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91448114
        for <linux-doc@vger.kernel.org>; Mon,  5 Jun 2023 19:18:37 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6b29a03ec42so15973a34.1
        for <linux-doc@vger.kernel.org>; Mon, 05 Jun 2023 19:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686017917; x=1688609917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pq85JV2SdkTWT1UykTpgwMJ7kQGul6RVMXpZztrA70k=;
        b=ALScxAXZfrT9BPJUTkAeH2f8cYqLzBXaTf/a3oKF9zKW9UtGYAPWsWq8eBVk3xUIcY
         Jd8t90JZdVk7gmx/cmuNhxlPjygWg+xXmkv8RMuHFPs6YxxDjyLml22nFlNKFeu2M7Mz
         QIUVRxqQbXpo853W/qRz3cjtet+cBVRChokpyvp5RQ9OcKIrGuYjjbeyPst5nikt833V
         eDyJ3hzO5QfxTBTIawravz1KwvPUNY+DjNNcjFw2JipI1pIrbaU1576h6PrDZisrnDeG
         x0g5sc38MrMte482vHPlMGF/cChPPaSDrQEnpdxZS3dYNyv0u07Vi7EK59I+bNpVcRM2
         vFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686017917; x=1688609917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pq85JV2SdkTWT1UykTpgwMJ7kQGul6RVMXpZztrA70k=;
        b=aAIzJIbqzrc65rIq7dNuog/gRxHSyCy655oEXobncLWpYteUvmGVUp/Ni9vdQBgPix
         OfNo/1d0hsnW9lw+gCIB86tZ2HnOa40oOuqFyAmrYfnw5dhQ17VvacldHgz7Fil83XHS
         iJLHi3+vyR1CbOTg2JXx+fKUxY+gBWMerRAQjQkg/eIrFVsCagF0nqfT8VeUctDkXsL6
         VpTUDVbubnJH7i75SY4xb4kXwjaaN7VU1BQozW+tBqpHMO62jpiKZ0Y/IaLko9U/dvDA
         KckQdQdHyLW8TSNRyzcJ2rv4sf0jKc3udo0GaQWLvfY9cQr3njkhJMaTXvKnkfdZTmrp
         OVrg==
X-Gm-Message-State: AC+VfDzR3PEQyJ/a+0BL71IE8Bf1R76aSHoJ5ACy1s0rUPC9WbMX0Qyn
        zuX7K8/Y/hI9AywKC3x1Xe4=
X-Google-Smtp-Source: ACHHUZ73hfAfBiMqB9tqWPbU/FwVETl7ryRQhqynyRWcQRUNX7uwhnkiuU+pE67e3wnEXA/xLD7HVg==
X-Received: by 2002:a05:6358:bb89:b0:129:cf4e:c0e1 with SMTP id df9-20020a056358bb8900b00129cf4ec0e1mr796577rwb.32.1686017916654;
        Mon, 05 Jun 2023 19:18:36 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-36.three.co.id. [116.206.28.36])
        by smtp.gmail.com with ESMTPSA id q5-20020a17090a4f8500b002563e8a0225sm6890499pjh.48.2023.06.05.19.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 19:18:36 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 604CB1069FD; Tue,  6 Jun 2023 09:18:32 +0700 (WIB)
Date:   Tue, 6 Jun 2023 09:18:32 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Russell Harmon <eatnumber1@gmail.com>
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/4] Documentation: dm-integrity: Document the meaning
 of "buffer".
Message-ID: <ZH6XeM4Uir4zQMn6@debian.me>
References: <20230604190604.4800-1-eatnumber1@gmail.com>
 <20230605050853.6240-1-eatnumber1@gmail.com>
 <20230605050853.6240-3-eatnumber1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8dT9jEFPjY4b25Xy"
Content-Disposition: inline
In-Reply-To: <20230605050853.6240-3-eatnumber1@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--8dT9jEFPjY4b25Xy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 04, 2023 at 10:08:51PM -0700, Russell Harmon wrote:
> +Accesses to the on-disk metadata area containing checksums (aka tags) are
> +buffered using dm-bufio. When an access to any given metadata area
> +occurs, each unique metadata area gets its own buffer(s). The buffer size
> +is capped at the size of the metadata area, but may be smaller, thereby
> +requiring multiple buffers to represent the full metadata area. A smaller
> +buffer size will produce a smaller resulting read/write operation to the
> +metadata area for small reads/writes. The metadata is still read even in
> +a full write to the data covered by a single buffer.
> +

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--8dT9jEFPjY4b25Xy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZH6XeAAKCRD2uYlJVVFO
oxMmAQDQw+DyLg4djiSiS72ErEICH5CXhJavIm92BeL22KsbJgD9HON0Q4ehRfPA
uydfE7iQ8VprJ9S5xNAHQXGHgGoIMAU=
=Gs2+
-----END PGP SIGNATURE-----

--8dT9jEFPjY4b25Xy--
