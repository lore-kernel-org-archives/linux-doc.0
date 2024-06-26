Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986ED53364
	for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 22:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719440611; cv=none; b=YoqiPqsBbGyDSZeyWpRQlGoYehJYqVYRcRVW3Hz85vNpqS9sf2wwl6AX4JysR5TWKOIAW8u0t+iJWlLf3u1aE2tuIaCmrh03i1sggD+R0cMuZwQtI+3kMX+Zpj+/TM0IlQkiQDouo1b9rCwsHS/3755eeBMU/OInTP7SHrVtxVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719440611; c=relaxed/simple;
	bh=1A3DM13bIzaGkTYXJbsT4apoezs8ku71SXSW/TFeYds=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BeXu1RA6Vp+2RfhtHnP98oIIbF5smurF1r9Xq3Tg2ka3BAoo0GkBP+uRqT9UK4o1ZKHsT8d66pJwcZFaHD3Rh2HkLC7Jzn/Lp2pM+vydGOcFp122gw4ewPdR6iIsv3Lu8essNJjaYsjHGKn4XZ1qJXEGBtfjQokRgYEmbTQPfFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=UUu4qXBg; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UUu4qXBg"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5A7AD45E2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1719440608; bh=olRhAtqZkejQ4brPwn7naKTGU4iAkIMjOVV0sO9b/wY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UUu4qXBgKncHGSIkbKyQre9uCJK3lhGTOXSC4Fru8V+QRPNESU8eyegpZ2azMVG5j
	 rwHTAYtdJ/cbcbPruTDKZsmZb1guFXBMWidpW8t7tChWxtK/Tg9LM8Z2CoDuST/Wir
	 LHtEn8Px5cjD8O/SdNUHRdhMWp1zSgM/bvFWg6E6yVj4d2tiQGSzB7yZcjPKd9cIHy
	 sU2lxeVULfEKB9wTp+TNheZipQVpV1eHBL3LLb78mTrkUD48stssbQtR4ISA3Qj+rm
	 9vStDI/+TNwrnHi1UtOfIDatRn/Oa/s2WVOM4/MP/9V7Jp235JbS7yp3VgVhaQe+Bk
	 q1u//xNpNMc9Q==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5A7AD45E2B;
	Wed, 26 Jun 2024 22:23:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Scherer <t.scherer@eckelmann.de>, Federico Vaga
 <federico.vaga@vaga.pv.it>
Cc: linux-doc@vger.kernel.org, Thorsten Scherer <t.scherer@eckelmann.de>
Subject: Re: [PATCH] doc:it_IT: Fix typo in Reviewed-by tag
In-Reply-To: <20240625210455.13262-1-t.scherer@eckelmann.de>
References: <20240625210455.13262-1-t.scherer@eckelmann.de>
Date: Wed, 26 Jun 2024 16:23:27 -0600
Message-ID: <87h6dfz6lc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thorsten Scherer <t.scherer@eckelmann.de> writes:

> Signed-off-by: Thorsten Scherer <t.scherer@eckelmann.de>
> ---
>  Documentation/translations/it_IT/process/7.AdvancedTopics.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/it_IT/process/7.AdvancedTopics.rs=
t b/Documentation/translations/it_IT/process/7.AdvancedTopics.rst
> index a83fcfe18024..b3d8b62f3b57 100644
> --- a/Documentation/translations/it_IT/process/7.AdvancedTopics.rst
> +++ b/Documentation/translations/it_IT/process/7.AdvancedTopics.rst
> @@ -200,7 +200,7 @@ all'ABI dello spazio utente, eccetera.  Qualunque tip=
o di revisione =C3=A8 ben
>  accetta e di valore, se porta ad avere un codice migliore nel kernel.
>=20=20
>  Non esistono requisiti particolarmente stringenti per l'uso di etichette=
 come
> -``Reviewd-by``. Tuttavia, perch=C3=A9 la revisione sia efficace ci si as=
petta un
> +``Reviewed-by``. Tuttavia, perch=C3=A9 la revisione sia efficace ci si a=
spetta un
>  qualche tipo di messaggio che dica "ho verificato A, B e C nel codice ch=
e =C3=A8

Applied, thanks.

jon
