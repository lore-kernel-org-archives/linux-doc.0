Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE0530EF9A;
	Wed, 22 Jul 2026 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784720123; cv=none; b=pim4ESI1PYccl/ck4eULvG7E7+zibwv6WenXT+HMO5xmbfKlohCwNtHWWSIJoS/O2t6wG6k2XQkHGJWIy/k4FVoTkfzmj77mdsLMQeobI2GaLilzq+baE4oJfaA1rOZudjWuVI9OZoNc5+Fof/d9ebyDKAZtPcTkZ6LBCZofUCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784720123; c=relaxed/simple;
	bh=xAYjjHcG7X68TX0SFKelH4J3RYk5Aj163hh+TdiZm6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSEgv9LnBEkfSKNYQ74PrMu5j3kksWTf5XXKU7A1HDPkGGTn8dngw2Ecj6vU7X0gF9i+8Mg1vOkmmGA0QdFy1Fo5auRxAelmSrjn8OSEaIt/ttp/tmA0ZDhqHKOW+zHTyUVVKUo55ODY6/uBuHgbU93K59gyT8k+Torfnly9jw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=LtruQ8Nj; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="LtruQ8Nj"
Date: Wed, 22 Jul 2026 19:35:00 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784720114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZu2GsJ/kvF6ulCfsd1zhnxboo9/Npv58i9rIx6hPFI=;
	b=LtruQ8NjzS3f3cQwzFVv/2Z0JJctH0IGX3WTL4/0M4CAVlNwdFvNKxzJUSvyENI1cJmdEB
	R/F4wNRegCzi4v9t63sHgi/HwCCD7rT7k/rck1TuEBRJa7HS+2VfqtcrzLRq/H+gUNQcbl
	9Lxw7Qv3hOux1uU3z2D03N6ljC3exJl8B/r0SRXRHyym9rDGnaL3U/rZ2EYuINhF/440Th
	HfgNH5PzuW3bFrIFpa/2HcyZ2SNo1VpjNg/UVJCxP5ay3ROZdm2C8Zd9QO0dcf8SpDA7B1
	xbMhnNtWjEfu1g31VvOuSD70J2wfPZNMPiH04AzB5KJs0N2D2fsveWw/tbdfxA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/16] docs/zh_TW: process: localize terminology in
 license-rules.rst
Message-ID: <amCq5Giw9HCZTK6j@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-5-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721215542.98435-5-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 05:55:30AM +0800, Chen-Yu Yeh wrote:
> @@ -129,20 +133,19 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
>  
>        // SPDX-License-Identifier: GPL-1.0+ AND LGPL-2.1+
>  
> -許可標識符
> +許可識別碼
>  ----------
>  
> -當前使用的許可證以及添加到內核的代碼許可證可以分解爲：
> +當前使用的許可證以及添加到核心的程式碼許可證可以分解為：
>  
>  1. _`優先許可`:
>  
> -   應儘可能使用這些許可證，因爲它們已知完全兼容並廣泛使用。這些許可證在內核
> +   應儘可能使用這些許可證，因為它們已知完全相容並廣泛使用。這些許可證在核心
>     目錄::
>  
>        LICENSES/preferred/
>  
> -   此目錄中的文件包含完整的許可證文本和 `元標記`_ 。文件名與SPDX許可證標識
> -   符相同，後者應用於源文件中的許可證。
> +   此目錄中的檔案包含完整的許可證文本和 `元標記`_ 。檔名與SPDX許可證識別碼相同，後者應用於原始檔中的許可證。

Start a new line here? This line is a little bit too long.

>  
>     例如::
>  
> @@ -156,28 +159,28 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
>  
>     _`元標記`:
>  
> -   許可證文件中必須包含以下元標記：
> +   許可證檔案中必須包含以下元標記：
>  
>     - Valid-License-Identifier:
>  
> -     一行或多行, 聲明那些許可標識符在項目內有效, 以引用此特定許可的文本。通
> -     常這是一個有效的標識符，但是例如對於帶有'或更高'選項的許可證，兩個標識
> +     一行或多行, 聲明那些許可識別碼在專案內有效, 以引用此特定許可的文本。通
> +     常這是一個有效的識別碼，但是例如對於帶有'或更高'選項的許可證，兩個識別碼
>       符都有效。
>  
>     - SPDX-URL:
>  
> -     SPDX頁面的URL，其中包含與許可證相關的其他信息.
> +     SPDX頁面的URL，其中包含與許可證相關的其他資訊.
>  
>     - Usage-Guidance:
>  
> -     使用建議的自由格式文本。該文本必須包含SPDX許可證標識符的正確示例，因爲
> -     它們應根據 `許可標識符語法`_ 指南放入源文件中。
> +     使用建議的自由格式文本。該文本必須包含SPDX許可證識別碼的正確範例，因為
> +     它們應根據 `許可識別碼語法`_ 指南放入原始檔中。
>  
>     - License-Text:
>  
> -     此標記之後的所有文本都被視爲原始許可文本
> +     此標記之後的所有文本都被視為原始許可文本
>  
> -   文件格式示例::
> +   檔案格式範例::
>  
>        Valid-License-Identifier: GPL-2.0
>        Valid-License-Identifier: GPL-2.0+
> @@ -209,12 +212,11 @@ https://spdx.org/licenses/ 上的官方SPDX許可證列表中檢索，並附帶
>  
>  2. 不推薦的許可證:
>  
> -   這些許可證只應用於現有代碼或從其他項目導入代碼。這些許可證在內核目錄::
> +   這些許可證只應用於現有程式碼或從其他專案導入程式碼。這些許可證在核心目錄::
>  
>        LICENSES/other/
>  
> -   此目錄中的文件包含完整的許可證文本和 `元標記`_ 。文件名與SPDX許可證標識
> -   符相同，後者應用於源文件中的許可證。
> +   此目錄中的檔案包含完整的許可證文本和 `元標記`_ 。檔名與SPDX許可證識別碼相同，後者應用於原始檔中的許可證。

Ditto.
