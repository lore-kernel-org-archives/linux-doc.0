Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F240771B52
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 21:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706649027; cv=none; b=Wz9NbZ+Pmb9R1ZOc/aDHMN96yVuZFUrx/v0ih9AHqqgxQX93zcwf7U03vh+5OMA2lGHs6h/AvkHeZhwn/fO3gMFnco4srgb78uRA5YVvfOzdy9llG/dK/2nvXeuKTiR6wQph/LBergaPRn6AJ4iP/zCyNLUhzzdZIgXYoWa2YMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706649027; c=relaxed/simple;
	bh=bOgIOwMQ4CxNuERPjhkXVxvqeiwk9rI6QQHiKnqDGoA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TSfyA8PQU25Um8BQMXTgobGxZzVkduPogUgYRDLQ9X4D14/CCS23ZcFl00XvUHJ2nzPC6ixMlBaV93HCs5ryNCyT91OVTfmbGfaKsbL0sRar3Jv5O0CYknZepG2gXm3p8wO775NbwL7PqGllxlHCzqqYmRcSCiBKhh0IMcgepiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Egih3KNC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Egih3KNC"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EAC0847AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1706649025; bh=qg9PD6ggrKyrdw2YP+YrYPjpAubJ0mfDBwSLc7JTHNs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Egih3KNCwoguEqKpgAvSwcfY51+dS5KIbCX/Ia7QBUxUlJwHvXjLYk7OVtibr+vNK
	 ZUYlJmLzEWP8BpVpev+rRihudfOq0zGPtojqjw5KsN0ZDp58iFi+jJDEHQ460dkEhI
	 D4OWZuakx7huvXYs2YCkYn7D+Sw1BUVCIwOnYF0HKYf1zO5joShrG7xR01A0AwfBpa
	 G4CGcrjGfb2L0r2etYl09aWZP3CeHENBicxmzCoyygap0gjFEEZneD72NDwFjpd58A
	 7p2RZkaGCIHaiwyy6AgebgPTqoR1S0VicjsXM3HsTeWhd+aLsmr/aUZ19oWJMeQLOz
	 Wy54oxk0EimOw==
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EAC0847AAB;
	Tue, 30 Jan 2024 21:10:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda
 <ribalda@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Liu
 <bin.liu@mediatek.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stanimir Varbanov
 <stanimir.k.varbanov@gmail.com>, Vikash Garodia
 <quic_vgarodia@quicinc.com>, Bryan O  'Donoghue
 <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-doc@vger.kernel.org
Subject: Re: [RFC 1/1] kernel-doc: Support arrays of pointers struct fields
In-Reply-To: <20240127185311.391940-1-sakari.ailus@linux.intel.com>
References: <20240126-gix-mtk-warnings-v1-17-eed7865fce18@chromium.org>
 <20240127185311.391940-1-sakari.ailus@linux.intel.com>
Date: Tue, 30 Jan 2024 14:10:24 -0700
Message-ID: <87bk92a5of.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sakari Ailus <sakari.ailus@linux.intel.com> writes:

> In a rather unusual arrangement in include/media/v4l2-vp9.h struct
> v4l2_vp9_frame_symbol_counts has fields that are arrays of pointers, not a
> pointer to an array, which is what's usually done.
>
> Add support for such arrays of pointers to kernel-doc.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi Ricardo,
>
> I tried to ram it together with processing the rest but it seemed
> to complicate processing the usual fields.
>
>  scripts/kernel-doc | 9 +++++++++
>  1 file changed, 9 insertions(+)

So I went to apply this...but b4 then pulls in a whole series of
patches, none of which were sent to me.  Since this says "1/1", I was
not expecting that...  I've unapplied it; can I get something that isn't
buried in a bunch of other work?

Thanks,

jon
