Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AF52475D8;
	Wed, 15 Jan 2025 12:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736943454; cv=none; b=tMrY2pKqoQ7wL2cUgTv7exkuKZ1kQ9gI0zxM5sChLmZbaejTWz21ps7s3WFmPCQa6X5/ezKLsrde7Q+LVPIw/Rz9IiijzGuXF9CP1e+K2H4bKcSBzYbdxaR8zmqvVCVhBEgJV+dfg5dJXSbSh5zjnxuGxu3CkoVUwa3mYGLLfPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736943454; c=relaxed/simple;
	bh=MZ8iXyV9krpfaeNca9I/Cg0nOW6S5tfum+WntY3vwQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnVJPEFv/IDfP7J2ax1WsQL+j3oQNIsE6m17d8i3mHox16mG8eJBo1YaI6MizK0LjBonTfWR285gUWT0oMS+fsmEW1D3UuNCVO80hzE9Zcb2wd+zPIinFYO+cw1mzyBicvXCnPAv9HnwqZhWyn2umqweqCtvtseJnIEcFRrkw+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mspNTOLJ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mspNTOLJ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaee0b309adso1081119566b.3;
        Wed, 15 Jan 2025 04:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736943451; x=1737548251; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tAAbyJp8sin7hseARu7agXZgnHyKzLkuNgXfKzGKy7Y=;
        b=mspNTOLJPjP2zb+LEbKbZQL7YHveEE4TJO3nhjNsMIvXFIPQfDXlzPo4Kn18mcAPF9
         2dh2gSxmVIkqLrHm66GWRGYoxmpszbTh0TN2Ji3JrtjrASvGnAs2mhXDo18lCAV2vvzi
         Zdj7G1cHgpkqrhYrtFyCeSJliFtwZF0UdxNDsWh2b/1JmRnB+HVrCqB37DlZ4h5pb//H
         70GSZJZ8ip+44Plcg72UlpgUq+hu5iZChvpZhqTeHATpW8bmvok1imJJC24cNBAeT9Bv
         umkT7CEOlDzMMLEa7BZNk1omQOxvochIUSKul/LkWrXSG+A0ugNkQTr2ajqRWDTv8hj1
         xE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736943451; x=1737548251;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAAbyJp8sin7hseARu7agXZgnHyKzLkuNgXfKzGKy7Y=;
        b=r4nSZQpAok4GE+cX36pi5J9vFwNeJ1h9EvcJUd9Kf0e7t6qCLMoErbcgRqSdZgHo9r
         SeBoE77NLYoFC0pIwDL9knly3AYbjOPe8RiFyjqGvTPZPu8hkJTf2yRVNs5FFRjhYeoM
         iyHZNgnsK6X++C7DQ0EtMUFs6wM8syUWFFZbDPS8utig4XStqTk5mKrUruGhhhLfBuTm
         AaYxo0m1uVmcRKXPViO6O9eLGxeR5znJNypd7w6m3fEH2b4w4sxY8INCOWO+QRuktMS0
         b3X8U39ugCQk1BlhaXLbFMT6rNGNGjXoPkQbA3oEXKMqM8LaV4nQksIJOOfTiPwk8nCs
         Lwyg==
X-Forwarded-Encrypted: i=1; AJvYcCUsDuprH5Ido43lhj/Gca7n/IhRqAkEAA0Cm3OiEtY5CbV12T5E7n56WVy5PXifBP49M84g085JhjYSbqFn@vger.kernel.org, AJvYcCWnBl6EM23oDH2Y95GdSYXJdIXCEU/o3A8wgf9w6PFYPHbuuAS/kLvSbjQu2jC7heOFr/6oVaZN3Zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YysT9Dks/ILdG2/kDLSYEQdCRxnRDB49xR3mskKmCQhbU4cIYgf
	ht6lYNTr3dh3HvUHnVMcugariBBXIURAz7XuyA4lpXVi98f4r/ka
X-Gm-Gg: ASbGncuJD06zoFNZln0SuMu6hPBxEco5B1YD+5gLqjJDUNkvnruWGgQ+rYK7P65KfFn
	2N9s3GBRWWazQPy6uKFf2/oNXfJNFyy9aj621QhNDA8tW/jyxKKhM31RbBZpgSF8dZjSTndAo5K
	E95vZVAwCoVjyCfrHqb6a53voM+vRs882/vXeuJIMp/PKr/qHR0mW5BgaOhFXT/bumzFfKKSooY
	Ye59Kjvncaf7u5U/aYFaXVbHKjfRdAsD0ECrdFwujR+BzjnhYXT1mN+
X-Google-Smtp-Source: AGHT+IHmipxBXZydOiU45pNOPDa+ShKwI5P50TKMQVL0t3FcwIFebbORmph6AQXQQkWUTqAXbyNHFQ==
X-Received: by 2002:a17:907:3d9f:b0:aae:ef24:888d with SMTP id a640c23a62f3a-ab2abc92349mr2943739566b.55.1736943450470;
        Wed, 15 Jan 2025 04:17:30 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9561053sm744211966b.124.2025.01.15.04.17.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 04:17:29 -0800 (PST)
Date: Wed, 15 Jan 2025 12:17:29 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
	peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 16/17] mm: make vma cache SLAB_TYPESAFE_BY_RCU
Message-ID: <20250115121729.al7sxmpqutmhaxod@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-17-surenb@google.com>
 <20250115022703.hqbqdqawvqgrfgxb@master>
 <CAJuCfpGShzXxqH8up75WQhdMzkr+Y6eE-h37nEEwVWHC6AN89w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpGShzXxqH8up75WQhdMzkr+Y6eE-h37nEEwVWHC6AN89w@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Tue, Jan 14, 2025 at 07:15:05PM -0800, Suren Baghdasaryan wrote:
>On Tue, Jan 14, 2025 at 6:27 PM Wei Yang <richard.weiyang@gmail.com> wrote:
>>
>> On Fri, Jan 10, 2025 at 08:26:03PM -0800, Suren Baghdasaryan wrote:
>>
>> >diff --git a/kernel/fork.c b/kernel/fork.c
>> >index 9d9275783cf8..151b40627c14 100644
>> >--- a/kernel/fork.c
>> >+++ b/kernel/fork.c
>> >@@ -449,6 +449,42 @@ struct vm_area_struct *vm_area_alloc(struct mm_struct *mm)
>> >       return vma;
>> > }
>> >
>> >+static void vm_area_init_from(const struct vm_area_struct *src,
>> >+                            struct vm_area_struct *dest)
>> >+{
>> >+      dest->vm_mm = src->vm_mm;
>> >+      dest->vm_ops = src->vm_ops;
>> >+      dest->vm_start = src->vm_start;
>> >+      dest->vm_end = src->vm_end;
>> >+      dest->anon_vma = src->anon_vma;
>> >+      dest->vm_pgoff = src->vm_pgoff;
>> >+      dest->vm_file = src->vm_file;
>> >+      dest->vm_private_data = src->vm_private_data;
>> >+      vm_flags_init(dest, src->vm_flags);
>> >+      memcpy(&dest->vm_page_prot, &src->vm_page_prot,
>> >+             sizeof(dest->vm_page_prot));
>> >+      /*
>> >+       * src->shared.rb may be modified concurrently when called from
>> >+       * dup_mmap(), but the clone will reinitialize it.
>> >+       */
>> >+      data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->shared)));
>> >+      memcpy(&dest->vm_userfaultfd_ctx, &src->vm_userfaultfd_ctx,
>> >+             sizeof(dest->vm_userfaultfd_ctx));
>> >+#ifdef CONFIG_ANON_VMA_NAME
>> >+      dest->anon_name = src->anon_name;
>> >+#endif
>> >+#ifdef CONFIG_SWAP
>> >+      memcpy(&dest->swap_readahead_info, &src->swap_readahead_info,
>> >+             sizeof(dest->swap_readahead_info));
>> >+#endif
>> >+#ifndef CONFIG_MMU
>> >+      dest->vm_region = src->vm_region;
>> >+#endif
>> >+#ifdef CONFIG_NUMA
>> >+      dest->vm_policy = src->vm_policy;
>> >+#endif
>> >+}
>>
>> Would this be difficult to maintain? We should make sure not miss or overwrite
>> anything.
>
>Yeah, it is less maintainable than a simple memcpy() but I did not
>find a better alternative. I added a warning above the struct
>vm_area_struct definition to update this function every time we change
>that structure. Not sure if there is anything else I can do to help
>with this.
>

For !PER_VMA_LOCK, maybe we can use memcpy() as usual.

For PER_VMA_LOCK, I just come up the same idea with you:-)

>>
>> --
>> Wei Yang
>> Help you, Help me

-- 
Wei Yang
Help you, Help me
