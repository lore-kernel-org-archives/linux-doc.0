Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C8A12BF22
	for <linux-doc@vger.kernel.org>; Thu, 25 Apr 2024 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714061751; cv=none; b=VOy23pcoLgJZGV2hGND56MVnrtUdIy7rfA6hm3WKP+AigdciGKbyV42+8zvKimR8yWtUQCgOmCSPWNFG0sFX54o0jhxWQpqyVSQl1iwcLGBWhCg4A2fOdEByCAQpcTvoX0vZkjXVnjVPwWSC1IdPJhoOkxDR4anQp/1NIV2bz/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714061751; c=relaxed/simple;
	bh=5k8e8x1XIDy/2ppAXH1AcXaoKO5Lj60KVADi3cxp9SI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pqf9Uk5BrAD8Nbyf/rqDR6GjVvczwvOuwz/6PZ1pYpyuBYOtxJwFeajJWgKsT62LT7EZ0UTDI5e2yjOZ5y3dIczfV7m7IRfLNvJOtKTkG7/cSzDZ9iGJlh6BP9nO1g8vXk/QTs/5Z/2ACnvDAInjv3CetiO6LXfHQwexGhaPS6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pH/OjqqI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pH/OjqqI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7F0C113CC
	for <linux-doc@vger.kernel.org>; Thu, 25 Apr 2024 16:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714061750;
	bh=5k8e8x1XIDy/2ppAXH1AcXaoKO5Lj60KVADi3cxp9SI=;
	h=Date:From:To:Subject:From;
	b=pH/OjqqIMeKtx9M5oKYjNBUgiohiTuGbO/CSs24FIn1msCdCq3lIbmnMeyHYi7LWn
	 zqFlVgZfjghHbQoIQbqCjWkEP6BUk8SwKIF34bhpyUDRG5RsXFrP69t7EHJPt0PZ2V
	 RLAlq0LE7pQaZsLz6niIWBorJqECzilHhDtsNgJodsbXYHt/rPoyl5ky1nzK29fJKS
	 FYs4ol34L7EF/h/INWqi9F5j5vwxvnfRG1xNeiMYvKpQepgptmULOyErql1UNgP3ma
	 mgfT8xMeqxFQ38Uf5ozDMcMElbrAfkEWz9IbGDwZb0P1KjwT8BCHSdapnL2lD1BJ37
	 Yiym4Xt+Piv3w==
Date: Thu, 25 Apr 2024 17:15:47 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-doc@vger.kernel.org
Subject: Weird document naming in maintainer-entry-profile list
Message-ID: <20240425-macaroni-retrace-11019fa29f4d@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s8MrmDuR4aR4LAPl"
Content-Disposition: inline


--s8MrmDuR4aR4LAPl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


https://docs.kernel.org/maintainer/maintainer-entry-profile.html#existing-profiles

The numbering here looks pretty weird, given there are 2 1s, 2 2s and
some don't have any numbering! I assume this is due to the directories
in which these documents lie - netdev and the two soc files are in one
location and have sequential number, but xfs and media are in
filesystems/xfs and driver-api/media respectively. I'm not really
familiar enough with the docs to make any suggestions as to how to change
that, but figured it was at least worth mentioning..

--s8MrmDuR4aR4LAPl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiqBswAKCRB4tDGHoIJi
0uMsAP4/GsghkTWRaZW6MWk52MetonfdBJizET/BUzhStrYa6AEAgFmJimqz4M1k
+SHvQ7fmgQ/wnCVLAPpMJcfzdvrSMgE=
=m+nB
-----END PGP SIGNATURE-----

--s8MrmDuR4aR4LAPl--
