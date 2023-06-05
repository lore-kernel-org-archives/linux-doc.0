Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5126C7EE24
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 03:16:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbjFEDQt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Jun 2023 23:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbjFEDQr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Jun 2023 23:16:47 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C816A9
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 20:16:46 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-33d31ab00bdso13523715ab.3
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 20:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685935005; x=1688527005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6RIp8/+2ROMbmgfodBV7gNklXelK6i7IpUS5pUrmgjw=;
        b=hddC6w38wMV3dA04eyYz8Xl4kSCg5yYnN8ycdOIU44yue1a47jm1elclLHGiH3Q4sA
         2FqdHsJcN/jT1b1VivKBGh7ivizYHzontXSMEhtj/XWpeQUe/TYgEEA7SFRygFB/PvMl
         dwgDzlGGrONqs1GjL8410dNEOhSNLMcvW50OTk/l3yMl2Va5GRo6GInekHCGeOoyqyhp
         onw36cTxOoLVgTtPG6uD5TVQvXsPgnucFgPFap/imxeTDVfiWnDeMG1pqhQ4SImnzNzQ
         QFOz72yo5NwlJZyGHQRDjWIRtEbnhiGACqBo8Xt1HgUpeDiUiMlvIMlnnA5g3o2LvEb6
         pvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685935005; x=1688527005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RIp8/+2ROMbmgfodBV7gNklXelK6i7IpUS5pUrmgjw=;
        b=SdvEYAB/p3vx+Dizbb1xew/IhYZalo4SmtrvCgm76gWg5X5IQs5suZgp2lLHQY7rFF
         IxLGJb+d+99qJmKzvjVIHBMctVJhkBQWfempPQYev3Hl49mAvtHInEa50Iv7vpLst9Ub
         mluUBLIVPBvSNucHt1ZzEzfOQQgYjyBrm0cs1d2FU7cY3njKVnTs5X6DEbZoSParFZv9
         x+NC7qJTir7225djWUkGY5BL7fjNVPBS9bC0k1032HDrevJflJvRI0YKNm9O+maElfac
         D3MofUl8ruwt2o1oaBmOXPkgC/02AUyknYVWcF1XP7wwDNIp4TTrmkiIgQMwLh6UhP+e
         xSUg==
X-Gm-Message-State: AC+VfDx0vsOF4CJk3ORGkFMBw+Em5Eju6m6qxG98TiF/THcLWssZa3WV
        X0f7CLvOUI2kzWfbDBt7r+o+p5zBNRKLdg==
X-Google-Smtp-Source: ACHHUZ5gh6OL2VL0ttW0+wx8rwFffRN+NKM156RLHk3uSO0deVArqH2NJxZgrS9IZCecilcQ9u4fqA==
X-Received: by 2002:a92:cd49:0:b0:331:35c2:d242 with SMTP id v9-20020a92cd49000000b0033135c2d242mr15938042ilq.32.1685935005445;
        Sun, 04 Jun 2023 20:16:45 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-4.three.co.id. [180.214.233.4])
        by smtp.gmail.com with ESMTPSA id y2-20020a62b502000000b0064c98c87384sm4178939pfe.44.2023.06.04.20.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 20:16:44 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 81FDE106291; Mon,  5 Jun 2023 10:16:42 +0700 (WIB)
Date:   Mon, 5 Jun 2023 10:16:42 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Russell Harmon <eatnumber1@gmail.com>
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 3/4] Document dm-integrity default values.
Message-ID: <ZH1TmkyVJbIlNUEE@debian.me>
References: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
 <20230604190604.4800-1-eatnumber1@gmail.com>
 <20230604190604.4800-4-eatnumber1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Uv1ofh8JTa3EH3uz"
Content-Disposition: inline
In-Reply-To: <20230604190604.4800-4-eatnumber1@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--Uv1ofh8JTa3EH3uz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 04, 2023 at 12:06:03PM -0700, Russell Harmon wrote:
> Specifically:
>   interleave_sectors =3D 32768
>   buffer_sectors =3D 128
>   block_size =3D 512
>   journal_watermark =3D 50
>   commit_time =3D 10000

Your patch description duplicates the diff content below. Please write
in a mood that evocates curiosity to read the diff (and make sure it is
also imperative).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Uv1ofh8JTa3EH3uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZH1TmgAKCRD2uYlJVVFO
oxtOAQDxw0K4WAzLOQJeDgTZ7eKZGmfQHtK8yGKMib5ms10aBQD+N1pKF9YxeXZM
z6jjsj1Q7fsfCkCdevSHNeih/7UssAo=
=/mJ5
-----END PGP SIGNATURE-----

--Uv1ofh8JTa3EH3uz--
