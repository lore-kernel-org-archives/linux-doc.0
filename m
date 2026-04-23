Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FA83EAC76
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 11:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945361; cv=none; b=ivW8kxd9e2sDd/+keqHVCMVMVr0kPHurjaiHJqzoO8PV+VOj3MyYM//Igpi0Sowp24k6DrU8cL2RGUzx5oU4Gemd1uU52DJquqL9zSQs0BFLOjswsePfjTymZfTFIOUpkFioqTWdud9FTNvD+/RdZ5Ox1qABawaPWKd2I8Kq2+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945361; c=relaxed/simple;
	bh=JF9irIFagLPIK1lfqZ6vDtG1xKITRFwUL8zyZE4043I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JE158rGjoMWufjwmZ/mnkedzQJLe8E4ssycsS2dSwFDFlukiJbsWCWfxPA+6yj7XfII2JrMXKNQhzejGuRZnafBEHWs9LlSCILawN3E4kOKnmTF1O4DRAQ+r07Iip5DqAVnVhdtxKQ6h8PwVIFGLco20+Zsmu1wDCH7SwSZb/1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QWaYamuq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QWaYamuq"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891b0786beso39942705e9.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 04:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776945359; x=1777550159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=siDGmpSQgWAHKUux8b13NOof/DcmZ5a9QBx3K/qFpTk=;
        b=QWaYamuqEnqMW3a8OyZOVXP/SUaPNAtm4OUUS4By/i+7TdLqG+rXEb1HYtcrEt0otQ
         8LSOxL2fb5LXSdv03gQAXxYCdRoNVujvnt2tykoUQAei4ke7XPOmsudyPhdrs6kmFK0s
         FLIIi5Z/GoXrB4VjT+vyJQBBxrFcGmOxU/FCjhDDcZdkIVGgoswOlsdu4xjSl7yBLfIh
         5GrMQUlDdN+n1S7TQuzbEQ1ig0QBRc20OCEXS1vaOa8yNYuVrlHOY1Q7d5q3aM6/PJLP
         LOa8qsacFtWJFj9Ny2M6iXtVfaZqcnnRZJVDw3Yz+flANytPzsYKRAqpXRTUZjVEklQk
         K7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776945359; x=1777550159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siDGmpSQgWAHKUux8b13NOof/DcmZ5a9QBx3K/qFpTk=;
        b=N++2PA/WuVKE89aCDvP0QfqFFhCPqItbAld4yqWndSbXYc+++AaZ8k2t/OopZU4NtE
         xBDAXeZkrf+SIxBSa+ww71BBqwdhE7owBYHb9T26sLgPE9WMcbqdW3eA5qjSG/3dfpAz
         KmOBesCvliNxSCqgk6bAJisYsAf/FKUYF1ZA/2+SIeAAcB1mXxuW0hZLBMaCliTIo4EP
         uW05rGg0njAo4Z0FFxJ+EupS0puUCSJUhv/fLVA8Ju+ehR++WSgRWPlQsk3uo4XT4S2w
         b9Yu//vBCgsW/203PXL1aYsGXa5hsF/SDa+SArjPAJG1S93+2ugpq5Rw/8d2QgeRANEa
         AXzg==
X-Gm-Message-State: AOJu0YwBNABUOqtm8jvOJbAmqfwBrNyVB5kFKclcdJDuAmjiTeow7scY
	Bmud/HpVprT4duoZWXRXWXIsObEuL5h4tuN0+n+VwEAkGm5eaudTaOqICek+N263T5U=
X-Gm-Gg: AeBDiesPWWbGQAVlW6SEmFdwkH0TSCPDAy/dIJFWy50GHOBE4XkM/yq5V08+rtFe5oV
	PCD5xjzHFXQOZUGGzk1b/YLGHqH4N3ZlXsjjdsFEo0MKI6M5Sk+9jr4bIFyHnf80Obzj75uK/Cw
	kOKE+tF8IxwxH3zfbSrUERIGLgko96yRwrfLHJ5V1YGLW8YROk9Ak2oyDAdsmh79l/3+Cdcp4h3
	XLaPOHtGCIMZI115VmuHr4SiEI3ghXKH9ZsbhzCD4b3WuIfUHOuHPvYpBmt8HsCMytTJnXTEsaH
	id3eU8eXNQ7Qd2W9JbaB1W68GjOUm5XWfWH0VAhPH+Nxnd9IW5ZxnsSVTWZFZeS5ZGQzo+Uzu4b
	FfEFXLLG1+IIBB5PHgT0WewJYG0RwZZa+cjeG5R47nD2sC2uN1EksmgbyNrcFa16dyNExFAFImF
	uowAzQVlnDlad84pGWmVq//XXZ3DLFQvBZ2LmTxXjTp2p44oM=
X-Received: by 2002:a05:600c:a10e:b0:485:3b9e:caa7 with SMTP id 5b1f17b1804b1-488fb773f38mr287588885e9.23.1776945358704;
        Thu, 23 Apr 2026 04:55:58 -0700 (PDT)
Received: from localhost (109-81-17-171.rct.o2.cz. [109.81.17.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e591cesm71273809f8f.36.2026.04.23.04.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 04:55:58 -0700 (PDT)
Date: Thu, 23 Apr 2026 13:55:57 +0200
From: Michal Hocko <mhocko@suse.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Matthew Wilcox <willy@infradead.org>, Harry Yoo <harry@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: clarify that we are not looking for LLM
 generated content
Message-ID: <aeoIzYSnJK8YeZEb@tiehlicka>
References: <20260420-llmdoc-v1-1-47d2091177c4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-llmdoc-v1-1-47d2091177c4@kernel.org>

On Mon 20-04-26 23:03:16, David Hildenbrand wrote:
> Let's make it clear that we are not looking for LLM generated content
> from contributors not familiar with the details of MM, as it shifts the
> real work onto reviewers.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!

> ---
>  Documentation/mm/index.rst | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
> index 7aa2a8886908..13a79f5d092c 100644
> --- a/Documentation/mm/index.rst
> +++ b/Documentation/mm/index.rst
> @@ -7,6 +7,19 @@ of Linux.  If you are looking for advice on simply allocating memory,
>  see the :ref:`memory_allocation`.  For controlling and tuning guides,
>  see the :doc:`admin guide <../admin-guide/mm/index>`.
>  
> +.. note::
> +
> +  Unfortunately, parts of this guide are still incomplete or missing.
> +  While we appreciate contributions, documentation in this area is hard
> +  to get right and requires a lot of attention to detail.  New contributors
> +  should reach out to the relevant maintainers early.
> +
> +  This guide is expected to reflect reality, which requires contributors
> +  to have a detailed understanding.  Documentation generated with LLMs
> +  by contributors unfamiliar with these details shifts the real work onto
> +  reviewers, which is why such contributions will be rejected without
> +  further comment.
> +
>  .. toctree::
>     :maxdepth: 1
>  
> 
> ---
> base-commit: da6b5aae84beb0917ecb0c9fbc71169d145397ff
> change-id: 20260420-llmdoc-21bf5fadbd6f
> 
> Best regards,
> -- 
> David Hildenbrand (Arm) <david@kernel.org>

-- 
Michal Hocko
SUSE Labs
