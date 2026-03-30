Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9B037417D;
	Mon, 30 Mar 2026 16:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889901; cv=none; b=unrnyBxse7N26lZBuiJ7Q2lEiXX9LHhrZP52bSzkGvfe6WjCxRZahuLpyTTbysfdDGFCeE9hIu3HSltopqugV2St7o7OX4H67bjVtempLL9BSaOCxNTzIJA0J2+KFGC0UILfqCCpeyFHNf6KNKJE5tGxiN8Zm2yvbWjqOOVL7gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889901; c=relaxed/simple;
	bh=YNyVExhvXvOIumcQd28g8Kb7NclDlHOifW6Kn52f6C8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FRcYXvW0f/kIR/424+vXoARBgTh8hUQLjoEeG4L2bLgacemVMOJvQv6LEqX6z6PNxHMRBnZGNJDSzRMaMl4m50fiUn6SPZr68ytL8rqwUvCRrtqtO8V07aEV2MChD9evFEYVEBwK0lKKFxaSlZJTOQzkXGJdxqADF0i0Gw8IDoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QIljCes7; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QIljCes7"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8ADCF411C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774889899; bh=CpGubG4zNuFlQ67QHp4c4dkGq9/gVSV2aPeAQDaEMsQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QIljCes7BUce+rmT6RmmSzTwdR82ma+FvxI2ucrk9F4UTkwitTVtVFsC0w77iaUP3
	 v8cZ4tHVqS30jf8kinrh0zgzsgjnKMY4ud79Reb9zGx3d8BVWPfP0FAUYeQQtW56Ht
	 5fusq3RI0f6HHVdYydogdFzAX+CpBax2HWu3XITnPedmwBdrbLRCsNHqW/UKwpLvGg
	 taAy40Y3HsJCQqjntTkg297kuZ5g0VPZ5MVsOlgVil/BtfI3KBKz3SFIFtQOE8nN6r
	 sV86CYeqCcWpTSo2L/w/qsmdLd5TCpbNZ0V23Q2Ywr1MzVGQdCDtjDX3fPdbhGuyRN
	 oWSLakkkgHTsA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8ADCF411C2;
	Mon, 30 Mar 2026 16:58:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, Akiyoshi Kurita <weibu@redadmin.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs/ja_JP: submitting-patches: Amend "Describe your
 changes"
In-Reply-To: <20260326114637.144601-1-akiyks@gmail.com>
References: <20260326114637.144601-1-akiyks@gmail.com>
Date: Mon, 30 Mar 2026 10:58:18 -0600
Message-ID: <87tstxmez9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Akira Yokosawa <akiyks@gmail.com> writes:

> To make the translation of "Describe your changes" (into
> "=E5=A4=89=E6=9B=B4=E5=86=85=E5=AE=B9=E3=82=92=E8=A8=98=E8=BF=B0=E3=81=99=
=E3=82=8B") easier to follow, do some rewording and
> rephrasing, as well as fixing a couple of mistranslations.
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> .../ja_JP/process/submitting-patches.rst      | 107 +++++++++---------
>  1 file changed, 53 insertions(+), 54 deletions(-)

Applied, thanks.

jon
