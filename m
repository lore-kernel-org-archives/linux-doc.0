Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA4E47AF5C
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154966; cv=pass; b=G7bq08bht7R9ABnqCiQRz3iIBZrsXMsXAoj0Jln96+Bjevp9xAVOiUShLtdl5aOD8HcANN/aIXahEe1ozZxpahFJaTQ/ed2D7/zYbxuaF4gK665+tAxihpXwujFyzH9hiOhE/Ob0voqQaXjbraf4clQHjyTjZoFxzbdEjw0LM7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154966; c=relaxed/simple;
	bh=QCNVGM6JXF/7JnLS+3lu6Q1utffymbytyo9HJaN2nbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3pQkRCiNepEBxJSY9fYcU5tTSvB9cYPWQr5gVZjXHqyCxx/wH4SiGHFCkFd23tncc+MT4qmHOQFIiDaNRJbbvUo6mnPMdfECa6ioK3TRC58T1U54sH83mGz0K8aJBvdsRCg53kebKODtXo6/YeAQQ3jrCX/9fR05buDTUZX6ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUpvuDWU; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUpvuDWU"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8f0e5e36912so8919226d6.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 08:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787154964; cv=none;
        d=google.com; s=arc-20260327;
        b=XljqLFKsa3l/j3gIqXGLNAYoQiW5r4snPC97bML+Wo+wdtluZp9YdnkqfijbBMe6V9
         BCHd1PI9EHrBKFmBuXrGtfHqjGqGnu7lW5LlNGUxcTLyfBtfK7ZourAmQ+5L8kLbR/9A
         +7OV9LXK8Jvq8Donf0lE6oKafN1jp1PAHq0jlOrvLczogmEhtwlWM3ou84LlW0j8nZaA
         RrGPGyiWxqCw73R2GngRSZ9pUdC8QmZjgAEbXQhXGjrrDmko+KjOlPTq01k8XbH/edi2
         GOqXT8goYGB1VO67M92x1ipaOErkJlfPe1bLlXd9Rd7CNBggwjc/GX6/F1hJrG1yWun2
         IFXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=luqgKeY9BCSFP8cqU5Wk0SA2ZSLwx1JOWvC8sMgRww4=;
        fh=4eGu01zDmUP2ZHFPuMquR8KZGwu2vG3Xen4X/zUS73U=;
        b=f/dWtGKIfGkKlVrKnmGsRIA5ntHC3Hao1Mk1sVcGpCFUK5FTW+RkQKkI4+ZlVTBcB7
         Q3NjNuPxBUf9GoNIQhnvK0j7UsR8DHeeQVlto8B6hVHa5z1zDWDftODPXvg9HeKU1UK+
         2ehHuTXaYWypOcDDoaExXQKv4E+jmvPROtcxUzqZn9C2Dof9sFR79/3WhqJii72QV7jP
         mocJHWWc9qkwvDpVVMbWXkDVOMrSYlacDon86VF1zBazaN/EbKUVcQVxFsFryT7vqltv
         0EHwDegfRUMUV5D/MV6OKKBYEyOyImB7eaaMpXmznlPnqgGcDZm4jeYBTJ3eUNZcwzM5
         +sZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787154963; x=1787759763; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=luqgKeY9BCSFP8cqU5Wk0SA2ZSLwx1JOWvC8sMgRww4=;
        b=kUpvuDWUN0iSWls7wvdw7a7lHp0AnzVBhPNYeNHhDagm7ncoLv+n5f54AEsAhkpdee
         TjzP4D3PtncpL3oG4gL6vyh5IBuE9P4kMG58txhd/UsYJGblhoFU1PdsM1K2SKloxo61
         hjpG8t9LnKBN0O+9HWFTTxRCoAqJJz1dz8gUBYkZUtF3W3d65MweQXwh2+uDjCzWjK7K
         K2Bf6icGRk3GqzkMO6JtLnt4suuOpSdbjVZDzDSD4z80+WVzCtVPZ+l+lgnLytRELCBj
         MTpGe91tiQY0B/CDFkRUCFBLUF1+nrAzFhyPzgNBMrZXeTQwPMQNdX/K/UFRTi1e7jsI
         X+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787154964; x=1787759764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=luqgKeY9BCSFP8cqU5Wk0SA2ZSLwx1JOWvC8sMgRww4=;
        b=BFCEmIp1Rs2f9UJpk5HwxUbqjqHYWm2vdQXVHoFX0xQK2NFCnf+8SpCIdk9yP0edC9
         gFIeIsW1wyhzXxTYH+uOH1YNbBUYGIPfeP0Oi2iccST422VQ7REaRERAUUpZA2XTO4Ba
         lOjWqi3ZwfW0NsLPRMP316zBIBfmx4BcGpFDdleF1hc45xUbJU+4IlUxXvKGbMF6JSu4
         Hf1zXjHN0x9Pb9jUts0XnRnmFVlzO3qiOLkkK6gTdVq6WjHmpQsR99iqZGTY41p9GtoG
         Sj261e/uwLvMaQWQYoPA3Z0VGKJEmOZUA422KJizVNy5KDvXL+GDA4iI7AO5XMTRMVd4
         7D5Q==
X-Forwarded-Encrypted: i=1; AHgh+RokqjS985pPafSt6sKKrpPJoA7ahdJIXq5IQoz1vYEPpnTacu/0ze+x3JDOQ2kabiBEYCLpfUl3+dw=@vger.kernel.org
X-Gm-Message-State: AFuF++lJUqmwXjTq4uiv+C/qzXXdXiodP4k/iwrIbvkKtxrneLE5Bj7J
	IhnVsAVMWrId8ZntqwAMbAY8KZURNXZy2d3doVtNEiZBMjHb8h10oMTm7p2/7bPiwhpvDQcF6wt
	wUo096DYCzRFnukr9jcZ7Tnqks7qIaHQ=
X-Gm-Gg: AR+sD11ZiR9DuW1XDIhyWElJxKKnGF/Ka7ztBINj+hCzq0vxIXzizzdVYOLE2NDV9e9
	urZYBZ/gZWduj810mvi+KZbmrRbi6jW8oKIcLIOGnYvNNWx/QsqFqAKmTkQx8LwstIPvcINbPKT
	0z+IbUrCR64AMwzZoUc00h9RNznwE5w8cBhHLUKaLMzirSlW+aeFFE8Dl5aZDFxRCRSgNFgqqmC
	bGvBlZwmyefYRYaQ0s8o/18rmlLxs9dgg0Kre8oAkdDMZUuPgsDZm/IVRPetTNYWLr0H8W6CLcp
	UW/43FobUBt95u2EwqiNotwTHuPoyEuAX4OdGEY2bA==
X-Received: by 2002:a05:6214:dc5:b0:8e7:8d53:2417 with SMTP id
 6a1803df08f44-90c5eac9942mr52592116d6.27.1787154963571; Wed, 19 Aug 2026
 08:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813083536.970196-1-ansuelsmth@gmail.com> <20260817134727.1f76d6dd@kernel.org>
 <6a8376ef.be1895d6.92f57.c9dd@mx.google.com>
In-Reply-To: <6a8376ef.be1895d6.92f57.c9dd@mx.google.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Wed, 19 Aug 2026 17:55:51 +0200
X-Gm-Features: AcwNN1WR7Zj_IFCR5YdVpGhfxkJspgU8SJdxW5GIgyyCDjlcNc7jn8kiW6V-vUc
Message-ID: <CA+_ehUyRKtuCtak5XD_1LUMEmLTn4JfeSDapsAEwo304uxyVqA@mail.gmail.com>
Subject: Re: [PATCH v14 00/12] net: pcs: Introduce support for fwnode PCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 17 ago 2026 alle ore 23:02 Christian Marangi
<ansuelsmth@gmail.com> ha scritto:
>
> On Mon, Aug 17, 2026 at 01:47:27PM -0700, Jakub Kicinski wrote:
> > On Thu, 13 Aug 2026 10:35:05 +0200 Christian Marangi wrote:
> > > This series introduce a most awaited feature that is correctly
> > > provide PCS with fwnode without having to use specific export symbol
> > > and additional handling of PCS in phylink.
> > >
> > > At times there were 2 different implementation (this and the one
> > > from Sean) but Sean agreed that this can be picked and used in favor
> > > of his implementation as long as his case with race condition is
> > > correctly handled.
> >
> > Coccicheck says:
> >
> >   drivers/net/phy/phylink.c:1039:31-34:
> >     ERROR: invalid reference to the index variable of the iterator on line 1028
> >
> >   drivers/net/phy/phylink.c:1364:26-29:
> >     ERROR: invalid reference to the index variable of the iterator on line 1346
> >
> >   drivers/net/phy/phylink.c:582:7-10:
> >     ERROR: invalid reference to the index variable of the iterator on line 569
> >
> > I vaguely recall that you're supposed to make a copy of the pointer,
> > not just add a "found" boolean. Dunno if it ever happened but Linus
> > was trying to make the list iterators override the pointer on exit.
>
> Oh! I wasn't aware of this intention... I have seen lots of pattern where
> the last value of the iterator was directly used (if detected valid)
>
> It's and easy fix... I can send a new revision right away if you want,
> I'm already on it fixing this in the meantime.
>

Sooo should I post a v15 with the fix? It would be great to have this for 7.3.
