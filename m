Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A1E2AD00;
	Sun, 22 Mar 2026 01:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774142005; cv=pass; b=tP4PFuNBEzvUbV2EsaAiDwbWlgrofRg+WuPqyyyIu28eLI8OhlBL9uXF4GQFyDLtTYHEEmzASoG/Q+dDYWHnhSTUIA9KutpqtJOqkJZjOXG7YhHBpb63PFYNAhY/Rr8LtTqUCkzcOtQCdzcJ/rZCUYP8j693+YKVy17RC5c+mmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774142005; c=relaxed/simple;
	bh=KurxseXxXQJ5x9bDEN3oAQOTwNu4Dgvqsgmh4p9e9sk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=Bwg3rE0N3Yfls6ozg+xpFru4cDerCSHdtnhNhsNXwFfHUZMcV712akkr/3HwBtjo97dsI/zd+cRcOrZEu4VM++VE5rVEj/2NedvXlfRdXmNq8mGWPfP+y2Fq5pWyRO/fDy0R3touLSYARTEl+P7AO+zMkTeMoQciQ1zi/V0PNUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=OkZYLmiE; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="OkZYLmiE"
ARC-Seal: i=1; a=rsa-sha256; t=1774141979; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cN3lX+s7UTVYz9QhyECXfBL+WAUhIvXvkfjYic0amF+WFkBxw1Kxc10ug+N2hrCiCwl8JujcVUA730U5frGRFbrTdo2/uYUZE5pNc9p5JHeYhWGFQYPhJLUM1p/RPaVuO7XW+HuE9VWcaUM5ZVDRln8ZZ+VodNw+DJ+lAp8e5zY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774141979; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KurxseXxXQJ5x9bDEN3oAQOTwNu4Dgvqsgmh4p9e9sk=; 
	b=UWJZy3OqA14EVQ52JFzDLDV1AfF2Bn66y9gsR5TCY7pOISsLyaYtZ6TLDsU0bJPW8NCjPVNDAQJyph17LzAuCdSey2TZvM6IcdNdvBvWzfKPVDvSdRUgrbxWgM26/6zk5ZpGG6Jdb0N92n+V5V+XZ9I05hoyH+CapO9UVOMxhdA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774141979;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:From:From:To:To:Subject:Subject:References:In-Reply-To:Reply-To;
	bh=KurxseXxXQJ5x9bDEN3oAQOTwNu4Dgvqsgmh4p9e9sk=;
	b=OkZYLmiEsTyR6gCA+irwW7bukKfsgp9kxmxgbgYVjFqc4HGn0pitJhiB4a7mpZ6B
	n4GmLUPZ61g5x8A15QTlQTjzGBkKAvXP2bpyajTdvacHbjMlOEQYoI1rjkraXGKNNep
	izK59S/UwfNavGfjSl2hcz+Fs5PUhEuL7m2owsAo=
Received: by mx.zohomail.com with SMTPS id 1774141977345483.8527676102449;
	Sat, 21 Mar 2026 18:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 21:12:53 -0400
Message-Id: <DH8WUB5VFIDH.B2WQGIM3163@ritovision.com>
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Randy Dunlap" <rdunlap@infradead.org>, "Rito Rhymes"
 <rito@ritovision.com>, "Jonathan Corbet" <corbet@lwn.net>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] docs: add advanced search for kernel documentation
X-Mailer: aerc 0.21.0
References: <20260321181511.11706-1-rito@ritovision.com>
 <621b43a5-256b-4a82-b179-3cefe43d419f@infradead.org>
 <DH8UC6DVQE4P.13E9XDIRGJ645@ritovision.com>
 <6cbf9940-0146-4b4d-bf74-4142b18602df@infradead.org>
In-Reply-To: <6cbf9940-0146-4b4d-bf74-4142b18602df@infradead.org>
X-ZohoMailClient: External

I was using the in-tree build (`make htmldocs`) before. I just ran
fresh rebuilds with both in-tree and out-of-tree (`make O=3DDOCS
htmldocs`) builds, and I got identical search results of 280 hits for
"futex" when serving both.

I ran the builds and served the output on Linux/x86_64, and tested the
pages in Chrome, Edge, and Firefox on Windows.

So at this point I have not been able to reproduce the "no output"
behavior with either build mode, I think we can rule out build mode
quirks.

More debugging:

As a comparison, WITHOUT using my patch, upstream only build, does the
normal Quick Search work? What results do you get for Futex?

WITH my patch, do Quick Search return any results for Futex?

How are you opening or serving the generated docs? For example, via a
local web server (`http://...`) or directly from disk (`file://...`)?
I am serving the generated output over HTTP locally via
`python -m http.server`.

What Sphinx version are you using for the build?
I built with Sphinx 9.1.0.

If possible, could you also check in the browser network tab whether
`_static/kernel-search.js`, `_static/language_data.js`, and
`searchindex.js` are all loading successfully?
