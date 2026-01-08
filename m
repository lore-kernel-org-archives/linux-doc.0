Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53C248C8D8
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868952; cv=none; b=qx6RiztfKBbBaIQAS1y4m4fSnWyW9QI8kallQ//dVB3+7klqGS9sQX8uhi1bskX8DgX6Sr+axnvdpO46eCtUri3vyl4ZiVlq7OlueNiL3WISM71mPuAJquXgxQmkpPlfuTgoyzikLgnSF1QhTfpqxNuDICuGEjAysig2aHHjXQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868952; c=relaxed/simple;
	bh=7jKXaItOB5HW6uJMPUGoE6Z1+rU0TW3Ya6J4u86JvQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nX9BlI6hc5rwt96JJsYStXHuf3MUWJfWzwrm/RZFBpfzepMulggiC36LKjGrPQhLQrcRD3xfzHjO7lTYxaQ8tAJ41wEHAmdkoMsCA9lxEnOQ9ol97ZrjSrWqmLPWpM62Byz7xtmD7XldMlKo1E+kVxXY6pyMB/i9hLEQwN8E7G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C/U4QNzp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C/U4QNzp"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779e2ac121so128145e9.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 02:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767868945; x=1768473745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iCksppsN2qljq533bVWKBzGPs8aXT6gZzyjV+hGv2Fs=;
        b=C/U4QNzpRg9cP1pYp/d/r6DsdRrGuciDjV8jHfcHOk/qDm1nEJVi21VYML4cj6RyU+
         jErS/5dC7I8pFiai/9CTqgpT3m1bGJHcz1RZwbVlX6sRZlrn4FLQk7dJCJJ4Yrd2DPXU
         /Ha+sLJTTyp9YNVasVbH+In6YzJws773ghXXKmAjcbuYx6YwfjmKNeXguTdu5G2toi7A
         NMNQryPj+J0BJi1KaHwnaELga7e+O+Ilu/uaCAf+MnGbVI76rPpp/C6TFWwBETTxQd3/
         EpRk2bTX+PBy92wzRRxprXOfhH+u2s0U5wk7R0NZvhVw4n89bFbABYAEOzid+DjTPUHz
         7U6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767868945; x=1768473745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCksppsN2qljq533bVWKBzGPs8aXT6gZzyjV+hGv2Fs=;
        b=RJNzuITY7Y3QtONNPnjiELOJQYySSWQ9MBd6sV5MAorNa7U/N8TrnO0ywO+vjLvow8
         jJ7Jqrz4sUN4MSOijkihCO/Za6ORHmjB9qEGc9v1JendkOp3SwPuHqoLDBlgoJxFkLh3
         vfa2rgf2QLa8qz7c+CG+sT1PM2BwLRMxU4XFI2L/WZeedX2zWpanlMu/XbZOha32hQI5
         9zjINlbNzUfv3lzOK7fMzQOCDQ5f2NAwGN9aOOrgYia644NGjJ9ViIO3uSfT0iLLjyw4
         oLUIv2XGIuzl0fwBtcmr6u7ga+JhkO5ikClAzIus9eJPRY2JrxUgZVe+AfPlQrOSYIDg
         QbeA==
X-Forwarded-Encrypted: i=1; AJvYcCV6HiuZ4h/RlTw4r+eRzmGkPUM1zPJ1iDmns97fcRao/25BreRMInrZ9/Kxuj+Rs5yp9cj99fg1zJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWJ4tz01Qt1WF7760vF99t5hkQ12IOxqLztjczrvaVvRM8Vk2A
	WOq6tNGtrnokO4qPikJBexqWSRKF84aYpUfVt7ErvoTXxvTVbeJJH63lmmXLYZsOfA==
X-Gm-Gg: AY/fxX7s4Hn2hCJt5OzAPHOXwUPqTLypvvulnwZCHUtt6KaJA9QQPtcgCVGnv5cXMK6
	l/jjagR8jIWW1pPC2LDAkR2dfuvuGiuxzbDJNqgOqsk2L9Nj6vnYSTXtvQzrS2xpcK8XFzLRdDO
	imHiv4qZGyHPePiwub+6UdpP9wY3NNjMMQMnhaA8dHOADEZ98oNtxJwIapAAzDBb+StsTY/NYls
	LMgBA3IyZpC1GB188u8iEYW7f+ZF1K9B8ZZNKKp90EjwaSxLtPdmTWXIosOSp2vAgEklT8v2VXz
	Vl2S5qnx+QWmKZ575CK3w9ioJoegamD9uVUyMVmMJSYZezqI2RKmVWuJ0yAJySFBtHLcoiEDeGb
	3xxW4OtIouUegYJnNyOsBnpRj01aAtUk9Wqyco0KQwlyi7bH6pn3/5ZdjkXGSgc7A+HkRE0XbU+
	al0iqFU8nrxEvyFdFssHRphZ6MVCBib7dNzgGtYRA3FLlYBaBfJ6Lp
X-Received: by 2002:a7b:ce90:0:b0:477:95a8:2565 with SMTP id 5b1f17b1804b1-47d8ac3eea6mr350785e9.16.1767868944788;
        Thu, 08 Jan 2026 02:42:24 -0800 (PST)
Received: from google.com (171.85.155.104.bc.googleusercontent.com. [104.155.85.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0daa84sm15517528f8f.2.2026.01.08.02.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:42:24 -0800 (PST)
Date: Thu, 8 Jan 2026 10:42:20 +0000
From: Mostafa Saleh <smostafa@google.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	rppt@kernel.org, xiaqinxin@huawei.com, baolu.lu@linux.intel.com,
	rdunlap@infradead.org
Subject: Re: [PATCH v5 1/4] iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC
Message-ID: <aV-KDEGlplD5EkBx@google.com>
References: <20260106162200.2223655-1-smostafa@google.com>
 <20260106162200.2223655-2-smostafa@google.com>
 <1a6aedcd-34c2-4e26-b07e-6eb8d423b759@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a6aedcd-34c2-4e26-b07e-6eb8d423b759@kernel.org>

On Wed, Jan 07, 2026 at 05:53:50PM +0100, David Hildenbrand (Red Hat) wrote:
> On 1/6/26 17:21, Mostafa Saleh wrote:
> > Add a new config IOMMU_DEBUG_PAGEALLOC, which registers new data to
> > page_ext.
> > 
> > This config will be used by the IOMMU API to track pages mapped in
> > the IOMMU to catch drivers trying to free kernel memory that they
> > still map in their domains, causing all types of memory corruption.
> > 
> > This behaviour is disabled by default and can be enabled using
> > kernel cmdline iommu.debug_pagealloc.
> > 
> > Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> 
> I think I acked it, but maybe too late for you to spot it
> 
> for the MM bits
> 
> Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

Thanks! If my mail client is not acting, it seems that was the
same version(v5) also.

Thanks,
Mostafa

> 
> -- 
> Cheers
> 
> David
