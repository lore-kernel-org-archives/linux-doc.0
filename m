Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792938093;
	b=kmZU6CFtCyYZFaCWWMJButfi1ELfViGMiN9IBJGA7qpPGPTSgIFvOyWwDqzAPEA0pfuo
	 SHtZV0HOwFKdLvabYi7c2PIpNY8KU52NjwmHuuzdiPeS+9yd6TRoKyVXdlF37ZQlhN9bK
	 A+NS8TGWcfrca4epQTENWYUnRyf3e1Rtl9vR2+AB5ktBuaRwlJ369BO2799ThHK0IVBuu
	 pimuTA0DCVeqFAs7A3qf1Me+ixtaNcGM4pUdBBvNAGSmvz0qB/nuUNXjmuoceJz5miKMa
	 8xYMhP+I1j4V4ZovvEVBSpNPqe6fEFP+OwxLTB5o0Znbuko/20Br6JuAsjqiXVgVzwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SM7Yv/1HjzmGuGQj9J0EPWbZsOFrrCqzpNrPuOL5wcg=;
	b=TJDZiNw/xfTlUBMEQcp+g7YERhwd+wLG4hSPG95AWdXeCaBWYKK57LAZLjiRjMs5Ezq+
	 NDEEMb5dKq6QdJgkdSErqi+8GlWNl/Z4RWKSF1G7NWPvNzaC3ZYvBVlVbRKx4A8jMNWuE
	 Qpcidq6Gqy3e01ScbBOulq5nSkPA/V1kPj640Bu4lxX99MylVNPrr0pGg1B3xclcWkLH/
	 wrqaFD+8uLiTSC0yLwU8hz4afkiIHmGKw3LlejSTSs9ff84XAPUhPTYvS4rxCJR/+aneN
	 D4MFw3ULuS7/ofIIui2PRlKKtCtUWqHCuZgGRQzgYCnMLLiirWxIWUK5wv+8Tpz6Qqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yeh32Jht;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AD5606A31D
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 14:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67AD5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yeh32Jht
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91b834592afso27712646d6.0
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 07:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792938092; cv=none;
        d=google.com; s=arc-20260327;
        b=R944WAiO7SCtj+5jSVLg1zRWXzNgALJV9ccTuyAiJlOhrDjFIShuGW2J5zyZLnzXvQ
         tVeme1sNxoRtrLkpToGefoXXhrXljzIdy0UbiygbHUjvpCfiIFAjjbZBGIQgdZMLR1Jo
         cdskkzf6/CuyG32PPSm3TvSYCD5GG35pN6tz3OEhIl8qNH8Q61y5MG9zw29su0Mvk58Q
         yDyIYzbcOIPDkEMoD17yFxmYYBIz7C/MMXpd06i6x7FkJbJWwpVUE3afOT/xn705/4sm
         BlwJUEimMA5mpJbdfLdQlSWQ3b+y5WsZ/btgXFSMi+lpi655rx2QerbtkKjyficfZlSL
         diDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SM7Yv/1HjzmGuGQj9J0EPWbZsOFrrCqzpNrPuOL5wcg=;
        fh=TpUr9XNcjB26JfwG0mHF01V18Cs8TDLT/M0lwBJTd30=;
        b=hEEAOB8iIUPhAQmxBrAsXqRSl0X+fNGhcj0dfqB1IUz4n8BFfL6P7B8PEaK3Hgjhrw
         UtWAE1CWlHCBoV5AFjKaKGlYIu8U4WDRlzDiCIlYlfNU/4sDr/DjR1cHVOFFpHDHkJE7
         lH7Taa/zSmbQiNyb/tiNvBuEwRUe0v1L3xm4hb1huMtwbV7SrhqFgDYUaL+ReVHZKXhI
         UyCmudQIsIpzqS1h1tB5ok61e6ZKcAu9XK+DeEMoOiG55l0VwhAAQ5uVamoMrCAdUnub
         oc3r6IO9AFGeoiqWn913viM3PSxxj0IVknO7p0kgTnwVOaqQ02MBTuVKVJS4O7Kpr1i/
         0wwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938092; x=1793542892; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SM7Yv/1HjzmGuGQj9J0EPWbZsOFrrCqzpNrPuOL5wcg=;
        b=Yeh32JhtZmd2iC8QTwS3rSPC+4TSmNn+3v5gKoXld8RdwJJN3cxGhjaNGyXCto/O4P
         f+0jqrBrGvdQ2aISEC/WD/zgW5r7eSNj777rU0XiNu6UxMDUoRoJbJwRsvdMZwj4mVG+
         fRjhzGU1uQdgxHWWpYYg98vmTb2p0MK8hPXv80QRvnCu13AO68UzamMdcIiBnok+vEva
         aJVL++M0Y6f/ATiSXDOghgwOzxw4RiHirD2KgIemhiWiXjM+/P6PA1iES9c26TFg3nRY
         52ZwfNNhRZfVaFU2TG20+8PUDmVIeP0GLoiNDmaft7QhSttqZbo7dMYsXeBVR7c81S6Q
         3otA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938092; x=1793542892;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SM7Yv/1HjzmGuGQj9J0EPWbZsOFrrCqzpNrPuOL5wcg=;
        b=JSvstgIqSXxVNwQKHglp6398OWi/1QIcqMzI7mjafmkIxH9cKtRIqbBNKbPSrXlEqt
         vQIJw4KTIbtX/rLGxWB9zFg6HBRCHhkWypnj4/FgUIDszEnfHmFC8g8zzxs7SZDn7uQn
         /F5/c5pJO47a5nEPwcWe8qHrEnos13n+pgL0fL+pAy4vqw5u3+3VvmcG18tenKzR2HYD
         X32haGPOnAMR4tixbCanet6Kzu9wValE+HKaH8EYzAEJGmv3ajs24NzwUFsygZq6CcI3
         qosOQ0xZbZLiN3EifygtR/oCkkJyefUg+VGPOlKk8KMxpGQoqc6KJ/1gt9vIza6/pcB8
         3fZA==
X-Forwarded-Encrypted: i=1; AKwUvBxzkCGqbuQNVb9uaiQ9XoeizkCqnHCiNPP25ZkKLg3lf9bpfGgn/ts/EyIq4iz3Km814gyBYS2lsVQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6JsZGIEFEUakF2QXN5/ECFhdzInMr4EmQ4bLc/+Tg+y2WuG4n
	i2Z9ePuojYK7NtdD9/9R39LBpGrxYzb9sZ7FK9UbwfZLsH2Ym9L90JAHMdyPfC/Zf3Hv5FPlvVL
	SUiByREYB2ZiTgAQc08qHUU5RMmDwPx0=
X-Gm-Gg: AYBFou1vjJ/Avm0tR5MPiLRHlknKOIwvOWmuN81c9dClVcGazrH5qZKTMNVAnIeDNtB
	vCreysbjkvsgm9ZMRcwsi3LfZUiMKMoD/Wo7vSSk/ePGq3XvHHRewvPHgJn5ok7X2gkqteuJkNh
	3VtIculDWZztFYYeGE+TmJr9imihyzW641y2TvAo31UFvsUTWkckAMUuZr2PMYHVn9iuimwveHK
	EIcWE74lVJEc9USWz2BVnz1YUxXiRXZGRNBfQlPBfkf549yWyUw2Pj9QB78Zg+NTagLWrWVjZwk
	tvuSnzBJKlPdqICkO5gATB3+Lsqxfiy/gqguIsj1uMYhT4h80gZGb4AfUmqQYnTb44aymqSwqk5
	pU5DnN7RCrsEJBbs0OGRGTKg9RwEWY3V3+EzWgM1drcBAOkJfCs3C0oTZS9NxsDNOCGax1bF2nG
	r0Zb2EQwj6kF9Ecy1wA2pIk80A5ATsCSkVhacXuRf+nbJ5dMMvOgRi8eqShLs2FeFzhUs+rONB
X-Received: by 2002:a05:6214:4601:b0:917:a943:c4c2 with SMTP id
 6a1803df08f44-91c48e56a20mr74345036d6.23.1792938092287; Sun, 25 Oct 2026
 07:21:32 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020142534.3533478-1-sashal@kernel.org>
In-Reply-To: <20261020142534.3533478-1-sashal@kernel.org>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 11:21:21 -0300
X-Gm-Features: AclHuK_3A6YoAPopWYDdBpyLpTtDAS3DEQEhpWyYqeQDBqHn86Lo3m1k1XEe8Gk
Message-ID: <CAMAsx6ch8bztwO2w+gA1xc2H8JEM-7haUd05dmyODN_=VWJ74A@mail.gmail.com>
Subject: Re: [PATCH v4] docs: submitting-patches: say which commit a Fixes tag names
To: sashal@kernel.org, corbet@lwn.net
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brads@mainlining.org, 
	gregkh@linuxfoundation.org, linux@leemhuis.info, mst@redhat.com, 
	error27@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026, Sasha Levin wrote:
> +Name the commit that introduced the bug. When using ``git blame`` to find it,
> +do not settle on a commit that only moved the code. If a later commit exposed
> +an older bug, add a Fixes: tag for that commit too. If the same bug was
> +introduced separately by more than one commit, add a Fixes: tag for each.

Hi Sasha,

I went through v4 against the tree (docs-next at f857ff5bf):

- the new paragraph sits between the description of the Fixes: tag and
the existing "Note:" about the stable rules, and reads well there;
- handling-regressions.rst does ask for this ("Add a "Fixes:" tag to
specify the commit causing the regression"), so the reference in the
changelog is accurate;
- I built the process documentation with the patch applied and it adds
no new warnings.

One thing for information only: checkpatch --strict reports the
"Assisted-by: LLM" trailer ("Non-standard signature" and "Unrecognized
email address: 'LLM'"), because Documentation/process/ in docs-next does
not describe that tag. If it is defined in the agents series or in
another tree, please ignore this.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
