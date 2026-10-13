Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6CF2BCF4C
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 01:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791855914; cv=pass; b=AIJSV0D1/Jj1ojVqg5LD2tIjXSCTSyOJRRaOEDd7aJWTonq/Vxw05AWAP1r/Ne4WzhzmBF07NRYVl0ardIAD6q5E8oiGk1UTYRj/sSjWhzAvtZXE8P8DykwAcMB4dmG227/JVEdRNmYVYSU1H5cROmrXOx53Lt/0xq30N2FbeqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791855914; c=relaxed/simple;
	bh=cz+gED3n3VMR1ENKlJ+1/sgawu/JrM1+H8MqpXBZQP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJd2HH2A5701jqNA3hB3mIcWd2emTDnIUWWFgntuZLmNcw8xSJqrbOiepZsylX2B5FfgVfK7s+8G0ud0IfTTtNyVJ12n2s3FWyFCfnXvB7R0xK+5sY589PYZFzGd396h80G1Ul4F8uPe9k/MHJSNBUHFhyf8LXA1NyLJO+ZEdC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXsEqth1; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXsEqth1"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5351e6a2230so23640151cf.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 18:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791855911; cv=none;
        d=google.com; s=arc-20260327;
        b=ljUavtrgkXhgEOLZ3tVe5b26ahGKdY+68xWMeb1aoPkswG2ovHDKsoXOXnpiqgKlho
         D42aKwXEzB9NHWdGW74UwLgI3y8r9zZZdCIdu4eHyOTj9ha4dJbSfQt1YS7xXtqcwTRm
         paUrKnqUDf+sb8bVlL3TOFZ99anKQcF1x/FsExyncgnwI0DSoTaUztyQdOX+yYQxW770
         ddnqm0RrrRfiz3GRPZB7HoQ/O+/U9WbBL7/CX8b+7mZRRmaDZZtjuUa1W3d/kjVwaYaC
         BXD1VrVIxCXmnjTeOwIdxwTkLkWpEP01VOtUT9zNQwcO45uIynfWlgAQbqAd6ZRSc/G1
         76+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cz+gED3n3VMR1ENKlJ+1/sgawu/JrM1+H8MqpXBZQP4=;
        fh=PgttDRi4jzFIeGMNh54UMNt4+Z7HU+ff+EoFoGNRmHA=;
        b=I3f0oJXp510/ULH9nu0fVn6+cDKPfR8NAnMxDIlSryJZn4KbcEREvJi6Hi/4hBf2H7
         NiuFkJg6vuaOcspBY4vdHC2JKQCdyRwrvgrNzB3xDLacqG36zve4V3kc2CODBAH88e6I
         GoWbjy6TlOi6s/nhKlnc41rLplZLYpzQ2udB98XZ2DxEgbm6eQMl6HB/aA/hTJYemNSi
         pokORozhhWC9jw+PZorFV3GiahfEQRCbaE2PLbsepHYhkHq4GCphymZ7a5G6LLKmc3Sg
         3VUwJrvEq0F3FSgh4dTcSB3K/Pj+7h5UeS6Zg8hgmrAU0PZhlP6SpawFc5wkyz9tS1H4
         l5vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791855911; x=1792460711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cz+gED3n3VMR1ENKlJ+1/sgawu/JrM1+H8MqpXBZQP4=;
        b=dXsEqth1P9jLVPPBygKZYVsdWxVsgJ001QvH6xJILCjdlHJNtXXFmUrPWXnAoaYPKf
         2YaADamCfb47RAK/+GZ5046cFz9FJJpDnLJkI9it/4Hq3rdXleE7Hxrl/O75O0aL68CY
         CcrmyphYhMN1nt6zk/rGRSdSOYgqW5fJK+YH8pY6JLdO/XMUNf06xVM9b1dvExYXqQ/2
         3bqQxG5m06URnmTFSCqEPcyziNcgwqLJfg6ayLpJ/z2JHxdF9KE7gcNPeWzmfheCD1Gp
         5mFlgszfUEdoVWbKZhQsP7WZsBQjnDTSjdR4BpWsN/47562yAJyrA1dDNr0BETOLfzg7
         CVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791855911; x=1792460711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cz+gED3n3VMR1ENKlJ+1/sgawu/JrM1+H8MqpXBZQP4=;
        b=iNngoZ7qZLpqTTuZBy8UQsTTyOPgfSCzzFXtkYTFYMSkE5KvtplDrDb5m1MfWUG2Ea
         UmSycHVzKRakCI0sRxdVYZD7ePaAaGok8TDWv2urWEQe4FNPDxfR+Y5RzJFD0ugD4xrn
         TyEoDmS50i/I5nlqbb/f/p5OfgMGZ1xzLNTmHAcfqap5tpRSU3Ipb9iCBbH/G8OmVk+H
         phQIIWwavcRkMGpy0EIGr6ADH4tx9KgNUTlGsPVk8kxbwJIMXqNLMOv5cHYJwyE1f6rV
         K1mF0E6LgPL859uQSDAmwH7o3Pg/O8twwq49W8nh7ggTLuTPQ/tXV+5u9UqBQk8SwJ1r
         lbwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRVEncFE+aGvePwkaMVX4f7yTliv84/QUuar8VXylfxvatB8PJ5gbK/WjWJFHPpoXeTzFSwEtKSAc=@vger.kernel.org
X-Gm-Message-State: AFq9FYId8u/xyajJLubmhW4Dauf1rYYa89/o2AApgZUr++XzD6wq24O0
	2m7OZDVGQIxIzL96Obh66lNlHo98FVWWU7Tm2oPEV25IXm0Fdp35KHPRnJ0JFiShDjf43wbVO76
	0OrrD1MpaUuhF1tFdpXvmEC0xiT4NaMQ=
X-Gm-Gg: AYBFou1RvZCNLfdTlHL7CnxLzuxspQ1/BcmSc/WfjM3JiRLJpvQ0rk0B0/E+/3Oatyl
	xhhFS8haFs5UKejbp8o6J9sMsoogGD+atyQP7MjZegnXWmCqhMr6tPNBh5oKHqcYl+7tpOQ60c4
	+sncD2Iwno2vMmZcpRmhQhx6MwAj/+tKx9bMm3mf2ObpHSAZrhE0QA0/VZ8C9gnmdM+PQY2a6e9
	nBUkeU3M+ZEXwNRd+MYkyjXAhRONFFURs8wA2KLfGhvjR6yQh6xWBHVk3ZJX39mu8rxLaXYe/d/
	X2nhPskVxX5pBdTGdlrb6SSULDBZfWycJ5QsV6uKpjJ2OmXEcw5Wde78rJaU016DSdiuwJBBCSk
	26vTqjcq4p+m+h/jS8M1Qvxe8J3nHDPOkNzbzsIuDdQIsagLlcVLWR7toeTzQ4bofOZ38lA==
X-Received: by 2002:a05:622a:342:b0:530:430d:87f7 with SMTP id
 d75a77b69052e-5359fba77f7mr196535301cf.47.1791855910479; Mon, 12 Oct 2026
 18:45:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-vsock-guest-ns-v3-0-b32447c66b23@meta.com> <20261012-vsock-guest-ns-v3-4-b32447c66b23@meta.com>
In-Reply-To: <20261012-vsock-guest-ns-v3-4-b32447c66b23@meta.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 12 Oct 2026 22:44:55 -0300
X-Gm-Features: AclHuK-kA8q05fe6Esk_oixM2BCHb47BieLQLjZDYfiDhY6CS2aMRdOMVHtXa5s
Message-ID: <CAMAsx6fKVQaYLzkK34v5DRkmQS5Ym-XqwNh-+Jj_Uue8NJCNUg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/7] vsock: add a netlink command to assign
 the g2h device to a netns
To: bobbyeshleman@meta.com
Cc: sgarzare@redhat.com, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, stefanha@redhat.com, mst@redhat.com, 
	jasowangio@gmail.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	shuah@kernel.org, rdunlap@infradead.org, donald.hunter@gmail.com, 
	edumazet@kernel.org, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com, 
	bobbyeshleman@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 12 de out. de 2026 =C3=A0s 19:51, Bobby Eshleman
<bobbyeshleman@meta.com> escreveu:
>
[...]
> + Movement to an unreachable local namespace results in sockets being
> + closed with ECONNRESET. Peers are not guaranteed to be notified via
> + an RST.

This reads a bit differently from the sysctl documentation in the same
patch, which says:

Connections established before the move, from a namespace that can no
longer reach the device, are closed with ``ECONNRESET``.

The net.rst wording also covers moving the device back to init_net from
a local namespace, which this sentence does not. Maybe use the same
wording here:

Connections established before the move, from a namespace that can
no longer reach the device, are closed with ECONNRESET. Peers are not
guaranteed to be notified via an RST.

Daniel
