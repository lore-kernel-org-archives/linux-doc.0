Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF392356CB
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 23:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754953875; cv=none; b=VgYpeKBM+oY2nuk9NwWk3o0/U6ikxul/nvZW00uDI7xxcXSh7p4CVIfqYuwBZGcvcydr2s6G5ndNr43RBScrXEyHoSmKJcneFO7wMuiQlDnIZsaz6YwXUoYRHAjlhCL1crQLkbOK1XM9fjuAsbER6Pj/ffLd1tzY3QmlmmatN0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754953875; c=relaxed/simple;
	bh=XlKWe7hGY5MiFreFuz3bf4pAkpABAV4Hc9Q8DzXwtQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCRB46L/2AoRZLXnq/fx5CKNqcbe8ML9HM129ceQedIbw6Q+WPdqFaHVej4TBwwQdHbOflYZJWwzALDdiJ0Kx0rCXMIj+6dlhIfSfIUjwwvl9240PdfAGm3KMyoL0DLFMiSyP6tMJz6rVTsiu3D4wDjk48c3GDZ/SZ0Wupj9D3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YSHJWR2A; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YSHJWR2A"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-242d1e9c6b4so89645ad.0
        for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 16:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754953873; x=1755558673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t1oV7yVKsQ5TCnNZCaQ3AZrRbIoYDq2nQJuy1DeTjIQ=;
        b=YSHJWR2Ak4gKSANGEL3Fqc1ZINt5iFRbA0zVKdnvL0nnrT5J7nx5tQuwEy6fGH1kka
         UcFrLsH6sQOhTkcUt2VHNlaRXkU9eJ1/6gEJexK7A+fBYC5SgmkTbhrR4MBcBoVvyoOu
         xAe7SjKWG6czv3spPAy4dOGwTs0FNxeCXIHWTScr7tItz/DAOpZJXqBfzWYHSHstTI8c
         sF/Y7AffUIuqhEjogcjUewGZ1DURn34f9y3fS9Ai3O6go+qe4mZCoqKRayKPNgF97GcI
         FZw/9GQTxy6T4Hn/S2l4EXMEaSdGc9j7admfGv6LthS+q7Ah1vmimLLWSXXFhPK5yOpN
         RlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754953873; x=1755558673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1oV7yVKsQ5TCnNZCaQ3AZrRbIoYDq2nQJuy1DeTjIQ=;
        b=VEHvaxPpUgXhriSYj3zstQSnph4dEMQOizTeltf/wI+yhq9Jc2Y0oEIcfR0j4UqVgq
         +yp7Ge2uX7uH/DaZ5WcouBXSsKVjbPvhC39ddz4gyl/k1SxCIMglH+tE/w8lMOhu+b9w
         CgoZ4pk/DIkpWADXfsH0irMCEHcC2cwCQeCV3CJdxzTfVDr4RgTxvsiYpSuGfjGsNI6K
         R8v7dgLNWrQztnQmpLZaMqcunxfj+qJoCzw0llzo0A6SbkGE/7uojT6h1iiiz7hl0Vq2
         QzW9Og7FHUbQD6afj3J45ffzImKa+3qAFT8yHDIyqAhhM8Hh1wuk+WuCoxhOtqRZ1S93
         d+YA==
X-Forwarded-Encrypted: i=1; AJvYcCVFkC6rD6rX52/3Q2yJh3MUQqr6pAMN0NVim6WADwP6Z80w1qsN/hxWrE4Xp3x/V1KybL8xWV4KFXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyitkNYknimc2wSoA3Ug9D2mQKzqmwSKBZAdFFC0OPAepr8dWfo
	lYYb8WqRDOKvBiWZzGWI1OLXjN1NrDhiLAJXbWj99YKY2Y54282LpYirI1OX7WXrvw==
X-Gm-Gg: ASbGncsmAvwSkWzx9D9qv8BcNuqBfBM21OeuXYBIMT16QX45kX0so78Q/rbiayDhWnq
	yIwm+tJRngKqrhMsd+/Zx37LnWTYwVIRdeR3I1szkdR8VyyKxbEHkwH8kv2UC5JoOOQNyGf+GoZ
	B/Nb7yY0oQqNxxXSm7q+wqjuAuw+Bx7RhbLFZaG9EXe4aTLZnI3MOucK/clc6b+rdD/XyDWjKPl
	CGk5ip1xNqZgBqBUVY5w0uSspqxmvDwZYla1CwraM6LpD9LxnOyNP/JyvAAceC2ZLbSGvgf+lvd
	ZAnUxFGs6wD3LpAvor86VDviIsS1djKK3A3VUe0fKf887XI6t3CnZaCxYhgd4BZnWP7Uu05Jg66
	9dFJJCDOhYcsH8itvQwhlAFD/XpzPOB3ZcnJMVLsRwovaNg9bzVukPvGmutOHW+AukCVxrQ==
X-Google-Smtp-Source: AGHT+IFzyKR/w1E27eWm6IovhDIP1SONsBPcExVJWFEliFhx+rfqf71Fi48caAfu36gGEzgxJL2HPA==
X-Received: by 2002:a17:903:41c5:b0:240:520b:3cbc with SMTP id d9443c01a7336-242fd3660c2mr1826635ad.14.1754953872909;
        Mon, 11 Aug 2025 16:11:12 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccead450sm27859139b3a.54.2025.08.11.16.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 16:11:12 -0700 (PDT)
Date: Mon, 11 Aug 2025 16:11:07 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com,
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com,
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com,
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org,
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr,
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com,
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com,
	vincent.guittot@linaro.org, hannes@cmpxchg.org,
	dan.j.williams@intel.com, david@redhat.com,
	joel.granados@kernel.org, rostedt@goodmis.org,
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn,
	linux@weissschuh.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org,
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com,
	myungjoo.ham@samsung.com, yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com, ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de,
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com,
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net,
	brauner@kernel.org, linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, saeedm@nvidia.com,
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com,
	leonro@nvidia.com, witu@nvidia.com
Subject: Re: [PATCH v3 26/30] mm: shmem: use SHMEM_F_* flags instead of VM_*
 flags
Message-ID: <20250811231107.GA2328988.vipinsh@google.com>
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <20250807014442.3829950-27-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807014442.3829950-27-pasha.tatashin@soleen.com>

On 2025-08-07 01:44:32, Pasha Tatashin wrote:
> From: Pratyush Yadav <ptyadav@amazon.de>
> @@ -3123,7 +3123,9 @@ static struct inode *__shmem_get_inode(struct mnt_idmap *idmap,
>  	spin_lock_init(&info->lock);
>  	atomic_set(&info->stop_eviction, 0);
>  	info->seals = F_SEAL_SEAL;
> -	info->flags = flags & VM_NORESERVE;
> +	info->flags = 0;

This is not needed as the 'info' is being set to 0 just above
spin_lock_init.

> +	if (flags & VM_NORESERVE)
> +		info->flags |= SHMEM_F_NORESERVE;

As info->flags will be 0, this can be just direct assignment '='.

>  	info->i_crtime = inode_get_mtime(inode);
>  	info->fsflags = (dir == NULL) ? 0 :
>  		SHMEM_I(dir)->fsflags & SHMEM_FL_INHERITED;
> @@ -5862,8 +5864,10 @@ static inline struct inode *shmem_get_inode(struct mnt_idmap *idmap,
>  /* common code */
>  
>  static struct file *__shmem_file_setup(struct vfsmount *mnt, const char *name,
> -			loff_t size, unsigned long flags, unsigned int i_flags)
> +				       loff_t size, unsigned long vm_flags,
> +				       unsigned int i_flags)

Nit: Might be just my editor, but this alignment seems off.

>  {
> +	unsigned long flags = (vm_flags & VM_NORESERVE) ? SHMEM_F_NORESERVE : 0;
>  	struct inode *inode;
>  	struct file *res;
>  
> @@ -5880,7 +5884,7 @@ static struct file *__shmem_file_setup(struct vfsmount *mnt, const char *name,
>  		return ERR_PTR(-ENOMEM);
>  
>  	inode = shmem_get_inode(&nop_mnt_idmap, mnt->mnt_sb, NULL,
> -				S_IFREG | S_IRWXUGO, 0, flags);
> +				S_IFREG | S_IRWXUGO, 0, vm_flags);
>  	if (IS_ERR(inode)) {
>  		shmem_unacct_size(flags, size);
>  		return ERR_CAST(inode);
> -- 
> 2.50.1.565.gc32cd1483b-goog
> 
