Received: from mail-40141.protonmail.ch (mail-40141.protonmail.ch [185.70.40.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DD355888
	for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 15:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718638269; cv=none; b=CqLUaRKeudCoQ/UDw1W8lPHu8zEM6FkU4Ggw08Z9njAZ5sM1zphXmR/JLpNrAfmPPjTLbH2HqXrP1gLoslmJMQ3kU4JkLqMqtNIYgIrW19Z2C7ua+IGFE/ouGVcn/7f15eJPlEaRMQ+pDvd6sX9TCIlwUA5BmklTQLB0LAHK4Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718638269; c=relaxed/simple;
	bh=Vw9sJgyHK3ECtSjLrU40gYhvBIYfc1eE2d/g0kCEj38=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mRi7TriR+irlbGmwiive/QJFmduD9MaPjqJxvkHdUA287otaxGukK+9io2pBmOoHrdWOgFXcoIrA/B9tETOUHGT7U9t+OJJM0ILvY66d15795zy3wi32SyF8jvNhV3D/lFV6Pd0upWrclAwY+RKxkJR7VaQvlM6PD1SxITAaSE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=K9dfGoS8; arc=none smtp.client-ip=185.70.40.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="K9dfGoS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1718638259; x=1718897459;
	bh=+S+6ipnip68fwMOjzQzInH5hKgTq1k7GaW8wHF/5f4g=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=K9dfGoS8OFbgzNgHdMMcTuYdms4inde9NJnxRV/j8a3T6M9kzRGDdQkeA+otzFsOn
	 wktl8YBtIPjivYxXVjF0PkQT0qj1gYKWzP/TKfteI7b7Bk9D0/BDoMxZ9W43FtczZs
	 h19JU7Eci3T96W/eH4/jQUhFp2phsAO8s5TngVMy9ptmU6sruvOMH4AOgRWTlj/qwI
	 sMOdFUUZGk8hRNJ2x4Pn5a0zNTdz2gYLhfKjTPWwuy6OkeEBYt2bHWPMqNl1WZHGcw
	 gUTvzUEaUN1RjWDKqnoK+vAFtOaU+xxAj6yI5kQUUUWKXNjuv8dHFJwRcrVg2J5hND
	 QQeBlh+/c+xIw==
Date: Mon, 17 Jun 2024 15:30:54 +0000
To: "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
From: Matic Urbanija <maticurbanija@protonmail.com>
Subject: Re: Translation of kernel documentation
Message-ID: <SxCxHfgiiur4Gi8tybuhWvD0c7Nomfp3Rq9dXG7U_A_IvKHOMozFC1GaWHwV5zWrcYxawk2ReNYcZjs-40SdxYPInJKiHxqb423nQHe1RYM=@protonmail.com>
In-Reply-To: <87a5jjlk8u.fsf@trenco.lwn.net>
References: <nsxoOqrCQ4-K8OjCxC6b-Ln3ZWyhM9w_R3J_Hjap5ERAkiTldY7U96QemhwTwuCvgpC3gOmMUZ-doU9lpx9W2JSQDbALD_-U-TwjB19CwF8=@protonmail.com> <87a5jjlk8u.fsf@trenco.lwn.net>
Feedback-ID: 816150:user:proton
X-Pm-Message-ID: 1e84fff6e9e220434784584d0633314590eac1b6
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


-------- =E3=82=AA=E3=83=AA=E3=82=B8=E3=83=8A=E3=83=AB=E3=83=A1=E3=83=83=
=E3=82=BB=E3=83=BC=E3=82=B8 --------
2024/06/17 16:25=E3=80=81Jonathan Corbet <corbet@lwn.net> =E6=9B=B8=
=E3=81=8D=E3=81=BE=E3=81=97=E3=81=9F=EF=BC=9A

>  Matic Urbanija <maticurbanija@protonmail.com> writes:
> =20
>  > Hi!
>  >
>  > Thank you all for your advice.
>  >
>  > I'll start with Documentation/process, as Jonathan suggested. After
>  > that doc-guide and translations, especially Chinese (I read
>  > Chinese) and Japanese (currently learning Japanese).
>  >
>  > (Are there any other documents that I should read?)
> =20
>  I would strongly recommend perusing the other process documents,
>  starting with submitting-patches.rst.  Spending some time reading the
>  mailing lists to get a sense for how email communication works in this
>  community (no top-posting, for example) would also be helpful.

Sorry for top-posting.

I'll start with submitting-patches.rst.
> =20
>  Please CC me on any documentation patches.
> =20
>  Thanks,
> =20
>  jon
> =20

Ok.
Thanks.

Best regards,

Matic Urbanija
