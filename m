Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689633DBD53;
	Tue, 30 Jun 2026 19:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782849554; cv=none; b=N9nVTuPNbEMwpSocT/UUmjk+OtaoglShgeUvou5bXoL6sDoN+FBVC8esxyHp3H2DVTFXZR1Bl3mLrwrODg3p1Am2DHWl6PrpG6K/Bqvgb9TaHlrjVFU5eDXc81RPYd3BxLv8SoYMO/k8lrYkLbu+iJWtbJ3IZkBpcZdBWBi5luY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782849554; c=relaxed/simple;
	bh=ujTY/dOS0R33Y3kklLCXUgKsj+SnQTbD2638nQVRoxk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BhwcXX7w++Xgjaj64vRkFwn/KZsaKy3SKDVBvMENlDJ3OKDCHn7HIzfvSuIS24VOAx2sLcvJlgEzPSTnObzfNiEoacDeni6o7ugoGTMB2lSNIGtJT0Wc5ywmPF8SENts2kHf/bSR3awHbcCjeH+JxNk/5zJ6Us55wlGAX132NuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=JjMrdQKn; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="JjMrdQKn"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A504C40E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782849552; bh=DIAuhwtA41AkfazriW3++q7S9yDekaSqKiyko/NSMBY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JjMrdQKn5dQcbeYaIboEDZieXDglKqerDrSEZi0sVFEuFoHoic6sidOq9WFUHHFib
	 IBA+LxnDE+7h70H81WPWrQ1SmtoXaw2Wd0pXPu7uxZD6JwRLnpq15k0+iNFDqGen/a
	 Xglx3f1DYkKOsPOz/hj5H9jReZjJvnKb593ShS3V1ic2ULIvb54NFPu9VGC/Ksm5IO
	 MOV+4GECthVV1tZarHOdEevOe0ZdRK1Z8rNtHx5A+sSPS1CHtk1nBaqLqCUkbty21W
	 8d4wCtTRlk40wsZDkTeVRNrTkPEDoj41VXSaO1fVJKLUK1n46RND4JZRG6TAfXur6z
	 E3Z843vf+HVUw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A504C40E27;
	Tue, 30 Jun 2026 19:59:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Amanda =?utf-8?Q?Corr=C3=AAa?= <amandacorreasilvax@gmail.com>, Daniel
 Pereira
 <danielmaraboo@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amanda =?utf-8?Q?Corr=C3=AAa?=
 <amandacorreasilvax@gmail.com>
Subject: Re: [PATCH] docs: pt_BR: update minimal software requirement for
 pahole in changes.rst
In-Reply-To: <20260614234320.8199-1-amandacorreasilvax@gmail.com>
References: <20260614234320.8199-1-amandacorreasilvax@gmail.com>
Date: Tue, 30 Jun 2026 13:59:11 -0600
Message-ID: <877bnfre9c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com> writes:

> Update the Brazilian Portuguese translation of changes.rst to align with
> the latest English version.
>
>     Key changes include:
>     - Updated minimum version for pahole (1.26)
>     - Added note about kfuncs annotated with KF_IMPLICIT_ARGS
>     requiring pahole v1.26 or later
>     - Changed "optional" to "opcional" in the software requirements
>     table
>
> Signed-off-by: Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com>
> ---
>  .../translations/pt_BR/process/changes.rst        | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

This patch doesn't apply.  There have been others fixing up the
changes.rst files; please have another look and see if there are things
still in need of attention.

Thanks,

jon
