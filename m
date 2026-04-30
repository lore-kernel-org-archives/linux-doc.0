Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917EF3090C2
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 19:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777578393; cv=none; b=es+JLGwRxSYaigceNgO3jSxHZ8KjvB11pbc07xrl3VImhKCrZ6X/Oe09ClVlSs07iKfVDxOpD64EnnTM8OdKjjTrt4vGQITVmceFBY2ATb07kTNu4xnDpCwQTTKopMmcRDaH4yFh9SCJN/WnwioYxCVumjIMk7sJdTRGXQubLL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777578393; c=relaxed/simple;
	bh=hsnuKszqwUnXW6gTOwMCMEQcekU0fo8nLxh7jZIg+RI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rASB05uVGXEO0fm7tk9kArf+J1BKTo+l0XT/4VUueXAL2noJkydujHEV7wM/XYaJi7kI9KEWLhxdRqG1yjApzNkMuPMfe/hlgnnBy7XJW822hkwDG/wDEv9UuX0NUa4y193KDIaI9vu5THaR2CwrhiWK1EGQO/ICxWUur9AYWx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GOYs4v8H; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GOYs4v8H"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso11713935e9.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 12:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777578390; x=1778183190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sePdHJFH0sEo8KzmXLcQsXcQ13LFg+J1qgOmUd0oKAc=;
        b=GOYs4v8HTEQeoBhPJ6GHfAse0YjIHiQx2meiOpzne4i0xLUG478eGBz1myTv2AUM12
         NnimpA7JWjxQ+pvDwHJD34wrZm/4Rin4T9U9OaTHEM6ZKkZR4rJbxs1FjfImF67aH14k
         p0xZzxGEzcKfknsrx7hv+nhRg98CHcwM8P5yza6qWNZfVZjs488HUQ93ymqnaOU5Hoo+
         vEz4IJWKlhMGeol2J+uHtriFyK02VKBeyNi8yGSmO5TAVb/rQL+jTyckAUBt4Cr4LaQN
         RFSoikPCyIV790gPJ7osuuTwe87r3RsCehFjNorTSf/dgo+KaEVK/GzT9w4LQ7f0oIpc
         XSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777578390; x=1778183190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sePdHJFH0sEo8KzmXLcQsXcQ13LFg+J1qgOmUd0oKAc=;
        b=XVkFmi4w4RDTwNhkY8k1/JeHfL6oeHg/aDhBErC5t18wOMisHm8LAgmqoe26KY3wLV
         PQ7lckYgbGdNLyoAYPtQcJDzCX/PpFgsblTvoD6xdvAktG7d8BL2I8WPMtRo2Obt95Nm
         /xTT12Tojk5WFNuAoj/xHlbkttL+Mt6X2Z83dxrNwzXe0+U0MhTgGPkeXHi1DJ4uppR/
         ba6nCbahNM9JxRVedwOcRPnBzG6h+fdgKGeBXjD4tkgKFbFidzeYmyDLSXT9tAYD9wpI
         Wk3tKEp1erKZlsMpy6dLTjiU5cNL49jotnMTxsRLWJ67ygWgpCm6GygkAFBjH2J0HyB4
         UbCg==
X-Forwarded-Encrypted: i=1; AFNElJ//0kRozFgsk6QyV5R0u2mdAgIOjnT0GTExLgZ/lb5hygjo1UchwOoeXLmqCJYJdfT3yY4fhB8vsds=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjxiZFuayJlrkB6q867NJbVBBBtch9GtxuF5Q7ShMCXNUi/qZ7
	9xnH64FTu29HQ1kRy8Z6W56Dr9itvI16TfLXFDAVluY7ry+wdSJwv5NzIjF8yUXSPzcRf3m1hqh
	Kc/Ol+SM=
X-Gm-Gg: AeBDietAwwTIga4ToxTpBxUsyEttYltEOdYECbzhfI1KY4U2Deuxgab1W6UrMboG4dS
	ONQ3HuRTpc2Pu7+zlED5DAfiKD0NIEd5MNK2Yc/PNenhDv5IQRfrEeTNkCWSLbraxUJllkqzgEP
	WYLAR24y35SNgi46EuBVLggBIPVnrnC39bwzevxRWXm4vjkMobDcpazItzyBue9AVtRq+Db+qTf
	s+dVCGGM2tPsghiqunBlUsiqIsp7vVtEBacjAbEYI0vZ0eq3kI5WOIdqOJeDx0jDbGmcNa/FSl0
	vPpqDGwmND93ERAFpNaEp3HgDHEZH6FsDZkH7FyaCrauNXcf8y9VXlR97nuQAoT8ksqcmar2zBq
	miftg0pGlyJwwnT7WpCNMZA9kFACnX/iBf/qZYGId4ZGVMn+9DSp1CmWbzzCnMumS7GN6mxszuE
	dDlwSkbUvw2qG3HCNnR2ev0qwR0U/m7MgWcwu8RGRaLi43kXBS8ER5EwwQsiGFy2AAT42wHg==
X-Received: by 2002:a05:600c:8b04:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-48a8445fc28mr75462175e9.26.1777578390085;
        Thu, 30 Apr 2026 12:46:30 -0700 (PDT)
Received: from localhost.localdomain (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm1864955e9.11.2026.04.30.12.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:46:29 -0700 (PDT)
Date: Thu, 30 Apr 2026 21:46:27 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Chen Ridong <chenridong@huawei.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xie Maoyi <maoyi.xie@ntu.edu.sg>
Subject: Re: [PATCH v2] cgroup/cpuset: Clarify the delegation rules of
 partition
Message-ID: <h46vz32432zl6xu773hfvnpze5zt7berywvg233esmeiftiruo@aub2kgpwi6zd>
References: <20260428180935.806284-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6nlu4ntkvwulhcbt"
Content-Disposition: inline
In-Reply-To: <20260428180935.806284-1-longman@redhat.com>


--6nlu4ntkvwulhcbt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] cgroup/cpuset: Clarify the delegation rules of
 partition
MIME-Version: 1.0

On Tue, Apr 28, 2026 at 02:09:35PM -0400, Waiman Long <longman@redhat.com> =
wrote:
> Creation of remote partition is currently not allowed without privilege.
> On the other hand, creation of local partition is allowed without
> privilege as long as its parent is also a partition root.
>=20
> The current setup allows a delegator to delegate an exclusive set of
> CPUs to the delegatee by making the root of a delegated sub-hierarchy
> a partition root. The delegatee is then allowed to create a local
> sub-partition underneath it if necessary. Creation of a remote
> partition is not currently allowed across delegation boundary without
> privilege. Clarify the partition delegation rules by stating the current
> behavior in cgroup-v2.rst file.
>=20
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

After Tejun pointed out that other generic paragraph:
| This means that the controller interface files - anything which
| doesn't start with "cgroup." are owned by the parent rather than the
| cgroup itself.

I think the extra words may only increase confusion (and constrain
generic changes). So it was a good exercise but nothing needs to be
necessarily changed regarding this behaivor or its docs.

Michal

--6nlu4ntkvwulhcbt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCafOxjxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Ai4FgD+K3fxQ2FEwOcBqVl9PaT8
KIsL7lXKQnwJxhqqS2tHkgYBAK02TDRypXPeVumVr9bS7i80Ptuo5uT9J97XU14k
DwUH
=iHbg
-----END PGP SIGNATURE-----

--6nlu4ntkvwulhcbt--
