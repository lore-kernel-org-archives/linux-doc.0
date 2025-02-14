Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA163245002
	for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 15:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739548621; cv=none; b=YMCvSMka36kCDBBvkhFTcipKrB9dmvayg/5sePHbagxrsMxZ/i80UsJ4yd+Q7D2HPQBEU+FqdvjKJq2jbj+R6WKrw1RXM5JIdtLwypDKn+HMdKBxTaxjA1igaUFB80oxn5UI/lkhYkvp2h0Blqr/iGQQWTHzMtodyb7JDxWuqRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739548621; c=relaxed/simple;
	bh=C4vZIOiKDW+XoTUS5wXXpy5I7HM7qTBEsnFh6i4Wt5s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oYr690ip6+N43m2nSpa2jvlTB729MMCtx5Gge6kRAuH6b2964FyUQniXumR4pakfTDKCqaSVpquKnG33kBPtqHq9AF/YF26+WbN+ZD1ljB8ddLgMgIyPXWFANfqYuc9GFnOziiyNKLXaiseHu9joXukHQkrC2NQCRQZjtLkSW5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=nOiQ/6jm; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nOiQ/6jm"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8653744097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739548618; bh=QaazEqTq+w4o3IuRmgp9R+21y7JRlCamDkBlHqz0b6w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nOiQ/6jmq3nPfq3qrm+raYU5k9OIpg7YX9d6PDXYYyfSUk7jrYP2WMHKFkDQNytHZ
	 ZrJgj7P4xNkKNdRxb1MaAM4Jx8hwY+RobP4JKpi1puuBMnVjozNVdxdEjUlD8G9pAd
	 5/H0TFTSl7KmR9buMjPTf1sszKCKQP78qrocHQLhTHy3giwv37vsVKDCrz2payZdwv
	 OT0Q++rOLzpjV9kKb3eLGzJb3+nynvQFGG5MeClyEONY/Hxn+ajOBbixbsb3yzEP4i
	 Ov3nT3m32Xul/xRxmn1QOnTFvfZAOxIQiKpEr/gRKoOIeWPtC2ECru5CSvWWLeysTC
	 Bmjbmirii5ZiA==
Received: from localhost (unknown [IPv6:2601:280:4600:2d7f::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8653744097;
	Fri, 14 Feb 2025 15:56:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>
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
In-Reply-To: <20250214084508.6ac2af28@foz.lan>
References: <20240131084934.191226-1-sakari.ailus@linux.intel.com>
 <87y1byvo4t.fsf@meer.lwn.net> <ZcFTepqR7xBFAMTM@kekkonen.localdomain>
 <874jemtq2f.fsf@meer.lwn.net> <87wmrhdekd.fsf@intel.com>
 <20250214084508.6ac2af28@foz.lan>
Date: Fri, 14 Feb 2025 08:56:57 -0700
Message-ID: <874j0wzfhy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Em Tue, 06 Feb 2024 13:20:34 +0200
> Jani Nikula <jani.nikula@linux.intel.com> escreveu:
>> - Use Python bindings for libclang to parse the source code. Clang is
>>   obviously a big dependency, but nowadays more people have it already
>>   installed, and the Python part on top is neglible.
>
> Ok, but this may increase the doc generation time, and would make clang
> mandatory for doc generation. As you mentioned, most developers have
> clang installed already, so it shouldn't be a big issue.

I have pondered such things (tree-sitter too) in the past.  The problem
is that these parsers parse C, which isn't what kernel-doc is looking
for.  It needs to see the code without preprocessor intervention, and it
needs to see the comments.

There might also be more resistance to requiring clang that one might
expect.

>> - Don't parse the contents of the comments, at all. Treat it as pure
>>   rst, and let Sphinx handle it.

That would fix the latter problem, at the cost of breaking tens of
thousands of kerneldoc comments in the code.  I don't relish the idea of
all the churn needed to fix that up...  That might have been a good
decision to make 20 years or so ago; it's hard to see it as an option
now.

jon
