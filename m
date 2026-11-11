Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403122;
	b=JluQZIK2liwRa3buEz+l8Q3w5NC3qyIhdxVeFp85fSYHACrA3IEiH4xGjMXme7OWOc6z
	 E9i5uWJKlkKXQZ1czEh+s7SxskyvimxBxjfZmwNdO9bO9Uy/Qp/pSVgveoHg0iXFj7CTx
	 apgBootp2W8cKyC0nufRZRVNfceRadN8HBaNcUZOr2TO6E1n9BatA4s6VdvtcRhDUrMlC
	 vRAQXFfwBviZnzuZPz7jeftxe1um+Ke3yIMILfSmZBWx2E8jCj7DLJuBZW2p7deCsUzTR
	 i50Qd4AQPM7D/9B+zhYW8TPspq607P23sarmNYy91ehy1bAUjH+MkLXGi1maHPJEReg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403122;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=esQaj4i0rxBBJRvkYI6ptnCogyr3YrhY79nTBzkIGog=;
	b=hmRImZmp6DJrj+ulfNwoYNlxA/PlvG1VPiYasBkuYYBz9AA85pAoDEbgs1NyMA2HtKti
	 UvCZOe9BDDueydFHDzODorbvWKYWbYa4dwBQzOY0DMI6g2mXE7469HWwcay3aH7kFlpSF
	 oByEWAbsV9LevHiEzvXeLPbVv7XYLzxIQ96+NKlTNpWMgkWgnBJJium+mbY3weUB3xnnt
	 gTGKBwn3pCXwnN3g6TDRxM+DaOaakLoKQCg3wZRRa6nfFqpu4bRhtuIOgmdpGQULZV6Z0
	 kHlWHQRk2x+4PouM3dEu007lmv2+L8LZp1niTkEaf0h9YzuAhkveK8dx2M3d+Fb3spQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iQq7dU9q;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RqC7PlOQ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E14606A326
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 13:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31E14606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iQq7dU9q;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RqC7PlOQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794403121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=esQaj4i0rxBBJRvkYI6ptnCogyr3YrhY79nTBzkIGog=;
	b=iQq7dU9qLnoGNYDWDjGkq2hu0UGzL8U0mU2PJsT4ClAuEQwYNhuhD6lbU/L5j70yCdSj3/
	/GrODQvBHppOxWr5r6zzBgSrz38hu3YXFAWjAaXPwSspLjuvjMHkYMML/7f3qhxJCiKfAN
	dqxY4Cs0j+KVTOfLKNu99AiyUax7GtA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-9n4luIubOhq5Xb8QitRZGQ-1; Wed, 11 Nov 2026 08:18:38 -0500
X-MC-Unique: 9n4luIubOhq5Xb8QitRZGQ-1
X-Mimecast-MFC-AGG-ID: 9n4luIubOhq5Xb8QitRZGQ_1794403118
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4ba078abd70so9198825e9.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 05:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794403118; x=1795007918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esQaj4i0rxBBJRvkYI6ptnCogyr3YrhY79nTBzkIGog=;
        b=RqC7PlOQLpcRLVRN7+MIGQGYiMWNxZug8Tju31tvogWMzrAd4tQOCCnLYEDdGQmB1a
         yIU6J7qsALFakOeCg3rFjyozZXyY1ZY94vDoAH3zrYpWMWqsW3rzMAnOcfjV/MD/Ce5a
         3f99wOl4BA2vgj6J0+xX6JkVMkaI8VW2NQwwEtIGyuKrux76g4GlnDaBC8w6s7sAkLTX
         CbyPtn1OpCdhcy/up/0BM2RXl6gZXXBTuguwH77sMuZ1vEM2VZaG1zS2XaIhSTZfFi4g
         T87PD7H2j7sgEXpZpzr/Wf2M8EuE3/qGvVuSuZ5CP4DWg3BOX2f1Bcv2x7cLi70juUtk
         CoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403118; x=1795007918;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esQaj4i0rxBBJRvkYI6ptnCogyr3YrhY79nTBzkIGog=;
        b=AgUWOpL/XR8cDZbq9PmkL788H180Q4gBqCm9qOrGzijr2TcvYiJeKvpn+ph491VyoO
         Wq5mtP7CAZsXE0M1JwYc8sEIi7X1RUhLn5sHnkBYH9kHguiByio7FLXHrHG0czRqTVEp
         TCELgtVoG4cDvnWXEaVY6RBz2WgcV14jGe2y9STnIJDw85nci/q60GSvv5Qx+eNoEXQ7
         MCtlFHkgQXhGUCx10TT7rgwjjGhUSbCZ4+cXz84jUgwsInx7JQRmJeQBkI+u4dmVmBuC
         8iViupYPwb6IQRJUbCUq7Nq+4uUqwJVGqA5YcidHxhsaCvq2iUrlpYTASu4GMrDwvYRW
         6lfg==
X-Forwarded-Encrypted: i=1; AL+hErFN4fbNERaVzFhr0FbEenDziG29IMrI700YjI7Dg5ABy7JaB44wXseAWI829Jctk68T+idRRYbQpTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AklisET5RrYBd05MRA31vKQM6CWlRDzCMAtVQAqcLVTGEQkgJ
	v7YNe+on01T8FKcMHqkkZJD39OOQDCFotTCeREqSTt4NON7aTQljvfvPXSY4NfjBROzbcMBwDZi
	6gKTFUL5f/i7uJjv8M1tQS2WdLk58IRw+A9OjLfNfqdnlS73kNCQ9Un28AjSfoQ==
X-Gm-Gg: AYBFou0LlB6PTlU1MMuqLY3q2D9HxDpKRp5sBf06UKvK4cdCXBvGY2mPT91hBpa8aVn
	w17vLuU4qHNSxR6iLojYtbAnSyH7HoCujT5n5ka/M8OO7XdOt2blmsL/010QEkSAYyD2ve9j1wb
	d+OFKirrPU5bakwhNiLwfYrIN4vRmIQyfaGn+t77f/PybuwETnApGGgPiM7pIesLf/AORg7/+I0
	0sOEru1/KW484BD2379YVKSwOzKYvUda3KcLixQ8rSVwdFqtZBAHdmwBni9IWDmD0qGWWInr3Zb
	bolN3GDkgT0NIvp8Oul6d9Tv6GMBa7O/FXMq2rZTJqL8xezibPvZ8hkp9CPdSX6ynm9iF7G0Lvw
	u6fcYewSsFJoy9mJMmVDvPwkF6+GeIMSY3/yD3/w8FeJCcftHQmbV51w9wkpR9EiKSeoZZEA1YM
	f1H9sSXWX6+ha8Ojm8SdT5MhUUimMxCD52Frv1rno=
X-Received: by 2002:a05:600c:870f:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4ba093817d0mr40825475e9.16.1794403117583;
        Wed, 11 Nov 2026 05:18:37 -0800 (PST)
X-Received: by 2002:a05:600c:870f:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4ba093817d0mr40824875e9.16.1794403117057;
        Wed, 11 Nov 2026 05:18:37 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498811fa70esm9733692f8f.19.2026.11.11.05.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:18:36 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?utf-8?Q?M=C3=A0xim?= Pedraza Padilla <maximpedraza@gmail.com>, Maarten
 Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Helge
 Deller <deller@gmx.de>, Peter Jones <pjones@redhat.com>
Cc: Francesco Valla <francesco@valla.it>, Jani Nikula
 <jani.nikula@linux.intel.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Jocelyn Falempe <jfalempe@redhat.com>, Sam
 Ravnborg <sam@ravnborg.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/15] fbdev: efifb: move the BMP headers to
 <video/bmp.h>
In-Reply-To: <20261027135342.2003632-4-maximpedraza@gmail.com>
References: <20261027135342.2003632-1-maximpedraza@gmail.com>
 <20261027135342.2003632-4-maximpedraza@gmail.com>
Date: Wed, 11 Nov 2026 14:18:35 +0100
Message-ID: <xlv1cxsba4lw.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

M=C3=A0xim Pedraza Padilla <maximpedraza@gmail.com> writes:

Hello M=C3=A0xim,

> The DRM splash client parses the same BMP headers as efifb. Rather than
> keep a second copy of the structures, move them to include/video/bmp.h
> with the magic number.
>
> BMP is little endian whatever the CPU, so the header gives the fields
> as __le16 and __le32, and efifb now reads them with
> get_unaligned_le16() and get_unaligned_le32(). Width and height are
> read signed, as the format has them. No change on the little endian
> systems EFI runs on.
>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Assisted-by: Claude:claude-opus-5-5

Please drop this tag. Has been obsoleted by commit 1e035297ffda ("docs:
remove Assisted-by references").

> Signed-off-by: M=C3=A0xim Pedraza Padilla <maximpedraza@gmail.com>
> ---
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

