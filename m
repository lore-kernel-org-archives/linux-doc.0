Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD26F4315A;
	Mon, 13 Jan 2025 02:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736735882; cv=none; b=p4PYc/5SeGxLp2eCC7Q2Q1UM9U8XJX5Wbr16+x4Rm77egIMNFAw4jvjRLpHI25kKnWAVUxer94gb/dKF9Ddv1g+GuevTzSK8MrI4R+0XLiiTDgczSwan+jtVkZ0NBK9pjgzaa14bVYxTx+5k9QFz9GbZq+Xkyf66REE4H8uZ+bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736735882; c=relaxed/simple;
	bh=ute81Tr9CZiZHFaeyFfNUYf8KWwYKmQPe+yFnZHSCBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDn0g0sumKpvjTmfdL6o/Hv28S60ec4Ow54QooD5WiqmYAyE/u+0q+xIt4JR7DiEfgtkDpLWGxSJ28geQtddDUMznnpZKUKE/B/EFbxWYXSZZobIfGi8nekJBWLGL0cmdAIil6YMjuStp0fzBSbTIBrGjtnkdL5w+YcFA3L7kmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljKBPHt2; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljKBPHt2"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab2bb0822a4so794061066b.3;
        Sun, 12 Jan 2025 18:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736735879; x=1737340679; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFa4UFnZYVUF29EjZIMNFsD2rSpOiFnUOuvrl5CUGCg=;
        b=ljKBPHt2+eRptiShjxqExCrclKM1zHUbc82aUYZQjlvFbm+6j/wWW0j8TJE3AMFnVP
         4Rlu8UvGNAefiLuj+47em0oDkNLnwruVAl6qHpoSWQHdee4+x8DnsYHqVcI7Q+4/jPfh
         oVsn6mRwtcgSRHGFy02N7NcRbOx+72XYv41T1EIB948Cu5PSKTTpYxkFgNLGm0QqC8ws
         t512bqUDp0SOo9neTSzgsBhWCJX1kmCNog905+RsuQ5dgS5lrzkKU6CgCCj6pIz2+Zme
         PSsNcv2FVO9zlzaQZwvcRRiloOEDsuG0WxNyduSS0HY3zcuvVNwXkPhsZgRl8nEYW/yB
         STDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736735879; x=1737340679;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KFa4UFnZYVUF29EjZIMNFsD2rSpOiFnUOuvrl5CUGCg=;
        b=rmn1ajqssqnPIBj49j+6jDCGL/nMfyABeJu7b4ZeCvHLmUfz7lViNsQVRWqFhaXSoh
         Cq99E9hKHbS1seIJEL9tmS2KyNgD+VOrMakQEPZ/2cSq5pb4Fj4nNLYuBOdfUzAiJZqn
         6/f24rjoP6axp7BlPiID6TGaKKOJ/z4r9M3VuJP49dMkXo6vZMg+4ZcuWVFnUwcmDdbX
         +J44UXqWIJW2r1t9dJhXlgMU3Fq5lf4dK0UVQTuXQglypLt4jO6AdBRhrMJV0XojETCE
         d4TLrK1THt7mYGXjK8l8j9QC2XCA8HVPMg9EgYg91U1Xqsex94V0L3QvviL+s1eg6Zzp
         zv7A==
X-Forwarded-Encrypted: i=1; AJvYcCUe/mxVzEmea0UI8WQ8e7iYkD7R5iE6BUNeQJkLDT6bMwCrQVs/bk8pXGZVI+J9zAFVOXcdje73shA=@vger.kernel.org, AJvYcCXeB3n4D6QJnbfjd82cpVbNuBuHze6YYF9UPaqQ/ZNqSsy8CfOqSF8MdYgJAAQIQ8QSHZfZiuv1UbjX4gay@vger.kernel.org
X-Gm-Message-State: AOJu0YwN2VwO+K8osJgr2T1Qno6PLSYjcWxKsPladvv2GxbkI5c61F5O
	cGfzEwDHxxxy+HOzlkK1D/HcvUtJ6gnfjJmUmEyFNNja5K6RQcvd
X-Gm-Gg: ASbGncsaNuC7tJo8/QAuoWPibKp60MvBvWd7CIDfxcjZsQ5zSscqOkQ6YYQ5rrECa/0
	CWNAnvHmCsIjmdnn5jcz+YTYIWuryWBzDwwaVEAA2e2KzSTzslrsxnfRLvouEAi+CXLSLSmiqIJ
	S/ZxV4wB7A7mRJtbNkoAYKnUn3niPER+KhOIg1h0x9qPyh+xSpWhtdocKzzTSINTzxMO+TrKyt5
	vhMWzRJ9L229bm4LOTugv5W3Q8wNFTD8f4uRQnYX8TqGnvyRNbpeGX1
X-Google-Smtp-Source: AGHT+IHEDkltBWyWbX2j4wixCxax7BMgnbEMmgEZ3qHErBAvGklHMF/EJlOvm24KMsZfkoihiOMM6A==
X-Received: by 2002:a17:907:7255:b0:aa6:8600:24f3 with SMTP id a640c23a62f3a-ab2ab5f5353mr1491294366b.25.1736735878714;
        Sun, 12 Jan 2025 18:37:58 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9060db6sm441445866b.8.2025.01.12.18.37.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 18:37:57 -0800 (PST)
Date: Mon, 13 Jan 2025 02:37:56 +0000
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
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20250113023756.kgu7hdeow7ltsj7m@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-12-surenb@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
> static inline void vma_end_read(struct vm_area_struct *vma) {}
>@@ -908,12 +948,8 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
> 	vma->vm_mm = mm;
> 	vma->vm_ops = &vma_dummy_vm_ops;
> 	INIT_LIST_HEAD(&vma->anon_vma_chain);
>-#ifdef CONFIG_PER_VMA_LOCK
>-	/* vma is not locked, can't use vma_mark_detached() */
>-	vma->detached = true;
>-#endif
> 	vma_numab_state_init(vma);
>-	vma_lock_init(vma);
>+	vma_lock_init(vma, false);

vma_init(vma, mm)
  memset(vma, 0, sizeof(*vma))
  ...
  vma_lock_init(vma, false);

It looks the vm_refcnt must be reset.

BTW, I don't figure out why we want to skip the reset of vm_refcnt. Is this
related to SLAB_TYPESAFE_BY_RCU?

> }
> 

-- 
Wei Yang
Help you, Help me
