Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793651082;
	b=ZDHzo356AItBn1wymUZ3KmURD4uY/HDnuIZiO/YCR82p6QQ/Zg+c3HndRfZJHfC8TNUb
	 EhpulVL/fvEOSLF+JeD+BgKURsk/UFWwjlhcyhaeFyReDGtmwtqquXGJKQKns7UwTx75V
	 winSvvldLnjPFtielNc2qL9V+kQ3IB1ZTNmq2qDurK+YXBbN6STtblpilXXKnytDFqGAC
	 HUj9DgX/FZhIezz5x7YvHBeE9MCvD6s8hP6WtbJDSjawWbMbusQe+EGK+49C0K15/Lx1I
	 AkmL8KCXrEjbRwc/ODBq7ihcYvv8I2PyUcUBRN4Y8dAP+6UGq60UMktetqxrrKqoIWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pRkX0U8+HuQCFFzjR90UGSol1Deg6kqBr45BiznV7xw=;
	b=jYI3LY5Bn0aJpVCQkD1bLn7y5dskWhP5Ev/ctgB4TQVMyIJHRjqf8q+JqRNCPEcIW5HK
	 pHaHyNrE63fPxEo5YVSjN4syqgFPx5j4k+2GNhK5dU1fafYQR6XVoadw80JceiXiuxVrm
	 EQXxT1ughMfzbPZzxFY9vIGBu9+ph4lTMfOv+2Et1X2Lh35mGO88IlGVJOuxQAZ6D03+o
	 wELodSWumIcd9uoCRkfv/obdg/XwUSucwQwb8pGIjshJT3K676RGwclfgqHz94v9s5xjg
	 z0PcaGSYNrS4ml6hY1lJQJ6j4nehpHESTWM6PCyXacBi5aTV/ZIIv5g6Yh8LofpdvKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SvOmcQSh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2657A606A32D
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 20:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2657A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SvOmcQSh
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso1868a12.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 12:24:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793651081; cv=none;
        d=google.com; s=arc-20260327;
        b=ioUO/1mOuQbEoqewqT31hURuYHxwQwYgkI+rMg/idfnVpHaKW8rZF00ngJZ65xPo69
         ZmziGUQfdlbjrmcpC9aV2BmGK788+LTMu9VOJVfgFFDfonHWOmeO0iXbXmqFy2kfGML1
         1kfgDHedXuYVLa+XYU533mOd6BnIHf8L3MTUb/3pKLYsH32ardzGC7YliG0NCH7QGsTc
         DqROhJ0qHCtOySSBVdeSIuk2tFj12JkDXy5/yfbcSv8IOqaXjjVK39ZoCnRpJG8bGkhx
         oNpcuzzePkPWaH3xCWEQLjhkkzuIyIg3GrUjBa9LWuRDzDh//g6ol6p7IkViB7mRHDbj
         ZxHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pRkX0U8+HuQCFFzjR90UGSol1Deg6kqBr45BiznV7xw=;
        fh=Y3UpC/bpORa5ayEd0MgxH+jnGEPUHzTDLPXRV7Wjj+Y=;
        b=LWrL3/J4g8pB4GH01VFisTeuFCOxt/ZFlW7/V4HC7K8jYl2jVqgm2pmqK0jZd3Vzbj
         wB/XaMBZ/UPhKVccMaLs612dUKaKfwmbbe2ew8/4ruRG7sIqjIsCaDW03hZUbmPIbSFa
         8Iu33SHiuaQLgMg461Op6TUh4z6TtHlNMDCFhRQW35KVHWUzxsACp+h0LcbC0R64kZKs
         6Rq7ALMoVRobuLd4vkipBbvHwMMqeePEN6xpzuCTzGYIgIzhy+o6crGlGQ0sc7utXb6A
         XNCCjBu5CO4tF0srylLPTZA68wZ0PhcvfApv//J2tEytG3C3FoYHDHEw6XGgSANTQfN9
         YpPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793651081; x=1794255881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pRkX0U8+HuQCFFzjR90UGSol1Deg6kqBr45BiznV7xw=;
        b=SvOmcQShy/Lt3LE+GpGQ7EhkwoAJ2Oh4dl3DKSKKoUDkMaOirBiVW7+e7Hcr3SqfjR
         SCzAzbBMhDNqzD5P+3DXQjwFtm84mTA9TiGZW9kYlDPzlPeRS5X6qXrkHLehuL+oXz/v
         a0tJQ7+URmRTDMS+dmS4t0JA8BOePVO4yJtsuCe/+i68+3svgEdr6NJ+9BSxzhGWJtzX
         D2+3vrhzSS4IGrh4b2ds0fRUX7ytMKUYob9XWOVLjynhVmM+QgInZDmbS+O7gsLrBccc
         92P5mgdx9E1rTjlCF23JPDzYMGMAom8d73U2aOxjDZhf2pa+SJ4+HkV7kOYcZ1IkzSGp
         QoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651081; x=1794255881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pRkX0U8+HuQCFFzjR90UGSol1Deg6kqBr45BiznV7xw=;
        b=yEtVL6BXKhUDLdYRM0MHvtnRcGgmabAJSnLLE0L55Ezijmr7FLanWM0Qd2XwrijWTE
         PQSrWqB4tcXCEZK+GtxQ4uB3IEBTttKNQagV+0RqpXiT105DUGgeEooYsQa1ey6jFytv
         cHll2WpHqUl+F8/V+S/mT7vXEnjiVx8WXT0gBlrwTAVXmkoheG90uB8iORtUFNEiJUAP
         TLKcWHVJWqgEvhPD/pcyKgrH3nl52UxKXjN1JaIsKxAFnUcHwVT8suc0eMZ4zz5lZ1/l
         6YsPHwnUjrpg+LRYoymQlMCmMf1P5ZnnEvvsKNrr18GPHhjkXcHeWd26MGP3CY8D+Dga
         dJkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxARFUSV+Vi0mCkIy5qYJNOFlfR0bEX+EOeayijOO7PtuhqXmnz12grrzs8y7tBTzIhHGyaQrnHc6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/65VmFXDHkV390rf8/GUSd2lPwjSYuQHkRXXXe1sonuPwXE766
	8AHtUlw6I8RlNL1IZijsYVkgQHVvBuLN6N/xxlK2Rs2SYydYMpvOfVtM8w9VFIWWxMQkUWPt62u
	JQcr4T1MUotTz6LHyPhjS+uPvYRDZhCBHYcZEKa81
X-Gm-Gg: AYBFou2Ds7f3f+hQzO4OlANXUwcGztyuDbarYhC4n7qRR0jPzH+nSjCGu5FFQv661qX
	/FzTXBsJ0KI2rDvJNGI7VseMSz+Ee0qEgM0HgSXrYEsuLZAaSTeB5wmOSE0mY+ehPhzJAWaJNP+
	SBTzfFUkZ7Z2zcGeh7dLDpc6ZCe/TpVuWat7I9eAlOvE2Fu5xDkV4CJ1Ry0AMMX8d7LSq7d4UCF
	FlmPenJV7dTajsMGifUm6/n9yUf0CeFZ1NWXxnb0kzKITo5l/4lvcU6xLEXroYZhV9ZeLDn7c9d
	osjcC20U34ZCjUa6RrclQxpOsCwsu60kr2JUsvZ3PPXValIyUNNY8vxTp7uyhfmkbF7CM5+9Q7u
	0d8Gi/xB1FZYEXaFkceK1SSZAN/v9InfCmXGMKMFO/FMdvV/EJC0JRMyFiuDN2INRlpQMZ/iA15
	4PQaH+PRMVOVAI
X-Received: by 2002:a05:6402:a20c:10b0:6b4:6725:f2c6 with SMTP id
 4fb4d7f45d1cf-6b539d6a214mr5220a12.13.1793651080182; Mon, 02 Nov 2026
 12:24:40 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-4-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-4-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:24:28 -0800
X-Gm-Features: AclHuK9HmthtDhK5Se7ln97xEjRHJQkrIbx6CEUxI-rYHFFjq-AxT46s87UOWio
Message-ID: <CAHS8izNMpH-RJm7mk=-MpMMT6nc1_AukmLVHmh2r=AoyBmZPmQ@mail.gmail.com>
Subject: Re: [PATCH net-next 3/7] net: devmem: use niov_shift in net_devmem_get_niov_at()
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> TX bindings use PAGE_SIZE net_iovs, and the TX lookup hard-codes it.
> Derive the index and offset from binding->niov_shift instead, so TX
> bindings can use larger net_iovs. No functional change, TX bindings are
> still created with PAGE_SHIFT.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>  net/core/devmem.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 32fafbfa1359..6339f221bc82 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -455,13 +455,15 @@ struct net_iov *
>  net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding,
>                        size_t virt_addr, size_t *off, size_t *size)
>  {
> +       size_t niov_size =3D 1UL << binding->niov_shift;

I always dreamed of net-iovs can be non-power of 2 and also can vary
in size inside the same binding (no reason why not), but this is
providing excellent value anyway.

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
