Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD8D1798F;
	Wed, 15 Jan 2025 02:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736908030; cv=none; b=mN1pBs6gJFSQurw8rmmujwB4xOWIt5i77d09VWaMHPYuatdC40dVJRhbyocr3NbAUFWNcKBIFGaKUBokoEsr5ls/U6t5nCXeakrviEs0PeFMe0pxHyd7Vleaimb8NmRX6gThKxtL87Dhq0szLqVSYfXc95tt/gg0sFbtifbN0Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736908030; c=relaxed/simple;
	bh=ThDH9uQF935yvwjPIugcuKvu3+yuRQ2UUkPp1LdvuAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKp+8ZzJDz8pBpER8n9YNi1EiRFGefzjrlso+C2jAy9v48q5KPXv/CoCodbdaKbvzbB5GiAA6Cay6pd0YMzu9vyDOju0vNUNHWjuDjPGUdqb1qZ7kMKRmjezVNzi5h4oXYYUFEj29zA8Tj7yKR2ajfyHw7CIAw2lQW8lj8KGY/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMncvuOy; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMncvuOy"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d9837f201aso727819a12.0;
        Tue, 14 Jan 2025 18:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736908027; x=1737512827; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cft0FFnxbXaKCYduOTSHaxekyaoRv/tqmxl3MTYv73s=;
        b=AMncvuOyQyYH7OvvQav9CVg2yrp6Qw9rnsf2pWRXwpOCFUjvoyQStoFJvaX0AaygUh
         pPYn9VmL5vVv9fy/oyTsdznAbR5dZ/DSoZWFNbOsy4RoIaNe258gH06HhD/gID3qtlAP
         hDPKv69IBNdWtmvvYXrYbUkrl9I/lPTjzaWOw3HR7cUePlLgcn35nXYItRT6TxMEIJ+X
         ISk6k+9omSZTEsPSEBhVyklnwFyL+oSp54rilfMDsigKwpP6I9QiLxc/FP3sr7m8F8q/
         dSJcit+5MXibx8QN67lgbWIjWRB6Z6HOAeIBjR3KHw10mBOjHATl5PsQoRKGhnW3HjNn
         PpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736908027; x=1737512827;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cft0FFnxbXaKCYduOTSHaxekyaoRv/tqmxl3MTYv73s=;
        b=QAkHhpsgPvYQN0F9R2GsdYzEc5W0r0s/7rRiBOKGqvu/yXPNOxH3k57YH8GwNi3iGu
         riVm4NKj/NZ0OtcXtUmPUgWKOPX937MkQL9cvgoaklgYCA263ezActf1B1R/aHoTqVeN
         Fh1IYBUdXlwFLbP1ejrnvCO2zEApIxopBKZHKDv6ZDBRCiLab3oRYnMoebrHkseWr0lJ
         9KS6LyA+IWJLOKIPt1aAzN3IaqadYIdO8lFTeiq2jAyL0cJgR8bkQPrtbHvjrARb6vbN
         rmEZ+7TBTlLupNlDubblt/k4dagwUsrrofyfDa4YhZVTRzp4TrOaQlD7ezz+wCnZNw/B
         leqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPwRCfYQYgOmZ6sMnWwG+EcTwP/shMx/Zr6+dsBrV8Q4scIrtN3/5n+bNQMiUgyYiToiMvjchz2TglROSU@vger.kernel.org, AJvYcCVPCwdke7JR18KeGxN8r9eJoaXKzonpD2susyKMPAb9BHdfBK/uLMGWnJwYsN+u5kxBu+zK8C53oqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjMdSmk3E1qoaTw8xhZXk2yAMz/yfAxEBE2dlX51fheBWpm9Ob
	dzt1x6MEbFOJ04uKHKGTXYa7HQqZNsoIKz+4XZf0nVyO+5vLjSAi
X-Gm-Gg: ASbGncukbT4iVWqhRFsKtZ9KkV4DHmuwBoLMGek+HvuGaUsBFqao5VFS7JphysBCxhH
	quKoZjDh29mlCte8HkJWpWRK6GaYUafhqrULCjywcWfJs2wXHbZOu1Y1Z9nWzuDo3WieGWlinOI
	8pHXmYOdMrQOpBBRKTadX9QJ0yiVkh4sAfWqbDa6A07nN3ImXGFyv0IHUu1iU1GXMZ/le0+w4Qx
	IkkjRllSkpZfr2WgDzMpWC4csbxln/3d4TgQ1TEdIJq3GbSNqmKM/dk
X-Google-Smtp-Source: AGHT+IEXyK5JsIG/REt2LqHjIyVyNodxD/Vbd8MXSPX+u0YWKZ4KISrSFVqciHOWz/+J8reVSqyBoQ==
X-Received: by 2002:a05:6402:27cf:b0:5d0:ece3:158a with SMTP id 4fb4d7f45d1cf-5da0bac2db9mr987630a12.3.1736908026651;
        Tue, 14 Jan 2025 18:27:06 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5da0aec6e7asm421301a12.33.2025.01.14.18.27.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2025 18:27:04 -0800 (PST)
Date: Wed, 15 Jan 2025 02:27:03 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com,
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com,
	richard.weiyang@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 16/17] mm: make vma cache SLAB_TYPESAFE_BY_RCU
Message-ID: <20250115022703.hqbqdqawvqgrfgxb@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-17-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-17-surenb@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Fri, Jan 10, 2025 at 08:26:03PM -0800, Suren Baghdasaryan wrote:

>diff --git a/kernel/fork.c b/kernel/fork.c
>index 9d9275783cf8..151b40627c14 100644
>--- a/kernel/fork.c
>+++ b/kernel/fork.c
>@@ -449,6 +449,42 @@ struct vm_area_struct *vm_area_alloc(struct mm_struct *mm)
> 	return vma;
> }
> 
>+static void vm_area_init_from(const struct vm_area_struct *src,
>+			      struct vm_area_struct *dest)
>+{
>+	dest->vm_mm = src->vm_mm;
>+	dest->vm_ops = src->vm_ops;
>+	dest->vm_start = src->vm_start;
>+	dest->vm_end = src->vm_end;
>+	dest->anon_vma = src->anon_vma;
>+	dest->vm_pgoff = src->vm_pgoff;
>+	dest->vm_file = src->vm_file;
>+	dest->vm_private_data = src->vm_private_data;
>+	vm_flags_init(dest, src->vm_flags);
>+	memcpy(&dest->vm_page_prot, &src->vm_page_prot,
>+	       sizeof(dest->vm_page_prot));
>+	/*
>+	 * src->shared.rb may be modified concurrently when called from
>+	 * dup_mmap(), but the clone will reinitialize it.
>+	 */
>+	data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->shared)));
>+	memcpy(&dest->vm_userfaultfd_ctx, &src->vm_userfaultfd_ctx,
>+	       sizeof(dest->vm_userfaultfd_ctx));
>+#ifdef CONFIG_ANON_VMA_NAME
>+	dest->anon_name = src->anon_name;
>+#endif
>+#ifdef CONFIG_SWAP
>+	memcpy(&dest->swap_readahead_info, &src->swap_readahead_info,
>+	       sizeof(dest->swap_readahead_info));
>+#endif
>+#ifndef CONFIG_MMU
>+	dest->vm_region = src->vm_region;
>+#endif
>+#ifdef CONFIG_NUMA
>+	dest->vm_policy = src->vm_policy;
>+#endif
>+}

Would this be difficult to maintain? We should make sure not miss or overwrite
anything.

-- 
Wei Yang
Help you, Help me
