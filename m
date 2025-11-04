Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D5E1E5B7A
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 14:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762264948; cv=none; b=KhxhNh8Gh6AsQMLFZvvo8BfMKY7S9yR+BN4WeGLHI9FLLG7GSNZRc7cR4NAJeOcyP4JcPGVSP8m1UeUIlsGBcg7t9r8n4KLBKiSZALyspbsm5i54fjQOAjfVrMlUc4oYsPvznoy4no8V1rW4YRSDemNq/hDre/iziJyy9TG0jp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762264948; c=relaxed/simple;
	bh=Q/dxXV1Q5RSlWNoIQ96VsrMW/R6DOvSX/GQwf+VHe6M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rTC844l7s2sCp2DkSmCSo5AlMJGPQiyBOTlG2SKodjZ5w0F2BwSUHYTkyol16XNZP0b7g7vhNKmeBjxV7rhn4nQLHQserle6uDWlOrUPNNvS30ZkAO7oFHiQq2Na96zYC/hkjRyP+cBYvj2sU563vGoJ7KVyuAvGaGmJkqAKX1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ioremap.net; spf=pass smtp.mailfrom=ioremap.net; dkim=pass (2048-bit key) header.d=ioremap.net header.i=@ioremap.net header.b=oiB3UxpY; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ioremap.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ioremap.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ioremap.net header.i=@ioremap.net header.b="oiB3UxpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ioremap.net;
	s=protonmail2; t=1762264932; x=1762524132;
	bh=Q/dxXV1Q5RSlWNoIQ96VsrMW/R6DOvSX/GQwf+VHe6M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=oiB3UxpYgM151usCu5epVXH/wPv7RCqWaIuSrp1Dn9x2O1tdZ5xF5dOVERCxeVcsO
	 lq+0vxGCjgqUK4D+qliJ+ex7NNI1wxPDR4p00BhMWWvcfaO+uicJXN6FqqLYAqMIcc
	 fSwRA646t+Rq9hvV70uZHCqnCRr60nGCsA+i9/MoHEj4b2m+nfsP7YPst31iorxDRX
	 cSO0puprFS4DDoP3wFnq1XmGmxZtTFPA7XynZ2or21kwQcRIRi665OYdrJExIF8871
	 WobFzKugo/l8PrIdp/PkiRqei7ciyuwOhQ31JOSp74Hv/poOZlFBzRi+tDvvEPnxkB
	 E+ICI07Z1BiYw==
Date: Tue, 04 Nov 2025 14:02:07 +0000
To: Randy Dunlap <rdunlap@infradead.org>
From: Eugene Pol <zbr@ioremap.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Linux Documentation <linux-doc@vger.kernel.org>
Subject: Re: W1 bad URL
Message-ID: <I1L_HoQJ5jb8-Y4wUqxp8oWCaqPl2e2bQPG1og65C9eZqD8yl5dfKsA7xm703xM7SrjTvgt0JTVnKxG-qGNKvHnqFgAtXlcH450k9Jl80DQ=@ioremap.net>
In-Reply-To: <f1914b48-eb9d-400d-aaa1-1346fdaed54e@infradead.org>
References: <5eb4fa80-7591-422a-9e23-c6661318b705@infradead.org> <f1914b48-eb9d-400d-aaa1-1346fdaed54e@infradead.org>
Feedback-ID: 136636263:user:proton
X-Pm-Message-ID: 175e3679c399e3c563d6f55311b30851772cd2ca
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Randy

Thanks for CCing me
ioremap.net URL is no longer valid, the code was moved to https://github.co=
m/bioothod/w1



On Tuesday, November 4th, 2025 at 3:33 AM, Randy Dunlap <rdunlap@infradead.=
org> wrote:

>=20
>=20
> [adding Evgeniy Polyakov zbr@ioremap.net if that works]
>=20
>=20
>=20
> On 11/3/25 6:45 PM, Randy Dunlap wrote:
>=20
> > Hi Krzysztof,
> >=20
> > This URL in w1/w1-netlink.rst seems to have disappeared:
> >=20
> > 2. http://www.ioremap.net/archive/w1
> >=20
> > This archive includes userspace application w1d.c which uses
> > read/write/search commands for all master/slave devices found on the bu=
s.
> >=20
> > Are there any other sources of this application for the documentation?
> >=20
> > Thanks.
>=20
>=20
> --
> ~Randy
