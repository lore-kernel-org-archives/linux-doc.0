Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089247;
	b=Dt6gIMygSU96WMLrv2isUcPT5Jj9BR9xfRJbHUBbtFc3GGuodn6P+g2F9cPe+YbNeSn3
	 2JsCJ8Z3tNEaX/fKIl1YiPH+Xg5gYWNEiN5yohJP9FqOugpm3k7c4crEFjHp7CdOFQmH0
	 9tdHhBwoVYYZIPKdI2m/LW7Fy//HMmr8vnE93NStY37U8n1NuSlLH68WCAWygU1JzxKQ5
	 ZDPYP/7rd8OsVPeMLhYl+3vjnGM8fa/rdQIfdGJjpM9npdUmTR1bT/f3bSA/zSjMIEOlb
	 3Txb+4IRUt/MjyMijr9+Ah5DIYNxR60U4GKnj6d1fXBVqrytHnvVqQpcUzmUceNceqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089247;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=BwOaWdPMF7ZjoGgqFFp4mcfQGWRKB52ZuTxmt4DQgm0=;
	b=GMGAH70xj+aqCP4zbG6jRQGa+w797Pr3+EgBp1mATaNlBjjSuoygEVkBLtib8Lswfd6X
	 rctKkh3s4ZFYRaFcPXe6/szH04I6V0RjYeB0ydi3RkPWG9nTu7fl+fqrK83AflwFRNe82
	 8PRahZXYwBwMqsKla79/9g230ZwAXl67dnmT3ORFdkT9Xe1Ng7IBn/QC6puE9eOpEkDOI
	 w9lssF+P4nsPb1Z58ztzBmGNOZL+5ksyI8OMrmqXIKf4BTMKt9Uuw7A4sjhCsgvRooQye
	 QEDz2qij8TOEMRrcPwD8HP6lszj2i9DEWwlwrOG8YaOUROUzgOnY/i3VVMg69wnM93Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R4Kfyci+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856DD606A32C;
	Thu, 19 Nov 2026 11:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R4Kfyci+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289681F000C6;
	Thu, 19 Nov 2026 11:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795089247;
	bh=BwOaWdPMF7ZjoGgqFFp4mcfQGWRKB52ZuTxmt4DQgm0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=R4Kfyci+0b1qYDJmcMfCUwBHdFcqsHB/hMDqNsPgugKpR4VCJHxrdqatQa+FiN9Gk
	 zwwOsDVaGjvVb+ODPak7GCzycpOiXAhOQ3uLKurWMQa4e7s1V64cfbnuiJ/Ee37r3g
	 /z8vSpc1XhYwlscXhNTdHW27s/SOk45LXTky9vdaSLTnAHlW1p1NKiuRT3j+VGh2ip
	 phmXKTR7le6ZZiDO59wOlsM1AQLK9IWC/SQIIvXYqJWP9TVP2oqiOzPG/BRk52Gl5S
	 aXQRQ7GD3bmEkC4GWFPNHggCHnAEo0twkcFNSgVkspfldlx3NXTrG5JdCMi6zS0C9A
	 EFRxOFvP9SOPA==
Message-ID: <9cc2066a-3e0c-4171-8dab-47b80888bc55@kernel.org>
Date: Thu, 19 Nov 2026 12:53:59 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Docs/mm: fix stale split page table lock references
To: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Qi Zheng <qi.zheng@linux.dev>
References: <32FBD023F945BCCE+20261119074854.252609-1-zhaozhengzhuo@uniontech.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <32FBD023F945BCCE+20261119074854.252609-1-zhaozhengzhuo@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/26 08:48, zhaozhengzhuo wrote:
> The USE_SPLIT_PTE_PTLOCKS and USE_SPLIT_PMD_PTLOCKS macros were turned
> into Kconfig options, and CONFIG_SPLIT_PTLOCK_CPUS was replaced, but two
> Documentation/mm files still refer to the old names.
> 
> Update both references.
> 
> Fixes: 394290cba966 ("mm: turn USE_SPLIT_PTE_PTLOCKS / USE_SPLIT_PTE_PTLOCKS into Kconfig options")
> Signed-off-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
> ---
>  Documentation/mm/process_addrs.rst         | 2 +-
>  Documentation/mm/split_page_table_lock.rst | 8 +++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
> index 04b649818cc1..0b6355e6d1d5 100644
> --- a/Documentation/mm/process_addrs.rst
> +++ b/Documentation/mm/process_addrs.rst
> @@ -659,7 +659,7 @@ acquired in :c:func:`!__p4d_alloc`, :c:func:`!__pud_alloc` and
>     references the :c:member:`!mm->page_table_lock`.
>  
>  Allocating a PTE will either use the :c:member:`!mm->page_table_lock` or, if
> -:c:macro:`!USE_SPLIT_PMD_PTLOCKS` is defined, a lock embedded in the PMD
> +:c:macro:`!CONFIG_SPLIT_PMD_PTLOCKS` is enabled, a lock embedded in the PMD
>  physical page metadata in the form of a :c:struct:`!struct ptdesc`, acquired by
>  :c:func:`!pmd_ptdesc` called from :c:func:`!pmd_lock` and ultimately
>  :c:func:`!__pte_alloc`.
> diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
> index cc3cd46abd1b..ce7908bebce9 100644
> --- a/Documentation/mm/split_page_table_lock.rst
> +++ b/Documentation/mm/split_page_table_lock.rst
> @@ -37,9 +37,11 @@ There are helpers to lock/unlock a table and other accessor functions:
>   - pmd_lockptr()
>  	returns pointer to PMD table lock;
>  
> -Split page table lock for PTE tables is enabled compile-time if
> -CONFIG_SPLIT_PTLOCK_CPUS (usually 4) is less or equal to NR_CPUS.
> -If split lock is disabled, all tables are guarded by mm->page_table_lock.
> +Split page table lock for PTE tables is enabled at compile time when
> +CONFIG_SPLIT_PTE_PTLOCKS is enabled.  This option requires CONFIG_MMU and
> +CONFIG_SMP, with CONFIG_NR_CPUS set to at least 4 (see mm/Kconfig for
> +architecture-specific restrictions).  If split lock is disabled, all
> +tables are guarded by mm->page_table_lock.

Instead of having information that becomes outdated, can we just refer to the
Kconfig file?


-- 
Cheers,

David
