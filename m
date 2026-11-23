Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795408693;
	b=GtQ5EbUdgqekfQUNks2r9mfhBYtu34UFzE3RdgHgqlGEFvJdznJ90rtuEfpdq8uLfMcv
	 ygmtsh4kVxuRcffBS+XnzLtXM+yRxFx8IDLVlPqIcp0avY+3HpjatgFj8udaO47bBWRFk
	 7/QPVX76QDqVQsSBy0zgBWxw+53H94eLDnYMZQrqw6BjmCgWA5AKouL0M/gBmQ9L7Ypys
	 cVnXY+VDpGxtzi68WKNPvROxlFjf13xMer9AEqY+WkZcsX0BtWzW2UcFuJQAtYVsJsnHi
	 b7z21ekblxV07Gji3bAfJ+BDl7BoutaNB1v0Cj8AoBdoKdJZrSG2dYRkt8e+Yj28c2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=01DOf2iRHDHQOjpqPMN2Rm96jVRX0YsMS0cwL0w5nL0=;
	b=2gbXt8T2kwSn7MOME1riFJCuIgjyri37Fta/ezJ5Xua3N8KB2plISKpXZxewa48KdVTF
	 y24wa7c//wvk4sFUUSjQUjksNX8PUyJ20/NtJxUWrg4m6dHyabwNa2tum7z9RLeIHh8WV
	 WzDOQVBrJ65Ls6wew/MVmFp7zBbLGNba/IBGWF215T8OinRY16JJhMvtQSrY+xSke3eOd
	 st8aEyJuG3qBeYsbA9thm9iGWdylFzGspq15WPXNwZXkZWJWCJ+CEPGX+q2ITsKQKihsr
	 myqajdzvtV8ZdF+e9iHydmSauBWx9I+L8kScB8ASl63EDAG+Sa12qQ2fZd7jTFOIf9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sl6aBOjm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2E3606A327
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 04:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E2E3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sl6aBOjm
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-843cf077f10so4208172a34.1
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 20:38:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795408692; cv=none;
        d=google.com; s=arc-20260327;
        b=cMQI2WivpMW16nePV2wtNytyBaC48SkN6KdAh4laF7VbWr5mhfmLbHyrxj/kYiufY0
         v/gGWhIZKMO8UYfahMzwkXSiXQq6vJnOM5nYxpDWd51EunrYTXdJD1wJ6g5QYWYiMELK
         APW7xeELvuQHuKcof0tTzwuis32rp7cgPGtezbf099KkJ04qesGoN8GuBjRaMeKlCAfc
         oJl2am0zOeX/HRsLl/Nxtf5O6d0+pfB/e+gNHfHZj4I2wiLS8V79bQtuaSlp+7A9MSN3
         G6G9GhHYJUKIV7PWDnuMK7wUz+T8WvCwx4y7Jyg/m+NamW3zf6tlpsPxAwYebdkKn85e
         pEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=01DOf2iRHDHQOjpqPMN2Rm96jVRX0YsMS0cwL0w5nL0=;
        fh=6zCqLl/2+S5AAc61QnDvaJah7PvOsi6PY7Sc30/ATCk=;
        b=UiZgCEoM2unIjO9CGazqwx7ENBRQQJDNAJATCAE6S+JdgI53hNpje2Ry8STDtWBF99
         xS9Cg4KlZNryGTVJ/VzA4rTQ1Vg/1Lpzd6FDw5Vp9Le1vCK4wKtdGB1thNx7ekOvDHHD
         3GaDpvBR9WMxh4ZM4665u+KIWVJi8aFdrWhCpDV5HekVXJBIeOTlMLEPTDKDkgI45rVS
         tPm96Pq63f5QsP1w/H5bkZKVrcSlIGHw0gkGwlyjQM0exfBJRVi0TNdpqWq5GwvEMsDW
         erm/qtFZkevIAaamgRtbyxRSVmI3gJGrtIMs8wPC1le765Jc5Y+bYjB3XehLfQ+6RcU4
         kafQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408692; x=1796013492; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01DOf2iRHDHQOjpqPMN2Rm96jVRX0YsMS0cwL0w5nL0=;
        b=Sl6aBOjmfdJYiC93IpBafu/98klT+7Vvi64r9/V7BBFpVK/IjO7f8734XlL1eP+SUU
         bLHnJXBSFfM0DXJrPgkv/1DP9eEuwBcawVJtMDpAHU/ZCsDXb8VkGW7Z2MZ2rdEZrxPq
         HoVaMj/jC6a3Jw5YMa9yhhewScQ2lg3ph0DsEp9o+D/jpnDeyQL0iDE978QUjoZFrdsv
         5MN339ODhzmGp4O1ifePS4BAlC8X5DXf34SBGmOhs6Kfx0DC3DE69VbjjczSsQAlqcj7
         dkxpGkQ/ex2QlXgm7jLuEECBc9IxXp1Nc3swTunZkaDJlTVKgGDiTvCLTe+JNiNZ/cX9
         1XKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408692; x=1796013492;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=01DOf2iRHDHQOjpqPMN2Rm96jVRX0YsMS0cwL0w5nL0=;
        b=UlAjrEhpuB9FVjg1eDfxT8QQfpcbmU2MOO4y57tN6eckbfT+D2EcHG7NGjd8cIXW5Z
         RB3M9ABYLx3gtw2UvXbhmczqADcLNMmw5QLiUvSBqS1RWWJHqAKr+MUkNCZqYvOyvTxS
         KrHKMIsRaPdmrRGmIuIqPMwyw5wMZmFJtK4sKlaHRHmehhk3CCwK+vzhGvCeuLcAdQ24
         U6Riam1gjXGzV0g/Lu/AegevNRKLqnNoPeBCmSq5YGA7IpuulZWYxJZQXxnQnTTdoIGn
         RO4eKI4yAgkCd2IkgZ/Pyc8k50hJysrdd4U9QMr8/tS1jT8smIsubnvw0C7a5ju29E32
         B98g==
X-Forwarded-Encrypted: i=1; AL+hErH4WhD+z189vuqVecnBgYo7X8upJaxbBZJOTWuHixg3UKzpMEA2ZmSa5PepMih4TXPFzq4JNSk74zA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wLNx99V7JYMFeVRr1kpfLy1vo1E/g+rYW476k2LNER4ZzgY8g
	t4Tml5iUaBcNL8LXAbHLP4JLOivY1TKT82mx1UR95HK5rxwIzB/oOOKkIN1wWL5GUBK9yWXC2xI
	OC2U7cq1wMDR0w0MAj3UpvJbJe37jPOk=
X-Gm-Gg: AZFdTZcHTU8DNM0g8EYg7PBVTbs7xEoeClGJYyrn0vI68Cpim3m0ARe20Pz3Ry3zglL
	UR1+l4wMhU+Af1KU/MU9LGfgSAFIczPppDwA2LBQ1IdbE1Ww3U4DeDCdlX1oJ7tRsCh5gPe+9x/
	+RfJo+FIq/pzpdAnu4evhRZqH+XKNiWvYpmaz8ss9lgkcLxPdPtR8g6nQwojgIBR6DBCnhlsi+l
	Hr36Uk7cOLP9o5cQX6wTD3Dls3/yPhiHXPiFRdmCiVCLXEvV9MirTDvlNQoHkLw5yrkkmINfSX7
	yNgr78H08AhFtlCk7eJgr0u7i3flvQQDt58LcmVntTKJnHWyAw9yrvbowwL4YYNKgSBqhShHfN9
	AEvjRI/ym+fP94dYgkzkyfWwalti4fbwkyWiNV7j58Tk/zntSUqAwojGWWbQNSyWojybVjAE=
X-Received: by 2002:a05:6808:4fe1:b0:4fb:bfc2:1a64 with SMTP id
 5614622812f47-57a0b44cd17mr11494284b6e.31.1795408692409; Sun, 22 Nov 2026
 20:38:12 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-kdoc-dup-warnings-v1-0-265f89bc3f9c@gmail.com>
In-Reply-To: <20261114-kdoc-dup-warnings-v1-0-265f89bc3f9c@gmail.com>
From: Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>
Date: Mon, 23 Nov 2026 10:08:01 +0530
X-Gm-Features: Aa3M54r_6zFrjE47vx1VIyjklPLWdMiuvshDWQnxuz_-5roWSbw3R6AYghZ4C6k
Message-ID: <CANYW1HwYge3KexMovtx8UiU_RBqv9VDqO==TLVLD5zD9i57Ypw@mail.gmail.com>
Subject: Re: [PATCH 0/2] docs: kdoc: print each warning once, and only for
 selected symbols
To: "corbet@lwn.net" <corbet@lwn.net>, mchehab@kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jon, Mauro,

Gentle ping on this series. Randy has tested it and gave a Tested-by
on patch 2/2. Please let me know if you would like any changes.

Thanks,
Prateekshit
