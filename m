Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F70C43217
	for <linux-doc@archiver.kernel.org>; Sun,  6 Nov 2022 02:51:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbiKFCvt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Nov 2022 22:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiKFCvr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Nov 2022 22:51:47 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4464F5A3
        for <linux-doc@vger.kernel.org>; Sat,  5 Nov 2022 19:51:46 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id k7so8242834pll.6
        for <linux-doc@vger.kernel.org>; Sat, 05 Nov 2022 19:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4J8NoZQWoWmZcjgG1p5tmLVVkGwD2d5q+W2LzjBkXN4=;
        b=kc7uVhJz7yt939eBKfqYP9+te2qc2jirS0VZAsgfaNJiX+rcBds/BxvX0qPW+0hrNx
         iCbcIpi+85TXv8/ye6KsmMbOvRDD7Gt4XVo+3tzYhWxGo+O+7Ecy8M6HW2/IJKm9bBLQ
         QLWM/hD2TgpOGsvbsQFLRYeQ4U9BmDUvdxGc9Eo9T6KxGfzGtV4xdIPIYL6CZEBQcfkX
         umJNROj8PJu6FffOn5ZaqZZBy3NBINPJVJ0iFqC3Lm8XegTdr3A2SyMvXjLNXEyknUGo
         QEWT10ubNlPytJMux2PWyuf5EeM3kOCAcJdhhe2tuRlhmtW631Q8OHvP3GOMJYglmxaz
         2RkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4J8NoZQWoWmZcjgG1p5tmLVVkGwD2d5q+W2LzjBkXN4=;
        b=e5v1fgxV1cT7NQR4QlHNQpvN9ZQ3qhOz7F7fyXMIpnQmPECSPGYIR64Bam87jKfQ5c
         OisJlSxIBkr6to5yEHG+Jz2fXS6U962ly9nYgdS6AhVUo8qE3wNyLD32aPE2hwMwkfTo
         fl1DtVWWyOCUEM9jbNERladwKGBEgTlErtO1e6hCeBDAsaYNXPUXAgwJhX/dQzys0xR+
         oDVUGXIj3YZBKssTQO+NxYK7gU/ATHIZkrv595mle/REX+MO9+zPKOWXA4LBRzYh47WS
         ufgr9n+w+eYYlt68r9nyuxTXy55Ny2mgQqCGJTXs6GEMR/tGssPBuBr0Z9MNtScS31vR
         lZxw==
X-Gm-Message-State: ACrzQf1UEPb74del9AOneWHMKQhpxgXuJDB+EiWbkcrYJBZJc849vjrJ
        Gr27MfPXYrTGIt3cxSYX0Pc=
X-Google-Smtp-Source: AMsMyM6GSSSFMw+U9K90sOjAf73erGChl0oL/OByOfAthd5F+K6mVsiuvMXiaNQqQe7i5l163BP9qQ==
X-Received: by 2002:a17:902:ff0a:b0:185:293d:dbe3 with SMTP id f10-20020a170902ff0a00b00185293ddbe3mr43352876plj.28.1667703106351;
        Sat, 05 Nov 2022 19:51:46 -0700 (PDT)
Received: from ?IPV6:2405:6e00:492:32d2:91c:dbcd:ac21:e070? ([2405:6e00:492:32d2:91c:dbcd:ac21:e070])
        by smtp.gmail.com with ESMTPSA id r15-20020a63d90f000000b00458a0649474sm1836727pgg.11.2022.11.05.19.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Nov 2022 19:51:45 -0700 (PDT)
Message-ID: <099b07f8-40a8-1257-2bc8-5cbf493244b0@gmail.com>
Date:   Sun, 6 Nov 2022 13:51:39 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] Documentation: eisa: Fix typo
To:     Bagas Sanjaya <bagasdotme@gmail.com>, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org
References: <20221105080653.4741-1-albert.zhou.50@gmail.com>
 <e416742b-d3f5-c130-b15d-74cbef6e590a@gmail.com>
Content-Language: en-AU
From:   Albert Zhou <albert.zhou.50@gmail.com>
Autocrypt: addr=albert.zhou.50@gmail.com; keydata=
 xjMEYkX5gxYJKwYBBAHaRw8BAQdAsW8QQjKnmpKC5G1d1QFYNvd9ddMxwYZs+xTT0dyqvtbN
 JkFsYmVydCBaaG91IDxhbGJlcnQuemhvdS41MEBnbWFpbC5jb20+wosEExYIADMWIQRLx2w8
 czp1EBJaieEhj+NExaaGfQUCYkX5gwIbAwULCQgHAgYVCAkKCwIFFgIDAQAACgkQIY/jRMWm
 hn2rKAEAlOVVAsYIpmGTEng+e/HHT7JJjCjcX4lh+pFZdUy2DGgBAM/EwKNYoNB43H5EJpb8
 I68MS+ZZSQ3swJWAu1OJKXIJzjgEYkX5gxIKKwYBBAGXVQEFAQEHQNk/Nf/E1Uttgm29quUB
 Xgc9RDwqKTHbtHLS5SOkZzhUAwEIB8J4BBgWCAAgFiEES8dsPHM6dRASWonhIY/jRMWmhn0F
 AmJF+YMCGwwACgkQIY/jRMWmhn0KRwD7Bv1kWYB2m8c5tRQUg7i3zIaJ4kpfqMj4bwYQ9xEk
 e3oA/11CMCzdPMcoveB279og31mtUISG5mXMDJmiE4y61akN
In-Reply-To: <e416742b-d3f5-c130-b15d-74cbef6e590a@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2S902TselIOqJpj0T8gMxrF5"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2S902TselIOqJpj0T8gMxrF5
Content-Type: multipart/mixed; boundary="------------taG9aikJ4codWMOY0CQwX9Zr";
 protected-headers="v1"
From: Albert Zhou <albert.zhou.50@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, corbet@lwn.net
Cc: linux-doc@vger.kernel.org
Message-ID: <099b07f8-40a8-1257-2bc8-5cbf493244b0@gmail.com>
Subject: Re: [PATCH] Documentation: eisa: Fix typo
References: <20221105080653.4741-1-albert.zhou.50@gmail.com>
 <e416742b-d3f5-c130-b15d-74cbef6e590a@gmail.com>
In-Reply-To: <e416742b-d3f5-c130-b15d-74cbef6e590a@gmail.com>

--------------taG9aikJ4codWMOY0CQwX9Zr
Content-Type: multipart/mixed; boundary="------------OBR1gGsotK9yBLR0dPUnYp00"

--------------OBR1gGsotK9yBLR0dPUnYp00
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNi8xMS8yMiAxMjo1MCwgQmFnYXMgU2FuamF5YSB3cm90ZToNCj4gT24gMTEvNS8yMiAx
NTowNiwgQWxiZXJ0IFpob3Ugd3JvdGU6DQo+PiBGaXggYSB0eXBvIGluIHRoZSBkZXNjcmlw
dGlvbiBvZiB0aGUga2VybmVsIHBhcmFtZXRlcg0KPj4gZWlzYV9idXMuZGlzYWJsZV9kZXYg
d2l0aGluIGVpc2EucnN0Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFsYmVydCBaaG91IDxh
bGJlcnQuemhvdS41MEBnbWFpbC5jb20+DQo+PiAtLS0NCj4+ICAgRG9jdW1lbnRhdGlvbi9k
cml2ZXItYXBpL2Vpc2EucnN0IHwgMiArLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kcml2ZXItYXBpL2Vpc2EucnN0IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2Vp
c2EucnN0DQo+PiBpbmRleCBjMDc1NjViYTU3ZGEuLjNlYWMxMWI3ZWIwMSAxMDA2NDQNCj4+
IC0tLSBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9laXNhLnJzdA0KPj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kcml2ZXItYXBpL2Vpc2EucnN0DQo+PiBAQCAtMTg5LDcgKzE4OSw3IEBA
IGVpc2FfYnVzLmVuYWJsZV9kZXYNCj4+ICAgCWluaXRpYWxpemUgdGhlIGRldmljZSBpbiBz
dWNoIGNvbmRpdGlvbnMuDQo+PiAgIA0KPj4gICBlaXNhX2J1cy5kaXNhYmxlX2Rldg0KPj4g
LQlBIGNvbW1hLXNlcGFyYXRlZCBsaXN0IG9mIHNsb3RzIHRvIGJlIGVuYWJsZWQsIGV2ZW4g
aWYgdGhlIGZpcm13YXJlDQo+PiArCUEgY29tbWEtc2VwYXJhdGVkIGxpc3Qgb2Ygc2xvdHMg
dG8gYmUgZGlzYWJsZWQsIGV2ZW4gaWYgdGhlIGZpcm13YXJlDQo+PiAgIAlzZXQgdGhlIGNh
cmQgYXMgZW5hYmxlZC4gVGhlIGRyaXZlciB3b24ndCBiZSBjYWxsZWQgdG8gaGFuZGxlIHRo
aXMNCj4+ICAgCWRldmljZS4NCj4+ICAgDQo+IA0KPiBUaGF0IGZpeCBpcyBhY3R1YWxseSBt
aXNub21lciBmaXggKGRpc2FibGUpLCByaWdodD8NCj4gDQpZZXMNCg==
--------------OBR1gGsotK9yBLR0dPUnYp00
Content-Type: application/pgp-keys; name="OpenPGP_0x218FE344C5A6867D.asc"
Content-Disposition: attachment; filename="OpenPGP_0x218FE344C5A6867D.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEYkX5gxYJKwYBBAHaRw8BAQdAsW8QQjKnmpKC5G1d1QFYNvd9ddMxwYZs+xTT
0dyqvtbNJkFsYmVydCBaaG91IDxhbGJlcnQuemhvdS41MEBnbWFpbC5jb20+wosE
ExYIADMWIQRLx2w8czp1EBJaieEhj+NExaaGfQUCYkX5gwIbAwULCQgHAgYVCAkK
CwIFFgIDAQAACgkQIY/jRMWmhn2rKAEAlOVVAsYIpmGTEng+e/HHT7JJjCjcX4lh
+pFZdUy2DGgBAM/EwKNYoNB43H5EJpb8I68MS+ZZSQ3swJWAu1OJKXIJzjgEYkX5
gxIKKwYBBAGXVQEFAQEHQNk/Nf/E1Uttgm29quUBXgc9RDwqKTHbtHLS5SOkZzhU
AwEIB8J4BBgWCAAgFiEES8dsPHM6dRASWonhIY/jRMWmhn0FAmJF+YMCGwwACgkQ
IY/jRMWmhn0KRwD7Bv1kWYB2m8c5tRQUg7i3zIaJ4kpfqMj4bwYQ9xEke3oA/11C
MCzdPMcoveB279og31mtUISG5mXMDJmiE4y61akN
=3D+2qf
-----END PGP PUBLIC KEY BLOCK-----

--------------OBR1gGsotK9yBLR0dPUnYp00--

--------------taG9aikJ4codWMOY0CQwX9Zr--

--------------2S902TselIOqJpj0T8gMxrF5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRLx2w8czp1EBJaieEhj+NExaaGfQUCY2chOwUDAAAAAAAKCRAhj+NExaaGfcqD
AQDFnzSQFuLsfgk6GVL15Ed/JpFC2j6z62gruFZuvfFM0wEA759uNY1y3XuD4HCA75Ip9NacIqEW
OjacTufsgB6pmAQ=
=La7m
-----END PGP SIGNATURE-----

--------------2S902TselIOqJpj0T8gMxrF5--
