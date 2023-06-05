Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26098C77B73
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 03:05:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbjFEDFM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Jun 2023 23:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232527AbjFEDFK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Jun 2023 23:05:10 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FDB9A9
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 20:05:10 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-65242634690so2140886b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 20:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685934309; x=1688526309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s+SNS/Ez4V5YrkVuSk178SGGNvobB71usHfX95QcJcA=;
        b=VVMsaF21C3cO6D7tiqZrbqmS/iJ1KQYzuduhTxCIhtIK5EVbx/3FwI0l7/zn6Ddkrm
         2wto5NYYhnkaXQnUwnPhXz4sV/jZ/kZg5AOJCZ9sN6zN38S/sAC/eFuq4Pp1bLh1ov8T
         5ZlIUDPkk2ChuvsKtm9+zydlpTyYDkQjnPcEn+E0ljaWFQbEADoO3z1ahVm75blw1Az0
         PjvlE8TF1kBfA74T7un9Op1NYgC2/7ozwwvWsSvtmF98zkbik+lAmv75FHCOu/k9Pno7
         OL9J9e7WU8FoaT+j1vUanEzsgrPvj9TfZuonML8Bh6RVE4IWVdHihwK5Sblm9XxAY0pb
         TkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685934309; x=1688526309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+SNS/Ez4V5YrkVuSk178SGGNvobB71usHfX95QcJcA=;
        b=JlLdrVioH0wJw05n75KrU5AD1whXARVegORPrlcX3k7rT05CTW2YdEmHqe6BQPCiNH
         ySlsEogTjeo3z9c4IByAQgAgXEU/NiGUyXmQBe9lgj9KefuuimfgIpNpc8mYNBsxSjPL
         fAQTmLH4XRRuEqvnjMEuoN+4tGeG354uhGLTioORI4snJjIQ5UZ79QdWyahOOl9Ki8zY
         4Lv4Jt/nnVQz54sjBkTjbs8XAMztbwv/1m/ZBkqVfGe27orMhjp3QhQPASBQm5U0DkEK
         e/J1qchG6A038y3hnMFxyJ0lGh3uSKW654T1QOhiF5JMcT3Awa8D/hLfRlds01C1BUMd
         mShA==
X-Gm-Message-State: AC+VfDyfPoZpf7p5VumoaHUAvo35FK4aDTlhmLAWkirjHrTM/LNfk4N2
        P4jBfToYq2SxKqIhqETphvo=
X-Google-Smtp-Source: ACHHUZ51HSuF7agss6dH0Air78er6+DFls6LF/iE9dOl0Rb5IaZm54LaOgUz1hLenDpw/WeylSIQPg==
X-Received: by 2002:a05:6a21:9988:b0:10b:8a27:bb59 with SMTP id ve8-20020a056a21998800b0010b8a27bb59mr3325496pzb.47.1685934309515;
        Sun, 04 Jun 2023 20:05:09 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-4.three.co.id. [180.214.233.4])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001b03b1bcf6bsm5271327plp.252.2023.06.04.20.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 20:05:08 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 820431061BF; Mon,  5 Jun 2023 10:05:06 +0700 (WIB)
Date:   Mon, 5 Jun 2023 10:05:06 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Russell Harmon <eatnumber1@gmail.com>
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/4] Documents the meaning of "buffer" in dm-integrity.
Message-ID: <ZH1Q4n-1bCJLr9r-@debian.me>
References: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
 <20230604190604.4800-1-eatnumber1@gmail.com>
 <20230604190604.4800-3-eatnumber1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HgsTtJwVqSUW+qkf"
Content-Disposition: inline
In-Reply-To: <20230604190604.4800-3-eatnumber1@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--HgsTtJwVqSUW+qkf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 04, 2023 at 12:06:02PM -0700, Russell Harmon wrote:
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

--HgsTtJwVqSUW+qkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZH1Q4gAKCRD2uYlJVVFO
o7tHAQCS4G9fVnWvbe+hdX9Gke3Gy+4g3X66+S82pYomEa7KewEA5AtHtuc7/ZYT
SlUoHPXalukvSbgIcnRyXU136buJ4QE=
=3XVp
-----END PGP SIGNATURE-----

--HgsTtJwVqSUW+qkf--
