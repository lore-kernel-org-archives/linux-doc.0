Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBD52571A9
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 02:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781145449; cv=none; b=taF0I9RFE6+hQJt0eX/BAyhOzCks8Jb6/6QMJblTHBCEcf4utRLh3U+82OuPxTamPqFIOkA5Zc8EGd5MSpx8XDomVkoKG5uLPdzvUE7rRK30IkFDVBYR+lu7Rs4ogy0jgTwFoUsxOSG0qxlWD0ife4paaLmKERKupL+aZWwfDRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781145449; c=relaxed/simple;
	bh=pIl+oGKJRW23Bb624XpDBUTR94UYRZy4fTNQdceZJT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T71RG8N/P1uT9PdE2yXpV9hRoo8p8XSyhD+v1yVFjxiM+xbkJmY1DbpUAe1hSZNVsqOpzDfRdkf1qOSo6GZ5BsNg2emazv30R2/jrdkr5TktQkZ5sWdMzdBnShn/zUog92rS8CqyxObzLebHXefB+ZCACiUPvLS80mt+FQUKlFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=xl3eHsWu; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="xl3eHsWu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=k07kbwRe+IR+jWJJhnZwkgFUSqgCb4sP6kwXFBFu7qE=; b=xl3eHsWuALYuaq07L38ZH1MZ5v
	S/Cv69TMn+FwaMZnr/dnnhVYM/89foS0KQ59WgyCSUG4SljRRfBIjx5I1zccwu7Kt/qJ1nIDOEIh3
	N234xHjXObWOioxZeQW881SFJvN686mx5e849DP4FLK30sVKoFB8lCoCM2yHyRHU5/8f49c+yWzqO
	lAezcSiFr9Y5I2xxc0fvoodcdnv0Q3G+8RgUo0Czv5GQ7uoeRkTmOJQe7gOfHYHQm0XlsYLFxr381
	jFbh1Kd+syD7s4PG2ffhPUEXwu9SM28ApOw7XTqcKIiF3n3AVJrG93CTmPjEIBAdtlYG5vaqGoREi
	X3VQG59Q==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXVIH-00000008a2e-0mdD;
	Thu, 11 Jun 2026 02:37:21 +0000
Message-ID: <e030cfac-7f01-4b8e-9cb4-c76a24009315@infradead.org>
Date: Wed, 10 Jun 2026 19:37:20 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/{it_it,sp_SP,zh_CN,zh_TW}: update references to
 removed CONFIG_DEBUG_SLAB
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Avadhut Naik <avadhut.naik@amd.com>,
 Dongliang Mu <dzm91@hust.edu.cn>, linux-doc@vger.kernel.org
Cc: Federico Vaga <federico.vaga@vaga.pv.it>, Jonathan Corbet
 <corbet@lwn.net>, Carlos Bilbao <carlos.bilbao@kernel.org>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Hu Haowen <2023002089@link.tyut.edu.cn>
References: <20260611010014.412841-1-enelsonmoore@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260611010014.412841-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/10/26 6:00 PM, Ethan Nelson-Moore wrote:
> CONFIG_DEBUG_SLAB was removed in commit 2a19be61a651 ("mm/slab: remove
> CONFIG_SLAB from all Kconfig and Makefile"), but references to it
> remained in documentation. The English documentation was updated to
> refer to CONFIG_SLUB_DEBUG in commit 5969fbf30274 ("docs:
> submit-checklist: structure by category"), but these translations were
> never similarly updated. Update them.
> 
> Discovered while searching for CONFIG_* symbols referenced in the
> kernel but not defined in any Kconfig file.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/translations/it_IT/process/submit-checklist.rst | 2 +-
>  Documentation/translations/sp_SP/process/submit-checklist.rst | 2 +-
>  Documentation/translations/zh_CN/process/submit-checklist.rst | 2 +-
>  Documentation/translations/zh_TW/process/submit-checklist.rst | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/translations/it_IT/process/submit-checklist.rst b/Documentation/translations/it_IT/process/submit-checklist.rst
> index 5bf1b4adebc1..c58d773fd297 100644
> --- a/Documentation/translations/it_IT/process/submit-checklist.rst
> +++ b/Documentation/translations/it_IT/process/submit-checklist.rst
> @@ -122,7 +122,7 @@ Verificate il vostro codice
>  
>  1) La patch è stata verificata con le seguenti opzioni abilitate
>     contemporaneamente: ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
> -   ``CONFIG_DEBUG_SLAB``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
> +   ``CONFIG_SLUB_DEBUG``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
>     ``CONFIG_DEBUG_SPINLOCK``, ``CONFIG_DEBUG_ATOMIC_SLEEP``,
>     ``CONFIG_PROVE_RCU`` e ``CONFIG_DEBUG_OBJECTS_RCU_HEAD``.
>  
> diff --git a/Documentation/translations/sp_SP/process/submit-checklist.rst b/Documentation/translations/sp_SP/process/submit-checklist.rst
> index e7107cc97001..aedf55eb3b80 100644
> --- a/Documentation/translations/sp_SP/process/submit-checklist.rst
> +++ b/Documentation/translations/sp_SP/process/submit-checklist.rst
> @@ -76,7 +76,7 @@ y en otros lugares con respecto al envío de parches del kernel de Linux.
>      cualquier problema.
>  
>  12) Ha sido probado con ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
> -    ``CONFIG_DEBUG_SLAB``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
> +    ``CONFIG_SLUB_DEBUG``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
>      ``CONFIG_DEBUG_SPINLOCK``, ``CONFIG_DEBUG_ATOMIC_SLEEP``
>      ``CONFIG_PROVE_RCU`` y ``CONFIG_DEBUG_OBJECTS_RCU_HEAD`` todos
>      habilitados simultáneamente.
> diff --git a/Documentation/translations/zh_CN/process/submit-checklist.rst b/Documentation/translations/zh_CN/process/submit-checklist.rst
> index 0e524f1c1af5..18411b426122 100644
> --- a/Documentation/translations/zh_CN/process/submit-checklist.rst
> +++ b/Documentation/translations/zh_CN/process/submit-checklist.rst
> @@ -65,7 +65,7 @@ Linux内核补丁提交检查单
>      :ref:`kernel-doc <kernel_doc_zh>` 并修复任何问题。
>  
>  12) 通过以下选项同时启用的测试： ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
> -    ``CONFIG_DEBUG_SLAB``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
> +    ``CONFIG_SLUB_DEBUG``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
>      ``CONFIG_DEBUG_SPINLOCK``, ``CONFIG_DEBUG_ATOMIC_SLEEP``,
>      ``CONFIG_PROVE_RCU`` 和 ``CONFIG_DEBUG_OBJECTS_RCU_HEAD`` 。
>  
> diff --git a/Documentation/translations/zh_TW/process/submit-checklist.rst b/Documentation/translations/zh_TW/process/submit-checklist.rst
> index a0cb91a6945f..06aa635a659c 100644
> --- a/Documentation/translations/zh_TW/process/submit-checklist.rst
> +++ b/Documentation/translations/zh_TW/process/submit-checklist.rst
> @@ -68,7 +68,7 @@ Linux內核補丁提交檢查單
>      :ref:`kernel-doc <kernel_doc_zh>` 並修復任何問題。
>  
>  12) 通過以下選項同時啓用的測試： ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
> -    ``CONFIG_DEBUG_SLAB``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
> +    ``CONFIG_SLUB_DEBUG``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
>      ``CONFIG_DEBUG_SPINLOCK``, ``CONFIG_DEBUG_ATOMIC_SLEEP``,
>      ``CONFIG_PROVE_RCU`` 和 ``CONFIG_DEBUG_OBJECTS_RCU_HEAD`` 。
>  

-- 
~Randy
