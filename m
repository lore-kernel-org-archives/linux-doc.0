Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FC3261B71
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 18:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706596; cv=none; b=jBkhkJO4euj9muIJCbu0+G2HBPjaCO1WIZ31VAdDbTACVOsLjl8kAbcniEw0FPb8GFBSi73giI40zp8/7IJiauL198NS9KmBMkJ/XjWPmdNj0aMmCNc8KjsAn8t4CqJ+JF3r4FWxibjZCRlGqPy6T1GLqps1NsfUAB1NWXIS3PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706596; c=relaxed/simple;
	bh=JK0Z967O7a8Bl55D2zvwLZqTqZpUiSqVWqaZiixu9aY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyYLlmjAaBDrKu08alk1IUO6un6ucG0FHcCtAJjoylW54+fimuUjbUa0DK942xhbkAd7F4DwblbOIKwqspiWurBtJTJZyIwLN3Nsz14E/2SjNQ8/H41SMS199azMp+pjFYgB0dgViBTz2f1OVVhx0+gkFu1PwYz45hvT6JDe3SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=XwYTQHDC; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="XwYTQHDC"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c0c45c580so8270091cf.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 11:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783706594; x=1784311394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pchhQjIZYIsHA+IyTP+kMOXOCiYK49mahPv3eolm7bw=;
        b=XwYTQHDCXEb07KED5ajRKK6taRPykEMNgPlbxgCoJ4mfSIU0+sBiMJHRZvdL3kDHT8
         WQDYq82uKGVSKALSD9uEckizEuWQ2DNoYU63JJ+9rkYmF4JV6xkEWtvhkBJBR7bOI8Ve
         hdLqNf/imepRfwD/zhfXO415m1vIlJmlKR/Q8WaW2vExCXpBIfva58QADaj8xAfogDMx
         Nmes74qpwPyzJV1r7mdIV8ROCQq1aSF4UabkGgEs/994EN5u8W9eaU4JK49IMLDDM9Hd
         JAnfM7tOFwVTmMx0vJEgkpnMbRCPvl8dHdpcEhdItpTA+2L8Ss1sw4xDaMYfAX6TCA09
         Bg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783706594; x=1784311394;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pchhQjIZYIsHA+IyTP+kMOXOCiYK49mahPv3eolm7bw=;
        b=efvugFBZZW9GYKhbDSxBYFafcujxCxgh4iEXorkwRaS8ljJNkKng/FxRQ5iYmmBD1J
         xnvhPkHnyuK+Mo43hlfhgcyWMUHFWeDMGc2DTgJ8Hb9AV8bHYERyhmiAz1m/u304tC88
         u9WyTe5XZ9U6z46QcEU/TfLnppUkxqZ06zMdr3ozD67LpcCA7gs8OcxVoXcOlgHzbPmc
         wXx8hhSBDyuJAI80U6M3MczY4HZTcPsfIWpdmrR2BZOTFHW856SN7V9VppZk45iGW65q
         EvYqMJN5jCtwMjWBUTMzsaYtkCWrHwZNym40sjviUS15jAijAWUJh/R85GHIZAbrde4K
         dM2A==
X-Forwarded-Encrypted: i=1; AHgh+RpWNfonrDbbtx7NMsH6T39XTtY+24jm9Zls8PnWV0WssvKEC5jJNZ29YAoJ/RfAKRPRHkMaBQOd6PM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuHhMpPhRnrizXA5iWzHk33X3XYGZH5TNHw6FT69S1I+hYxFIu
	tFTOtKNxHUai9r0zAIEFWGQLd+NlWcM1d+0/SXBMUhM4nSkgkyds9KvVNZIIot0PBgE=
X-Gm-Gg: AfdE7ckbKkc+GkCE47MZHBTmCDa9zQ8sfVgmDqnu5CASTdFWxIvImQLwFjh5ZiAkSms
	Stl24tAANzU5Zs3aXB1Uu1amArRmOe6SYg1nrdAGBO+mcOddekEzjMZ98lsfbOI2YkwaeNxX9vL
	OxOyKEYrTGXL+iR56XkmsrieTLl/XvkBrMmOSAx5niFoiL/Y0vRmctccOCLBhhETm7wemQFs64B
	BYdb2M9iS2pSuF32wAkYfMIIrLsTkrea7sbrBvoDz5xKV7OVshi5mQ+avq2/cUHsusWgQEtxt+B
	YX7YNy38QU0NCX+8gLAkkOc74wVwP9KoHMiDlz9DnsvvY6FGqlGw8N3S7U1/hevSk+m7NYofKv/
	LW5MUNO/SwHQmWo1O5zAmgb+e3mG74qEi7wL+PzgFvVy/jvI5UbJiqNqliRPf
X-Received: by 2002:ac8:7e8c:0:b0:51c:7b13:62fa with SMTP id d75a77b69052e-51c8b438c0dmr129494461cf.80.1783706594020;
        Fri, 10 Jul 2026 11:03:14 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1fd2bsm47060696d6.27.2026.07.10.11.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:03:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiFZA-00000007fhc-13JV;
	Fri, 10 Jul 2026 15:03:12 -0300
Date: Fri, 10 Jul 2026 15:03:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
	corbet@lwn.net, dakr@kernel.org, david@kernel.org,
	decui@microsoft.com, haiyangz@microsoft.com, kees@kernel.org,
	kys@microsoft.com, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
	lyude@redhat.com, maarten.lankhorst@linux.intel.com,
	mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
	nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
	rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
	skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
	vbabka@kernel.org, wei.liu@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v7 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <20260710180312.GD1803712@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
 <20260710162749.GP118978@ziepe.ca>
 <20260710164743.GX118978@ziepe.ca>
 <alElv0EKjLQXMNK8@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alElv0EKjLQXMNK8@skinsburskii>

On Fri, Jul 10, 2026 at 10:02:55AM -0700, Stanislav Kinsburskii wrote:
> The main customer for this new feature I have in mind is the MSHV driver
> which backs VMs memory with HMM, requires userfaultfd support for
> post-copy live migration and fast restore and it doesn't timeout.
> 
> I agree, that this current timeout value used by the other callers might
> not be enough to repopulate the mappings with userfaultfd, but there
> drivers would get -EFAULT for uderfaultfd-backed mappings without this
> change anyway, so getting -EBUSY with the change instead doesn't look
> like a significant change to the behaviour from my POV.

It sounds like it won't be reliable either then.

> > So, maybe the deadline should be resetting after every handled fault?
> > ie the timeout really is only about the mmu notifier and we don't
> > count the time spent handling faults or walking?
>
> The timeout was inherited from existing HMM users rather than introduced
> as a new HMM policy. Some GPU drivers use HMM_RANGE_DEFAULT_TIMEOUT as a
> budget for the whole range population operation, including HMM retries
> and subsequent driver mapping work.

Yes, because we always had a timeout around the notifier because that
scheme can sort of live lock. The timeout was to protect that only, ie
limit the number of notifier retries.

Expanding the timeout to be outside what is bounded by the notifier
retry is not right, and heavy stuff like mapping should be done after
the hmm side succeeds and the notifiers concluded so they can rely on
normal locking instead.

This is why I'm suggesting to reset the deadline as hmm makes forward
progress, we really only want to bound the notifier retry loop not
anything else.

Jason
