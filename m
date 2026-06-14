Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C4D31714B
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781428484; cv=none; b=Fg3IJooa2H4sXc8+3r3j++d/Vx+XsTD7pk06jlOVp/iFkWAVFQO9oxcfOGQIHZofSFUJc0fN/ABXzrxDGGVChWdQssPNZdgyOnBdwR9sYfHcMjB5A02RBTqtgX4HVPLglOGz7E1CfcyxrpGisboOBtYEE7AH8TgCQ7ADdM8pLDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781428484; c=relaxed/simple;
	bh=pMDQCbEdAremaxVE4eNOWM6qSqcfZc6GO4d6bu0Q+C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0uvg3yT8FRcB3bz4kdqoSvgAPlDhIY/l5PW1a2DFOUc9ejPN8Li6oxQGdJVRXz0dAEiTLwbYEDjgmBsJPpCXpTf9GG/Gor3itfGSqP8l1trBPIo6ZxGtqgRjyHQ3nsrVxsQIgcQZwHgFBjY5FZ16QtEcMl1/hSRff1BDn6DJEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMx8Eb/8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMx8Eb/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BD81F000E9;
	Sun, 14 Jun 2026 09:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781428482;
	bh=PTdII44FGFmJdbMtCPKaS2eB6vk6Xg9WicWBVorhrQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UMx8Eb/8JnZEGxjCkj5fbSZIF8ouy/FZaJqolliub6IojIr7yzYw9OXytXU+YyLzG
	 1sfXtl3YbiZTHx4pobKS44wrOe/9MYhm2tWwd31Ert3JNdVaXqg114iI+UWTuy4OjW
	 eEq7hlRisAo9IafOG18VOinIoj/K4b0RqrIZFDM1y5lIoa8PmtHJeKDDrIZSW/aEVw
	 WaSKWCYHK5mZ04tE5rKZ8HuRwYBK/0w2yG1YGIlxnc5hKe4rk9Nn3wgPZK3PHPflvl
	 Us+XMr6qFdCT9iRh/a2jnmp39Sb0AR4c4PW9TiXmXDwBbHO7SOyAGNjWnkqwUDaRak
	 h+seQ0Hl9eOnw==
Date: Sun, 14 Jun 2026 12:14:35 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] docs/mm: describe current criteria for enabling split
 page table lock for PTE tables
Message-ID: <ai5w--zzNaUHuQ6S@kernel.org>
References: <20260613221448.98657-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613221448.98657-1-enelsonmoore@gmail.com>

On Sat, Jun 13, 2026 at 03:14:47PM -0700, Ethan Nelson-Moore wrote:
> The mm documentation regarding split page table lock for PTE tables
> refers to the CONFIG_SPLIT_PTLOCK_CPUS config option, which was
> superseded by CONFIG_SPLIT_PTE_PTLOCKS in commit 394290cba966 ("mm:
> turn USE_SPLIT_PTE_PTLOCKS / USE_SPLIT_PTE_PTLOCKS into Kconfig
> options"). Update the documentation to refer to the current option and
> document the situations in which this feature is not supported.
> 
> Discovered while searching for CONFIG_* symbols referenced in the
> kernel but not defined in any Kconfig file.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  Documentation/mm/split_page_table_lock.rst | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
> index cc3cd46abd1b..c9d16024543b 100644
> --- a/Documentation/mm/split_page_table_lock.rst
> +++ b/Documentation/mm/split_page_table_lock.rst
> @@ -37,9 +37,12 @@ There are helpers to lock/unlock a table and other accessor functions:
>   - pmd_lockptr()
>  	returns pointer to PMD table lock;
>  
> -Split page table lock for PTE tables is enabled compile-time if
> -CONFIG_SPLIT_PTLOCK_CPUS (usually 4) is less or equal to NR_CPUS.
> -If split lock is disabled, all tables are guarded by mm->page_table_lock.
> +Split page table lock for PTE tables is enabled compile-time (via
> +CONFIG_SPLIT_PTE_PTLOCKS) if NR_CPUS is greater than or equal to 4 and an
> +MMU is being used. However, it is not supported on ARM processors with
> +virtually indexed, physically tagged caches, PA-RISC processors older than
> +the PA-8000, or 32-bit SPARC processors. If split lock is disabled, all

"it is not supported on some architectures" would be enough IMO.

> +tables are guarded by mm->page_table_lock.
>  
>  Split page table lock for PMD tables is enabled, if it's enabled for PTE
>  tables and the architecture supports it (see below).
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.
