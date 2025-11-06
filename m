Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE44345CB0
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762446598; cv=none; b=SQ8km+xfEAkzwgrtK/CNBvZcryNFv2wBlgMOl5NBLpoKz3wN6xLjD9o/l9PTy0ALH9qsa/iWSopmfKgEk+og03ISuzD1dnbjmN51ZIXSMI2BQdGpBi0KlxXK6YQzDMiF5L+TY6L9yuI3zl6GU9ze7X83hACwReNpylzMb3m8mmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762446598; c=relaxed/simple;
	bh=jEkS0wS9JdICTaCzYvZx0OjcAUCfKSnRc9lNZ08RGwQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BMAGTWY+K7mS9/l36ePtpvtUF/zOZG1Ohr8f72JgkuC8XWVlL7FMBlFBRcoOL988kdQRHCo5crLy6CtotJU9EiXotZASe7FRiCWY5VCWAYRHFTiaWihKWFF9QW6nOm3+lZIk92J549vJfrKO2eCG1KjxxR3PHZNIhpPiGnnaHuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ed/MdcYF; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ed/MdcYF"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-33db8fde85cso1093954a91.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 08:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762446596; x=1763051396; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EMufvlKZanMTIZvbWWJIkNimyApBJZflYRWdIy87U/A=;
        b=Ed/MdcYFf0bE13i+lCUqEh61uYXZIRFsVri+LZVomCRwmAuWXJVvLQ6mrDubJbKC/U
         vgzdb5uvdJai6GSmlEbySoX2SUCrdlDoz2F9sx1SWdbzdQb1CUxPXT/gtK8D1XUm+uXo
         j0rAiZJ0MNULiHXmz1XEGw05ynjQVlhBxUGfxDUKihjbB22zhlJodUfyutsQ2QKzHe/B
         hA6rKMfalhvvFRHacfP1Ml7PV6yUAAlVMMDPtTvKJ+rNXJHvAsUQu7bL0GCDGXaUQfwp
         vXAO6e7LM+ffXLxPJcsgLhhaDz+7HRmkQkGY8eqQcBvoTaaUIefuchT0dpju/c1ZhgCM
         x+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762446596; x=1763051396;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EMufvlKZanMTIZvbWWJIkNimyApBJZflYRWdIy87U/A=;
        b=mvcs5vkqqdzjGhZRo9Zzzmt7RSIrdCnF9FgSupRAsl9IGbiH5uVjSdWxUAPzBlIx4f
         9sQ7AXHhB5a99GFXPmqvL8N9iaW2mZoyRiCufXbMMZoZZEd5eH22SJcfq2Yct+El8QII
         y8E0KLJG9pem6gqP/JsKbdKhlZeJ/y1Ax94yy779DYB+MRGJOAPjOfr/FFFZIz1GiPdl
         PxFG+QJhUegRTwfyOPsCuXO823BOGwI9bBWJ9c27qknPCZ2L2r0Y0VO37drQsZWR2EH+
         0yV9LxkbfVOK6cd4W5OZpbXzmwDL4n1eHWwXwIELoRES5yOGA2GKg2vUdhJMIsX5KMHF
         Jt8g==
X-Forwarded-Encrypted: i=1; AJvYcCXijKEEvLujc5ZNwm1Ykz+6Diu25ZtFvdMKn/k0tE5n5doQGS7I+NmJLJ+O9Gl9FMXqB7trYAoCjLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNAjYRndFBYqpwZp9rQophhn0G7g62MSJJlX+TIwTcec+TGViA
	Sex7CtMgwRwblXhFtb1samob+55Ei5q1EyRNAmMNdD8Msc9d3N0lkBCt
X-Gm-Gg: ASbGnctWM5JETg7kXv5G0XtEkbecJ/C2HfJ+A2FFflA82VPQ/iGsPO7RXDzDI/+mZWt
	FjoDa89pvf14fp7ImzD9jd93unthEWa5aKt3oPsplafh1W390jCvJJWNF+u1OPGZ8nHTbUjTrJB
	WOtR2irfpbYiXCzT+6IGPF5HUFEWeDcS8H8dO/0fKYi60P7WUKmgWnbQ9HhJZorSahkxvazjIsz
	NFTrNrusl02l4GpMgX2zrmjiUKc+RmNv9DLXrkYOvkvDdbetEctieB3nKtaOIZe6RboytPixjcg
	HbowPD8DSeMy8wRXPlhruHVg/s3vNWa01WLAMxMkEeaZYrwe/egvUrbImeoBdKa2pluctgGf2AG
	NoZ4uVKK1WExn3TaOK7oTW6Ezpvs/QIpfXdY2N+ZPSGNAVaJTzuPgx9ilRqUnZVUK9OaSm+nmuA
	eoTtIqwPHikA+BbnB3+CeJ5wssj9De2HjQhuKnG/AISAxVHuXfWMpS/5AQOxtpc2FXHxMn0g==
X-Google-Smtp-Source: AGHT+IG+/YJFa+iN7B35iE0D3sOPdQh3iyKV5sn/uuCGaHI5yvaeFznbvQBUEeV5BmhRnHB0H5TLTA==
X-Received: by 2002:a17:90b:3607:b0:341:abdc:8ea2 with SMTP id 98e67ed59e1d1-341abdc8fdemr6666428a91.37.1762446596409;
        Thu, 06 Nov 2025 08:29:56 -0800 (PST)
Received: from ?IPv6:2401:4900:88f4:f6c4:12e8:f050:511d:31f3? ([2401:4900:88f4:f6c4:12e8:f050:511d:31f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68ad143sm6652545a91.3.2025.11.06.08.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:29:55 -0800 (PST)
Message-ID: <67e28fadf4c20433c964d13d96dafe3514457656.camel@gmail.com>
Subject: Re: [PATCH RESEND v3] checkpatch: add uninitialized pointer with
 __free attribute check
From: ally heev <allyheev@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>, Geert Uytterhoeven	
 <geert@linux-m68k.org>, linux-doc@vger.kernel.org,
 workflows@vger.kernel.org,  Joe Perches <joe@perches.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, Andy
 Whitcroft <apw@canonical.com>, Jonathan Corbet <corbet@lwn.net>, Dan
 Carpenter	 <dan.carpenter@linaro.org>, Dan Williams
 <dan.j.williams@intel.com>, David Hunter <david.hunter.linux@gmail.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn	
 <lukas.bulwahn@gmail.com>, Nishanth Menon <nm@ti.com>, Shuah Khan	
 <skhan@linuxfoundation.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar	
 <vireshk@kernel.org>
Date: Thu, 06 Nov 2025 21:59:33 +0530
In-Reply-To: <221c2b9b-4809-48d8-af7d-f290d1c2a7fa@web.de>
References: 
	<CAMuHMdV+12MoAGNHC9kf==Bt0cLuJ39Fs+W61DN67sE_p-u=og@mail.gmail.com>
	 <221c2b9b-4809-48d8-af7d-f290d1c2a7fa@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-11-05 at 10:18 +0100, Markus Elfring wrote:
[..]
> * Do corresponding source code analysis requirements indicate a need
>   to perform data processing with other programming interfaces than regul=
ar expressions?
>=20

not sure about other source code analysis tools, but checkpatch
predominantly uses regexes

> * How do you think about to mention the possibility once more that scopes
>   can be reduced for affected local variables?
>   https://elixir.bootlin.com/linux/v6.18-rc4/source/include/linux/cleanup=
.h#L142-L146
>  ...

The docstring talks about interdependency issues caused by assigning to
`NULL` which are very rare

Regards,
Ally


