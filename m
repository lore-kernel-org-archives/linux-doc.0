Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBF8305684
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 15:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561212; cv=none; b=iSpwh3N5vfw6PnP7JnTbRyM4abDyijZErKV5946Hs7BPkFAFit2oeWr4/EInjDhpsuHXL3GS2AFrZItnvEVD6yaXBOxe99u9gHbvfeSYGcFTJ8zJZr+oTpOqk8qEGTrM549NeJ9BXzzr0FtvLsj/vf1pqdcybMbIdWk0BKemhDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561212; c=relaxed/simple;
	bh=ghK5za8aF1N6pu59Foh6V9T8x31sHIYSxEvCSet479c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFOKILs2Tjfn+zQ4akaV90t5hyGk5nnfFFvb1GQbdF2GYIBjY5lbYmKmwGic2fC+gbaBChEsgRAIvczh0hlkriSqj4Oa1geODGbd7bjzpwoIwvHPSODezHMeeQrbYa+MJIJmc/ZXItrBDzwJb3hsVV4PcJUQi3OuP3+BFHvFFqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EODW0rM2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EODW0rM2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954afac04bso27573695e9.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 08:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784561209; x=1785166009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ghK5za8aF1N6pu59Foh6V9T8x31sHIYSxEvCSet479c=;
        b=EODW0rM2HPV5v5jXus1d7KAZ9mo1j9TPtlIBiFreQgiElZjXszktq0p8r01pOxTADF
         9cOtOrjCoKSFFDvpX8/HHtu3BCLRxlHKe+uKE5ZKg5J4nPOxZXRYL1If6O4FlfZMSug0
         ftcJpm8AtbFt7FzxhQBY8+r/nEfcOMfuplJSnlCzkOOySkR1xTVqt0QwLIfoHqmjWveo
         nziJmkQLDps+s3dK10Na80TWebbQLimIPSIlBe/ljLucc6yj7vjBpLar39UeIplHugzf
         tk99l79OsRdIkxTA34txdLq/ipFyivs42MmbBiBAxToyPMm4fQ+q8bCyXB722ie8z7qH
         OV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784561209; x=1785166009;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghK5za8aF1N6pu59Foh6V9T8x31sHIYSxEvCSet479c=;
        b=fXsq87pTjL9HYOzX+mtZ78NgaIqMEyaecWaOtxVfzqCy8jfRj3dRa1nFZr0S7h/nSh
         oelhHKor7i5hD1xYZwJCN9Fyh08SoPV2WeE8aIGwx+45+UYmdT2yJUh0iT4TqTuOSxaf
         o0LYq2Ap3yxYlqiaffsRJ2jX/swVz2HxANie483tvozw+jAevHC3nRHp+LASGTn35Cd5
         uG0R/xJlpK5l6uUgMmgQ9toIuETcXuBpmiHltczjoRONFY8TzIlQgTDWIAKOu1XueMRs
         30Ptu4fhh2nL/PhgD0xKwctM2Pg70DfsnmMpZB8hV7jfN1e24TTpn+ap3VxcYkvhJshn
         t/pg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7t7fp4IXN+XuTVd5VRmRd5HHQyysJ0nhe4scVTpSv5hWr4PXQMp7+hWtkWKCKdDJEawLGM2hIyCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzELerdT8BentHYVYaALX5mVs5Fj8Tpbj2WEGlasmxQadGz6Mr+
	zGAcdBCxg63e5Ogk2G9Sa/UTyQ/SPh6Eft0adIrKRo4LquUZwtyrCsX8eRTl6KFvllg=
X-Gm-Gg: AfdE7cmE7C3eM2lwfcdv5rI7xi+F4KCek3fEuZqLnfzsPZXQo0+nJlZFe9SfvTZEHUK
	/uWJ/wHR7YlmJaWIjme61JtcXgXxrzt2JuHeiBhScOaXYd97Xe7FkZlMNV5YctPF1sLP7L3h4Xl
	sH1zkjubtgDut+KCHdYhD5AYwVKjLuoKgtHlObZ4cOtwTmtENvDmpePN8yaoDPG3tGNjUaFFzsI
	+GES/K8KIwO31pUvbBXtomLnNcEzjUE9zWhxckF9sQeqsUG2Ut9UG+wePS/45TYygLzx09ER0c3
	SGar+nutjaLeY4A6d78tufkZVhl8fgXU3LvFgyvvRAs9CdL7t9nWPSim0l4owNF08PxA/lc2gcI
	EINskLIkLvnNZYsMFbjSC0NaA4xkYApnFjK1TWvxfUgSLMnacx5+1w8cTDz4tbYbj6kmG3Jdmew
	aGCWDKwg==
X-Received: by 2002:a05:600c:3512:b0:495:4572:21af with SMTP id 5b1f17b1804b1-4954a3ef7dbmr155802875e9.9.1784561209104;
        Mon, 20 Jul 2026 08:26:49 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de88951sm77982265e9.3.2026.07.20.08.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:26:48 -0700 (PDT)
Date: Mon, 20 Jul 2026 17:26:46 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Tao Cui <cui.tao@linux.dev>
Cc: cgroups@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Joshua Hahn <joshua.hahnjy@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cuitao@kylinos.cn
Subject: Re: [PATCH] cgroup/cpu: document cpu.stat nice_usec and
 core_sched.force_idle_usec
Message-ID: <al46ipavC-KCaoHv@localhost.localdomain>
References: <20260718080100.2334415-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w2bwicfq2kh5elpa"
Content-Disposition: inline
In-Reply-To: <20260718080100.2334415-1-cui.tao@linux.dev>


--w2bwicfq2kh5elpa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] cgroup/cpu: document cpu.stat nice_usec and
 core_sched.force_idle_usec
MIME-Version: 1.0

On Sat, Jul 18, 2026 at 04:01:00PM +0800, Tao Cui <cui.tao@linux.dev> wrote:
> From: Tao Cui <cuitao@kylinos.cn>
>=20
> cgroup_base_stat_cputime_show() unconditionally prints a fourth base
> stat, nice_usec, in addition to usage_usec/user_usec/system_usec, and
> also prints core_sched.force_idle_usec when CONFIG_SCHED_CORE is enabled.
> Neither field is currently described in the cpu.stat section of
> cgroup-v2.rst, which still states it "always reports the following three
> stats".

Just to better sense popularity of the fields -- have you found this out
by:
a) reading cpu.stat and being confused about semantics of the fields or
b) scanning files/code vs docs looking for discrepancies?

Thanks,
Michal

--w2bwicfq2kh5elpa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCal4+MhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Ag3vwD9E1MC8njfG/ALqSIl0+J+
vDpXYoCVjiKaSM/c4p3+facBAM1HnJky1cQzDzCmTg5mmKUbPFXANmVUH42v2ac9
Y7MA
=/WHZ
-----END PGP SIGNATURE-----

--w2bwicfq2kh5elpa--
