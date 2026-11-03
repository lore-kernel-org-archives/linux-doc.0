Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793675450;
	b=hagA6VR59B+SOvVWycLAil5fiXfTtb94EFM1rE2DOCZuv4fOzDMDGtx34Sa5i9XjzCam
	 RVZYssFuft0vKvDb85YaPvhRZOEw0CM4c3kwW9VtqYMcXcRix4Ddp0qTWSLjMsrmki40Q
	 FB6/6zsO+DVl7zjawAqigDDnicZMpv2ztSc3M4F03AjRlS0W1xisRf/zq+MR1ibNhe5KF
	 nxoj4cDkX6fEK5pt+1FQKq5Y8i3Hd47+Y22VBTdMIf2L235cI72qOwHnXo0C+bq34KOJk
	 WEY7TjNH8jrKogp/xJS0Pla1FdNWfBKjKP1HiFEbS4iUny/dv6VBrIYBuH2qYFQTQ8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I40CEUKGQGeVFrpde/Dw8amUVmDAEaeEzpfG41WG6Yo=;
	b=C3jJpbbljQ0FkwHZ9gxcxqz4lcJ26HzU8OO7PlX0xd247SvmGtZJp5aDvhc3Euy7IIKp
	 O9rtY7GDTWTDiyMNLYLmmbcsYbyp6vWhTZvKsVGhMxG5bX8Em5iHBEhEzB662Q38YoSnG
	 KKq+DETwam91lFGol2HcBCuXVLvdZowF67gDopZiltjFxfj97vIxJZqO4loE0KLeYErnl
	 HRdr/qyavyToJb+Lc6v5y0UyXhElNcZ012FzctMAuarV75jhjdkBhjYHGL9oBAIpygWOC
	 AKSHbhZfSju/JTJ6NBrFf2brgKbPDnnoI1KLr9Y2Yjry8pmlC1Dl1u/1j+a+bugEgkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kd1d8neL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390F7606A32C
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 03:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 390F7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kd1d8neL
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-917a707f37eso40859476d6.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 19:10:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793675449; cv=none;
        d=google.com; s=arc-20260327;
        b=CbNUke67S2xti6lv16CXAfSR8RJPLW2bTnxesSvCLEwlXAcgyl/FOHDKFMCTJjey1U
         qkqyTMAwdUlWfWRj0tNvZHmVuStu2DvcVyjAqWIgC/flsxIFBWjksbv4suNfpXENmsEp
         6XWm+50nf/aWrLpHcvuc2Mokc5aTQIt0F4oYIraKpAoO2rEjSVoIRCDSRHFk4gtaPOUW
         7IvcqtRKLZUZxB23YsNPcz4+48anbAWtky0YAPoKTc8kFtyJN5Os3fU8nsZFw111Ql5a
         BdI/1GH8UAxDjpcWEmAYgT/nath2YujYGWKS/Or5R3DhvtVM93g7Rm2vyHy3vty/rumZ
         YjQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I40CEUKGQGeVFrpde/Dw8amUVmDAEaeEzpfG41WG6Yo=;
        fh=c95vh13YOxOMWSpwxbl1NRJi784cCPMb0chrItKiURI=;
        b=QcjS2ksFrfvjm01i5zqXrukV5eIu7Ui8hB2FbanhJ24vmmQRVlPld//WyOzlunNvVC
         LvpB09X5hsYDTjWueQY5dp6jmx3iYtbi9iFnoWIe8vmpI/vUdMPdvL0YiDrSHH0Hk2u5
         ptUscR4Mx/VzsVs7lWVCC8/4mbkyVAaDIHNGOUQne3Rpl6nf+iYzvpNV334EGvyR8fjx
         flpuRSuvixXoYcwrz8js5i2C6fjOQQiQEqlQoy/Ms4QsCTOPb2QDzjtpkPPZC+yR8RX8
         b/3ORgQmXox8qKqrqVBVx6eTAds8bKBJ8qxTF/WbyiAl0N0CKNX6WRgb5Fs8xYAJ4SxZ
         idYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793675449; x=1794280249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I40CEUKGQGeVFrpde/Dw8amUVmDAEaeEzpfG41WG6Yo=;
        b=Kd1d8neL3mi0vxLQynuwHhuLnYrGWKsrp4eFh+ak3/BEcqFEIvh4SE9c1aFOUkFpj1
         LrlWaigVkdNr0ONMHJ/Ov+9IaNAqgZRVBLi2Va8c5TQBBZV5bq0h+RkjByvrFDPhoLqM
         9qC1Sv4LJ6L5F+rgqYap02KwM5gF10n5OVLPgwWGU9C6kEYY1ml6Tc3jnfT2ZlLVvjVT
         UIyiE1VZMpDui6NVZ0bsvdlsG3DUg8mskLI4PEIt4As1FvyMz4BvOImX7uTotWoaQ9Cs
         7C+QYuYstD+hM9EtUZXDZITNJ/G6Rp0MpcdwoP1BVq+fl2r3MvKD0gAT6Mg04IzTD6d8
         uP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793675449; x=1794280249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I40CEUKGQGeVFrpde/Dw8amUVmDAEaeEzpfG41WG6Yo=;
        b=MePvHBfBSJY+OqK9Zpk5NdfkxOYvatxWpHln6A8WgC86g8IGbQ6x+6w/Rmcl5EoOoO
         CB0ffHa7gEwlQdr0V/uAKSiPmrV8aPvSanVLC+6OwTTZ2f+WSu+LMUUu/QhuhDE7jO5f
         B6vktxiTb08qRTK04SxFK/AG+WFWYl98/k6pasExHUIjq/4POz5Dc16n5zd9nza1hF0b
         PwBQrsANmqfAhmHoZu2DGcMOG0+bVj84ijiP+6WiA92k+L9rqQ3G1GV8V62H3CFFvPaJ
         xdZn2lcQqytonmr0vJkyfWe9pHPj9DkeG1nuPc8SaeXVCkLlznXyaOi/SQwqCZM5WltH
         D2gA==
X-Forwarded-Encrypted: i=1; AKwUvBxCKBf74+1mrinuRsFveuMvMw5jaBShDPNKiv3IsoOxYzRcTtCF0E10LVHAJ05YxdRe8tqw0rw+FGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YxyyGY4sUooydD793wW6BFRxxRVEDs5nCbIsmbm4aytGZeGgw
	6L90+PnRI714oh1yifFtNQdMDdVBof1a139MK/aGh00q9TIfeRQzL4dgU+6x1v97HUO6dPctSoc
	l9nsBXdrN/HSHd82hWoDY2j6TqUJvpIU=
X-Gm-Gg: AYBFou3VRi8u112zGfVBveCVmRoVAoLwO4Ak81xbvJ5Eu+KKIf/F+VneYZmm5pE12al
	jILCYadl0imhfwAlro7hkznfYXoDrOysORno4ZmExa1lD6YVBZbNUtFz0hRLq2JHgtDA5TDuJdf
	RTBDXj+8/molVd/fXSJtGiW7pf3vkT43jBTxrfCEWxTjXmfBnHRMWLspVpkrZXnxGsNo8+8brpi
	Tmb/NO3fCDNOFbRx+EXimCe76wPnGcLeARRTz//Z90SJYD+kdW78fG72icSrQmKgY/dD4oYUlJm
	XyjN9Tne5h2EGix3BUK2QpjKE5mE4ARJLcx2s1sNxl3TXfY94MYd1Ma1lzK4kO63MjBESKAvCuf
	xN80dXVPJxh0EdBSKSXggeH73igFCFmoPRU/ijXu7qD5s5lysmg6JthMfEm94sguXXt4vsMdgNB
	PtYjECV+BckxfuGuEZPVkEWrIhj8XtwppYQs26ROiihYXkTQUqPQXmlDOOcGBTC8NjsN9OudCO5
	0M7lcpLaopLpXoHPSpFzcm9HE0=
X-Received: by 2002:a05:6214:2b9c:b0:914:563a:b3e3 with SMTP id
 6a1803df08f44-91ca4b50632mr206042986d6.36.1793675448953; Mon, 02 Nov 2026
 19:10:48 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101194423.44459-1-ygorotavio.sjc@gmail.com>
In-Reply-To: <20261101194423.44459-1-ygorotavio.sjc@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 00:10:38 -0300
X-Gm-Features: AclHuK8GVbGdwEglxUYkowJRdXZFoN7I9cbuMHab-05gEXheEypiH8GnhkOCXL8
Message-ID: <CAMAsx6dCFZPfViXMWidbrRT+_xAN1ZMJKecU5yYv78x5gJhMNw@mail.gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: translate process/generated-content.rst
To: ygorotavio.sjc@gmail.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ygor,

> +Como em todas as contribui=C3=A7=C3=B5es, cada mantenedor tem a tem a di=
scricionariedade
> +de decidir como lidar ou tem autonomia. Por exemplo, eles podem:

"tem a" is duplicated.

> +tudo o quesubmeter. Se voc=C3=AA n=C3=A3o for capaz de fazer isso, ent=
=C3=A3o n=C3=A3o submeta as

"quesubmeter" -> "que submeter"

> +mantenedor possa se assegurar de que o autor entende completamente...
> +como o c=C3=B3digo funciona.

I don't see the need for the "..." here, since the English text doesn't hav=
e it.
Thanks,
Daniel
