Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884F48635A
	for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739551117; cv=none; b=fmOCSW+zMbTakStFDlRTqaxKV2uZ9x56DsH0QHyRXbwy+d0D214KcB6Gd4atMM1ESCGdqiY5MdkTyPD2E1X57rP7Ea6nyduaCPnbio7h2jj/pM13iu1Kn+qygq5dDlhyBF7GhmFow5x5hCTbluPvTUoqdn03S4pJyEKl8d3ItWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739551117; c=relaxed/simple;
	bh=7Jmhq2NekDQ048KOAnVnMopjOa7Q2hbMV0etgoH9qr8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QMRziPHS1BLW+shkAI0ciL/cnNLNn66/cTNJ3JWDUek7a4MDhy6+yNGOGb9M2PK12oeRM4Fi3kQHRSYQXxF/1ue3rL+XLsCyE7I2SPLrNCf8P2GjUyKa3s4+cIWviMQMXfCAGvdn+5TCZU8EDNt+RH5xbuGZ7C5oMVKgkXMa7F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=k7qq/BNS; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="k7qq/BNS"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 450A444097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739551109; bh=2bnOwUCTDWnCPt0G4sBddEuA+tov8Iv7QjSRvA64i7g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k7qq/BNSWP1Cbq5p37OpQC9JECNDeLPFKSQQlH4M8lUMAOBrX262+bpGpU3ioVBQc
	 cig3/nRMIqqBhpwED4f310seFvevmeQXEm7qkimVKdOWNIOrCZjQIr6WtBAlBhoxMT
	 547pJDTtCH2Um0347Hsqizq5b9OfLT7NJUgbL565XZbBRTDtpyn4wlp7Bs18S9usol
	 CPr3V1mkHU15IXOT1na7iZ8w8G+Yd8ktsHvaUllLyH40/UBkQY6ajGqi+qv7UKPiWl
	 fYWZmFwnzxGf6XWJ4a+89DR1g9p4MXr1olwUTuYWR8bLdzNFv4n39TUqxnuC4gw9I9
	 2RkvG4Cahsx2Q==
Received: from localhost (unknown [IPv6:2601:280:4600:2d7f::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 450A444097;
	Fri, 14 Feb 2025 16:38:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jani Nikula <jani.nikula@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-doc@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Bin
 Liu <bin.liu@mediatek.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia
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
In-Reply-To: <87pljkv69v.fsf@intel.com>
References: <20240131084934.191226-1-sakari.ailus@linux.intel.com>
 <87y1byvo4t.fsf@meer.lwn.net> <ZcFTepqR7xBFAMTM@kekkonen.localdomain>
 <874jemtq2f.fsf@meer.lwn.net> <87wmrhdekd.fsf@intel.com>
 <20250214084508.6ac2af28@foz.lan> <874j0wzfhy.fsf@trenco.lwn.net>
 <87pljkv69v.fsf@intel.com>
Date: Fri, 14 Feb 2025 09:38:28 -0700
Message-ID: <87v7tcxz0b.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jani Nikula <jani.nikula@linux.intel.com> writes:

> On Fri, 14 Feb 2025, Jonathan Corbet <corbet@lwn.net> wrote:
>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>>
>>> Em Tue, 06 Feb 2024 13:20:34 +0200
>>> Jani Nikula <jani.nikula@linux.intel.com> escreveu:
>>>> - Don't parse the contents of the comments, at all. Treat it as pure
>>>>   rst, and let Sphinx handle it.
>>
>> That would fix the latter problem, at the cost of breaking tens of
>> thousands of kerneldoc comments in the code.  I don't relish the idea of
>> all the churn needed to fix that up...  That might have been a good
>> decision to make 20 years or so ago; it's hard to see it as an option
>> now.
>
> Just to be clear, I feel I must repeat the context of my email:
>
>>>> After we'd made kernel-doc the perl script to produce rst, and
>>>> kernel-doc the Sphinx extension to consume it, I pondered the same
>>>> questions, and wondered what it should all look like if you could just
>>>> ignore all the kernel legacy.
>
> There's a huge (olympic pool size) if in there, and that's the main
> reason I could create a fun and lean little project around the idea in
> the first place!

Yup, sorry if I trimmed that out.

I just wanted to be clear as well... I've often thought that life would
be a lot easier if we could stop trying to maintain our own C parser
(and maybe Rust too someday?), but I don't really see a path toward
that.

Thanks,

jon
