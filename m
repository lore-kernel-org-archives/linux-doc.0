Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578673F0A81
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 14:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066576; cv=none; b=C/UDQD6XJC1wKmfVp41prJ4CaZ020AR5czPYTkrKXg7hLLOaXFS2ljwmUzw1c6qPON64TaMu6/Ch5GJVqJdiDgK5YXLYI0SweXRbuHppSLIOQoruiCNzmUFTifS/mx9CYdKCvSU7s/GUf+bl3g10Yac0QOOwuNmTJfLEwkOnlmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066576; c=relaxed/simple;
	bh=TGSbtZ81+gJhs54t7hRBEcQBUzBN4z2l/ycleOU4/pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ot4+mzsZoCh4+UjLtZbXAk0wv6BedypcxE/hHDlUQKyVkhsOd/8snpYmadyWvbLn3FtLfSeJMSAZzbqEH9ppfB2MZUBTtSdx4E/V0x46gWd4hPP+A1Rw7CZExT+k9nrvf6JUjCqGnogeN2Zy4hcl6QyeTorVDRS5LpgkzFbWtQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M15wgI/w; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M15wgI/w"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4908b92904fso26222735e9.0
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 07:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780066574; x=1780671374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4sxBURKEIs5vdCG6YL1mHOm0YuBgobmnmOVB3aNVSj0=;
        b=M15wgI/wsi+JAnMW01hc8DJy/2xg3Hbb7qimMrIu3Zw1qmYv6jWVI/NYZdjzrJJ42l
         aPewwr9Yevu3TMcvyUspVWOy3ji/eqz61NxGQYOVd73gvxptJTIXyhTdEbKXc0ATNn60
         L+eE/YYV8J0ZcLfwrlo7xwJl5DBIBfYfUvBnGkdbFW9v9bOwBHTg4fU1VJU3GHRO6Odq
         mx8N5hhWfI3RbQAnLoeYYBnG4hOK11eKBnip4xcyauxQO9R24Kdb25UF85BIxzN4AgWo
         21x/PVEx6Flw2wR3CnUDGtOOtDol0I2/dEEcTpiQmpGehuMuKTvsjXyUOsgPKMLoEwkl
         6bZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066574; x=1780671374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sxBURKEIs5vdCG6YL1mHOm0YuBgobmnmOVB3aNVSj0=;
        b=EuZl83dhNjCJF0BbgQd4u5Wwzqk6W7XGFNmzTJIGJ2YD52J/MkO9icOWUN6w2USF54
         sI/hZHO7kdkXuKo3MkjFDMyrm5BvdQ0FcIAPq8b7xhHG0rbTCjTJ3PmtvV5QRyCi/QEd
         JctLzGhCcdx6MuGYaV8+H7+wLEVCP+oanDkH9uHgXlu5n2OU6y+N2TFHhyxzz6NrqR0Z
         PqWDeXN9IkVTyAXeLz0a1SvAl8qqrNYBrqVVmxPEhAwONS42gXbdsA62V5ENEhHvxLUW
         mznme932jDIXeluEpc2YCcv8UlWjAeOom4C4XMJgPFCSHi3uthYeMkPVTuA4b1R3ABqk
         f7yQ==
X-Forwarded-Encrypted: i=1; AFNElJ8moVWkdXaohRJ2t/AzdvLjU4NdVl/kzodER6IV/+kjOYosSuXRR8BGsMTJuIetwiyf43M+g8+vtV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLr8V6zICNDej4qZSHTi90fCw2Uh1UsKoXxE257NFl3ro5D6Sf
	GzZRNrjCXxFPPc8a071GZVeroDZ7WzsjOHEtBefl0ZvRGud4LPNnbpjeyiEIrgrIYNo=
X-Gm-Gg: Acq92OGMLTx7hhJ0YThlQik0/l7lEOq5TVsQ//hfWm2nD5UwU74OH5Td3lNhVYsUarP
	W1d1n+OEunCmnJwH4E5v+YP8Wnm9yl+xNWSSVICTgfRfZWcnlNRChffa9Enhyq4u4QbJbt5ocmh
	Pma88OVTk14gyMVcoziGSjvalEJAZq72hRO0iMADyVtKsx9JwNLSYOKHbhjuM8FtMzCLlNvwoKX
	Yhji0zz/oSCCFw7E9Qqo7enonmAwzS2EmzWT+5GxeU5sq05UxHm4fjqRUvACj1uTvpG5ssTVmtv
	YD50WKkFOCne3DHWIMOCl5d4hxZjhHcq1bqo2d/Fpya3D6WUpEX2j11oAyoHqQ5snJnkrKyaApm
	VqNIY2atu4iZpgdmmS15eQK+JQRjAxErSsON3TkJplfKa63Yk0juWIDWVLA3fMdJWw2Lb8nOj5X
	LupgIqsDIHA2suxKzvMejJeMTYpz3KRk7/VUGZeYxRmIGxiCHYQWOps7myxxk=
X-Received: by 2002:a05:600c:4e55:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-4909c0a7eeemr64821725e9.16.1780066573715;
        Fri, 29 May 2026 07:56:13 -0700 (PDT)
Received: from localhost.localdomain (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909dff2a80sm51054325e9.3.2026.05.29.07.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:56:13 -0700 (PDT)
Date: Fri, 29 May 2026 16:56:11 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Eric Chanudet <echanude@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, 
	Natalie Vock <natalie.vock@gmx.de>, Tejun Heo <tj@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>, 
	Dave Airlie <airlied@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm/memcontrol: add dmem charge/uncharge functions
Message-ID: <ahmoDiQ8Q11xUgtV@localhost.localdomain>
References: <20260519-cgroup-dmem-memcg-double-charge-v2-0-db4d1407062b@redhat.com>
 <20260519-cgroup-dmem-memcg-double-charge-v2-1-db4d1407062b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rwilhpywdsxyo6sd"
Content-Disposition: inline
In-Reply-To: <20260519-cgroup-dmem-memcg-double-charge-v2-1-db4d1407062b@redhat.com>


--rwilhpywdsxyo6sd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 1/2] mm/memcontrol: add dmem charge/uncharge functions
MIME-Version: 1.0

On Tue, May 19, 2026 at 11:59:01AM -0400, Eric Chanudet <echanude@redhat.com> wrote:
> +/**
> + * mem_cgroup_dmem_uncharge - uncharge memcg from a dmem pool allocation
> + * @cgrp: cgroup of the dmem pool
> + * @nr_pages: number of pages to uncharge
> + */
> +void mem_cgroup_dmem_uncharge(struct cgroup *cgrp, unsigned int nr_pages)
> +{
> +	struct cgroup_subsys_state *mem_css;
> +	struct mem_cgroup *memcg;
> +
> +	/* CGROUP_DMEM and MEMCG guarantees this cannot be NULL. */
> +	mem_css = cgroup_get_e_css(cgrp, &memory_cgrp_subsys);
> +
> +	memcg = mem_cgroup_from_css(mem_css);
> +	if (!memcg || mem_cgroup_is_root(memcg)) {
> +		css_put(mem_css);
> +		return;
> +	}
> +
> +	mod_memcg_state(memcg, MEMCG_DMEM, -nr_pages);
> +	refill_stock(memcg, nr_pages);

This doesn't look right.
Here should be memcg_uncharge().

Regards,
Michal

--rwilhpywdsxyo6sd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCahmpBxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjhCQEAr+BVWEm8zFPKmbprS/Y0
DGDmEkJvmxq53yv7/M98beIA/RFe/RMHQUNUp4via8ejOQCz9uiKLY1q3PFlk5c+
ByIA
=eOXW
-----END PGP SIGNATURE-----

--rwilhpywdsxyo6sd--
