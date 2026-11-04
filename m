Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835292;
	b=Z6YHTWQ9v46trpk4ExvH59pJ2/VQe8Gjo1JajOwtntrvBdHf8qIrdqr+HKbQgeKXVYpp
	 g4fTZYapokRibRg+Aym3Vs5tyK72iK9R96jKwA1o91HhU6maitUaASHCeD8/7lszLHPW/
	 7WraSwaJjVxM3VgPwzj9hIBicqqTtCnCbsZcQN5MVo0J57CjfywOdFjtr/VIdn1pTUGYX
	 T0w9f4XQ5g/v8Jfw11jctnNWW9qzpTUnkJMaxPUO31LB9ZVITcda1t6GhVu3IgKplie8n
	 aI6D4UU3wa0vXuKyL10RpNp9hlEzXkT+6xHebuTTvOdOPJO4buvZRI3kGuh2aH/VckA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LfE6XYGuOtutQi6QIVbHin4gqCciGQW2WLAtGNmvG6Q=;
	b=p0XKUrsDTJWdfPit+vw9T5M3nh5Ix/cnvHZXSe6xmlYfcMDSk8YEbllejNUGtIQLpXip
	 OLlFjZ53WwK4UXtmoUexjYDwi9bJ6jZ9f7VkKAADV1/yCYBnPsMK70ThMa9kIV071WYtq
	 Mr4xP8DYKBvFIgh3STAlZxpvO3DQY8H5tn9ro+MKmlmCQV5xNwtkjTQowSGtT+oOQZfzz
	 tV+ksJWJk0gEHEXku3N4+5ljJ5DsBoQS/2Crwx6JD2zw+oDRdMgvxRoNHFmLi5wBF5wXV
	 3zVgh2Dp8k1FICb7mpnmtuu3fbTZAIULJVpXzQ+TesLrtq5OzUH2p8xQIfPxkhhV9Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oS7uv8AV;
	arc=none smtp.remote-ip=74.125.230.200
Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616A6606A32D
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 23:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 616A6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oS7uv8AV
Received: by mail-qk2-f8.google.com with SMTP id af79cd13be357-93e63db6681so89786885a.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 15:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793835291; x=1794440091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfE6XYGuOtutQi6QIVbHin4gqCciGQW2WLAtGNmvG6Q=;
        b=oS7uv8AV9GQs+J3J5ITcjDbJ45MfrP5WlJdXu9KisS72I4zpWoRJN5mJENlCQNWjx6
         w6K20K4KUKSGFDrMS302lTQndqWgqfIIfYI4hiFH/mHVzQym9VVyMDrRCBCOb51DMcFl
         ofIQOr/qNDRlwNFNSvNiGZJyTOhzeJbFV8bAw8e+jKUTpwf9QgJv2xX1b7IFT5/ZC33z
         NtdznjXTZpPlty80dmkYSVqvYGXC19ugvUN86LkSV4Ng/wYHohFRzaMwCARIKOv50mQ3
         4t5AO2K5tdru0p2GZBx61QhznZr06ky45CDetlhp6aKoK/W9dCwWbUxhQLSjm/9isl9p
         5p3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835291; x=1794440091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfE6XYGuOtutQi6QIVbHin4gqCciGQW2WLAtGNmvG6Q=;
        b=hXiPsjf1JbApe6O/ef94Hmlu1TXsiJ1lCEpU7e8/hOSF9Oy4ZfCOsDUe7ne146ojD7
         TAsQDaj182DSA3rb66xP0kvDRvBvVDYHO+p0oLhcZZYScdA5GIsj6iqlRBRl3kYv7fQZ
         sFurikIsjMf5K8tBNhrS/EjXZLyhZrhhYPVbKpnXa8QqvoEoUYQjrgjxa0cM357t9wBZ
         d5qzsqPbZhlSNoXQviFQfIPl2Ap72rq6fBscdwU+5PJVZZ6KsYmtTOrD101QOpZXQOGJ
         6PR1R/PkNufFMfDXQMC0FWsrMrtW6R4CPQQuxdg3mUbQx5vRYLEjsReOZQgxcsN2wjdL
         rUvA==
X-Forwarded-Encrypted: i=1; AKwUvBytLHH+n0YHMmNjTFe332XzNiwrd+VRgn92INapHaVzgbU6kTlNhZinAthUOyLx3vSHAFTuy9EkZWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RBld0G2SZxLnoMkJ7u4JdsD5an2o7jzr4udR/alhoBXG0xuek
	W0SWJztiB9aigge8Pdh5XQKmjFqJ+7/M8z161+VRaQU2yFBEoIvz/vDg
X-Gm-Gg: AYBFou1Qku4TSIFn/AiaG2mo44/whgy0fJU6pkVybVH8mlEQkgqioPmbh54km7MJU3N
	LmIBArLz3dhwa8H7ZdIsuTK+VOdDNlUW5jxOsomtuEdLZr/ZkH1w5uOEClm4ZaWZ3dDLv15Sdpj
	32uQZNVUViVtUL8Zi00VjoDAMiOR72eK/4lfQCPnxdgRo0EyF36c5JVqyB1TkgE7elX3MbBAIuX
	2pqYRqIU0pLFpHT9vNMRAe4N/smeJUjfxzkOYaw+CPQD8PhfvMLpx0qf2Nb8gC2WR/UvznZK2Fj
	Dk8nR54C2ucFZS/qEu3n+qnxTZEBcU0nkEGEqNbBU4hkeZBBeNISOVUtgogeMfF/ZiK6uLtuV7U
	VdYNu5rRSgMD5Ef8qh5al6Z+4tuL58q/Horf+inNb+LZrfHYdTnWaeaKbGNEmbldd6cdCd31y+P
	pP9HWbyIlanXQFIxTkX4SVjXR/kSQNbcLJxNRlSXlUW/r1HTf1x/W2wG13wn4rfHdtjV+/6b7Ib
	dMeRM8bbVmCqduH5xroksJGmTXSak6Hgrjj3s3Lc4GzaJ4Euinua49tx/s0JUr8xAvk63objYvM
	S7+waPIbLEGptAiQEwDxfJIS9onXB9TDkeI=
X-Received: by 2002:a05:620a:2994:b0:939:4a44:5f99 with SMTP id af79cd13be357-9442156ab2fmr2992527785a.10.1793835291266;
        Wed, 04 Nov 2026 15:34:51 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm324141685a.39.2026.11.04.15.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:34:50 -0800 (PST)
Message-ID: <0f61c649-6e27-4f09-a69f-026f91d89848@gmail.com>
Date: Wed, 4 Nov 2026 18:34:48 -0500
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 4/6] tls: update the RX key when a KeyUpdate
 is received
To: sashiko-reviews@lists.linux.dev
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>,
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20261103-keyupdate-rfc-v5-0-de1ab90a88d5@gmail.com>
 <20261103-keyupdate-rfc-v5-4-de1ab90a88d5@gmail.com>
 <sashiko-outbox-198140@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <sashiko-outbox-198140@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/26 16:43, sashiko-bot@kernel.org wrote:
 > > +   memcpy(crypto_info_salt(info, cipher_desc), iv, cipher_desc->salt);
 > > +   memcpy(crypto_info_iv(info, cipher_desc), iv + cipher_desc->salt,
 > > +          cipher_desc->iv);
 >
 > [Severity: High]
 > Won't these memcpy() calls trigger a CONFIG_FORTIFY_SOURCE field-spanning
 > write warning when tls_check_pending_rekey() -> tls_keyupdate_rx() ->
 > tls_keyupdate_rekey() runs on a socket with a registered traffic secret?

I could not reproduce this. I built with CONFIG_FORTIFY_SOURCE=y and
GCC 15.2 and ran the keyupdate selftest with TLS 1.3 AES-GCM. There
was no warning. In this build, __member_size() and __struct_size() of
both destinations are unknown (-1), so the field check is not compiled
in.

The result depends on the compiler. A small user space copy of this
pattern gives a member size of 0 with GCC. In the next version I will
take the info pointer from the union itself, as c43c1c24f3cd does for
the same reason.

Martin
