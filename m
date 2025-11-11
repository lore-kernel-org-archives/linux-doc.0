Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108FD20ADF8
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 19:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762887682; cv=none; b=N7Pt0iu7Np8XzpBERf7rDkWTYg5/4dBMTDoQE1TxQ3oM8H+iGPqJDp3px9idEag1Pl0TzaCVslVYLWysjgsUUx+fuQty+BYmrn0FFXrP4OK7UC+qiW9E0tN8VPjkTjJr0EfPTmtL4Y10O4SfThFrJ0vOt/uI/cyX3wb0w026qN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762887682; c=relaxed/simple;
	bh=Epb41NgFerG0tgs3sczL0A6VdBeDJhkEgRYHHk2JhIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHOnUR5QhKRYYOjtNzvwIPuJ9B6+/SEKfNBTK4oB3zwW/F+ULc5KGXTXVVCl4h0MtnOaa+dQvJquABECjGptB5vPueC7W/Zy7qnfL3dKXPAerfyYvjyIZdDxFw8C5A4GxtVBM73+usey3Ie+4M5OcJgOguEAsaBsQ8/UrI+JoCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YU38gCer; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YU38gCer"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b32900c8bso5355f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 11:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762887678; x=1763492478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Epb41NgFerG0tgs3sczL0A6VdBeDJhkEgRYHHk2JhIg=;
        b=YU38gCerCh3gS7SUuYCEaqWJZryQU/qAZo3ICR4CL3WeRGzzd8iXAYKAgMEwL/Su04
         TEJWZl+a+LZsTROjHKPpNzur5KOSeLTbx33C9qcU4J3SWI7PHiUmBCBpqbeB+kdzoc+5
         MN/wj5iBqvyRF7XLTADRSUrq2iuznPtLE1RA5Lfzw9BbnSmVAiXgZ3b2r37Wa7p4GJW1
         yUidqxeICV6t1ah4aq8ANz3K/sSFRQn1c4fbyzGI5wwnbiUxK2COGAZAHEt9NAwx3nx1
         LrRIwDJKAmHFSC94i+2zn8U2YmKyYtGpvGNCe3hoHoG4OSEFXEiYWG73LTheXZV5tmvx
         HOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762887678; x=1763492478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Epb41NgFerG0tgs3sczL0A6VdBeDJhkEgRYHHk2JhIg=;
        b=dKhO7T+MnUh9QedbDKnDRqcNAG3Bt38MiukKmn4gqt3b8XRSzH/syPNixDT+4aHzL0
         0FKUo7dNTBSNNhz8I/P8AYmThNRcFhzk1kSJ5AqG7aHqMXu0fVMQEeXJOfs5O56FDbGF
         SmSneHko7U2Z08kueHZyYuXE6mZrBaSrrwpe0NXs6HhvFsoy0hbBfu2SAu5/T0yosrKc
         RgUkP8nvWyjePqKWj3lLKkNiM8DcOWqKKUAkFx+Hkn+MqBEUWZAcfum2cfhkfWlXozXm
         9rdrjsGkk8wXPNUEnivpe2OYV2ADDZkWDuCfYH0rMNH5IPAhRngBU77MzIVbaUctNwPq
         qaTw==
X-Forwarded-Encrypted: i=1; AJvYcCUrutXsooOPGIK+NpJkrlWyFuexShi0kvd9OUqNCHuodWcuXcxDkOxIFr6W6cmtoT4y+1v8irBI7wg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtasFT1vZqZ0qoZtTUlz3KuECfT1QzWb71tNH56mdnbpi9WIit
	TEeR40reRmudcfAXomyGZvjRuoeBvW9GLHO9ZFzJHE8aLDV/mF3gcS9rPaFDJFurSWU=
X-Gm-Gg: ASbGnctGlz7hplNVorIhh2DkxUdZV4XZyNEwuLC6uFfeO+3g8PVeVTQh4Kllr/Vu10i
	aERR8TpTi4htZ3AUZO9juJV4BkVJugmc1JM53gg+SNtKro86N3IpvGrx6FK9e7GWjikY2aSzu4c
	0sDcLZ02REQinuJ/w2PjJsxZtmY30Q7xkU+Bk1xKpL4cO3xAIP16fdM23wC5wG5UcGVP41v483y
	ZK9opVuK+sxEbCRflisBVgjCwvrzG61DuvM3BGzUGPyTP3R1msP4VEJeJNo9ZSeP21iAKhVRRLn
	ANb5MeQ5Impx/XKXiqbN0/K0OK90ON+JHTCVjQI5mWJb2YhYy2vYNnjjdv8I7ldnVSwo6CKN84k
	41LuGgadumnwTaoPno5JTdYdG4H3IvWx0xhyi+R0YZC/gOvS3wy3Ji5MJuJolIDWOVbAB00EpHk
	2pKkSfaso//rGhYWqRmu+docnHKas5PU8=
X-Google-Smtp-Source: AGHT+IFjd4Z8ZyYwgjnX/oawjyx5P78Okty05jRhzRxhhnb1ZsNUnhRLUldhAazDANfsJjvK+WSEYw==
X-Received: by 2002:a05:6000:2c09:b0:42b:39ee:288e with SMTP id ffacd0b85a97d-42b4bb8b9d5mr281057f8f.13.1762887678240;
        Tue, 11 Nov 2025 11:01:18 -0800 (PST)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2e052f32sm22848861f8f.17.2025.11.11.11.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 11:01:17 -0800 (PST)
Date: Tue, 11 Nov 2025 20:01:16 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Leon Huang Fu <leon.huangfu@shopee.com>
Cc: akpm@linux-foundation.org, cgroups@vger.kernel.org, corbet@lwn.net, 
	hannes@cmpxchg.org, jack@suse.cz, joel.granados@kernel.org, kyle.meyer@hpe.com, 
	lance.yang@linux.dev, laoar.shao@gmail.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mclapinski@google.com, mhocko@kernel.org, 
	muchun.song@linux.dev, roman.gushchin@linux.dev, shakeel.butt@linux.dev, tj@kernel.org
Subject: Re: [PATCH mm-new v3] mm/memcontrol: Add memory.stat_refresh for
 on-demand stats flushing
Message-ID: <5xyq3w4jlewi4gt326exj45piti46vrsqkxnh4jzxmsgl24rm6@ivoslsgvgkp3>
References: <ewcsz3553cd6ooslgzwbubnbaxwmpd23d2k7pw5s4ckfvbb7sp@dffffjvohz5b>
 <20251111061343.71045-1-leon.huangfu@shopee.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="csbfp2a7l72eto4t"
Content-Disposition: inline
In-Reply-To: <20251111061343.71045-1-leon.huangfu@shopee.com>


--csbfp2a7l72eto4t
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH mm-new v3] mm/memcontrol: Add memory.stat_refresh for
 on-demand stats flushing
MIME-Version: 1.0

On Tue, Nov 11, 2025 at 02:13:42PM +0800, Leon Huang Fu <leon.huangfu@shope=
e.com> wrote:
> Fewer CPUs?

Your surprise makes me realize I confused this with something else [1]
where harnessing the job to a subset of CPUs (e.g. with cpuset) would
reduce the accumulated error. But memory.stat's threshold is static (and
stricter affinity would actually render the threshold relatively worse).

> We are going to run kernels on 224/256 cores machines, and the flush thre=
shold
> is 16384 on a 256-core machine. That means we will have stale statistics =
often,
> and we will need a way to improve the stats accuracy.

(The theory behind the threshold is that you'd also need to amortize
proportionally more updates.)

> The bpf code and the error message are attached at last section.

(Thanks, wondering about it...)

>=20
> >
> > All in all, I'd like to have more backing data on insufficiency of (all
> > the) rstat optimizations before opening explicit flushes like this
> > (especially when it's meant to be exposed by BPF already).
> >
>=20
> It's proving non-trivial to capture a persuasive delta. The global worker
> already flushes rstat every two seconds (2UL*HZ), so the window where
> userspace can observe stale numbers is short.

This is the important bit -- even though you can see it only rarely do
you refer to the LTPs failures or do you have some consumer of the stats
that fails terribly with the imprecise numbers?

Thanks,
Michal

[1] Per-cpu stocks that affect memory.current.


--csbfp2a7l72eto4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaROH+RsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQfj0C55Tb+AiN9QEA6sXoc/oeJj+mDnKkROmk
nkeyTszvrZYKIEtJBQFSBuYBAJ76dUKkXJVOhrMBSE2sGSx9Ye0xq8mM3w8ZTrQk
jKIN
=qop6
-----END PGP SIGNATURE-----

--csbfp2a7l72eto4t--
