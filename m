Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B3B2749D5;
	Sat, 17 Jan 2026 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768644054; cv=none; b=hCRplENfnwnnrIrZoKMQRe7UsDV7hvn0ogyKmDc1inyPscP1/QQSCuWAs8aop7D0njZAQdWmgj4pU4AszjWizsJnw74Wj7wHDGcqwzuu8r6YUEGa+T1JlYjA3qGoBkdpDifjrvGvCTkWyVXluYYt58NX05J/bau3FWinSsCp1pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768644054; c=relaxed/simple;
	bh=8F5V8IZB9vDMO1JyN6t+ZvVzWbD3ouQ7tqsDaA5F8h8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kj2zKfcPlaLZTHFxpZeenceP2d35wrrQtX08LVvr1hGw7flRYOGPhehytNXr7c/Blu6XRQAvrBN1nqBk6KEWPQmB3YdkF6ttt49LgeCb6yOrhh8LRBmkERo1ufeVo7hDribWMiuywMOODO4VDPUIwC4Noa7Z6c29x6KRRxn/IPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbK6WWvm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbK6WWvm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8499BC4CEF7;
	Sat, 17 Jan 2026 10:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768644054;
	bh=8F5V8IZB9vDMO1JyN6t+ZvVzWbD3ouQ7tqsDaA5F8h8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RbK6WWvm6I2B5Sb8+xjozRoMvA1+0HcXCt6ynfah27bb32bKxkHCK3P2uu/+2KSLA
	 ZRIkmJwDW+sTm1XxY3OC3lPP1ksZxL0ykyV7ZrmJjdaNF5wDoARAsj/xtLy2xS/Mxo
	 0jibitaZ2NJbAmBYx7bxC0IpzJzPOVVihOO2djhXkpVFZQZ8kFuX58CjAs1HfV6iM9
	 tNYj39pI7k5VtdnpriN43LpEQD1r9+/TMOGWXt0Uz1lFqV6FPx96HusiZ1vNC0h4ju
	 yKSx4s3ruCWQ3M9wVFVKrIprn6DASuxsvcLOJd7O86y8pPdU7GG2qGykGQvHTOryzQ
	 fLlrL4LuXDBCw==
Date: Sat, 17 Jan 2026 11:00:49 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 0/2] Move kernel-doc to tools/docs
Message-ID: <20260117110049.6cc49048@foz.lan>
In-Reply-To: <87wm1ho3cs.fsf@trenco.lwn.net>
References: <20260114164146.532916-1-corbet@lwn.net>
	<813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
	<87zf6gt2ts.fsf@trenco.lwn.net>
	<20260114212558.1aeb1b17@foz.lan>
	<87wm1ho3cs.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Em Fri, 16 Jan 2026 10:48:51 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>=20
> > Em Wed, 14 Jan 2026 12:24:31 -0700
> > Jonathan Corbet <corbet@lwn.net> escreveu:
> > =20
> >> Randy Dunlap <rdunlap@infradead.org> writes:
> >>  =20
> >> > I do many of these on a regular basis:
> >> >
> >> > $ ./scripts/kernel-doc -none -Wall <path_to_source_file>
> >> >
> >> > Will I still be able to do that (by using ./tools/doc/kernel-doc ...=
)?   =20
> >>=20
> >> Yes.  The tool moves, but its functionality remains unchanged. =20
> >
> > That's actually a good point: should we preserve a link on scripts
> > pointing to ../tools/doc/kernel-doc? I suspect that a change like
> > that could break some machinery on several CI tools and scripts
> > out there. If so, it could be useful to keep a link - at least for
> > a couple of kernel releases. =20
>=20
> So is the location of kernel-doc part of our ABI, or an internal detail?
> :)

Surely it is not part of ABI: it can be changed whenever we want.

=46rom my side, I don't mind where it is located: it will take some
time, but my fingers will end learning its new location/name ;-)

> I'm not deeply opposed to maintaining the symlink, though I'd rather
> not.  It won't be for "a couple of releases", though; if the symlink is
> there, nothing will ever change.

I see two reasons why having a symlink:

1. to avoid the risk of eventually breaking someone's CI or scripts.
   This is just a preventive measure, as I'm not aware of anyone
   with such scripts;

2. as you don't want ".py" extension on execs, but PEP8 mandates it,=20
   together with replacing "-" with "_", you can have a symlink that
   would make both PEP8 and you happy ;-)

Just my 2 cents.


Thanks,
Mauro
