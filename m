Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FE0128816
	for <linux-doc@vger.kernel.org>; Tue, 30 Apr 2024 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714474606; cv=none; b=b4OjkzT6KJIMkv4ii0yTpQnDbFujTOiGzDSsCsCBEgGhMoReeXaEr4RNPLRqCiwVvE5ERfAr+bklu/6LxqGOtvTvym7Zp0XGP75Mm6chfEYN3CIxgTjqXaMtMOrp4DzAmfuLWNzGqJG494bGnrQT3NmBR/lLReBWUJ3GtWR4pPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714474606; c=relaxed/simple;
	bh=pzIyXcdyfqtUGA1qx1iaMgx0D4XtXaB83+uXXULcFS0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KVF4YblzaC+236/X7+ybDbvgu9ep+u5U9tCXVBuOgwWazVg6J3D/cL+4vzirjzSRhjZW2p+8XwjuV5iIV1bND81B/8duU1zC5DUJ0tr92+fqSLQsUOr1tgEfmEw9bu2OcaJn/fqGeaOkF0zRle2lkHpWQr6Ycb/6wpoHBb04lEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=zdU0fsSi; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="zdU0fsSi"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1714474600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=bEl3LgtNBcFokQSDWjC3vLo8EQukiz9sfPEbKmNjeko=;
	b=zdU0fsSiAX4OF2JWE/nPr38uQKr/BJ2D+NxYfMO/qV5VacfFfARv+1WyPAhhjzrHvzitvR
	Y6rcFy8D6bGwU6xiYV7RqOrRmTMxG70JyHs3+l1trWmceTGu3SiVTKjRZ4v3r8BFp6uhmE
	pzZIm52iDe/v0nU5DzJcTmkIEdznfmsZjLfD5KEMqOjTRx3tTO37+x4iLwvo9IvcGO7s4H
	7tqbi5Kys4SCm8axk1KJgQB8vSaMBRgnanFQ8yXnR+q9bQf2x7yRERk/XcBDw196H/uM9A
	7oLPQqyZoPLI9XS+lFqo7lb+1vrIcGYp+UAqRVgbYgqpMLkOqL/3GxPo40awgw==
From: Diederik de Haas <didi.debian@cknow.org>
To: linux-doc@vger.kernel.org
Subject: checkpatch doc suggestion
Date: Tue, 30 Apr 2024 12:56:30 +0200
Message-ID: <8090211.0vHzs8tI1a@bagend>
Organization: Connecting Knowledge
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3953469.dA3AkLujJ6";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT

--nextPart3953469.dA3AkLujJ6
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
To: linux-doc@vger.kernel.org
Subject: checkpatch doc suggestion
Date: Tue, 30 Apr 2024 12:56:30 +0200
Message-ID: <8090211.0vHzs8tI1a@bagend>
Organization: Connecting Knowledge
MIME-Version: 1.0

Hi,

I think it would be really useful if (f.e.) the following URL
https://docs.kernel.org/dev-tools/checkpatch.html#BAD_FIXES_TAG

would lead me straight to the BAD_FIXES_TAG explanation.

Cheers,
  Diederik
--nextPart3953469.dA3AkLujJ6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZjDOXgAKCRDXblvOeH7b
bv6VAP0d3fajPDW02jCzTRYmx3g0CS1JWYqgiTGCerHhmoZNwgEAhhsBqoG03IkB
mC3dvi0NlbjQ7qHhUXJcA0QoGRWUuAA=
=2U1Q
-----END PGP SIGNATURE-----

--nextPart3953469.dA3AkLujJ6--



