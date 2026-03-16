Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1A734887B;
	Mon, 16 Mar 2026 07:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773645040; cv=none; b=dVjO3VvWTtUPBfnoPVn/2mPwfMfz88NgX5wMR9dbZep8UQ2J6OcRxFRKtijCyIUlyPE8L6fkqPCEUogAtuWzaqyfWqTP8eX972+LZtNRpQbPHpoQ/FU0w0tGzXlkjvGFZXNlmETLuHifdLtjBtiJMyyALLa9E1LOC/M29XIHLKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773645040; c=relaxed/simple;
	bh=pnmC2GhPjFLjInhxncVX3Y5WnpxGERvRNgnd++x2L8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKHcUwwybEMHLP70SygzTi+S3SPI3FVk+q96nt4/zzEWnHqNedyxG2mPIycC/kOkcJaeXd7WTrYRMyehU/xK2cBPXi8rhKO0hmq6P+XeCcp8a13zr+Ydo7FQ4A1EKZYrcxB8SQpVpoaydmCIwIekEoQrFcojUqDP3ISTkw2Q0zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdmUk3Xv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdmUk3Xv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6546DC19421;
	Mon, 16 Mar 2026 07:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773645039;
	bh=pnmC2GhPjFLjInhxncVX3Y5WnpxGERvRNgnd++x2L8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tdmUk3XvVJgXTVxu27ZbtHylwsBERi4a33TYpHhszEpyP7sNV7I6VaxOZtCpg42MS
	 ntfxTuW9gPt37XOXU58sZ0iMvszs50HRAjPoLuwWG7kxL+rVjMMgalz0GyOPElMn0y
	 xTdxomGkTsuJroFCyOhTDFNzCPFu41vy9WZhx9DCjeDKjG4uu9jtwJl3vDkx9fl2U1
	 EFppQzodUXaHNYWKda1u9CkoV5wKGPIkQKvFWCzvSP3ksRnRnOvWiN2vcCbUMh8U6G
	 bWGCf7dsuW6l2l8c/v9BiNTqkgf3H4o6ArynAJDoEKZyDvcJhLmszGYyxhcIZqVb0N
	 dr4RK4TwABoMQ==
Date: Mon, 16 Mar 2026 07:10:36 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Docs: mmap_prepare: don't italicize structs
Message-ID: <2ae64217-ae32-4a4e-9c23-6809582ca7bc@lucifer.local>
References: <20260315224506.1973566-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315224506.1973566-1-rdunlap@infradead.org>

On Sun, Mar 15, 2026 at 03:45:06PM -0700, Randy Dunlap wrote:
> Using a single quote mark `struct xyz` causes the html output to be
> produced as italic. Omit the quote marks so that kernel-doc's automarkup
> can make the "struct xyz" bold monospace ("code" style") in the
> generated html.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

This is fine, though given this series is still in-flight we should just
fold this in no?

Anyway, LGTM so:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/filesystems/mmap_prepare.rst |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> --- linux-next.orig/Documentation/filesystems/mmap_prepare.rst
> +++ linux-next/Documentation/filesystems/mmap_prepare.rst
> @@ -129,11 +129,11 @@ pointer. These are:
>  * mmap_action_simple_ioremap() - Sets up an I/O remap from a specified
>    physical address and over a specified length.
>
> -* mmap_action_map_kernel_pages() - Maps a specified array of `struct page`
> +* mmap_action_map_kernel_pages() - Maps a specified array of struct page
>    pointers in the VMA from a specific offset.
>
> -* mmap_action_map_kernel_pages_full() - Maps a specified array of `struct
> -  page` pointers over the entire VMA. The caller must ensure there are
> +* mmap_action_map_kernel_pages_full() - Maps a specified array of struct
> +  page pointers over the entire VMA. The caller must ensure there are
>    sufficient entries in the page array to cover the entire range of the
>    described VMA.
>

Cheers, Lorenzo
