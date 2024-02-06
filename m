Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F73413BEBB
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 15:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707232426; cv=none; b=sbivio//U6TRjxfxppMKJG5b9h6ZCarXFBAj3RPhAwwLLo/c/4DqMdRO3ZpX8Y19+GO+ds7uVehDVw/xOtqleXzx592AEpFJWhxjngHlLt9SR+LSXXGj36Lmfy5MIfhliPyUE2D4SYloHPSmKe1RUnowzPN3O4FZ6mrwUrOgTRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707232426; c=relaxed/simple;
	bh=WCrwBYO/b/EpitGQowheB0AEGpUrUY4HXPxoPQjDNeo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DdT7J4RkPvCGzwuZV0doL4KQwaDIWfLTl6hCUIWdacsV0gLVwCz9VgtVQ4eLTygOx5mAlDXxuT4NmjOrUWV7ew8Nb70W4T+kUl6149NHctD0Z3AI9nIJcrv2gBb2VgBCGa7SdUsmRDHDTJrpTG1YiYx4kWUUBfM6JWTD1j5xBUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=noHYs85Q; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="noHYs85Q"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1EAB247A95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1707232423; bh=WCrwBYO/b/EpitGQowheB0AEGpUrUY4HXPxoPQjDNeo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=noHYs85QZjYaJGG1VgpZJVp7IjyI3xUcmuy2p9DUnI8x+wDvdESBVey5NM+6niO1M
	 NjRs6W1xkZuLqpf8/w1U5KYdTu+sChYeG4t6K70LJPo7ZefJvu3ylLfHwGY2oVYCbp
	 mSaywQd7M6qhsR+18WDOilzvEj5LOg9eJ+srATNR97ueyDWHk72ZFnhcbWsmzELd+C
	 edi/tL668AzegWq+qBe/SEBM9lHOVXX2VsA9bBXvC9UIOfQCFf6qeKHG3uZdIXHCvJ
	 LUP+5Vmx46u2wQ6WDn/da93yWpLCV/EO1kZqXheTXBnWVoM+szn/UCAjs9p2OWzOT5
	 EKm+gSLaisOVA==
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1EAB247A95;
	Tue,  6 Feb 2024 15:13:43 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jani Nikula <jani.nikula@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>
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
In-Reply-To: <87wmrhdekd.fsf@intel.com>
References: <20240131084934.191226-1-sakari.ailus@linux.intel.com>
 <87y1byvo4t.fsf@meer.lwn.net> <ZcFTepqR7xBFAMTM@kekkonen.localdomain>
 <874jemtq2f.fsf@meer.lwn.net> <87wmrhdekd.fsf@intel.com>
Date: Tue, 06 Feb 2024 08:13:42 -0700
Message-ID: <87v871sk0p.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jani Nikula <jani.nikula@linux.intel.com> writes:

> What I'm saying is, while Hawkmoth is perhaps not the right solution,
> using any generic C parser will face some of the same issues regardless.

...which is why I mentioned tree-sitter, where it would be (relatively)
easy to augment the C grammar with a grammar for the kerneldoc comments
and end up with everything in a single AST.

It's still not going to happen, but one can dream...:)

jon
