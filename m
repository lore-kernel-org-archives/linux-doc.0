Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A059533ADBF;
	Sun, 22 Mar 2026 19:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774209489; cv=pass; b=kXpD0Yav1S8h7l9SZ5kftOl54hwA7uKGvUcdVuQZkmIEkDFvwVvYobRRf2TRJOrY/PPnYsLBamswgVHO88MFptR/jfFRKrBQIOZAi8erbRnyjug5aBKVm1XNHNrcy0nwOH+Sgc+QdQjMbt9/okMm2rqBzJ2EWYTKC+8V/TnaahA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774209489; c=relaxed/simple;
	bh=7F4i8RN94Nojv9pCorehsC1N3Z25pgJ/lG3m6yNFIz8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=C4CO2YVphwyA8TVY5QdEAqAZNxmJBx6326HhJCd7Ee08vCw668wGs3TdFQFzpk6Fc0FSle/tzOKEXtQPlTbQ1poJd4mj5H5i7rSyCkzkqRFzexUaESgnyWpIOCVIPo6kiBeuBPbI3/y2m07SB5vzXqhQrKoMUt3qxj2nAlEekAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=XOTCTsiG; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="XOTCTsiG"
ARC-Seal: i=1; a=rsa-sha256; t=1774209478; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cq4dxgzoNqs3Aw4CYIiY+5dvvFnoJpAoABejZSwt0bvyAu7ZvOinSaKF1w/tQLn1e0bSWWszz8PjqRAWeQzotlFz9iAhTPgMZVCj410sqv84QMB0mvvpmUFCcscTY+By/otXk8qeIFdP24ars0MaIRJA0yoygi5vi3HC5T4TbEQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774209478; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7F4i8RN94Nojv9pCorehsC1N3Z25pgJ/lG3m6yNFIz8=; 
	b=jPrbIaoHH+Nc62H59/2IUgJF2W4ri9/fVtrlGo3FKQ3hKgyLsUg+Sw8ko0PE2CCiAa1hPsZGpk4pIf1++PH+L444iWndGeCu1uqP0pM2hZNqmFiUpvSx9h6oeH87DIYqxYj3PC4a8TwdNttBGVN/dUh4PRtfVZoHkvl/F4Tu09o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774209478;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=7F4i8RN94Nojv9pCorehsC1N3Z25pgJ/lG3m6yNFIz8=;
	b=XOTCTsiGnGGk2VXbKwf9rKGiRmDf9i2W6zJty9Wfn8VnD2vcBBXmPVhfcG+ht196
	ymozxCQG41dZnwDEosaToI/ILXoewDLaNjw9YP6lx49+eeBBAMKVvVbP8aX4puMTfeP
	hyOW2G4i3MtKwMLqcW2PXvQ1ZP7F3zD7521iqpFo=
Received: by mx.zohomail.com with SMTPS id 1774209475906177.53383755720427;
	Sun, 22 Mar 2026 12:57:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Mar 2026 15:57:53 -0400
Message-Id: <DH9KRO13XKS4.2LXPZP4WPDNL@ritovision.com>
Subject: Re: [PATCH 0/1] docs: examples of pages affected by heading
 overflow
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Randy Dunlap" <rdunlap@infradead.org>, "Rito Rhymes"
 <rito@ritovision.com>, "Jonathan Corbet" <corbet@lwn.net>,
 <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260321144855.30429-1-rito@ritovision.com>
 <f81edf19-9b33-4935-904e-636afa4dad79@infradead.org>
 <DH9AX5UKDIXH.Q8NWGNIUI82X@ritovision.com>
 <ac4d4ec8-90d5-48df-96d4-38de535a6a9a@infradead.org>
In-Reply-To: <ac4d4ec8-90d5-48df-96d4-38de535a6a9a@infradead.org>
X-ZohoMailClient: External

I am glad the reasoning and trade-offs make sense.

I also saw Jon's note on coding-assistant attribution/disclosure
and have already rerolled the relevant patches accordingly.

Rito
