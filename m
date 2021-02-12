Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9F7C433DB
	for <linux-doc@archiver.kernel.org>; Fri, 12 Feb 2021 08:24:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DE4764E6C
	for <linux-doc@archiver.kernel.org>; Fri, 12 Feb 2021 08:24:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhBLIYM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 12 Feb 2021 03:24:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhBLIYH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Feb 2021 03:24:07 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46EBC061574;
        Fri, 12 Feb 2021 00:23:26 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id x14so7995630qkm.2;
        Fri, 12 Feb 2021 00:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=zo7gwS8RPYEVeaZ3nWrakdE8Lwe2tlMhL3SC2eaylwM=;
        b=VY7iVEm3Wppz+osSGRplv5FBHknsRsCH+DmFKVAw2EpxLYkSuH1+1bKBSa1r+9z5H5
         Mlz3cbNfhPcJw+scdC6EgobWmP/7WuIhwkxy8AMG4Fk6d8h/cdpNEJw7OBglY3kkr+3i
         nGyCuSO6ycRRRjVwjrDbHtSgUC8MVhfyqDD4JSFyxIA2qCtnj0KstiRwGdY1cG/ijcgC
         Z3AiaV46bmfSihQDRH4kSnBsTta/+rIBIf/tK4mimMTfbRd678PsP+Gfx7iyx3p728Bx
         RJr5vP1n+sqMMi2tIUWcVl9eHsLF2FvSkRfNEqapwixJgsq8ANBr8hQqcH6iAhRB/9vL
         pBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=zo7gwS8RPYEVeaZ3nWrakdE8Lwe2tlMhL3SC2eaylwM=;
        b=bmYHsj1hiDYd7HwIABqdaUZXieSNcYVIJNoW2yGvwC+VpC4M/DMjOVfbuFb2eqKh1f
         ZWwP08EWNqW73S7I8B3BfVvJs+AM8o/QU3Chz1uFLB5dWBmVkkdtQ9Z+YBziQ9D3yo4S
         f7xZ3yXdke+j98267knmU6LnjcIEvPnfAgAg7i+WOItYeQs8RDTl2rjOa++EJKEZz6MG
         7ZFNdyXwmVAbjY29Vmv4FrC4AIqxXE3OQ7/UcAve7t0f95/tnAtUdMwwU/X9LiepMGll
         pCAyK9S86y/qnbmG+WkjT2S1p4u4nfFosXmosTklkhbH1MQJ0p9UW49LItFXB0VdlAh6
         yzsQ==
X-Gm-Message-State: AOAM533W5UagWDHgTH/p+yfQ9TZ972ajme+5jWXGNXNONr+dq+rOCpNv
        okmaFnxLUkdZn6+y+nXJOsw=
X-Google-Smtp-Source: ABdhPJykZmedCR0RVXZb0p6YFiQBkva+h/MWPLDvmVspvfxnq4cK3Q1GznJMJP8Mz9v4SuUrEmYx/Q==
X-Received: by 2002:a05:620a:b13:: with SMTP id t19mr1664573qkg.300.1613118205946;
        Fri, 12 Feb 2021 00:23:25 -0800 (PST)
Received: from ArchLinux ([156.146.36.184])
        by smtp.gmail.com with ESMTPSA id f14sm5674223qkl.76.2021.02.12.00.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 00:23:25 -0800 (PST)
Date:   Fri, 12 Feb 2021 13:53:14 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, swboyd@chromium.org,
        tiwai@suse.de, nfraprado@protonmail.com, mchehab+huawei@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: kernel-hacking: Remove the word fuck,trying to be
 civil :)
Message-ID: <YCY68j2miphB9myN@ArchLinux>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, swboyd@chromium.org,
        tiwai@suse.de, nfraprado@protonmail.com, mchehab+huawei@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210205115951.1276526-1-unixbhaskar@gmail.com>
 <87sg62pmd4.fsf@meer.lwn.net>
 <ca67086b-3b52-40b6-003e-9ac7796ad68d@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tCXFL2zAXXsGZfua"
Content-Disposition: inline
In-Reply-To: <ca67086b-3b52-40b6-003e-9ac7796ad68d@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--tCXFL2zAXXsGZfua
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 09:10 Thu 11 Feb 2021, Randy Dunlap wrote:
>On 2/11/21 9:04 AM, Jonathan Corbet wrote:
>> Bhaskar Chowdhury <unixbhaskar@gmail.com> writes:
>>
>>> s/fuck//
>>>
>>>
>>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>>> ---
>>>  Documentation/kernel-hacking/locking.rst | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
>>> index c3448929a824..ed1284c6f078 100644
>>> --- a/Documentation/kernel-hacking/locking.rst
>>> +++ b/Documentation/kernel-hacking/locking.rst
>>> @@ -958,7 +958,7 @@ grabs a read lock, searches a list, fails to find what it wants, drops
>>>  the read lock, grabs a write lock and inserts the object has a race
>>>  condition.
>>>
>>> -If you don't see why, please stay the fuck away from my code.
>>> +If you don't see why, please stay away from my code.
>>
>> Sigh.
>>
>> I've gotten a few variants of this patch over the years...I guess maybe
>> the time has come to apply one, so I did.  If the word is too offensive
>> to be in our docs, though, perhaps it shouldn't be in the changelog
>> either, so I rewrote it:
>>
>>     docs: kernel-hacking: be more civil
>>
>>     Remove the f-bomb from locking.rst.  Let's have a moment of silence,
>>     though, as we mark the passing of the last of Rusty's once plentiful
>>     profanities in this venerable document.
>
>I really like that tribute there, Jon. :)
>
Indeed!
>--
>~Randy
>

--tCXFL2zAXXsGZfua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmAmOu0ACgkQsjqdtxFL
KRXKAAf8DVYgMCVAnifWxwiQrXPWSZLY418rSsWAR7iz292aFH0KiByjUHc6lxf5
LaccVE7emH6+bzetmovYAAMVH7Ot3ZIxyHbrrdYpQaUI/hWMwyWcjzZoI9fvAYtF
fVnOksq4eTB+dfGnf/7X2xFfda/fXO4htjEngZOAU2m9+K3/7QHOC2T0yoL/9Z/8
69dOPEML/VinyWqZmFDaBTWfN9O5zWit5wHVzjkxo+HU4OKPaKcDhEKkhQ9X8vOH
Y1Pg8+eB60Nc0nk9FzjZ67HxBpobgKSfH3ZQFWkLF6Aw4R/pAmLIuJMRo5i1GhRF
OpNUUNntZlgGDkqbNjhm27p7xMSffA==
=1arQ
-----END PGP SIGNATURE-----

--tCXFL2zAXXsGZfua--
