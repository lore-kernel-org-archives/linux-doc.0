Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0D41C288
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711723858; cv=none; b=XP8nj8ka4C8pBikmEUgKFkouub91LHaTXeYcSajzAziDtyuSyUg/k/gI38orp/Fdir6j0mcqLL3qxn9XxRDAYlchh3/bS5T/X0qCB17R4b3/GWhFMXqi4Woi8fDVKYzBTHoiexvYaeFnfzzs/6WPe2Fw8+NUrhtcfiWSs6/u8o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711723858; c=relaxed/simple;
	bh=ArY/uRD8pBqT/1wdyDG2UJXWSxDfq1mc1YKNqEOjZUo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WrNYIgWYjCFSj9Wyu3LH2ZIbu8SoEKQOhZ8vI6lkYgdTujeZ4+HS7rgXs5AwVP2COQIQMzwK++KVTTH3gxYimcOaCecQ+5LnyCNFRX3/ot3hFhKkBXupkpQBDTWowsTD/132MdRzVjGQae8vUvnp7k8XYWTc3e/NNGxubl+Rm8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qIUoGpXV; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="qIUoGpXV"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 89A5045E3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1711723851; bh=88tUoF5m/Q4Fmbdk88UbjUSSExOvYdJZ/Q8fbWSG+8w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qIUoGpXVRdjiVbIJdIuP6iyxsqi7aQ6ZsmYp7WqH5ZhHQujjehvTGURSLEoq4Z2ZV
	 hRknVLJNiupIFSkljQpM3GPfcq7jZh18ch8LWsT9CsYoxeZSUZ5+fhGy1cFRFzLPAv
	 8DxhcO/TE1IAUppmgEJWX3QlNk5Ku3tM3wpf78HMSmuVADpNEiTadzVzV/fVD6nfyO
	 Rf0nikwUUEpqjN5xQLBEqNOkcl9X1RNHmEG846iqv61CCfsR4aXPja2NI2Id0eWM0b
	 9VGoogBR55DRqnUQSs/VWSAuyvnbvZbHbkhQwivs+EnF6/NvVxEYpwfzlexqPBxf+6
	 MS4gXJX+S/RPA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 89A5045E3F;
	Fri, 29 Mar 2024 14:50:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Donald Hunter <donald.hunter@gmail.com>, linux-doc@vger.kernel.org
Cc: donald.hunter@redhat.com, Donald Hunter <donald.hunter@gmail.com>
Subject: Re: [PATCH docs-next v1] docs: Fix bitfield handling in kernel-doc
In-Reply-To: <20240326173825.99190-1-donald.hunter@gmail.com>
References: <20240326173825.99190-1-donald.hunter@gmail.com>
Date: Fri, 29 Mar 2024 08:50:50 -0600
Message-ID: <87frw95bxx.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Donald Hunter <donald.hunter@gmail.com> writes:

> kernel-doc doesn't handle bitfields that are specified with symbolic
> name, e.g. u32 cs_index_mask : SPI_CS_CNT_MAX
>
> This results in the following warnings when running `make htmldocs`:
>
> include/linux/spi/spi.h:246: warning: Function parameter or struct member 'cs_index_mask:SPI_CS_CNT_MAX' not described in 'spi_device'
> include/linux/spi/spi.h:246: warning: Excess struct member 'cs_index_mask' description in 'spi_device'
>
> Update the regexp for bitfields to accept all word chars, not just
> digits.
>
> Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
> ---
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 967f1abb0edb..cb1be22afc65 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1541,7 +1541,7 @@ sub create_parameterlist($$$$) {
>                      save_struct_actual($2);
>  
>                      push_parameter($2, "$type $1", $arg, $file, $declaration_name);
> -                } elsif ($param =~ m/(.*?):(\d+)/) {
> +                } elsif ($param =~ m/(.*?):(\w+)/) {
>                      if ($type ne "") { # skip unnamed bit-fields

This patch changes this warning:

  ./include/linux/spi/spi.h:778: warning: Function parameter or struct member 'last_cs_index_mask:SPI_CS_CNT_MAX' not described in 'spi_controller'

to:

  ./include/linux/spi/spi.h:778: warning: Function parameter or struct member 'last_cs_index_mask' not described in 'spi_controller'

We might get a grumble from Stephen on that, but so be it, it's a step
in the right direction, anyway.

Applied, thanks.

jon
