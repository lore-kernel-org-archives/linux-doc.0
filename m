Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793278843;
	b=Eje0IZb6IOfmRpx4nJr8YCgI7UH0LabGcWN5GuPp85dP2vGbiPrg3DdwhlE4G7jXy4KU
	 +ozaqJZ3owrJQG6sscb3R2RqCbs+UagTpxUK9y3hEtytPxoCZZzW0t6rPpxJx6RfXVjkg
	 cb6ah7a1K7CKpMv2fNQ1uvF0nGpLdf6Ko6VDOBghCUbmijqbh8+xuwU/Pq0PK7oy4HMwA
	 u3gL+DRq74ZCPvT1Q7LY/JlHblo6VEZB++nLnHksTVoPQCOMnYrAFkNPt46fxC6RASDdx
	 bZxYQXE7lmnUa5bcRflSNmSofnQ1HTd/WrnqvslEVoUiAl7DKJmLPcbR8ibkMmqdUjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
	b=K/uZnpxNWdxZUG6g2keJy2N/4OoeOkcRilZXKrPi9Qtoh9ivQCtv1Zt+uvkk7VIrBR+c
	 6ZzKXe69QmNOJ+9foCYhRBaGJhybl+YIVr68k0BAzElt1Kdt3ctX5BApTAXG1xZzz+UcT
	 7r15S5VeCwP7L4hN48gLBKNDHRBAIlTJ0eFyhysh0NXySbNfva31ObOsPZpM1yRu0ggvZ
	 ZAa4cGeYiiHBgJl6br77+3MwIPoplulfEiVOdwVALDdf3bxKC45GTJ4mEJ8H8eKtGaGAU
	 vaBj9yaRFJU0vlUw/wl6vaM5o9dDB19T5dbT7Im0/39DOlec3cunJYD6y4n6k3AuapA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ofPvZk+o;
	arc=fail smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F86E606A334
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 13:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F86E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ofPvZk+o
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a10095f3aso279599eec.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 06:00:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793278842; cv=none;
        d=google.com; s=arc-20260327;
        b=sTAtn0fAEZZ9QzI4XrO0IM9AEEihKdcw71Q2HIMo+L80iTDmkLl8Sh96aE+wi2mxHh
         rgjAQ5LDyqG0u9a+GMwaDIuluIIwqgV6ru7zmVx4aK+sthczhCmD356zP1JdV0YkLZqq
         kQP3oyt6TDEYaVQ8YBJji/zV3R7v/sU+f/C4K4wu66lH2QXZH3yg+uPSDgvwflkqXs3e
         al8IXQxTOVkMWTT50+iHdrbjObpeSnWpqTHgaqUTPQf8/7wklnYFwvOt7ZWzINfJ4/yY
         rG0Yjg7du123v1kJaIRTK1awt9+s+MFi9l7z2OrY0hUvrPKidR7btzDnzw4/KsRBIX/E
         P8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
        fh=kf9vkPEHOK1dvRkHvsu3NjJWgG1rSdc/UyA1RAbtcHQ=;
        b=cvaAv25AKxHNqJWohgMpEiVRunfXXPZqy+M8BV7zBK5Qu2Au6rlwRrn0yDLbtvjy+u
         M+X2Oulp8qPAsPqM+MNk4YUOlmdVnMMqOUDOXYqOHdrVMe8wFI40ncKNwUqdTeraoVTZ
         S3mF+uZxb/x95oqYkWwzzrljKxSJhhpvC0EiScpqIeXlj0/Pw3wu9N6z8i7Vrz4zrzPr
         FE1GgWVW/C+L277GjoxhIuL1bl8z9kXTnOlta409i+qe1qLzWzzJFHpkL8xeDRN1TmmH
         aIT/VixefYgy4wDAPL71VW7K5VWgF7965zyEVE38RxqMGaRmY/34pk1ZVYMSGUGoaYTo
         j6+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793278842; x=1793883642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
        b=ofPvZk+oAY1UtBN8lfS9Hjg636A5yXXxymVbjphADhkntlAvo7d+OJU8vVQ+Az1YKb
         dWukwXu2x313G1oppF7iAuhlMKCT3diyXTgTlAKXWjGM+Iwm50zBqxbGFoqtU4CjQPRi
         ToYeRwJPj5xeiznntBlX4VFyiQuMizC0YzA2Fycqh5ak/5xu31DBjOip8vO4Z2tuK/4f
         9PhR8pLQtraxqSwScA6jTPUn2IoU48Ael0NpD7F/lfQbSWkS9kG+njGnjZ8V4i1r6jjs
         NKUP7iwgO2CL1t6jHHe5bxmc7L4p3wIS4RcYs0ebru/xZh/T2s+t/RLRgJoRw7N6mzGF
         pkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278842; x=1793883642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
        b=M0N0h4h9Gzesoz4fxJOEmP+iXzOWyxkzinvegGHc9kBBkarbQJ8fJ2yHx7uEXbRpek
         ZZ8QbMxm5flYZlcXsQk0Iy6CCTCjXjOzuGskJ0JC+iVp3JFkZG7DEl81q4H1YTdV18vC
         SG3idxrIv+ZocUhFv4KA6pIZOecpECyAZbA+eHf9vmPQWk8ew2cpR51xIzh2JMwMCISU
         2Fkrr1p6VyohbXSb2RnEis8of1PV1/Qwec6COKuaxyrezAUMbHC5tDpaSmwRI8hGOg55
         FAyK7XZPPyXCQzX9j5J+J2RchD4BZ3vDuujWb1zhXN/2h9uwMPV6GWnDG9RgEm2WBHeY
         QWEQ==
X-Forwarded-Encrypted: i=1; AKwUvByBinxj+JQdP2Xj5ytBFA4zAnQ14n7fe3LcMEKViBgqxZrURfTAjYRJ/OHYp3EpR0XcdmmYlMnYPZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZoF2vnxd6dJezdqqNTXYbtn0azdVtu/UhLJkWPNh1i9HxHi3z
	ECZiz0n1lZ+bA1kRPPGAd569UaGoeLro7dWdnhj4qLvDGwsrn3goH0jqi86CJyhEiLoqwyrbaXo
	sJcNAn3qtD/VV29Pj/vP/YiaRTJzY9xQ=
X-Gm-Gg: AYBFou0bsBcb0/5cZ6NVP7E7E69uPBctneXPBgFd73dcFEy3YR9iMMJOMY7boUGtw3e
	qc4VC4AnsVbGNGIL8rB/eBr2wAgGfHpOuE0QK56hIiPPWye2jLxaJN8iGPChSimpGJoZNxGtNy3
	JTVgtllvENNyQU/F8ZDwy4AcHKfyl+Ad76l/4BTAtK9+9ofJAokhXLanKtWHKUg6TkJpzbpxAxP
	/679zEuWLYOSftoFsqy1zbOGjFNUUxq6bgFuRKWK2uXaBPbF5HNjcCFEW30hy4oVHUlasKZLYqM
	O+n+HpQbxQzNN/B0zlLzzsVyfrvRcDDFQeaYuda076H56DFpIMec2cCDTBwsHQGc1ylsXr/QWVk
	kU8O5rc+1r3iinsqEkHT7/NsLzxrVbvcQBEkIYt/dHdttbWw9hcBki2eIv6jQbAnmOoP7OnV17v
	yCDut5/D1KFhKHP9KPUVgBJ+puN9HN9BBtUCbtHtb0mw4n8ar+Vf1sS0emeWkY1JZfeRtPR6ZWl
	SK55VORZPO2ZW96ZPvNS+wJr1cOCAqt9cQd9A==
X-Received: by 2002:a05:693c:4196:20b0:36a:e7a:e89 with SMTP id
 5a478bee46e88-36a202cb0e4mr12034617eec.2.1793278841146; Thu, 29 Oct 2026
 06:00:41 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <5bfdc1491d297b5e98cf42322c790f06481c28c7.1793027261.git.d@ilvokhin.com>
 <fb3b6a24-74ca-4da8-8593-352afd515313@suse.de>
In-Reply-To: <fb3b6a24-74ca-4da8-8593-352afd515313@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Oct 2026 14:00:28 +0100
X-Gm-Features: AclHuK_VOCF7u599iESvOsHhN0DoC1VeK-LagvEMwpUC6WNOUUTl411X-macJoc
Message-ID: <CANiq72mMm75svCqevd8fHtVoczDpvpo4NwL0SC8=bWy030vQuQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] drm/gem: Switch to __nonnull_args() macro
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Ilvokhin <d@ilvokhin.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 8:32=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Should gem.h now include <linux/compiler_attributes.h> ?

No, it should be included for you (unless you are doing something
custom with the compiler flags etc.).

I hope that helps!

Cheers,
Miguel
