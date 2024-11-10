Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AE1154457
	for <linux-doc@vger.kernel.org>; Sun, 10 Nov 2024 21:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731273003; cv=none; b=gIMvnFrBmF1slR/A1F0FmtgKgz9rxZHUkcT/8g4EmUCNMWfM9MsV65cR8IPHGzDId7hHUG5GuGmiBwftkF1zN3iY5m62/ONDRHuxvEYzQGD2TPq6KYiEH+Qju4iSuUk4TS5oVK4odxaAoZ98GUz6i6N3+Yr169Nz9UeWXnYJnRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731273003; c=relaxed/simple;
	bh=Ye+nRUuA7BD1TYfTkTWTH7JJPM2B2WhEEyCrFuga+tc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BQOwSTa7V6wOfd8HLZrCAfSK1sNZ6SBMc6RTY4Be1DvHyr9Jwtw0naqJQCMN/e8sSJZ636b/76xVrxoL0QPlaCrpIpyHeN6LGzaIiUG9jD1HtkLETScFtil0eHoSHbv20HYHBOjkBe22s1TAnDQF+zuaEi4bHgvGf0OUlh+ArnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mHB1Gb6e; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mHB1Gb6e"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F39E8403E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1731272995; bh=qdqCfFCNICKAnLe0TFk3pCoEPpSs21r22Tzef9RDm+Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mHB1Gb6etXEqMgQN6G9wakb+3EN/7U/puaZW99V27Xt+uoN/cap3jx3AJajeyTUC+
	 GenTuEHlxEO+v/uInxuQfMlrQQXECGBsYfjndwjcN/t6gqEFvDQa5uNNIcjVtJ3Fcl
	 TDfaAt37qJTB31953wErIHXCBgs99gkX99+YQZAEO3MWp2DN8EjIOIYuOF0H02cyVV
	 9BOcQEd62dwUkYcDLjppaDFOuTQF3ZO00Jnx4f8WpwPgjcgnY8WvOdMLO4ZKiri3Uc
	 8DLHfEf4AOw9xTRdWWGkmujjm9T+FyFNHZQthStMp6lf57s0dgxCoXdxbZJNijEApg
	 2brkfbI7ME19Q==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F39E8403E9;
	Sun, 10 Nov 2024 21:09:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dongliang Mu <mudongliangabcd@gmail.com>, YanTeng Si
 <si.yanteng@linux.dev>, Alex Shi <alexs@kernel.org>
Cc: HUST OS Kernel Contribution <hust-os-kernel-patches@googlegroups.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: lwn.git does exist or changes access rights?
In-Reply-To: <CAD-N9QX7B_io6wnx47w_CJpBF4vFOSS5wskr591BP1xPtz4cYQ@mail.gmail.com>
References: <CAD-N9QX7B_io6wnx47w_CJpBF4vFOSS5wskr591BP1xPtz4cYQ@mail.gmail.com>
Date: Sun, 10 Nov 2024 14:09:54 -0700
Message-ID: <87a5e6vlr1.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dongliang Mu <mudongliangabcd@gmail.com> writes:

> Hi all,
>
> Our mirror site (https://mirrors.hust.edu.cn) reported the following erro=
r:
>
> Mirror=EF=BC=9Alwn.git
> Upstrea=EF=BC=9Agit://git.lwn.net/linux.git
> Return=EF=BC=9Afailure
>
> Please make sure you have the correct access rights and the repository ex=
ists.
> git update failed with rc=3D1 fatal: Could not read from remote repositor=
y.
> Please make sure you have the correct access rights and the repository ex=
ists.
> Total size is 2.8G
> =3D=3D=3D=3D SYNC git://git.lwn.net/linux.git DONE =3D=3D=3D=3D
>
> Jon, please help check if lwn.git has any problems.

An update on git.lwn.net broke the anonymous git service.  Fixed now,
sorry for the trouble.

jon
