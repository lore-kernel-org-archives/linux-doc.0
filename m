Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E1F3FE4F
	for <linux-doc@vger.kernel.org>; Mon,  5 Feb 2024 17:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707152976; cv=none; b=EJP5Z70xFMJGwevFXxVEojQAp54W7l24LjhCYWoRdXkKMCDML0nL9IFm6oubJ1DezPEQKdTNPuzd//tcq/TG5C/nAk+RiilKP4jx97nKBbkw+6qs7aj6OcMa+fHuQi0o76T7QLfC4MrfH23L1xCtEo6RSk2d8b3RpCf7VKEGzWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707152976; c=relaxed/simple;
	bh=2Jtf+z5k2UwNW9Yqz3535v74q98hE76O+wEZtvM3bj8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=b1sG5rXZcS+ykDMnX4sZmUWDLb1lTE3R14q76bYSs+O77UR8ccAQsZsheYsd4EFAIF5g1UORlvXJuoyauvnHz4JX+nfYam5hV9v2QC5LxWOLwem1B/XTLrPCWLo80XlQBE3JISb2I7LNxXcehP+YtwFzXFx3ideFtkAAGE7lijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Zv3ZON2a; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Zv3ZON2a"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E890145AC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1707152659; bh=YyY/wO0/bUgl02P1mWur7WkbAjfMwUY8pIPqpsKN2z8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Zv3ZON2a90TXKIeD9GWQh3rV2MCAa1FShdHlOYJ13hYrZfPLJxA+NKCQ59koL7enU
	 nPPBOPCWvYWHP/fzVSiO88yXoGJOexUc2UkzsOpMyLCjb9R0rjzOQaCeGKyETQLjN4
	 v+xzYn8HVL3o+xfWbnsFaLbpGCAdDJ8g42j4Pfl453SfE2xWy0ESYHUPArvaWVcSTi
	 h4vjpyy2Vf8ayIcey5g0ewQ4Aa6l/viYPk6Z+igd0Qk/rvnTa6VFVbdmHPpER/8/9E
	 YVd24pJ8DgP3oFivBxABGVPWyffAomSuPPNMP106qFK71hbCNnb/mnImy7cwsZAi/7
	 JPeMzJqUc1ksA==
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E890145AC9;
	Mon,  5 Feb 2024 17:04:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-doc@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
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
In-Reply-To: <20240131084934.191226-1-sakari.ailus@linux.intel.com>
References: <20240131084934.191226-1-sakari.ailus@linux.intel.com>
Date: Mon, 05 Feb 2024 10:04:18 -0700
Message-ID: <87y1byvo4t.fsf@meer.lwn.net>
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
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> No change since the RFC, just added the acks.
>
>  scripts/kernel-doc | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index e8aefd258a29..23c91b11585a 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1509,6 +1509,15 @@ sub create_parameterlist($$$$) {
>  	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
>  	    save_struct_actual($param);
>  	    push_parameter($param, $type, $arg, $file, $declaration_name);
> +	} elsif ($arg =~ m/\(.+\)\s*\[/) {
> +	    # array-of-pointers
> +	    $arg =~ tr/#/,/;
> +	    $arg =~ m/[^\(]+\(\s*\*\s*([\w\[\]\.]*?)\s*(\s*\[\s*[\w]+\s*\]\s*)*\)/;
> +	    $param = $1;
> +	    $type = $arg;
> +	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
> +	    save_struct_actual($param);
> +	    push_parameter($param, $type, $arg, $file, $declaration_name);
>  	} elsif ($arg) {

Sigh ... seeing more indecipherable regexes added to kernel-doc is like
seeing another load of plastic bags dumped into the ocean...  it doesn't
change the basic situation, but it's still sad.

Oh well, applied, thanks.

jon
