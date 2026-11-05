Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871733;
	b=pg++RWzkDxXUZWWt/N1C7IWlB8jTt1E6MvjwGY/5a9og5X1cUKwIKxtILY6Yny8VgH5I
	 DO4vGU/kd9qTTtGF6mGtxlHs7RyF4CGFYe0dfC0PER8AvMfJfEd0dnCnIjHVh7LwSTMQm
	 UXTFOsr+mmSicZTUDUlkhvqce6DtrJpRqf87kmHbSGWm9bzZLvOOCNoJLtyi3qB+wC1VC
	 SLKS1nbD0VgSC5HTSvBa18hTeni4ktOUjLSLJYTUEy7/G9TK7qpEK/RzIVZyM67AR15aR
	 AJeQ0WaYOBDXNMn1r4lKguwnex5o2BsR3HL8cYXgBE1zp7EmR1oaqdAJsZXZohjphzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871733;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DpLYJIWgXoS5zQrloj/RgE/cGCpS34NjW3pzuN6S6xY=;
	b=1GqkOdKaUa5ipvBDf1aYlLnOj5Ur9rQOYFIs8CyeoTWxUGMsIZ3QmxmyVkGBnPUur8sg
	 QPqhIaTkS5/WOwxisMroz9Dv7L7bYLTEoZWv0WU+68tnjtkOnHdffY7TABLPv0cDwN4r0
	 J8/XNxAU0BpUIL+3RBqewHUmSDnFafSnNFVgJ/2WbVhgfEg+5QWFbDU0fCoK7KH2zddFR
	 K8bWKQtUBDNU8WMEwmC65SJi+4NEPO2GFWK6NwYZIrwvEMAWltZGU6oQk/mu8IwhwmcGR
	 TNIq///vbAAY70OZH+gO5n/Hq5MCjeR7y1Q0C8cxeR+nmB5W8O1ElNXiRQjk9sEuGvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C6A606A338
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 09:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79C6A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so425834241.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 01:42:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871732; x=1794476532;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DpLYJIWgXoS5zQrloj/RgE/cGCpS34NjW3pzuN6S6xY=;
        b=jDfpU6gE8MV/bgn6uWb160pYmoUEGyiSYXwa6X3G2M/u0N9LycPC5PPU6ObFy8FBKs
         hpN9vfLgpEPjVqx9J/36GaMi++V+Leql4rzLnZH/5pQieweJGMdxVIieWAJsTq0srbWE
         sA7ds/m8A5Sy48oJqWVtBvPsF4tt2L6Zm3ZBoD1LB46XGPvemwtqu3Dp3SidMWYnLjLL
         spssPDu4a9yN6N/QejnkpDJRLc1KaFiqaSnoO0OIbwvDoB5z0ZFCM3NawznFUjqnjN+3
         Pu+pHZZGCKYOKUtycgWttKQVEwPKzHsYTsLCRsYHsUV3J4bXKfnGVVbV+4vhMrKsoXoW
         a99Q==
X-Forwarded-Encrypted: i=1; AKwUvByQpy/5mwnNtpu8tHp+yeAdcsWnO3bae1BOR6f+RAgTtbCv5Lqc5Y0iy/XI5jUUSTHinAu1c0+xXIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z99FQn9vCFmOXJR6GqAIPEgyE1yxS+owlc9VtPswEoBjfKtm4h5
	fLgcoZMQTNXjeJnF7hTJVVGbIGqKoKMDcq+F3cjUKrDuj9pD54IOf8pzxw3ZR/+kkg4=
X-Gm-Gg: AYBFou0Jkl1oMA69Ej5IpB0qmtiTTRQY84KJ4ah7ukA0kHFGvVBvDzU7WvC4SPPS/CQ
	yyCx3+jgZ6x5pL8m+vosGm7h4D/V3etGW4zP2+vGxoPB0eZPy/0Tg98PKilxSdwpIpzPf8jCw+B
	JE3QFjoraef2Mectj6XSL6OPrMWEfOQUlTEVB4YlG/v5Y+R05DBzPflDRaBRFygqH33ZPgfHNj9
	vzsTRTg80d1pIDTzeGi3/rvxX7L2hK9a1QFm2zuBvHdvrEEvpNutU8AoEPUXVLtLVslfeHoBsxX
	ZjtVn8IbbZePTc7JI+MR11xDDslFB7lMiYa2ZBQSsMTF/C2v9d/3+rmiowvB83XObkCpwQl6DIN
	iAwVRNqmdZH6PalD+PnZ5wSxRgWcZrnd9NEK1SMPmRurRz5g1Nvr/1jXbr6iGgLG9jWTmeRn3iR
	Jiee+40S2ngVeo7YnhUBHOjr63+CJCShUTQF9V5j+NOOULJCJr7tzN551bLQ176rr3nA+OLbAST
	UOh7p+WyuQTGf7LKuzmvD1+E3/hfZGPmVpdwhHNO1ITi1IDU21KIcYMF/Mtx9zDBWSI0Lcz3n3M
	OlZMknisei2Q1v+qDIAmkT0HLwmBMeTT4o1+9BuOdWo1IbduXCyCYxyOk8sP13jC4dOMmw==
X-Received: by 2002:a05:6102:5106:b0:7ca:866:7217 with SMTP id ada2fe7eead31-7d2867454bdmr1090334137.6.1793871732321;
        Thu, 05 Nov 2026 01:42:12 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d9d62bsm3680046e0c.8.2026.11.05.01.42.11
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:42:12 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so466354e0c.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 01:42:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwdWkIklgAXun0HO3d0Q3HmFF8f9aipVchBV1dxwCZ6H+9NBmDAw792r3MgMESnFP8GVFB55KJYMgk=@vger.kernel.org
X-Received: by 2002:a05:6102:3709:b0:7ca:5626:11e with SMTP id
 ada2fe7eead31-7d286b7fa17mr1126485137.36.1793871283167; Thu, 05 Nov 2026
 01:34:43 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105044046.52180-1-dennylin0707@gmail.com>
In-Reply-To: <20261105044046.52180-1-dennylin0707@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:34:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWzY9YRnGz1Y_60RYP7TH67q8fxi1VNWwkhhc0EUeSCFw@mail.gmail.com>
X-Gm-Features: AclHuK8PYnqOIDpZItZg042mTleQ6jUe2E1wddINt5GGmEiia8n8vhGDZzRowiM
Message-ID: <CAMuHMdWzY9YRnGz1Y_60RYP7TH67q8fxi1VNWwkhhc0EUeSCFw@mail.gmail.com>
Subject: Re: [PATCH] omfs: remove the filesystem
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: me@bobcopeland.com, willy@infradead.org, brauner@kernel.org, 
	viro@zeniv.linux.org.uk, jack@suse.cz, akpm@linux-foundation.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, tsbogend@alpha.franken.de, 
	maddy@linux.ibm.com, linux-karma-devel@lists.sourceforge.net, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 05:41, Hungyu Lin <dennylin0707@gmail.com> wrote:
> OMFS supports the on-disk format used by the long-discontinued Rio Karma
> music player and ReplayTV DVR. While reviewing a fix for incorrect block
> mapping on writes starting beyond EOF, Matthew suggested removing the
> filesystem instead of continuing to maintain it.
>
> Existing OMFS media can still be accessed using an older kernel with OMFS
> support.
>
> Remove the driver, its documentation and build configuration, the
> defconfig entries, and its name from the statmount selftest's filesystem
> list.
>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

>  arch/m68k/configs/amiga_defconfig             |   1 -
>  arch/m68k/configs/apollo_defconfig            |   1 -
>  arch/m68k/configs/atari_defconfig             |   1 -
>  arch/m68k/configs/bvme6000_defconfig          |   1 -
>  arch/m68k/configs/hp300_defconfig             |   1 -
>  arch/m68k/configs/mac_defconfig               |   1 -
>  arch/m68k/configs/multi_defconfig             |   1 -
>  arch/m68k/configs/mvme147_defconfig           |   1 -
>  arch/m68k/configs/mvme16x_defconfig           |   1 -
>  arch/m68k/configs/q40_defconfig               |   1 -
>  arch/m68k/configs/sun3_defconfig              |   1 -
>  arch/m68k/configs/sun3x_defconfig             |   1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
