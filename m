Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751996;
	b=G0o6gfqMYBP0+Ay10Z7JWFp32FZ1lY5bjkBui1Ebj844Hi7doVb2FvSYGT4mvthHQx1w
	 9NBU637sZbSmaUkaTjKW2u4xf5MhP9piJQCP5d4Zl5DbK/8RvPZ+HuAxXLkw8naZBGdkB
	 iL5fcnfY8oYBgBjhGY3cQ9xYa0Q7TWfFf760CY2IBPHrzru//fMg1ZpP9h0GKR7MLLMCF
	 x3jVgS+Bc8iU+MEML9xc/jjClImWCJff21dWjWm842NezldE9DM63eIY8UdL1Ttw5sugg
	 fBPMiUJNsn90O/CZP2gCH81vYqMvCl0GNDcFfhSBHSAy+3syhG7WGmcmocxFX3oi6GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Organization:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=aePbxP12bi9+JzkDwE4dblQZtnAtPL3OH/5MvF5gIsc=;
	b=HCOuvMsl1m8N1gHU073uxGAq2SwAk1WEKFSjXFuXp/SHkX7h3h5xrU1wpZh+D/EBvCH+
	 9XuGv4nT2237I/y4mhORkUA5n/8htyCuT9pnApdHMWuk4VHibJ3/DbJ1vzVFewR23TK03
	 ehiLZZJQJmKj5QV1XnBe6rXu8d2YOex9egvkUbr1JWFO2KV5XTMWDZDtB/TG0SxZt3ULN
	 K036YZf36vNtIVUnMllDGXaEuR0+9tRonr3F1yH8G0kdIWbxnjHdh5jhEJYW2Tm2htFXf
	 WDj8QrWP5sNBNW6G77TprC3ZLEZ3uD6P5WaVNU7WqkvDWxxmG7/TCTq1JFSV4DhucJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QrhlYS9J;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790C2606A31A
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 790C2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QrhlYS9J
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so575536f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 03:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792751994; x=1793356794; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :organization:references:in-reply-to:date:cc:to:from:subject
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aePbxP12bi9+JzkDwE4dblQZtnAtPL3OH/5MvF5gIsc=;
        b=QrhlYS9JPq7JnApjBXfRmjqqe4dNo2BW1dKZxKhsHlgdnG8+5QiIsK+sTo8d5NTrR3
         uWL3U+s6CEPmNkiIqq8g2iq94WIayXCdetnfnmIzsQJ6Fb0WzeJ88NN4n7lAwX5pKl1C
         YZCnwU82I/rXc5kk9r85ZYypjhDys7+VJfnim8KgFjDHVq/tDqBu6h+JiplR2skAxuPU
         EyxVXPRizn3ISu46j7omzgg8DbvKCwxcC30/pjVcFjQ9HkAGMWBAN/xAJ5yu0MIi1o3K
         VhhP/x12m9ZrTl6La3MGoRKwN+cZDV/qqKuKyENAmh6vD6S5wXAZEVaGJiAq8ERCgAXX
         8zeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751994; x=1793356794;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :organization:references:in-reply-to:date:cc:to:from:subject
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aePbxP12bi9+JzkDwE4dblQZtnAtPL3OH/5MvF5gIsc=;
        b=qsU9Qz3tUSYNbUfBxfNBPp0lVhbvdQwR8Le4lJgihfFxaRt+skHFZ7nAnLcH0Hic9V
         rgeQ10J5Bg6dWe1qFBjc+V0V1GbRajcLi9J4zDfeLZfZ55MC1cbXREQe2rPdawOAj3Kk
         G+GwGy++XlsTUVTzTcelHhGyzx9qmvYIUoBUas9GON+DLY61ZINR5SG4rpewBXzO5dQ0
         H199OUBDVD/FJhuv+JVlVuBNG2kthvLWAoRk+OAFunczK6XiFlWHeKoFQkgo25Mow31V
         tT9KM0TQ4HfIOoENrVJ3yBFmW249IWKeRgMLz6O7zYZDmEOS1QK5ud1DBCe3woYi+IUS
         1CUg==
X-Forwarded-Encrypted: i=1; AKwUvBxfs23ot5B8RvPYdJG+6q1V8js4MjCjL7jGV0EhtFy6/PXv31cNgtZUKFxtwBVi7pTQYQOoShnmOlw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDOwGpd0WW2BGittb3oEShbSpfesoDLW9lS1gq2Wu4hwFdNKuQ
	TnMiA/htHGhCw/bGXNBdCFY8VHFL3zEeh/bj7uJ1BcOXlIDSMZMKnWLw5ruQYpEEdPU=
X-Gm-Gg: AYBFou34u2TtnlqMUnCqgK5bM5qPuJyc0DzKHBG5dVY5qtMKDpiMWEJ53GuK9hkpnQ2
	3XYSizesJblW36aackLz0unAj2nX13utjXB6u4XjwpwG3Re02p+GXCyAJZRVkhq8vjKwtwQAkXG
	fH4Op69oEaUgoK/LjjtaNq7woSOldZuCmnhHBF5uWvuDhmrcaKm59UZOetX9yaHsYw0u2gXZVg1
	gBDfv+p1sdg4qqO9UJ64WV02wxEXEA4f/LrXBJgtkAqman07DgceZ8qAmwJ6IFQY2jyLGuUIQ3B
	zDeHYBIe4kIFFgYSfMscBKBeIKbqVi99PJbjeBo+jzajSCBoWu+oLFMUzMf88TDznV+Ycoky4HR
	oa+9YsRwLgTWlNPejlenNgcgkPq8p7Z7z4mNEmtxrN8QEXT2sJJOObH7Qyl3BGHSc00Y7CVKm5F
	wToLiROIiHpyUPywzEFExY8x+COhblasOV+KXRH1puf2peFCCj16z4kBBN1Bv86N7IrGN4Oda9P
	WfDeK5g9BdVkb4eVD3XfYkswPzu4npbcit5oKmuDivzCcEKNg65RPqsLGavVe4QwN2bFkGuHoyx
	4phdgkbk3bxY8fp6w/Dm
X-Received: by 2002:a05:6000:186c:b0:48c:6cdd:ba89 with SMTP id ffacd0b85a97d-48e385bdfeemr2784852f8f.36.1792751993862;
        Fri, 23 Oct 2026 03:39:53 -0700 (PDT)
Received: from ?IPv6:2a0e:439:c2d1:0:bce8:4acb:ee53:8d19? ([2a0e:439:c2d1:0:bce8:4acb:ee53:8d19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edce4fsm4566663f8f.6.2026.10.23.03.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:39:53 -0700 (PDT)
Message-ID: <0bb53b3f00e9a1a834e32979bd1e08ecc4517411.camel@baylibre.com>
Subject: Re: [PATCH v2 1/2 RESEND] usb: gadget: u_audio: pass channel counts
 explicitly
From: Francesco Lavra <flavra@baylibre.com>
To: Kyle Farrell <kaf@nwlink.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Date: Fri, 23 Oct 2026 12:39:51 +0200
In-Reply-To: <20261016162534.384844-2-kaf@nwlink.com>
References: <20261016162534.384844-1-kaf@nwlink.com>
	 <20261016162534.384844-2-kaf@nwlink.com>
Organization: BayLibre
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-10-16 at 09:25 -0700, Kyle Farrell wrote:
> u_audio currently derives the channel count from the channel mask in
> struct uac_params in several places.=C2=A0 Instead, pass the resolved cou=
nt
> explicitly, so the shared audio implementation does not depend on how
> an individual USB audio function represents its channel configuration.
>=20
> Initialize the new channel count fields from the existing channel masks.
> This preserves generated descriptors and makes no change to user-visible
> behavior.
>=20
> Assisted-by: LLM
> Signed-off-by: Kyle Farrell <kaf@nwlink.com>
> ---
...
> diff --git a/drivers/usb/gadget/function/u_audio.h
> b/drivers/usb/gadget/function/u_audio.h
> index 9512b8fccfaa..46e1d6b5ca4e 100644
> --- a/drivers/usb/gadget/function/u_audio.h
> +++ b/drivers/usb/gadget/function/u_audio.h
> @@ -41,12 +41,14 @@ struct uac_fu_params {
> =C2=A0struct uac_params {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* playback */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int p_chmask;=C2=A0=C2=A0=
=C2=A0/* channel mask */

With these changes, the channel masks are no longer used in u_audio.c, so
we can remove them.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int p_channels;=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* resolved number of channels */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int p_srate;=C2=A0=C2=A0=
=C2=A0=C2=A0/* rate in Hz */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int p_ssize;=C2=A0=C2=A0=
=C2=A0=C2=A0/* sample size */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct uac_fu_params p_fu=
;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Feature Unit parameters */
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* capture */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int c_chmask;=C2=A0=C2=A0=
=C2=A0/* channel mask */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int c_channels;=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* resolved number of channels */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int c_srate;=C2=A0=C2=A0=
=C2=A0=C2=A0/* rate in Hz */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int c_ssize;=C2=A0=C2=A0=
=C2=A0=C2=A0/* sample size */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct uac_fu_params c_fu=
;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Feature Unit parameters */

