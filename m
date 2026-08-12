Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3793446CA
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 13:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542178; cv=none; b=iuC6o1qa0R/xfERIV7cYZQzlFNBXrIWgIQ4O0yVDh4qKMftg/mlCRN7VjtDkrzWQ0FsePzInUi9uOigqYWDm8X0VxT0QO731w+Kvf+SVETRcDhRUiszPtVkKrykzjPkngPYpvncbX41+QMUjHYg4MgI/gmur5IwyrjBoQx+8sN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542178; c=relaxed/simple;
	bh=ZZ0EkUNVvMTjAU6PcUiHmPTX+B1Qao1RwlfKrOONRHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/WVjQqss8YT0XjqKqm6NJ2QGoqdC5PnEotNv6BbUrI+9/YZ9m0P5vpsT9GvV9jz9/Tsw8AaRm7LGfaAZH4LPXxlVUh54uP77FnHuHPP7aOcV1iT5JX8mTD//usOyapEpwPWoY99bHi4djcRCy+IMCIvpRdCc1NnRB6GM4BlMWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=bWx70Wy0; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="bWx70Wy0"
Date: Wed, 12 Aug 2026 21:42:32 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1786542161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A5igZ4JC5/L6Ocym0oRK/mZut7CkYxfyWR058i+HeXE=;
	b=bWx70Wy0ROoYu/zVTn2RIa6/d5QWq5Hdqd1qRHQmLeIj6KZuIMtAofgx4HW96ClcxrKyUP
	wrkWnlHZEmPtlbBclupCJWBjyVKPB43oARfcYzphLvuOObSnWg0ur/JDzToPd3T1vL7UP4
	3T4Wphx3zs/BgE5HbWFRjmhN2kQEnXzZY5R5thCihTdyimEPJI/YwJ7AeD45IDDvaGsYfk
	7SBqBWyFMr9IN6ZK/wY8ZxL47GpyRB2xwdtb04Q20Cw/z64FxEKFTSIfK3ahfaEl7L0ChV
	NQmz9/4i4tsXAqTP7yeJpgg1jPX2UocEAMjmS2RloZ+fPh0FS46VaKhznC9jGQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/16] docs/zh_TW: localize terminology and sync
 process/ documents
Message-ID: <anx4SPAL0Yx13xk5@wyuan.org>
References: <20260806181949.65648-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260806181949.65648-1-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Aug 07, 2026 at 02:19:33AM +0800, Chen-Yu Yeh wrote:
> The zh_TW (Traditional Chinese) translations were originally converted
> from the zh_CN tree, so they still use mainland Chinese terminology
> (e.g. 內核, 軟件, 接口) that reads unnatural to Taiwanese readers, and
> most of the process/ documents have fallen behind their English
> originals.
> 
> This series localizes the terminology of the existing zh_TW process/
> documents to Taiwanese Mandarin and, in the same pass, syncs each
> document with its current English original, so that the "update to
> commit" markers stay honest for tools/docs/checktransupdate.py.
> 
> Each patch covers one document and does both the terminology
> localization and the content sync for it. Notable content syncs
> include:
> 
>   - code-of-conduct-interpretation: new "Enforcement for Unacceptable
>     Behavior" section and updated TAB voting language
>   - stable-kernel-rules: retranslated from the heavily restructured
>     English text (three submission options, stable tag variants)
>   - submitting-patches: interleaved-reply etiquette, reworked Acked-by
>     semantics, tagging-people permission rules, Assisted-by:, canonical
>     patch format subsections and the b4 tooling section
>   - embargoed-hardware-issues: "Early access" section and the current
>     ambassadors list
>   - index: mirrors the reworked English process index layout
>   - programming-language: Rust is no longer experimental
> 
> The final patch adds Documentation/translations/zh_TW/glossary.rst,
> which documents the terminology mapping used across the series (with
> zh_CN equivalents for cross-reference) so that reviewers can check the
> replacements against a single reference, and future translations can
> stay consistent.
> 
> A short summary of the main mappings (English / zh_TW / old zh_CN-style):
> 
>   kernel      核心   (內核)      software    軟體   (軟件)
>   interface   介面   (接口)      memory      記憶體 (內存)
>   process     行程   (進程)      queue       佇列   (隊列)
>   network     網路   (網絡)      server      伺服器 (服務器)
>   default     預設   (默認)      user        使用者 (用戶)
>   code        程式碼 (代碼)      file        檔案   (文件)
>   community   社群   (社區)      documentation 文件 (文檔)
> 
> On tooling: this series was prepared with LLM assistance -- an
> assistant drafted the initial localization of each document and the
> glossary, and I then reviewed every line by hand, checking each
> terminology choice as a native speaker, verifying the "update to
> commit" baselines against git log, and building the docs. That review
> is where the substantive fixes came from, including the two glossary
> corrections below. The patches carry Assisted-by: trailers
> accordingly.
> 
> Two items are deliberately left for after this series, as noted by
> Weijie during review: a legal disclaimer for the DCO translation
> (which affects all locales), and the rendering of "Linux Foundation
> Fellow".
> 
> Changes since v2:
>   - Collected review tags; every patch except 2.Process now carries
>     Weijie Yuan's Reviewed-by or Acked-by. The tag for 2.Process has
>     simply not arrived yet.
>   - Added an Assisted-by: trailer to every patch, per
>     Documentation/process/coding-assistants.rst.
>   - glossary: corrected two entries in the zh_CN reference column
>     (建置 -> 构建, 账户 -> 帐户) after checking every term against
>     Documentation/translations/zh_CN/ by occurrence count, and added a
>     note recording that provenance (Alex Shi).
>   - glossary: documented the CJK/ASCII spacing convention.
>   - code-of-conduct-interpretation: two wording improvements in the
>     "Enforcement for Unacceptable Behavior" section (加以糾正 instead of
>     作出彌補, and 對這類報告進行調查並予以處理 instead of 調查並解決
>     這些報告) (Weijie Yuan).
>   - 2.Process: dropped the space in 維護 staging樹, following the
>     CJK/ASCII spacing rule now documented in the glossary. The zh_TW
>     tree is 2581 occurrences without a space to 721 with (Weijie Yuan).


I have no more comments for version 3 as all my issues in v2 have been
resolved.

And Dongliang's comments seem to be non-blocking, which may belong to
another series later.

If everyone is happy with v3, can we declare victory for this series?

If so, which tree would you prefer this series to go through, assuming there
are no issues with it?

Thanks.
