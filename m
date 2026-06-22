Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F1B30CDAE
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 16:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782145509; cv=none; b=NoCxPCM5ZeymfZCmCLEdHShqX2qZxUsaAt67S01oFnPPXs6IJ6mye3+fJ7G0jlYLGFHLeydTrE2zUNsmQBN5mKjv2GRtzXOY7syiCeicwSdwIq4rLh2pKA3QqHag3JEaJHtsNm9cwDzHMKRDqmhKGu9RFwwT91rN+M5A8X55JXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782145509; c=relaxed/simple;
	bh=Pqc4jM+GBUi93/Y6w+cgK7Vc7OZCkjCZX3cJzwQfJHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2iKsWg411toRmgmd1Wjb8yiVkSSH0SoTdWMsPMCZGJ8SitiVFLADQmtscJGfsF5JPcAa9pioEO1iItFjgaB5rZnoQSXrNIGko40ZLneJxKY8naAUZkG8YJbrUJfJ37QCrsqRHxqmPmw/sLcH1KRlkL5bPrshkYY+Lop2AK80mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZtAuhLkc; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZtAuhLkc"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4629051c946so39736f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 09:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782145505; x=1782750305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sMLIt0eZRojMqZhfsI3oKKF+5t4VTIJSxwMeV7ztxpE=;
        b=ZtAuhLkclasew6/nGBdlwpjGegdiG3NWkBWGE8/UcFAe88OA1z+mm535DkIHYi1bYW
         KKLCrIb8Ww6bhX6zotfQ3fSu8h9tGyOyJLj93M4iwVhw+m+64cq5tUAZDx43TszU4vPd
         nASQwmQ3iS+JakzbAm0w71Wb9sgPsbxNRwp7CaVpxA2DU2jSM0+nItjkaduMNcoiCOJS
         8e/HyFNkHb/lQw39UeuR1C6k6Tor2c/O1NgHhFdC6AkgfsL5s1XLugUGl+JDHiM51zw9
         Llp/5yHSeloBK1mOk0QEzUrgtvJs9neKOmDmnVKgkDlmohNKVTuiBT9y2s/SlnX+sW/i
         s1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782145505; x=1782750305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMLIt0eZRojMqZhfsI3oKKF+5t4VTIJSxwMeV7ztxpE=;
        b=hovyxzM9hZsISI64A0TUnJa8SCGq74d1kXkTq6nENinTicSDLsGj0zJ8z6Kz0MWUKX
         av8qfeW59qCt83wZbic8Xc5F1AvGW010dIJGW253wNuoy0F2GAxpo/CTXX1IW40Gxaqj
         6kDYXi5HlFERhUMVn9zvLd3BOCFBqnLjwBsDMUt1IE9CYSqegIOP87klp0nm6ZvZIftn
         3JN4Y9fQcHybywDd5J7Sy1x0VBxUvOC7hhrOaIuJ7x/s/f36vA55xLVhDo1UcQ6Yuirf
         ixgQy5rTDWGlxKyYzivbu3mZZk3hRSgjDvNbsuBxhv3uSHaLojyP+kUdu4vYvMgqlFfs
         Jbrw==
X-Forwarded-Encrypted: i=1; AHgh+RriiDURri88llaa0NtW9JoFxgnzcCv/DpDlxXId7p6uPh7ZKxv13Sxpfv5mZHcobPfaGKUdZUIRCoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBfWQ7cJYujL6+bUNu1USURjLCjFLgeQ423ZrNhaVfDxwsIWZy
	sxB0IoQTS/ygVGPXyeWtgIrHJEXOXRe/l3fGbJnlv7mMWhZH42A0VsOLBoY90T7Wn9U=
X-Gm-Gg: AfdE7cnGnZTqGEb+pLuveIp5aNU9v5+HlcHRy5RWZMpz7SXJ3NLeBIy46+fVk6no7jE
	Zd9jYF1pLBVtu2MMOFhEpu+MNo09TSdLuOeDVkJpxyNzVCiPJBoYszCeqZ9256fJP9IrIJa9i5/
	EIMESYettmWYnvjpEiU38yMng87mrifvJOJ35ZWDGugWcs8s+BvHQQWIwkOCmdXC0Abfhgalm5W
	f2rR+8Yb3DoV9YLl7TVYeeKFd9E5QpuRboQbYsq62FW4YAfgpN3ShfLJLw4OWaSUQh2WmjdnxGv
	yzZ7tXN6QqL+OtLWh7S453vEzEwGfmYG2Iz9MOsmeq0d0aM3n8Q4xCJSLZYTOE+sSU4qxnvLKxg
	VRasMG21hJC/MuLMF/taupcG3Awe0zvEz6U6Ak4ZAT/gr/w8umPWu8HCB1Q1GGnoCvJF5YYezq1
	27v7FVROLzanhfQrGV8dpFUu8vl2lB
X-Received: by 2002:a05:6000:1888:b0:460:21e7:330e with SMTP id ffacd0b85a97d-46a7efb72e0mr336250f8f.10.1782145504382;
        Mon, 22 Jun 2026 09:25:04 -0700 (PDT)
Received: from localhost.localdomain ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5413sm28550880f8f.11.2026.06.22.09.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 09:25:03 -0700 (PDT)
Date: Mon, 22 Jun 2026 18:25:01 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Doehyun Baek <doehyunbaek@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Docs/admin-guide/cgroup-v2: fix memory.stat doc details
Message-ID: <ajlgcMFJ_Df2s93d@localhost.localdomain>
References: <20260620122751.388770-1-doehyunbaek@gmail.com>
 <ajlLhFnMZGoVxLE6@localhost.localdomain>
 <CAN-j9Upy=thswORWaU+QxuO2i8uJKrZxcLpt5umP5QGRhpwqaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fksukxp23q6rzf56"
Content-Disposition: inline
In-Reply-To: <CAN-j9Upy=thswORWaU+QxuO2i8uJKrZxcLpt5umP5QGRhpwqaQ@mail.gmail.com>


--fksukxp23q6rzf56
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Docs/admin-guide/cgroup-v2: fix memory.stat doc details
MIME-Version: 1.0

On Mon, Jun 22, 2026 at 05:26:53PM +0200, Doehyun Baek <doehyunbaek@gmail.c=
om> wrote:
> However, both zswapped and zswap_incomp are memory_stats[] entries, so
> memory.stat prints them through memcg_page_state_output(). Since
> MEMCG_ZSWAP_INCOMP is not special-cased as a raw count, the stored page
> count is multiplied by the default PAGE_SIZE unit and exported as bytes.
>=20
>     unsigned long memcg_page_state_output(struct mem_cgroup *memcg, int i=
tem)
>     {
>         return memcg_page_state(memcg, item) *
>         memcg_page_state_output_unit(item);
>     }

Ah, I messed up how memcg_page_state_output_unit() is used. The printed
values are amounts (in bytes).

> Separately, this matches the existing documentation style for zswapped,
> whose exported value is described as a memory amount:
>=20
>     zswapped
>         Amount of application memory swapped out to zswap.
>=20
> Since zswap_incomp follows the same memory.stat output path, I think its
> documentation should describe the exported value as a memory amount too.
>=20
> I also boot-tested this in QEMU with the current tree and zswap enabled.
> With incompressible pages pushed into zswap, memory.stat showed:
>=20
>     zswap 87822336
>     zswapped 87822336
>     zswap_incomp 87822336

Thanks for the test and for the fix!

>=20
> The zswap_incomp value there is byte-valued; it is not a plain page
> count. It also matches zswapped in this all-incompressible case, which
> is consistent with both being exported as memory amounts.

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--fksukxp23q6rzf56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCajlh2RsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjefwD+NV/VDPrTB56lm0tTV9Bx
3LNony3pBqJ3qGqO0IvMxvAA/AjgY0KM15uzvd2GJiB21yMY0AXrJOboe9eQq9sh
BpQM
=ybGu
-----END PGP SIGNATURE-----

--fksukxp23q6rzf56--
