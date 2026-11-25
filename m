Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622147;
	b=gz8uicve2lmttGbE1fENdUNz7VJIxSe9bpQmuDoftVCd0ZXeNJkuNX6Jwi2HjFeLNykW
	 ja3eArnHf66mnlyDz8i/CciQX+Jk7OIhZqNqkUINwbJwmCahKRrz2JJ0Bu/2XEwsay4Qc
	 Uf1Qt/cCPk5QSZp8lKvCriTY4B3WkmwWfvfEIZvYaLagOismtqD9G7/rCJZZLaRwg1tw4
	 UqdI+KZ41beEahZJYpkvPhgRLoVSUqZAKbUaLQcCaYMj3Nh90UYRy5fMrBrevQF6XF4Xa
	 3ieYZtEir1puf1bSFko78/FM3TlpB7s+znl2oUA0IyPz8p0kECeufHDQA4dOqmxEEMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622147;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=ODlkvh1jgAsfCEKAh2uwTJVhaz2a05aAUn81MDeLjRc=;
	b=fMw7BC+VhUoCK1l989nRiptRohZoIJeSoRVMnjKCn1pTkQrwVPvVIzGXSKOAzVTduGlO
	 ZukvHfgYe6jbQZFYRyVfYIJbLlvocYktCat5qNCBwwCbngqowB+WqChXz/lzVCL4LuDTP
	 2S9HpucepQM8SefkQcnt3RTuRran2YBRujInNH/SS6DndS9orFTTCDaDn7IgRmYi7lvwJ
	 edtjJ++eIk6Xkfyfh1Twk54nppb4CPTcNt1eZ55bfaDPv/Na55KOKrEPlKercR0bhnq2C
	 Xk9Ualm9fs956UvJlCdBg+FebPb7sWENA2dF39TEl7NWGkOKZnBfr4532DBEoviv3pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=Szct5RHV;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B25606A31E;
	Wed, 25 Nov 2026 15:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9B25606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=Szct5RHV
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 86E1D410D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795622145; bh=ODlkvh1jgAsfCEKAh2uwTJVhaz2a05aAUn81MDeLjRc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Szct5RHVBtpHwWUWp5mx6P0Gz0c6tltDbqKL0aZXWh3XcNBxRuqjV/NmUCcueupmc
	 lKV5IMbDIWrItA4Hpu6YsnMckADzbgGON3nrvXoCzayxWfDbSxY8+rilY/t1KEGvDC
	 NGfc1opGJES556XGYF2C3O5/of0syeMJy9x7sC+qV3rlEufTYEylNu9nwhZMMfLiy4
	 W0KMOmF6vzOC4hqbC702CvYmJx3yKkE/wdvgJPd3hKoET4KWWZb69eo8A7QHl3Wt+u
	 Gm3OQ+7l6exsmkN4kXKKF0N4CtNF/89dlpBbcxP6RDjgKfWbUaGZbV7kKlpCiLLyUV
	 PDMfZBwFYmGgQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 86E1D410D3;
	Wed, 25 Nov 2026 15:55:42 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>, linux-doc@vger.kernel.org
Cc: danielmaraboo@gmail.com, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, Gabriel Ribeiro
 <ic.gabrielribeiro@gmail.com>
Subject: Re: [PATCH v2] docs: translations: pt_BR: add researcher guidelines
In-Reply-To: <20261115140631.70601-1-ic.gabrielribeiro@gmail.com>
References: <20261115140631.70601-1-ic.gabrielribeiro@gmail.com>
Date: Wed, 25 Nov 2026 08:55:33 -0700
Message-ID: <87h5h4ykga.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Gabriel Ribeiro <ic.gabrielribeiro@gmail.com> writes:

> Translate the kernel researcher guidelines into Brazilian Portuguese and
> link the page from the pt_BR process index.
>
> Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
> ---
> Changes in v2:
> - Preserve the existing toctree indentation when adding the new entry.
>
>  Documentation/translations/pt_BR/process/index.rst |   1 +
>  .../pt_BR/process/researcher-guidelines.rst         | 176 ++++++++++++++++++
>  2 files changed, 177 insertions(+)

Applied, thanks.

jon
