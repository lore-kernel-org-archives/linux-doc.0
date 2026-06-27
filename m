Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FB2768EA;
	Sat, 27 Jun 2026 00:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782519324; cv=none; b=m4yWHQWlim0q/EVauxUxmKFujm4ZvqhJaxswYvJ5BINmEYeLYET7ZWnFpncJpVjKLPlSe/f4MTw4UutO0MTGizoWoubdDJZxT8FeYxpeyEQit14OlIBzPTfwBxtCfRBoVP1PIUYAw0vNoDPvEu16LoHKiEJTDTFQ4F5eZ8aoPA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782519324; c=relaxed/simple;
	bh=NdTlj81kbHbZxYOwBuzeACeYEdbOqk7YqsfM68E/3oI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bd4gEd2Rn8cW8RdvDmC20k0h0LEQMwCWObQaxUtRnrf9UqHU0CTsNZTdPc7K9g6KHNRSlzrzz5W7xIVDWgYJ6THybeDS2P+g6k225pYyUTu1/G0YUN7+Ajg3pLlZu4F+oyAZePscpObNqVFxHUlBapGthwPY5hPfs7mYb8MMSC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZIWrY54; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZIWrY54"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444D31F000E9;
	Sat, 27 Jun 2026 00:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782519322;
	bh=3KRY5OrO7g+cPT9+7+2igg1BzSLFiMUr5YncE0LQ8JI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bZIWrY54veV5+26gLmgy96EhnXGzoYWtKD9q8OCpYYLYxx/YzJKpSL5p5SqEWDvjX
	 imioq55UvWyjm87pKOZ7aZg2U5eVnrPytxISK7GDFf+ekRRyS3GgB71UzPIU/0v8+S
	 WAeRNAIxaT7diZkxZ79AbNy1y1spRBkgXyUpArAT0xUE92jzopDZN9/qWHnEzXXepT
	 k90gcdox90LlKNifdSL6AOTstVp9zYFgeTHF4XZKXDEcVJxl1Q1SNUNwgExi3z7gdU
	 Vgb8z4D+CbcOtZaQQae4UzEgs2K3BJtOEmUjxuC4qSGi5iJssyRNlybi743yW6Pniv
	 VQq8JjLN9iQEQ==
From: SeongJae Park <sj@kernel.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: SeongJae Park <sj@kernel.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v2] docs: pagemap: fix flags location, member name and sample code
Date: Fri, 26 Jun 2026 17:15:10 -0700
Message-ID: <20260627001511.85842-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626162710.25844-1-zenghui.yu@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 27 Jun 2026 00:27:10 +0800 Zenghui Yu <zenghui.yu@linux.dev> wrote:

> The userland visible page flags (KPF_*) were initially moved to
> include/linux/kernel-page-flags.h in commit 1a9b5b7fe0c5 ("mm: export
> stable page flags"), and later moved to
> include/uapi/linux/kernel-page-flags.h in commit 607ca46e97a1 ("UAPI:
> (Scripted) Disintegrate include/linux").  Update the doc to reflect the
> current location of these flags.
> 
> The member @walk_end of struct pm_scan_arg {} was wrongly written as
> "end_walk".
> 
> The first sample code of the PAGEMAP_SCAN ioctl wrongly used the
> PM_SCAN_CHECK_WPASYNC flag twice, instead of the PM_SCAN_WP_MATCHING flag.
> The second one included the wrong category in the required mask -
> PAGE_IS_FILE should be used instead of PAGE_IS_SWAPPED as per the
> intention.
> 
> Fix them all together.
> 
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> ---
> 
> * From v1 [1]:
>   - drop PAGE_IS_SWAPPED in .category_mask (David)
>   - fix typo in commit message (David)

Good catches!

>   - didn't collect SeongJae's R-b (as the content has changed anyway) but
>     thank you for that!

Let me give it again :)

Reviewed-by: SeongJae Park <sj@kernel.org>

> 
> [1] https://lore.kernel.org/20260625174447.24292-1-zenghui.yu@linux.dev


Thanks,
SJ

[...]
