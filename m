Return-Path: <SRS0=ug/q=CY=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A9BC43461
	for <linux-doc@archiver.kernel.org>; Tue, 15 Sep 2020 14:48:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8F81206C9
	for <linux-doc@archiver.kernel.org>; Tue, 15 Sep 2020 14:48:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnuiLmya"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbgIOOsJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 10:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbgIOOr7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 10:47:59 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DEDC061352;
        Tue, 15 Sep 2020 06:52:18 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id l126so1976713pfd.5;
        Tue, 15 Sep 2020 06:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=/tqrNsraNfTj1stxIyy4mP5043NzxO4IeWGGqxC3I8g=;
        b=PnuiLmyalDRqdLZYsX9G4bpPjnnydS4iqiZQmmd2O75xWf03979RzNxBy/9YByaaCc
         Nq9qreedg6fWlu0t50+UUvn5ocn7rGTBHJZd4butU0yS13uopoqLH4uK8JR2ST7CM0m+
         3urhNOvHemoKFzBL/+dwcE0K6Kw7tG+UMo5Mkynx2zZ129/yvZ8elxYW22+OoqP4JQuC
         0tdYIKQ7DB5ZC1tJNmaTZkV41LIRUvHxF4I3sFLp3zS/9ft1KU2duYCIWejKY1M+oubj
         jokv99ijKg9z/ydqRHmEmr85uDGoFeWxcnN2m2KdzSQTXK5pB6dW9F1BMsYOjszODW0b
         SQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=/tqrNsraNfTj1stxIyy4mP5043NzxO4IeWGGqxC3I8g=;
        b=sz3M03R+nPvMmHkw/IW6eFcthScoRVny3JoHfSxRW5/Jcq4i4BPeIbkQP5kUR/zZK3
         tq4TfJeEJBCMIVm5Jc/TSg8ukjaFRRBbk2SZ+BNsQt0L7El24R6zWf5squNP6/6i6Alg
         Pxwm42l0JQDMd9oA4F7YXpOZhfw6OMk3uIeZEOcbS12yvwyeseiei2X564E9NCv1nOte
         Iw9hdYJsg59fy52srI7ZgRz2YFT2CWRZvRpfRnefJOk2rFlWapC1gf1t/OdpxeDxCAn7
         CJeC8OzOcSOVIE3zw2ThotYr1KqUt5zivumTLtehvPXm5HtvPLTYbjC8dVUsEyo2e7S7
         /Adw==
X-Gm-Message-State: AOAM532Spa/credpePT/Dtg+w3w2VVKi7uLrn1mErOr+Trw8G9OrAqyp
        jLOazJmKbY5sDV2PPPMpK7Q=
X-Google-Smtp-Source: ABdhPJwZPrOXUBR5K063N+vYrdlvoy2CTXjQYRJQEaf0KsrgKE+YHZgfyAnEkWkrE505ZxZq7a/w7A==
X-Received: by 2002:a63:c40d:: with SMTP id h13mr14662107pgd.185.1600177938416;
        Tue, 15 Sep 2020 06:52:18 -0700 (PDT)
Received: from Gentoo (sau-465d4-or.servercontrol.com.au. [43.250.207.1])
        by smtp.gmail.com with ESMTPSA id k24sm13873722pfg.148.2020.09.15.06.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 06:52:17 -0700 (PDT)
Date:   Tue, 15 Sep 2020 19:21:57 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     b.zolnierkie@samsung.com, linux-fbdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, rdunlap@infradead.org, daniel@ffwll.ch,
        yuanmingbuaa@gmail.com, w@1wt.eu, nopitydays@gmail.com,
        zhangyunhai@nsfocus.com, luto@amacapital.net,
        torvalds@linux-foundation.org
Subject: Re: [PATCH] docs: fb:  Remove scrollback option
Message-ID: <20200915135157.GB30746@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>, b.zolnierkie@samsung.com,
        linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net, rdunlap@infradead.org,
        daniel@ffwll.ch, yuanmingbuaa@gmail.com, w@1wt.eu,
        nopitydays@gmail.com, zhangyunhai@nsfocus.com, luto@amacapital.net,
        torvalds@linux-foundation.org
References: <20200915132736.5264-1-unixbhaskar@gmail.com>
 <20200915134127.GA873393@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline
In-Reply-To: <20200915134127.GA873393@kroah.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 15:41 Tue 15 Sep 2020, Greg KH wrote:
>On Tue, Sep 15, 2020 at 06:57:36PM +0530, Bhaskar Chowdhury wrote:
>>=20
>> This patch remove the scrollback option under boot option.
>> Plus readjust the numbers for the options in that section.
>>=20
>> This is the effect of these commits:
>>=20
>> 973c096(vgacon: remove software scrollback support)
>> 5014547(fbcon: remove soft scrollback code)
>
>The kernel documentation file:
>	https://www.kernel.org/doc/html/latest/process/submitting-patches.html

>in section 2, describes how to show git ids within changelog text
>properly (the number of characters and the rest.)

Okay, I have only included 7 instead of 12 ... :(=20
>
>Can you fix this up and resend?

Certain.
>
>And this is a v2 patch, right?  Always document what changed from
>previous patches below the --- line, as the above link asks for.

No ...no Greg ..  I shall be sending afresh ...kindly ignore all the previo=
us and
this one too..=20

>
>thanks,
>
>greg k-h

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl9gxvoACgkQsjqdtxFL
KRUHAQgArmFJVrc6dwRjlNuO95r92Rk8vcvoeOtfkMN6LQ454PW5VakoCan6j11a
5WnzD39nqfjtcLNPuX1Bb6WGRUNAPp6THDn42miNC55SbRwqrCLxgjKvI017dytm
XOVPbDZxfmGU33IWvA7mmyqRHvMTsSZcfK7ShRNY2s6UeIgo9gA5SkY4K4jg4PXC
OQqntGGrX24whZ8hvKqv6yMDaZqL4dRIkB1i6GVMs0k+h7UetiqrPtJJftqBh4OU
WE5T/8K0ejag1VKDfjIoOCxa3KAbiz6+MruyhAhrwkvyd/hGvKjkuQoiIHiWUMP4
2zSGw50aYOi/GkjNsMvEQer0yAL21A==
=N8Nj
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
