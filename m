Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD2B3090CD;
	Wed, 25 Mar 2026 22:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478003; cv=pass; b=Uso/J0sRB1ueaTytJ9AkaMYtNTkv1dAJBZka6h+wp7+hGmTG2NJvwM6rRH6DRYNVnkhXLUazRo7TN6ZJ3RKpv6874jXRKgvFXiGcRCRupQx/zwEF7Bp8m2n70ga0XJx1myfesnq7uWdogW0rPm1RjNaAAKYhMQOGqduc9BrykPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478003; c=relaxed/simple;
	bh=mtCOFEEK50b1s6/zGAV4BDMfQf8/y0dzMxvJIsRt4Q8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=Hj/JTcFAZKx8fMlU53pD1difVxPAkSHnw/VnTOeaqvSuU3akIoZgGU2dBmUap/kuBUkyzhlFuDoWTABkuRcfQCiILEtLgS1xWsiLgzAGPaqk57jzTTEGYcKLkTcMwP6TZupplcI3gNhQzxYJNeSXirdL85dsi+XaCPQ6VSVhvfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=DGDzxKVs; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="DGDzxKVs"
ARC-Seal: i=1; a=rsa-sha256; t=1774477996; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZixoPBH+PF93FleBAXJnyOO9cvw0DKnNjIuZ2115R6xaskli8ajNIbkM1PC7Z1Xizk2HgquFn53ArNORtczWB7EUVMKmZWNFl+ng27/CYY32DMnaHTsbQkKstEUqOkrP84UFoet+6oWvctWy8ivja7qWutIbIwWBZKubgCMrCUE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774477996; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mtCOFEEK50b1s6/zGAV4BDMfQf8/y0dzMxvJIsRt4Q8=; 
	b=MkivNGMhqRIZyGHAy5jTVEmi7xmFxhRLngC1mjYjTPB9ew7sR7mMS9HteJRdzdL7qPb5e+rwoBGtHptMYyPprhQ8nUk9u/qchRVSWC25+5PoOab9LbWJvHgGv4Kj8sy3J2h4YuZMlqugj1Qz3NTwz4R9hrb1tHOh52WYSuDE0fc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774477996;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=mtCOFEEK50b1s6/zGAV4BDMfQf8/y0dzMxvJIsRt4Q8=;
	b=DGDzxKVs+7KZBdIh/7cAviGW95IYhLfvfDXsZNm1TGVjfpYu8lBcA1zO/3rHXOv/
	6K6Mo3dzrraPUjZV7fiVMuULtyMg/xBTyIq5c30lKTBM/0YzQjAfDNxPhhZFM0UnIB5
	PNxoBCaFTS7ER2jhlRWzm8kwu4xrfZzy55qT0gE8=
Received: by mx.zohomail.com with SMTPS id 17744779953931010.1520032680781;
	Wed, 25 Mar 2026 15:33:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 18:33:12 -0400
Message-Id: <DHC7Y88CXPP8.1AXPXN8YUPK1D@ritovision.com>
Subject: Re: [PATCH v2] docs: rework footer with semantic markup and
 responsive layout
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Rito Rhymes" <rito@ritovision.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260321131857.14166-1-rito@ritovision.com>
 <20260322182251.49484-1-rito@ritovision.com>
 <877bqzg146.fsf@trenco.lwn.net>
In-Reply-To: <877bqzg146.fsf@trenco.lwn.net>
X-ZohoMailClient: External

We could use a CSS override if the goal were only to change how
the footer looks. But CSS cannot change the footer's semantics for
accessibility, and that's where a fundamental issue lies.

The default theme renders the footer as a generic `div`, and
`class=3D"footer"` does not give it any semantic meaning. Screen
readers and other accessibility tools do not treat that the same as
a real `<footer>` landmark.

To fix that properly, we need to change the markup, either by
rendering a native `<footer>` element or by adding
`role=3D"contentinfo"` to the existing container. That requires
replacing the footer template/component, not just overriding its CSS.

Since the footer appears on every page, I think it's important to
ensure its a11y-friendly, so it makes sense to fix it at the markup
level rather than just overriding the CSS to be mobile-friendly.

Rito
