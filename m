Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D7739659F;
	Sat,  4 Apr 2026 08:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775290197; cv=pass; b=c26H51nwkXwnwXSmi+QtDAXigj4GHS7Lu74hSLfHZtb6AwIaXOrzaahtO1mboNvwYane0VFFbEESLZJ9uUC1MIfUzubbpPdMfnGNNdrCdHB5MxcrhvJel12qGZ048Tl+aov+swZgPGPDw65yJcvc5NqLHtKT7h87F+YRDTJL80U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775290197; c=relaxed/simple;
	bh=Vu75UJPws3k2eCy9HgYaU7Z7fUWK4y66sSvBL16PXVQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=g6ozPB+fEriRuwmpk/OdSglyY8fIcVUEkAORrTtx0DApbPb5ai08yZZO6vmxaiWmo75A2E96apsDS02cb0kzZBsB3Or7KGsKceoyS1riuGWyLcA5HVshEN//Y4ur3dn69zCwbboP80hFRzQT4XRtmZr73NMFxLX1ES9GEex0Fsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=ZlAJw6PO; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="ZlAJw6PO"
ARC-Seal: i=1; a=rsa-sha256; t=1775290192; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mTgndlunrkKF4LA+KZ2gjdhDuY0GEcO5tEqDu2QAeLU/A8q5MGTTAM0M3s6IefapYLCX9/Y87QAK5ow21gzAu97Jt6RTX1cwAAt7xS2fLHgSqa7BX2YqBpH0uPHYmxU2ZgtAm6ojn0MeYQxuj8BolLFaBOWBgZyDRuKu8uvQTI8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775290192; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Vu75UJPws3k2eCy9HgYaU7Z7fUWK4y66sSvBL16PXVQ=; 
	b=KjjXkR9TgA9z8qcbG6vamGhNMe2jFNCI9MaaEOxU9Q6l/y95iy+iO8hlhRjlAJ4oijqmR2itIfdakXizrt1zISnyIlffA0tN1tHqkZCY/Iml1IkmNkpeAa418cdV8U1CgoyIV42Y5wcWTCCtgPBjSjiUaYn19Xgly9xCaKhFd14=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775290192;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=Vu75UJPws3k2eCy9HgYaU7Z7fUWK4y66sSvBL16PXVQ=;
	b=ZlAJw6POOm1gQcthZqSapA8Q8194ni53o/hO3PJBXBoMWTXc7fOXiM9PWW+hINig
	FNQ3MeeBCDnzoi0UQGXm0JkBhBBrdq3vaZcn0Fp/mCPU+tWYNkPQImaLxEHpJQqPFze
	VCqHiFPSmAyW17+6HG3DPeEiF8QOCQ/uW5pknKxY=
Received: by mx.zohomail.com with SMTPS id 1775290189472450.6285856038676;
	Sat, 4 Apr 2026 01:09:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 04:09:47 -0400
Message-Id: <DHK7ULBZ7J30.EL6B3092L0DI@ritovision.com>
Subject: Re: [PATCH v3] docs: restore and reflow footer on narrow screens
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Rito Rhymes" <rito@ritovision.com>, "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.21.0
References: <20260321131857.14166-1-rito@ritovision.com>
 <20260326005811.116154-1-rito@ritovision.com>
In-Reply-To: <20260326005811.116154-1-rito@ritovision.com>
X-ZohoMailClient: External

Jon,

Following up on this point:

> We are not going to fix Sphinx accessibility piecemeal in this way.

I've rerolled this as a CSS-only change limited to making the footer
visible/usable on mobile. It is no longer trying to address footer
semantics or Sphinx accessibility more broadly.

If that narrower scope is acceptable, will it fit in the upcoming
release?

Thanks,
Rito
