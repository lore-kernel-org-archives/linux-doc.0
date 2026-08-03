Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C07D3A3826
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 19:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785787087; cv=none; b=ZTRFZ84VN6b8zXj/ZUeI2z8CJPrvg9cQORVvFB19KEr54B+MwHqWZLDobdWYrTXI4lfURZH4v25Rb9V81Fceaz1jjMMB3v40+GCJjkY2tofwwoL7+TVBjll26Q/FadfOOGP4kKqLwylFZdkrYB57i6ts13ePfC2yw3fVw9g5Y34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785787087; c=relaxed/simple;
	bh=gU7IaoFAFmnD7LUdo5WUMUzqVX0frPTn5M1cd09IbNg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fRdHrL1HkFYI6qvCBYsR+Q7wtXDnoOG3MFVO4tCePOgfRyELKhCTKXboKGzW63tjrO1CDqvtaJWpEVf+5d/owxGk+Wfda86ZP98pGL7pGYfXdpNoSxy47p+fxUTtEDmM3dpjTyK/qwgyIPIrMMVGSswgSQDu+1jSWI6nVJIA3ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VUBz9cqE; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VUBz9cqE"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 90521408D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785787085; bh=piSRNWzGDW6P8BVUseJxRugEQF9AnFnMiAA8X8W7954=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VUBz9cqEkgxx6wGv1N5hkNkMAt9dWwXpNpnFwyVlmQtxO69GwAhyqqyyU8tWh5ht6
	 bvFwkS2yKuiMMHcCCIzNkrfc1+Ierz8tL1dhVu3cl2ZEXLUAaegjQs7YGZpukKxH/O
	 4kwMRNnjH/faKkX8qIlC5Uu0gO1JNgnZCAxfb657dC7ytgBW2zJ2D265ETToEhuAJW
	 ho/mNICdMyghebRgkvk13e7evOr9JI0y/a8qhRH+HLo5GbcKs3qZYCQ2Jyqiw5RUeN
	 eODFi/tAP8JfvgiARooj6nugvpqrKjUrhT2u9oi2C8LU9ATKnvk8aoomzqPeZVke6G
	 ZqLi7Kr/olN3Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 90521408D2;
	Mon,  3 Aug 2026 19:58:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Matheus Patriota <matheuslinuxdeb@gmail.com>, danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org, Matheus Patriota <matheuslinuxdeb@gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: process: Translate stable kernel rules
 guide
In-Reply-To: <20260713125113.20976-1-matheuslinuxdeb@gmail.com>
References: <20260713125113.20976-1-matheuslinuxdeb@gmail.com>
Date: Mon, 03 Aug 2026 13:58:04 -0600
Message-ID: <87mrv3vuwj.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Matheus Patriota <matheuslinuxdeb@gmail.com> writes:

> Translates the documentation regarding stable kernel rules into
> Brazilian Portuguese, maintaining consistency with original
> formatting rules.
>
> Changes in v3:
> - Removed the Sphinx label to avoid conflict with the original
>  documentation, as suggested by Daniel Pereira.
> - Removed duplicated/incorrectly named files from the commit.
>
> Changes in v2:
> - I changed the patch name to avoid conflicts with the original patch.
> - I adjusted the dashes by replacing them with commas.
> - Regarding the typo, I corrected "conclu=C3=ADdasamp" to "conclu=C3=ADda=
s".

This inter-patch change information does not belong in the changelog;
put it after the "---" line so that the maintainer does not have to edit
it out by hand.

Speaking of the maintainer, always copy the relevant maintainers on your
patches, or they will fall through the cracks.
scripts/get_maintainer.pl will help you there.

> Signed-off-by: Matheus Patriota <matheuslinuxdeb@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/stable-kernel-rules.rst     | 232 ++++++++++++++++++
>  2 files changed, 233 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/stable-kerne=
l-rules.rst
>
> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> index 7a488f662..e761ee0eb 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -78,3 +78,4 @@ kernel e sobre como ver seu trabalho integrado.
>     Processo do subsistema SoC <process/maintainer-soc>
>     Conformidade de DTS para SoC <process/maintainer-soc-clean-dts>
>     Processo do subsistema KVM x86 <process/maintainer-kvm-x86>
> +   Regras para kernels est=C3=A1veis <process/stable-kernel-rules>
> diff --git a/Documentation/translations/pt_BR/process/stable-kernel-rules=
.rst b/Documentation/translations/pt_BR/process/stable-kernel-rules.rst
> new file mode 100644
> index 000000000..22fc83a73
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/stable-kernel-rules.rst
> @@ -0,0 +1,232 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. _pt_BR_stable_kernel_rules:

Please do not proliferate these pointless top-of-file labels, even if
the English text has them.

You did not actually build the docs with your changes:

Documentation/translations/pt_BR/process/stable-kernel-rules.rst:68: WARNIN=
G: duplicate label option_1, other instance in /stuff/k/git/kernel/Document=
ation/process/stable-kernel-rules.rst
Documentation/translations/pt_BR/process/stable-kernel-rules.rst:141: WARNI=
NG: duplicate label option_2, other instance in /stuff/k/git/kernel/Documen=
tation/process/stable-kernel-rules.rst
Documentation/translations/pt_BR/process/stable-kernel-rules.rst:152: WARNI=
NG: duplicate label option_3, other instance in /stuff/k/git/kernel/Documen=
tation/process/stable-kernel-rules.rst

Please fix all of these problems, then resubmit for 7.4.

jon
