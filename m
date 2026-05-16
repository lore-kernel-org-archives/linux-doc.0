Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978B436C5BB
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 06:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778911237; cv=none; b=lC/5rIPi+m4NC2tmlsXcc19Uia/tknqRNM8cnZ2Z7BwgMc9TS5B3Z53k2zF1zDoMvE0klYdT8Sh7bbGi40AsES3bFpo1TiUr+PgGkWKYPK1Qv++GsN/7fq9x+Anu3+0zTlAzvBQVrs/MOC+ME8u2JNA/gdeQpJIMbIVeVS8p+6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778911237; c=relaxed/simple;
	bh=6gRnyyU6kT2iGFbB1O4lo48RXODj/MSirfM4J3sPjX8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qa1mnjObblAsrQljHFb3QSOovy7/TEpCY1cdMc65yGpDxqWQBymwXj4Ycy444iG9Ul5zCsZQ/z8nU8ybPwxqvW0RZADakXwJz6RnixGPuwDZJek9nt1yhImlVzZZfbGeJLX3R68Snqo9sqxv6k/+w3/PcjeQU6mdONWpijDh3d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=exKKwUSw; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="exKKwUSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1778911225; x=1779170425;
	bh=6gRnyyU6kT2iGFbB1O4lo48RXODj/MSirfM4J3sPjX8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=exKKwUSwDgpOH+GghS+cg0WpqlpW7/kdOmsVajrUmsuqwykqrZYLW4obIYCOM+hpK
	 nTYPd95Frp4uWt5+McPYaECMbgDa15O+NfWyjxIbie8UDm3jOKEl+3EYnFUp5frQde
	 +KPakUhswEeEskrt7H2pt6mbrt3pVER6RSuF3K4oFtoP3olna/SEwvjNBVQRZd7kIu
	 gDwvga1LLdFQOYgLCQiQ8Y83nZTCrCJCMq8kNlCGdzZl2j4nPgX9vXoXGDv78zIshL
	 frS0jYfgdqgo3IttvdoeVZioVi0qVCGy68uc6UoXNWQhw6a/HsV+h0CD8WRtg6tNY7
	 FhtjCZxONYWBw==
Date: Sat, 16 May 2026 06:00:21 +0000
To: Guenter Roeck <linux@roeck-us.net>
From: Hassan Maazu <maazudev@proton.me>
Cc: Randy Dunlap <rdunlap@infradead.org>, "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "khan@linuxfoundation.org" <khan@linuxfoundation.org>
Subject: Re: Documentation: fix typo in title for max31730
Message-ID: <iHocZ7FKS1VKC5iUOdqgnNintdfIRrLyjCZgF7_SwkMiNKO0dGvWMIvuiRn2UfHfN-7Zssd4e0rRZnZ81xzL2-4wXtaXADFUD_YZVOtPxGU=@proton.me>
In-Reply-To: <e370fb0e-c3c4-4f82-a280-49e154a4c08d@roeck-us.net>
References: <lC2hDaF-g523KA69MW_DVSRix9HHjA5drjH62zaO9eFNuOboR1cxxrTbqNJ8lmvuZ0u35qD4Ds8x0SeARtp5Hi-qIVpOi2zjYoV_vzCJjEM=@proton.me> <5e0aa2ae-b179-4cfa-85fc-805c0da79111@infradead.org> <e370fb0e-c3c4-4f82-a280-49e154a4c08d@roeck-us.net>
Feedback-ID: 83974785:user:proton
X-Pm-Message-ID: e2f4ba59ca4e3cb54a0327d0aeb918d0d93d1ae9
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Resent

Regards,
Hassan

On Saturday, May 16th, 2026 at 12:45 AM, Guenter Roeck <linux@roeck-us.net>=
 wrote:

> On 5/15/26 19:56, Randy Dunlap wrote:
> >
> > [adding Guenter]
> >
> > On 5/15/26 7:41 PM, Hassan Maazu wrote:
> >> Wrong device name used in title.
> >>
> >> Signed-off-by: Hassan Maazu <maazudev@proton.me>
> >
> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> >
>
> Thanks for copying me, but I wasn't copied on the original patch,
> and neither was the hwmon mailing list. I am not going to waste
> my time trying to dig up the actual patch, sorry.
>
> Guenter
>
>
