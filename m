Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310F63B8D68;
	Tue, 20 Jan 2026 22:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768949003; cv=none; b=IQCpR1AiQ98SfqT279z1wN3LHE4nZrQC6qzOiGoJOfyx/W1petkai8o4HEhIFWVXZbu3OsR6VHafG3VCd7KFkenL8vUp96KqN/8YDomSD4wkZjzNCYa6yA2dMPzQweINcnMH/5xa+yLQj1GOnu0sR7S2OXXD/tuKUh7jNT+T+u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768949003; c=relaxed/simple;
	bh=FQJ3EqIPk1L40PaEl5wsScXaThKGK3nfpIxpMrbVLJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vF3QopTHeWBeXeBOfPknWSCtugahDbOazeMbcB6P2uBStxVbmqjfelgS0TYkAwA1bWz11MhM1ewYtw3OmopS7Zb+lKrXRLzBy2n0xG/Xk+vhEycTJvCvaSDvImhu03M6mwcU73SqfOoy1tJEs5Aia5Ce/+LSqtKXiStzH/X3zC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9MTK2tv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9MTK2tv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53103C16AAE;
	Tue, 20 Jan 2026 22:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768949002;
	bh=FQJ3EqIPk1L40PaEl5wsScXaThKGK3nfpIxpMrbVLJ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d9MTK2tv+LnVl1eArfbVtGbEOHUDsE8gU7mpAPlHoEtBJy1tylR2efUj73jDtn5ZB
	 0CdJePdkup8z73mFeKgcGARv3q4nf5KBp/R+QgInmqM4pzIC9gzgbrE0fL4LdWtXTY
	 fxQ0sCQ57pZjUzvg8tOvcjLOb3NQICk+L+eiZnfu7kNmAptClBJc9IOHqLjSTV4Hx3
	 rJEfLxkUNcjTIJMajsbxc+JfoooDah75Tm83uTHbgvlEYOMS3R14J79aogZxQPG8po
	 TODqUYTLKyv4QdlfSHgE1GwwE5ahRg9e/iUtVD7aob74DT4ZEMLCzfrxddFPA5IwfS
	 +JurG7iY2xlmQ==
Date: Tue, 20 Jan 2026 23:43:17 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] tools/docs: sphinx-build-wrapper: avoid spurious
 rust docs generation
Message-ID: <20260120234317.48887b52@foz.lan>
In-Reply-To: <20260118-docs-spurious-rust-v1-0-998e14b9ed9e@weissschuh.net>
References: <20260118-docs-spurious-rust-v1-0-998e14b9ed9e@weissschuh.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 18 Jan 2026 00:26:20 +0100
Thomas Wei=C3=9Fschuh <linux@weissschuh.net> wrote:

> Currently the rust docs are generated for each entry of SPHINXDIRS,
> even those not mentioning the rust directory.
>=20
> Only generate the rust docs only once and only when requested.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> Thomas Wei=C3=9Fschuh (4):
>       tools/docs: sphinx-build-wrapper: generate rust docs only once
>       tools/docs: sphinx-build-wrapper: make 'rustdoc' a local variable
>       tools/docs: sphinx-build-wrapper: compute sphinxdirs_list earlier
>       tools/docs: sphinx-build-wrapper: only generate rust docs when requ=
ested
>=20
>  tools/docs/sphinx-build-wrapper | 80 +++++++++++++++++++++--------------=
------
>  1 file changed, 41 insertions(+), 39 deletions(-)

Patches in this series look ok. Code reviewed and I also did some
tests, and all LGTM.

So, for this series:

[mchehab: tested building with and without config RUST, doing
 a full build and also passing --sphinxdirs rust peci and just
 --sphinxdirs rust]

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Tested-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks,
Mauro
