Received: from mta1.migadu.com (out-109.mta1.migadu.com [95.215.58.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44BC331A63
	for <linux-doc@vger.kernel.org>; Sat,  3 Oct 2026 04:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791002753; cv=none; b=ITOrhs5u9ecO+wPK1+0R2Jc5n2ForhEVZcq138U9urhXHo+H2DPSSEjVlS/pbb2i8kN7r5c/u7gfIxMZY+BIXKoTzIeZdla8lOR6poQj0UZVLlrfQaM+cgCFoAuUdEEXAHZ2PExy5x4RB/HzYXHP/XkqLaZy6Xk/TIBKJ9FfbrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791002753; c=relaxed/simple;
	bh=PqHA7PAh9JHMpXtkgXGlLykZuAEZzZGGNJLrwPYAJeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brw4lZF2vU4dbv7DKVizjHjzzrsyIvoXuutdDReUfq8AA9bj0JeM09GPPCqwenZqLMMgB6P6N0bDy1uVp32n+cTXApuhn3fa90t1+j7rrCCJHmL3qim9fVN03fnAFJdHf1wU/JOaEkt9SmLT+q1S2SVu68SsFP6Aqd1kpX3X/BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Ee8Q+FO8; arc=none smtp.client-ip=95.215.58.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Ee8Q+FO8"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PqHA7PAh9JHMpXtkgXGlLykZuAEZzZGGNJLrwPYAJeU=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791002749; v=1; x=1791607549;
 b=Ee8Q+FO8bnLZgRAqXKj+3lZQYvpNzPdLqfJztoOxMsNpO5WGdGzlPlOkUVldjkQf/yKcDVkj
 zLn7i9e2iyN4oTkAYawe4JSrxEUI19Lqrj40ySxW58AJqRViqVEAjKpAvjJUY9AXOVhKlKqD2Rf
 MqpKvgr/nyIMZV1nz1pp3bVW3/VNF21WJuSX0iCeny2s/qFYh6Jfv9dcuQMcdy25/i7gyYQZKEH
 8wQs5ZAiaIs45xpHVN12dl+n+ktqqS84TxB4X+AfKHuKJf/j2rC3b4poSElceHm/eRda0oOe4Lz
 jcx3A1JmfX6UZjx/pELdK9s7x4o2Wnn1EaAQDX8mYx1Zw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id de9461c6e3360cc2;
	Sat, 03 Oct 2026 04:45:47 +0000
X-Mizu-Trace-ID: de9461c6e3360cc2
X-Migadu-Flow: FLOW_OUT
Date: Sat, 3 Oct 2026 12:45:38 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn,
	si.yanteng@linux.dev, srcres258@furdevs.cn,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] docs/zh_TW: add a notice for translations not kept
 in sync
Message-ID: <asCIcsjSHdqF3oI-@wyuan.org>
References: <20260929131142.266819-1-chenyou910331@gmail.com>
 <20260929131142.266819-2-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929131142.266819-2-chenyou910331@gmail.com>

On 2026-09-29 21:11:38 +0800, Chen-Yu Yeh <chenyou910331@gmail.com> wrote:

> As agreed in the zh_TW scope discussion, translations that nobody keeps
> in sync with their English originals should say so in the file itself,
> rather than leave readers to find out.  Add the notice as a shared file
> included at the top of each such translation, the way
> disclaimer-zh_TW.rst already is.
> 
> The notice carries no :orphan: marker.  Included after
> disclaimer-zh_TW.rst it would not be at the start of the document, and
> Sphinx would render it as an empty "orphan" field; Sphinx does not warn
> about a file that is only ever included, so the marker is not needed.
> 
> Start with the two files in process/ that are not in sync.  process/ is
> the part of zh_TW that is kept current, but security-bugs.rst and
> debugging/gdb-kernel-debugging.rst only moved there with the recent
> relocations and have not been updated yet; they carry the notice until
> they are.  The rest of the tree follows in the next patch.
> 
> Link: https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com/
> Link: https://lore.kernel.org/linux-doc/aqFPBQxq5asHzvtn@wyuan.org/
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Acked-by: Weijie Yuan <wy@wyuan.org>

> ---
>  .../zh_TW/process/debugging/gdb-kernel-debugging.rst        | 1 +
>  Documentation/translations/zh_TW/process/security-bugs.rst  | 1 +
>  Documentation/translations/zh_TW/unmaintained-zh_TW.rst     | 6 ++++++
>  3 files changed, 8 insertions(+)
>  create mode 100644 Documentation/translations/zh_TW/unmaintained-zh_TW.rst
> 
> diff --git a/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
> index a9ca1156fea6..45f178c0bf59 100644
> --- a/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
> +++ b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
> @@ -1,6 +1,7 @@
>  .. highlight:: none
>  
>  .. include:: ../../disclaimer-zh_TW.rst
> +.. include:: ../../unmaintained-zh_TW.rst
>  
>  :Original: Documentation/process/debugging/gdb-kernel-debugging.rst
>  
> diff --git a/Documentation/translations/zh_TW/process/security-bugs.rst b/Documentation/translations/zh_TW/process/security-bugs.rst
> index 76a78746ca4e..783d7c77b5fa 100644
> --- a/Documentation/translations/zh_TW/process/security-bugs.rst
> +++ b/Documentation/translations/zh_TW/process/security-bugs.rst
> @@ -1,6 +1,7 @@
>  .. SPDX-License-Identifier: GPL-2.0
>  
>  .. include:: ../disclaimer-zh_TW.rst
> +.. include:: ../unmaintained-zh_TW.rst
>  
>  :Original: :doc:`../../../process/security-bugs`
>  
> diff --git a/Documentation/translations/zh_TW/unmaintained-zh_TW.rst b/Documentation/translations/zh_TW/unmaintained-zh_TW.rst
> new file mode 100644
> index 000000000000..4b4eb63d749c
> --- /dev/null
> +++ b/Documentation/translations/zh_TW/unmaintained-zh_TW.rst
> @@ -0,0 +1,6 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. warning::
> +     本翻譯目前無人維護，沒有與英文原文保持同步，內容可能已經過時。如有
> +     出入，請以英文原文（見下方的Original欄位）為準。如果您願意協助更新本

So here means we still need the Original field.? ;)

> +     翻譯，歡迎將補丁提交給繁體中文文件的維護者（見MAINTAINERS檔案）。
