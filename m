Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941D721D3F6
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 14:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762956135; cv=none; b=JABlORgBNYWrUEKpPbtQ8uV11yitzj5qXUERMwNOjidDHIi5j+EJftJy4ElQNfVZOhbUDI89KxCOGme5TozC4jQ7YzFVgC6Rj8U1osokSk51mZSdbyF5DYDLgKAk+bLeDi6/QHa7ScrX/h133BAQfXeSMFFtZady8HhkwGOo1Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762956135; c=relaxed/simple;
	bh=hhaiEJCK8eTAN1k0/yDDRPi3ZY6cafDGrtKd0G+aZE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYzMc1E73A5Bp9maSx5eHCFTUi1YCK9zF6jkCX+8MWNvGI1AAGnGPnPQm76tDqI5pi+ryZcZghA8EZqtAKL2+HyAdmKKqUfTbqeyayfLh+XL4PCSCU/S9y1G291afQtzgX/WeN7Lnasa0IZnDeZ0eR1iA/qNiV7q0Htg4fDMdbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ARbnSoR1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ARbnSoR1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso4482125e9.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 06:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762956132; x=1763560932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WOeUMdFLrARgOFLb1t2AnuzeStuy1JBycaUsDP/wyV8=;
        b=ARbnSoR1Nr+HjwG9Lv8sC18gr+fpb8MIBNs7/go6rcbQw1/ivs01jtIGIyAtZjsE4X
         pvu6PowI+oo1rKE8UdTg4C47+72oQIGo6GTyaWbDNLcu1KAMXvOx7u9PXXsh4jzE+bOG
         Rf+swwgpHyCQrL4odfcSk1H8GIaVIlY0JSd49O045T1Gh4fPds4G1Sii4e29r+IOqc5h
         f2f3btewh+P+BX4hwJMoFPeQjI0RHsdyhokEwyF9UaU1pXJGa4MAuCJQRxlUvZyqz5wT
         X3hf8Z6pXdtL73NK6nKFlIJYlnuqUPMsWIODWfOO20kyIM2lfrCn8rujw9DSqGSowPIe
         nGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762956132; x=1763560932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOeUMdFLrARgOFLb1t2AnuzeStuy1JBycaUsDP/wyV8=;
        b=f6+stJARuTYuhaRpSUD/wKki9mZ4jTT4NdaUBDoj556Z07CJMAGgT/JaF1ii/Kqczr
         YXiyfD8FfakrNYW7YbqpVgiLcNzuww117FeIVpph8pgauXM2qwAUfPSUN9+iM6Nksdd1
         3Xam8Vk+NB9cGAF9YXMUq6l3i6eNrIC86Fm09RZDgbuxK/6H5O9osSMCkwdSy7N0qyw5
         zUHwIHPxtMpmLX6ICOgaXc0Iw8wJg+Gv891ZWyrGKLZL8PIxnEsTfknUl7P17KgJfE9w
         vwH6F+3QH59TRAOZRdibrtxCs3iWaTfMPnUVv9Orqu4ht58OhfnA7joEpzDR3ZwqELEH
         /zVA==
X-Forwarded-Encrypted: i=1; AJvYcCXdbv9/4kx1Hq3Be+Cfi/iEPkZcl2ZNQhZs4ejFUX8yqn7r14CXjcv76V4Yq3J8fbf0XRKUkfHWeNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAFlOTeGTWjGW0r2TVpX8jkfdTigdwZkbaBZW6TNGzAAwJliJd
	zg9VszcRA0bbSfIaqEwpPpbfYU6Oi6v/OlTAok6nSfNf0Qjmt6scLUscSZZ34BwGNAQ=
X-Gm-Gg: ASbGncufhNiN9mwaeqXNqvqR/reQfHUYhgDcYpOtaDErEHgEbcHG3eAIKSAweY9pnBq
	NeSMh9PxbM0nLZrK6tyh78wf5EXHBtykDe51OgpZAR+szK8Ho8TnIC5Rz+GLPeScfU8FTB1SAY/
	mXCVs23lM8a8HexOKAXvnhnB9QyCOn1mxp2+azEfGmpDX6urh7DCRqz1M013dS5jU6sEWIBZ8wJ
	k9zmBcYL7PZeOW9vZSGNTiNYxf403t7UaUdNvsB/sCsVHQJt8A44PSvE7RL72LKuLd7Q3ORat7D
	9qonE7XrugG+8cqMHHdwDDNQD0sN/gSjfMpi+UQl5KOnJqSCelYuXm0btRGqFCeckS7M3vyuWOT
	i93c27AjtiOY3lpFW/UUkTr+ln9qrrx9ppZLGoxbjLOSqGzktFtJIivwlx2GjHtfUn8Z7Mavj9F
	BOMvtUZBtcZbp2KIWoSaGU
X-Google-Smtp-Source: AGHT+IHr7c4ZnrhLQZ/bB6CXbwoEkep3GrU2Tc3liHlu3o2VJH0vMGReTx6XLb+PoXt92HxE5gNWUw==
X-Received: by 2002:a05:600c:3114:b0:477:1bb6:17e5 with SMTP id 5b1f17b1804b1-477871c4b45mr28509875e9.30.1762956130143;
        Wed, 12 Nov 2025 06:02:10 -0800 (PST)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e85a94sm37157975e9.13.2025.11.12.06.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 06:02:09 -0800 (PST)
Date: Wed, 12 Nov 2025 15:02:08 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Michal Hocko <mhocko@suse.com>
Cc: Waiman Long <llong@redhat.com>, 
	Leon Huang Fu <leon.huangfu@shopee.com>, linux-mm@kvack.org, tj@kernel.org, hannes@cmpxchg.org, 
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, muchun.song@linux.dev, 
	akpm@linux-foundation.org, joel.granados@kernel.org, jack@suse.cz, laoar.shao@gmail.com, 
	mclapinski@google.com, kyle.meyer@hpe.com, corbet@lwn.net, lance.yang@linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [PATCH mm-new v3] mm/memcontrol: Add memory.stat_refresh for
 on-demand stats flushing
Message-ID: <ew7opa4vqangjafwfthroe7d37ovvvmlekzc6clbqia7od4v6y@344cuiqiduc2>
References: <20251110101948.19277-1-leon.huangfu@shopee.com>
 <9a9a2ede-af6e-413a-97a0-800993072b22@redhat.com>
 <aROS7yxDU6qFAWzp@tiehlicka>
 <061cdd9e-a70b-4d45-909a-6d50f4da8ef3@redhat.com>
 <aROkMU-OFAmYPBgo@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jtcwccftag6wk3eh"
Content-Disposition: inline
In-Reply-To: <aROkMU-OFAmYPBgo@tiehlicka>


--jtcwccftag6wk3eh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH mm-new v3] mm/memcontrol: Add memory.stat_refresh for
 on-demand stats flushing
MIME-Version: 1.0

On Tue, Nov 11, 2025 at 10:01:37PM +0100, Michal Hocko <mhocko@suse.com> wr=
ote:
> How does that differ from writing a limit that would cause a constant
> memory reclaim from a worklad that you craft and cause a constant CPU
> activity and even worse lock contention?
>=20
> I guess the answer is that you do not let untrusted entities to create
> cgroup hierarchies and allow to modify or generally have a write access
> to control files. Or am I missing something?

This used to apply in cgroup v1 but the v2 controller APIs are meant to
be available to anyone (e.g. rootless containers).

So yes, if it turns out that the isolation may be substantially bypassed
by reclaim, I think it should be solved by some rework.

The memory.stat_refresh is different because it doesn't exist yet so its
impact on isolation needn't be even potentially solved :-p (not more
than memory.stat).

---

That's also why memory.stat_refresh is different from one global
vm/stat_refresh (easily constrained to root's monitoring tools).
And despite this precedent, I don't like the approach of two independent
invocations (write(2)+read(2)) when the intention [1] is to obtain
precise data (at least) at the time of the read(2).

Cheers,
Michal

[1] I guess. I'd still wait for what the actual usefulness besides
    fixing LTP here is.


--jtcwccftag6wk3eh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaRSTXRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQfj0C55Tb+AgYtAD/c+S8KG22icAY+D5u/Hw+
IaaTSOoxlnotS8mWtF9Q37kA/Rx/AJ5T2cm0Z5vyBpqCrcQhSgksn4AhdUXvWv8t
O8AL
=ff7K
-----END PGP SIGNATURE-----

--jtcwccftag6wk3eh--
