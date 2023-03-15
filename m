Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD934C6FD1D
	for <linux-doc@archiver.kernel.org>; Wed, 15 Mar 2023 04:00:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjCOEAB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 00:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjCOEAA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 00:00:00 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591032CC50
        for <linux-doc@vger.kernel.org>; Tue, 14 Mar 2023 20:59:59 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso2564795pjf.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Mar 2023 20:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678852799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XPDjkafRuofHvnDZ4c7d1mMxKts3yW6SSMO1cKOcl4Q=;
        b=E0HRFM1ZH4e5rcglb5oc0c9BwMXTspJJpXD8Ua2sO5X0xVUmk1OtkVW7W6ay+/coNV
         n8AP/HbkjcAjGxp5b+PnLcDQYBCELSlLnYnuGpQbf+/OWkNrwpesSUg0hVgoWaOoWWus
         EjU+YHRNztAx6e1fhzoitVP5LWTeSvCqx1yQFdhNRa6yEDoPgkcGRg03YktF1oW5opt3
         VjqsODPL/cmUWBSxsA7wGxlnL5KMZc4PcPt0fSPmnUyXd8mhcOxbMj5zjrdZkO3ZSZf1
         qIzSwkd75cot2W5H6M84Av+7kHmM0apCWoNpJljirTz0A4ID3wYzzM8zReqonNGW9/LR
         o05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678852799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPDjkafRuofHvnDZ4c7d1mMxKts3yW6SSMO1cKOcl4Q=;
        b=nVXVThTBBIERaXKUYk7YuvNc1+dnqPpgpxEgk9H7Mgstx8CtDMRnupX2mzsbLTULlX
         +9+BPTan8ip60KSFNE5JkIkOfUjNcNGqP0jKepaiJJQWYKM7yOthoDg/p+/4byzKqUsr
         KXU+ArnvkRalLTXEf8je6gR5x5No4GVfcS+DWBSqkyZrrra4p6wbo8FR5rTAwfOOkEXB
         AJ/CBnQ3pcmv1IDQVkmJavXTuN9pWX+fhRDWQLNAwX2OQA6sJm/s5L9W7G3SvRcDQ/nM
         BfSBTA7rxR/zRiUTgF/WbYeNg0apfc3YK45QscSQc1L5gALvyOlSf3zC+DorEaiIv6Kf
         gRTQ==
X-Gm-Message-State: AO0yUKVb3Gnr/dw2SoeXYlIPHl5Cy3aAQpK+Ma9F1IONEjSqCjvEcOJW
        iIqbJj+dCBrSpHuKkwPEYlg=
X-Google-Smtp-Source: AK7set8Oth3Q8SBZ/ZOQ7mU71prYZh2acMb00qeIxMMiwbUQutzyBMeMar9aDWyV+SzYQzSsSlADMA==
X-Received: by 2002:a05:6a21:6d85:b0:d4:c605:4512 with SMTP id wl5-20020a056a216d8500b000d4c6054512mr8821821pzb.30.1678852798774;
        Tue, 14 Mar 2023 20:59:58 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-17.three.co.id. [180.214.232.17])
        by smtp.gmail.com with ESMTPSA id y18-20020aa78052000000b005a8bf239f5csm2339589pfm.193.2023.03.14.20.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 20:59:57 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 2BE6A106195; Wed, 15 Mar 2023 10:59:53 +0700 (WIB)
Date:   Wed, 15 Mar 2023 10:59:53 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Stefan Roesch <shr@devkernel.io>, kernel-team@fb.com
Cc:     linux-mm@kvack.org, riel@surriel.com, mhocko@suse.com,
        david@redhat.com, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, hannes@cmpxchg.org
Subject: Re: [PATCH v1] docs/mm: extend ksm doc
Message-ID: <ZBFCud+I8mVAoh87@debian.me>
References: <20230314204557.3863923-1-shr@devkernel.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wIjEjcYmUcp0YvzG"
Content-Disposition: inline
In-Reply-To: <20230314204557.3863923-1-shr@devkernel.io>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--wIjEjcYmUcp0YvzG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 01:45:57PM -0700, Stefan Roesch wrote:
> +to cancel that advice and restore unshared pages: whereupon KSM
> +unmerges whatever is merged for that process.  Note: this unmerging call
> +may suddenly require more memory than is available - possibly failing
> +with EAGAIN, but more probably arousing the Out-Of-Memory killer.

"... to disable KSM and let it unmerges ... . Note that this unmerging
call may exhaust memory and triggers OOM killer."

> +However, if the system is dedicated to running multiple jobs within the
> +same security domain, there is a usecase where multiple instances of the
> +same job are running inside a safe shared security domain and using the
> +same sensitive data.

"... it is possible for multiple instances ... and share the same
sensitive data."

Thanks.=20

--=20
An old man doll... just what I always wanted! - Clara

--wIjEjcYmUcp0YvzG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZBFCtQAKCRD2uYlJVVFO
ozI4AP9P9tfkdCTSJfH9gecQ8XguWY64xBRZzCAO9aruksa3dwEAml1J1hNvucA/
L7hhjcsKXkv6rW/TFH3/CVkLzxIFnw4=
=FJct
-----END PGP SIGNATURE-----

--wIjEjcYmUcp0YvzG--
