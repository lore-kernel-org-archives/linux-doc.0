Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792934538;
	b=Z/zQ1ZfJ9pn+81ywNFxKlymLKYiPxwvwm7aks6b/kh5SCGsyRlX3xri5y7/9KdAwxd9A
	 GqbcZBbgqsh3Sivp7QZBrKBv2/LaBaP+11R15rKSD4DkGoY7Kuik1/lcRnY090A33I2/k
	 HXmYRckkJGaIpJVZ7mzbI8nZNIy4S88wsbGqNhAI//YmUupP5/s1tOPkN5xCsKI1cEZe1
	 XhM2oD1to9JVvdFOxyBu2sNbmILOkSJJ9cvGm8W2zJ8Jf4pizvQ1QQNZrP6Y/h7tjBmhi
	 rq/OfiXimo//AsrgTCDZvqctlbH3lPgUGK87vkOjliWgDzMRr97W29PxEyMP8NLOLUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792934538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZmVJXovP/SYcTy7+girXETRc+nqmLI60cP0gmYMw0Ks=;
	b=OsZ1lyuYhdV6VXi5Qxk0P2IqEkcV8rWlUQKkrgmcD7Wv4zfK4kWcZd6BtcCOwVH9DuSm
	 TZ2qdgchTSGsoQzFYHbZBZDDQFk0Ie+JwBBdgjG1O1+SpxrGZ5SA+f68/l1rzgGxgMESm
	 uRWu/ktLb7iuajwt54LRwcybs7zL9DQ+2IV2Qg5uZZzzk38Gn6XaOGcO/cVc0ILElOi6k
	 H0AQDkBsWAFnAuiwbXgC9QpVy465NJHRXmvY4M5tqaPkBtIEUN2j9/5hNF5pK9b2c3br6
	 JCHNIs6hvr0He1SuvH1/zLgdUku9deHuET9cA2jaQO/PZmRJBLkjrnWB1rZGQy56hQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KrtQG2sh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA04606A31B
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 13:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CA04606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KrtQG2sh
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5361e313e63so21448171cf.3
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 06:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792934536; cv=none;
        d=google.com; s=arc-20260327;
        b=Qnpk841lHRALHwd/E/s9We4WC9ePg/eDC2zAxQeCdgvTo7PYoajupRfKoLug9hviQf
         A6A5mBy6sd4+42uCGsaNL4BlhdRG+C7w6VmGdMyuCMV6sjnG/2d7Q0p5YX6k7ZBpFA+d
         +hF/StKb9coELQKKiUBOcJRrUhuGluvqpWj+3Csfr3xWW+Q26FV6+fA+Tresz+i+yQ64
         UqqNzqiZyRrTSZENIQCtjoNjEb8woI0XkgGuPNvCDh89yxvGWUWim/UAgvNmIVd3SlKZ
         rJQ9L9cphGOZdZhqY/GBTVM4ewNhaW5kupEE9qXZoGLPrNzhFNhpBJdKVrRfKvDQoZKM
         RDZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZmVJXovP/SYcTy7+girXETRc+nqmLI60cP0gmYMw0Ks=;
        fh=NX8FUfxtNb0HKCsiw8TulJZsZ4hhvemVIgL1RnM9SMA=;
        b=R+vH5Z+1l/Je4anYzUmz9aiLsb39axpMaSLjiUph6is9/5bK/AgFXapG344sj5X3/K
         zV+mcjEwqFv+2FEVrbyKuQacI6XI/bv28c4VhsdkVTZ7r7qoy39yb/14zdlkRt3velbE
         bzwj6lL3PAEc/lQcIhf2f6MCer0WTN+qSbyRCzQL3YCv3GbcPc9iYHECWJlLE1TKPMjN
         JNjV+ulxXXlbqCXcuiOtLG9DSeXIA1Odm3OZrZ4rW3aS1sKLNugPHAdPB3FY7BkgHZKp
         9jzXp3D5tpYoaBxE66GkhhU9seqCOanyOO9J2rDaBjVTmimIIdevn9nfCT3dHYfqNvn9
         IpPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792934536; x=1793539336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZmVJXovP/SYcTy7+girXETRc+nqmLI60cP0gmYMw0Ks=;
        b=KrtQG2shgBOu7+Z0DtX+eCmMa0WXKipTZloNp25qZl60hLpX0BxBwduNRK8bvhC1XW
         RgY+tKNEWhr6JOAjZX6Vn66I7E+dxWry7bBpgsXIq4ZPCCgPZcw6qMvvgtLN8945EQCd
         ODLw9qW1p6brqcXm6p/PVhEABQqlL01nBUgsZc/DmnFGX4LH2sI9vUQzJQ8oOSQEGOt6
         Jqy+YuzcMFD1Nx9UVDj+43gBQORHA+QW1JiwqLaCzAWBnfuLYp5by6ZVE7RKRO1mmEh1
         mlrLK8gHIdOUoJM+c9VimTmsioS+w67YklsggVbPx9jCUiMvVErmZE0L5hFkUZP1Fk+R
         V9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792934536; x=1793539336;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZmVJXovP/SYcTy7+girXETRc+nqmLI60cP0gmYMw0Ks=;
        b=sRNqJznOr1TvuZ2STZHhoaBxl89bTa0FOUryoIHNdTNejyPiCMNDiu1kReSV76LV/2
         BbCz6hXXKO7zcD/S4VfcZRN3hfQMpjPeAG8VAZLKILivGN6uALBHdJ+Z6aGYOkBIrohK
         k+yqMnMHDHw+tAnbp28Ekn0BiR6SxtX23e9d7Yrxbvk9OrYJwvwDQUeeNdLoToh2MOvD
         7acG8TYaqJoxZGT6iS1Y2qj6uo9FJ9f1OUnCvoIhoDV3BTKkqZ3K7FE71y/KbRuXCrqN
         s29rKUpxboHyEf4rV7dc+mujjLaPbPRjJX3M041B5+scZhQ8ev81TcaYgHbiqPLNCRaT
         3rQA==
X-Forwarded-Encrypted: i=1; AKwUvBxQN0GC142B7xTW2Rb7OZrWXRZlzRHj0lBtoBXiv4d8vrqGgqTSP5IwmqlQLHIlJz7a86+l0tbZtZc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLteOPOBwg59gFPYY25AQNAS0SM7/EjrtL09EJLqDXGBbFAabZp
	ASHEkX6R88vPbvQa2xcwpCIrzW78dMdwr+92eJ+UbPTonWd1t0G2xH332Hp4qiURoPNduwS9Z2v
	WYag0Mdkrd6+Y3z4ilU3uol+v8tLHAmePEpeZ
X-Gm-Gg: AYBFou2Yv2sgkHZdkgFL7Sg4eCl538pe9HaKdW8PUSZWEToH/CI/7X6Pcsr7kKYvz2t
	YaWqEN51EA26cBB840iJOqnODgXbj5PaHAVLuFHC73ujJQPWPRi+epotAZLKzoSyOiq1XPE18wP
	UYvjAAHdRmedj8TOJFfAdHmPRTnaBoyfOefNb2xDXC+CEhcyGIF/dzYRb5GD0+w95v2i69yB5hF
	/F0DQVpJzLMPOmMebCkdZ7Xzrk+wAyHfuChXE2JEy9lvCbL3Qj4YmOwqdkbBN6WcYuyYeFQgnXI
	+d7xjH4Ui8M6ohnct4yybIjtxL5S/xAPRt/GKMfoeHO7DQtH29OXLdMtYfVlFN6X/V52/KKJCDo
	2ipGiv1OPgFfBLzig/Pw04LDVq0nfLPlOdvKEOXF30G0Nn4m1nDCx6GCvF3yvs49Sm6LnZEXl0C
	goOZ6YAmClJqWYb5KFb17wGxZrDVR+5skeZFxyfmNV4zL8LRPNFiU=
X-Received: by 2002:a05:622a:1e0a:b0:536:8f5a:64a with SMTP id
 d75a77b69052e-5383b5d8095mr65259641cf.63.1792934536433; Sun, 25 Oct 2026
 06:22:16 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-binfmt-typo-v1-1-459d4ae4c15f@proton.me>
In-Reply-To: <20261023-binfmt-typo-v1-1-459d4ae4c15f@proton.me>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 10:22:05 -0300
X-Gm-Features: AclHuK_RzNSAMZBWg3A6xIKtAXs72wHUSwnE42f611HZttmQYdbPl-cqobyZqvE
Message-ID: <CAMAsx6c7MVuP1gsOdepwyjostG8eYnkXrw1rttqFupiT_GmbKQ@mail.gmail.com>
Subject: Re: [PATCH] binfmt_misc: fix typo in "auxiliary vector"
To: atanaskunchev@proton.me
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	kees@kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026, Atanas Kunchev wrote:
> Fix "auxilary" -> "auxiliary".

Hi Atanas,

I searched Documentation/ for the misspelling and this is the only
remaining instance, so nothing else needs fixing. The change touches a
single word in the description of the "O" flag, and the fix is correct.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel


Em sex., 23 de out. de 2026 =C3=A0s 14:55, Atanas Kunchev via B4 Relay
<devnull+atanaskunchev.proton.me@kernel.org> escreveu:
>
> From: Atanas Kunchev <atanaskunchev@proton.me>
>
> Fix "auxilary" -> "auxiliary".
>
> Signed-off-by: Atanas Kunchev <atanaskunchev@proton.me>
> ---
> Fix a spelling mistake in the binfmt_misc documentation.
> ---
>  Documentation/admin-guide/binfmt-misc.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/binfmt-misc.rst b/Documentation/ad=
min-guide/binfmt-misc.rst
> index 9e84b877d06d..e37668371453 100644
> --- a/Documentation/admin-guide/binfmt-misc.rst
> +++ b/Documentation/admin-guide/binfmt-misc.rst
> @@ -73,7 +73,7 @@ Here is what the fields mean:
>             Legacy behavior of binfmt_misc is to pass the full path
>              of the binary to the interpreter as an argument. When this f=
lag is
>              included, binfmt_misc will open the file for reading and pas=
s its
> -            descriptor into the auxilary vector with the key "AT_EXECFD"=
, thus
> +            descriptor into the auxiliary vector with the key "AT_EXECFD=
", thus
>              allowing the interpreter to execute non-readable binaries. T=
his
>              feature should be used with care - the interpreter has to be=
 trusted
>              not to emit the contents of the non-readable binary.
>
> ---
> base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
> change-id: 20261023-binfmt-typo-bf80308e23a0
>
> Best regards,
> --
> Atanas Kunchev <atanaskunchev@proton.me>
>
>
>
