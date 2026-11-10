Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309807;
	b=Z+XOeB6qoB2GbYjx6z21YuD5Hjr5SmmfoobhrAD3GImwqJ3NzyKiW1mrQmAlsQ9tSjUB
	 HUi8I8/s+oUVJ+6ZDgf0BDwjUkyn4FZxhbsBoyaPYWZH/biZwMBPnjwbhti1iwYgWN+tG
	 Amf0XrFc/bJMwaXA9iHwMkqXIpf8bTJJt8k70b3Z34KFdI8lByqW74q83DQDzmi5nLn7r
	 xTOAHNFLqozQ3ry6xkegHmnsPY4N+pvLsf6KdjwzQQqklDq92TfYU1771xotjOm/RshOR
	 U0/CDgVDvT+To7zd9fVqjXf/u/cjt68ZDilliJ80XhS06i00Qcg0Nwes3KoygIDJdIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309807;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XfmJBNGd92FhC8y95UpzVL4GweLdJWyblAebsca1f90=;
	b=dgNnCEnB/Z3NKRJJFL5+gTqZCcrpefK9jsEFt4deuiFlSLTZaWbXIGfiWV3/hsyTFzrv
	 gJHBB/UCPfDTZdpKFHF1quvItxlHmHibqf234EbV6AX6TyNpDcO3gOQNHPYQKhZDB1AL3
	 wrjcscd8qmjgoSNtO+/2gSywQZQUqafGtJDS8jDMQCK3wyPTRg0c34gGbN5WOxubakXQl
	 oCogL67cd32slfnyXG9qV/2rjDiT7SvvdTSZIavDzj/2dhCtBNr3Pn4cdi1qgy8KB08Ql
	 rJThDi0p2PzFILj626x16TS20xP5RL0IQSM92eIiezNfGG+ZUSydudTT6FAqx8c6lDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=apScMet4;
	arc=none smtp.remote-ip=91.218.175.135
Received: from mta0.migadu.com (out-135.mta0.migadu.com [91.218.175.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B10B606A31C
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 11:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B10B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=apScMet4
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5/QZK8nVFxgJu/4R/AOnU4rMsK+Ac2dSe2EfSYkK1Sc=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794309804; v=1; x=1794914604;
 b=apScMet4y9arBN9cUMG3SLMSyaA3KRCXpajjc9xX9Vzp1lFme1MK/9YYydwkfmEqBLYIFyqo
 9+LzppbpPJkZCszP/wB+TkjH8SOjO1WvLxUFzI3KZXF72YfC0X2L/BRc+KQyhffox7Vp8oU1tNV
 UX/EQS3Tff3iXekb/UshX7eJxtEBRNGo2I+8WnnZeStMWlMJ5SH5U9V1H3Dp5g31sEWsD+xSg+Y
 +y3fH+59Pxjfrwu4to65blJNVaONA6ZraaGvut2MUvckRa0L/5McmjAiQvNDZlKVLYOmYrEVm+k
 dv2xHA23OYYIQ7/MTcMTwHT/GtqjTD4dEEa3dsHxaYrow==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a7f6b9f97e4de1b5;
	Tue, 10 Nov 2026 11:23:24 +0000
X-Mizu-Trace-ID: a7f6b9f97e4de1b5
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 19:23:21 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/13] docs/zh_TW: process: add researcher-guidelines.rst
 translation
Message-ID: <avL-qRuVY_v924Vy@wyuan.org>
References: <20261106113545.708896-1-chenyou910331@gmail.com>
 <20261106113545.708896-2-chenyou910331@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106113545.708896-2-chenyou910331@gmail.com>

Chen-Yu Yeh <chenyou910331@gmail.com> writes:

> Translate Documentation/process/researcher-guidelines.rst into
> Traditional Chinese from the current English text, including the
> "Surveys" section from commit ad93f083bdb7 ("docs: Add a section on
> surveys to the researcher guidelines") and the tech-board list address
> from commit 27103dddc2da ("Documentation: update mailing list
> addresses").  The zh_CN translation was consulted for wording only.
> 
> Keep the three reference link titles and the example commit log in
> English, as in the original.
> 
> List the new file in the toctree of process/index.rst, after
> management-style as in the English index, and drop it from the
> TODOList.
> 
> update to commit 27103dddc2da ("Documentation: update mailing list
> addresses")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Reviewed-by: Weijie Yuan <wy@wyuan.org>

Thanks.

> ---
>  .../translations/zh_TW/process/index.rst      |   2 +-
>  .../zh_TW/process/researcher-guidelines.rst   | 136 ++++++++++++++++++
>  2 files changed, 137 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_TW/process/researcher-guidelines.rst
