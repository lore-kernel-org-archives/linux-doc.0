Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231179;
	b=oi4Hd9La/fnsoXeE1esXJSr3CStQql45Tzu5KPb+e3KlGu8oJ6g7c3tIY+IN9wseiwBG
	 oLlbvaPgmyGuRTlFe/wdNIAmc9U+fTxBeZUi7PK5/wAv4A6iVWaWvFNV4sr/omeER+OT9
	 2851pBWqcNev5lXUB87FyXwhjSlDkqjIqrHYE38iWGWNc3wVSRZKd2lzBKFE/f9L+5LkC
	 Fy9DGbG9tTB7/lk+UmAPW4xzecfXCUITWNpKoTPqpNqeDgVoawHjz7bVN6HOB5p7SctAb
	 uXMuN6liShyefCc5Cqbbu7T0O9Yz96JUYjYD6jiH1nxSBsmFWPwdwzsiltiN2L7mP5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231179;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=40bKMwmS+zqliWyWpfE0ENwj1eMynIlSudH9fVtlnO4=;
	b=M2D8dok0Qw00MAn6RWyJRJDE1t3kfUqeJrtJidcwYIinyF4Xt0CdsbD4TB/qErnYb38a
	 Yymr2acv50p/caZMC0U1UPrZdrYJuQEAruJYsFl6SexEQVnGCkusR8WSxAhNQb3tdIdQu
	 31OX4s3zjj0NY/hWFWo2U+HBK75fKOzjcVKnMwRZT/u0LKrRZ/newijoC/weThXTOfF02
	 k9afd9ltOAlydIXCe1M6/cCzqPcXEtNq8RDWLAunm2CIq7hJ5B0homMOahqYeGHcHY796
	 iD0qdbwTYnjke9h6hJcMCEHGRgdYUStLeJWEhxDhkzR9FHY8MhZZTrUwmFc26lJYh7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=Bbm86PvU;
	arc=none smtp.remote-ip=91.218.175.45
Received: from mta0.migadu.com (out-45.mta0.migadu.com [91.218.175.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F6F606A323
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 13:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20F6F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=Bbm86PvU
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Fvo0rU4AAAD5ybmggyHQoZ1nYUH7YGGjSe5YZFFbZuE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794231175; v=1; x=1794835975;
 b=Bbm86PvUjI3zrbGY+81JkYDU5PoHIZDhecLGKWYu2QzvSduoHWC7fC8GVqaJ6gu7+Vdfg/Ph
 thyBZi5PFa1MUb64BUCAw8Gt0Q3c8q4tBqRn/o7Y65RCv9qmp7zZhGLn6Z/TcGTVOCxQqXTWbNx
 1iY0tXMPH/nov4HTuyaYYy2cF4riz9oe+dFlHLdshxjYoIfOFDuxN9SY2pWrAf01xu3RzMCoMPs
 jKv0h+h8ZhV+jPLhlIM7V1+i94VHtvPWLNvQPX1sKzXvs/f6P84rCa6RLSaHZEDoBIo2elc1Kk5
 y/VynyjTbqYdMxfnEKbx/l7UbSRDC26m6M5inVCOhvBYQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d3a5308d7d69d732;
	Mon, 09 Nov 2026 13:32:55 +0000
X-Mizu-Trace-ID: d3a5308d7d69d732
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 21:32:45 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] docs/zh_CN: translate AI-related process guides
Message-ID: <avHLfe6N56YjXa-i@wyuan.org>
References: <cover.1794153793.git.dzm91@hust.edu.cn>
 <cover.1794197977.git.dzm91@hust.edu.cn>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1794197977.git.dzm91@hust.edu.cn>

On Mon, Nov 09, 2026 at 01:21:36PM +0800, Dongliang Mu wrote:
> Add Chinese translations of the process guides for coding assistants,
> generated content, and the kernel threat model. The final patch updates
> the coding-assistants guide to link to the new translations.
> 
> Changes in v2:
> - Add the missing Signed-off-by tags to all four patches.
> - Spell out "AI 助手" in patch 4/4 to address the terminology nitpick.
> - Format the English commit references in patch 3/4 for checkpatch.
> - Add Weijie Yuan's Reviewed-by tags.
> 
> Dongliang Mu (4):
>   docs/zh_CN: translate coding-assistants.rst
>   docs/zh_CN: translate generated-content.rst
>   docs/zh_CN: translate threat-model.rst
>   docs/zh_CN: link AI guide to translated documents

I happened to take a look at what is Sashiko's review on this serie:

https://sashiko.dev/#/patchset/cover.1794197977.git.dzm91%40hust.edu.cn

Besides the Original: and Translator: thing, Sashiko says that the new
translations below are not added into zh_CN/process/index.rst.

And I checked that the English original version of these are indeed
added in their index.rst, so perhaps we can by the way tidy up our
index.rst in Chinese process dir and add these new articles?

Thanks.

>  .../zh_CN/process/coding-assistants.rst       |  74 ++++++++
>  .../zh_CN/process/generated-content.rst       |  97 ++++++++++
>  .../zh_CN/process/threat-model.rst            | 168 ++++++++++++++++++
>  3 files changed, 339 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/process/coding-assistants.rst
>  create mode 100644 Documentation/translations/zh_CN/process/generated-content.rst
>  create mode 100644 Documentation/translations/zh_CN/process/threat-model.rst
