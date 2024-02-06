Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814FD1AACD
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 00:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707177933; cv=none; b=MgM+b1U6yVvho84T7MedJscu+o82CQX/9xiyQK/2JdXmkH9LUKuVHKCcTXAjwaE6xBD5pdLeUaYThPeiXel+X4rzXhjiCjd9IMrzIWwyuz9cwlfAkYQa1ACoMv4+LFanujNUW+ZagtkyxjML/Ms9x8bFvkBlds1LMlZZtIPyJoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707177933; c=relaxed/simple;
	bh=Ai7fcbhpRUk0/5aannUXYXdTe38Ype6DDhL/xs5ZBoU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bOVcnXCuZVsmzgtjmPiYODDmu57/E0Sfdim8Ke9CE5ZkDW0t1qrxtHNifMxaqWveJy/lGSjLRaZAy/P0zI1PQMathR7OmoO0k4A8Fml9DxPP08q6ZwhCdx5neAv8dTd+rHYwAjqtza7Of3KoO/yvP4ZYNpzMFwtTeuowDsqyYeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VZOIFmVK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VZOIFmVK"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 52D8C41A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1707177929; bh=bVXT50ZjQGutkZZQX2+6L2E654flsuW0AO8wEENnTS8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VZOIFmVK2UQTl2P3PLUX/+wslLN1SDQ1zsx5o0tEW4iPB/LWJlahjil/PgIpLYvFl
	 ccQmKo++b43fZH0Wujae23O6C33ARbZ5LrUgJtD6RJIzePKWthwOkdSIxxBhxYE6oS
	 D5IINtBtHjeQDWsLLq8H1IBNURd+sIFmSwnyJ6cxGpkVneND/DCHBDO8E97k6Tn0pT
	 Gwsmhz0fSPUrFT4hKgLHHJ3wQvU3A1p7zYKTedckS96jObviZXiY4oIygoFA+3LCAK
	 J6FHm/DO300XGDg4FCVwH40dp2jTAqsG6gZWlyHsVkeLen4LCKioZowF+szJ3GmbAF
	 SRe3Wla4YyeVA==
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 52D8C41A45;
	Tue,  6 Feb 2024 00:05:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-doc@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Liu
 <bin.liu@mediatek.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stanimir Varbanov
 <stanimir.k.varbanov@gmail.com>, Vikash Garodia
 <quic_vgarodia@quicinc.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/1] kernel-doc: Support arrays of pointers struct fields
In-Reply-To: <ZcFTepqR7xBFAMTM@kekkonen.localdomain>
References: <20240131084934.191226-1-sakari.ailus@linux.intel.com>
 <87y1byvo4t.fsf@meer.lwn.net> <ZcFTepqR7xBFAMTM@kekkonen.localdomain>
Date: Mon, 05 Feb 2024 17:05:28 -0700
Message-ID: <874jemtq2f.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sakari Ailus <sakari.ailus@linux.intel.com> writes:

>> Sigh ... seeing more indecipherable regexes added to kernel-doc is like
>> seeing another load of plastic bags dumped into the ocean...  it doesn't
>> change the basic situation, but it's still sad.
>> 
>> Oh well, applied, thanks.
>
> Thanks. I have to say I feel the same...
>
> Regexes aren't great for parsing C, that's for sure. :-I But what are the
> options? Write a proper parser for (a subset of) C?

Every now and then I've pondered on this a bit.  There are parsers out
there, of course; we could consider using something like tree-sitter.
There's just two little problems:

- That's a massive dependency to drag into the docs build that seems
  unlikely to speed things up.

- kernel-doc is really two parsers - one for C code, one for the
  comment syntax.  Strangely, nobody has written a grammar for this
  combination.

A suitably motivated developer could probably create a C+kerneldoc
grammer that would let us make a rock-solid, tree-sitter-based parser
that would be mostly maintained by somebody else.  But that doesn't get
us around the "adding a big dependency" problem.

<back to work now...>

jon
