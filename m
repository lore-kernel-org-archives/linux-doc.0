Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD61383C93;
	Thu, 26 Mar 2026 19:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774552274; cv=pass; b=jxSVX4sboy4SosVZgvbl0uwdLHKIY5lojN+NBDvq3mTsDUe9SeLKn/p6JIMX5ySmOES2cme+LkXbSrZA+NcTs/M7/sGIwu5Vz7zRF4XsUAc3ROLFgleur6ZUEjjTxlVgg6JLoUiQe1nmsJBoicTyGDZsPWSHH5ikeF2tt2pAsmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774552274; c=relaxed/simple;
	bh=ydMm4YJoEbvIVgt5vinv0ob9KcIPM13JWicxkZtW5Ag=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=keuZZ5u/4ZqUL1ObXGRc+axZopxEscLAa1vyB1z1ZWVKTyF8q79Yz0EIeAmyAKbZmHNts1IadohfCC/OLVqKwuQ+Kmkubt77Del/0Xj7dK3wqcXsMvrdx566P1N8Z1HhqdOz+JRkgREAdWAfBxKcnnWtilYe9p1CVW7UyriQjaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=IHkJyr2X; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="IHkJyr2X"
ARC-Seal: i=1; a=rsa-sha256; t=1774552261; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nqicHuXm5VTaKYmeEnnCCp4xIndmblVBI/tTseHt9Jba9NUBK16eRnfy0l+igg1q1cBxMIQVyso10+Fb5YXiXjagMM6kUcDCnQDlXyvX0bnbXakwkuzIoKe2L03wnsmREzANORvyOL4YyO/3BfbFDEwjOLKJ9pCwvEOP2LJvTpg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774552261; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ydMm4YJoEbvIVgt5vinv0ob9KcIPM13JWicxkZtW5Ag=; 
	b=amAiU6AwXHY+uNpvCTTa+gTHXLhgoixGJPm2d4d2i++Q6yE4du87ABCkYzTZUveiWBm9tBIHCq+i7ZsS/KAe4s4G7Mb8dYU3f0fs1gBYYcqK9a32qyhuMpgTu2s5voqW+CRB9/Mn9jG+99Hp5YW4tReoVAju5bDec/6wp6/dOb0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774552261;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=ydMm4YJoEbvIVgt5vinv0ob9KcIPM13JWicxkZtW5Ag=;
	b=IHkJyr2XwjzCrJFp3gmxck3eo+zsklnD6nlgaqqGeDKTIO8MAU1Y0U1Qao610/Ph
	YvcxbY+4XnRAy0Micd2PCNJxOAGK8ODskQNLc9+901YVhV2jZpsFT/EeQhUH34kMh+p
	gwBT84ldr677hwvmTZkrExYCkPGZ4IUVDixrRUTk=
Received: by mx.zohomail.com with SMTPS id 1774552260236479.8774657992831;
	Thu, 26 Mar 2026 12:11:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 15:10:56 -0400
Message-Id: <DHCY9W9YCEO3.VIOD40U407AC@ritovision.com>
Subject: Re: [PATCH v3] docs: contain horizontal overflow in C API
 descriptions
Cc: "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <rdunlap@infradead.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Rito Rhymes" <rito@ritovision.com>,
 <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260321142559.26005-2-rito@ritovision.com>
 <20260323153342.33447-1-rito@ritovision.com>
 <87jyuzg2fi.fsf@trenco.lwn.net> <DHC5RBUT88C0.2OACW6VS3CYF2@ritovision.com>
 <87jyuzehmi.fsf@trenco.lwn.net>
In-Reply-To: <87jyuzehmi.fsf@trenco.lwn.net>
X-ZohoMailClient: External

> It should wrap so that the entire prototype is visible, but the
> way that happens on small screens is definitely ugly. The trick
> would be to have it wrap the way it would for an overly long line
> in the source.

I re-rolled it again to match those specs.

FWIW:
I tackled basically the same issue in Public Inbox; Eric wanted
it the way you described, but he was married to his highly efficent
custom blob rendering system where the approach caused regressions
with no reasonable workaround. And no alternative systems I tried
came close to his system's efficiency even though they fixed the
issue. At the end of the day, page-wide horizontal scroll overflow
turned out to be the best fit solution there.

I think the preserved whitespace wrapping approach should work fine
here though.

I rerolled so you can choose whichever you think is best, though
personally, I think contained horizontal scroll overflow is the
way to go since it provides a more straight-forward awareness of
the code shape without needing to be aware of wrapping distortions.

I leave it to you.

Rito
