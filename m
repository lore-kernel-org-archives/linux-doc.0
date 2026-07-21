Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5FC481252;
	Tue, 21 Jul 2026 12:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784635330; cv=none; b=AyL6QqiV/s2cW1HoxCgOGCh0k6160PhHBFK6CWfQfAqBWIGLnCRc1sWNqVWrG7jnaw1zhmVx20mvgXZr9kiJuBNigrTel5mp7ep+2CjcvDdljZywBU5Jraoru37lDeqAQR5jj3iOv2qcs3F7heI+JgeVmYpM+cS7opx7jjNzR8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784635330; c=relaxed/simple;
	bh=sBaeMNl8DRRRw35CQmdQeyJQlQB3/6fRgqV1TpMbiRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frhVfCzAHkMYxrkVJkl09u0rHJ1s9kmZnll4mt7SQKqndyEgzczfptSnO8kVQ3wShrA5tYyJkLShKmVuLLriHaZnqRCy0mwJojQ8BB+Eb+82axQh5jK2jcCE0SJcHow55Uk/BGbpgf30xeNAkxdW9K+P+LQ5C4ncNCOEN7/3UKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1+rN0wU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1+rN0wU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155C21F000E9;
	Tue, 21 Jul 2026 12:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784635329;
	bh=PWQwVOyC4A942UEorwwKgtEDycHHifMWAlNig7s4ClM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F1+rN0wUrIXL9MXn3HHNV9d242TQOMQ0NHQec6idQplYCrDsVhGGwHp86X5FtMDhB
	 RObxrd7QdZ4ZmULURuFaPBplBR9HtE0M11tCu7LYvvXU9WSNvte8aobhrmMHqqnSX5
	 zv+xQ2G7xIDZ/Yd1dJBWwhMnkqnrEqx9ybjXdePzpuMPG27886bzmKpuAAqjqtKMqS
	 Bar1atYjA5UAG27GzX3AtVShWyRzMpKt9PWECVaReKQ2mydzVRkQlTO3JfZOY73UQ5
	 J9zqPKSDmRsQtHeOEOM7O+7K1VmwzRqkCJ4JUBZ/2hQ/jq6c64MkPhWhmFniu6/8lt
	 S5twIP26gm60g==
Date: Tue, 21 Jul 2026 13:01:51 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	corbet@lwn.net, skhan@linuxfoundation.org
Subject: Re: [PATCH] docs/mm: Physical Memory: remove deferred_split_queue
Message-ID: <al9fmePMPbxj8ffX@lucifer>
References: <20260721111919.22923-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721111919.22923-1-zenghui.yu@linux.dev>

On Tue, Jul 21, 2026 at 07:19:19PM +0800, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
>
> deferred_split_queue was removed from struct pglist_data {} in commit
> fafaeceb89a5 ("mm: switch deferred split shrinker to list_lru").  Remove
> its description in doc as well.
>
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

LGTM so

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  Documentation/mm/physical_memory.rst | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/Documentation/mm/physical_memory.rst b/Documentation/mm/physical_memory.rst
> index b76183545e5b..a09407d72973 100644
> --- a/Documentation/mm/physical_memory.rst
> +++ b/Documentation/mm/physical_memory.rst
> @@ -262,9 +262,6 @@ General
>    PFN that needs to be initialized. Defined only when
>    ``CONFIG_DEFERRED_STRUCT_PAGE_INIT`` is enabled
>
> -``deferred_split_queue``
> -  Per-node queue of huge pages that their split was deferred. Defined only when ``CONFIG_TRANSPARENT_HUGEPAGE`` is enabled.
> -
>  ``__lruvec``
>    Per-node lruvec holding LRU lists and related parameters. Used only when
>    memory cgroups are disabled. It should not be accessed directly, use
> --
> 2.53.0
>

Cheers, Lorenzo
