Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53C628935A
	for <linux-doc@vger.kernel.org>; Sat,  8 Nov 2025 01:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762566146; cv=none; b=ueNNyKR8jceC21M4z+3V7s/8QjoCxa3TtS/DmObR17qVWkBSAlaDwHBJW2uDBSzCGiPiJ0X+dPHMsplrJAJXF5HSRUdad951dzdL3c4hwfIlnbVaYytAmPJBGHncIq+0DbiK6OcYdlVzUQIG2L06D91Yq8XbjSch7t+akuMdCvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762566146; c=relaxed/simple;
	bh=2BoJwDhWmDPG4AVqZIXWOTh2l/C5ji/bwn5DT8jGj5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f11dLqqPSJugDlujEW7E1nf4lnefFIDypnAj7SjJ98PNTlfn6a0Q8jxxpBNCt+sAoURlAzggWoWQx9DEpJfRP1eaB5IbxDTwwNdYPZGHNVS1eYLEgLfG4SVLQ9hg9AV6UiLO36MYQjwQMp4+cQ2c//vIF+/uBVNr6ljFJOM6BUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfiJ9ISX; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfiJ9ISX"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b72db05e50fso141757666b.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Nov 2025 17:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762566143; x=1763170943; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txzBDkuu6HQXRdAmWeqGcCpUJ0ARUbkkBrAd0TRurdY=;
        b=LfiJ9ISXQelqWzBVj4ny7A9nTjIbcSg2MeaNw9335bzIYQvQnHaiyWiCz6RNmdwLxK
         pS9CcCNnUkn3CslqMhTBLHZsAHyhgHr0QpNtqiHSHZYxF7V1y8IJ/vq6zOFC+kyER/QC
         jjtvTzynnrWDLdrmkYp/znrm5jTYp8W1iDpePrMKDjVi8jrA3ORN0ks0PtVEBgz8qELJ
         P9uyc/NHMiEhlsXnRSzYWIVr1T/6gdNac/IU0r5EoV2foVU3w+ikCb8XHhaqEZ5cGDbw
         +TWB7odawleaF8uJ0zmeXUSd99DtpGwVIYEsIh4c3iDLkPh3XQkxs1s4DWn0YVgu7V5q
         35Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762566143; x=1763170943;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txzBDkuu6HQXRdAmWeqGcCpUJ0ARUbkkBrAd0TRurdY=;
        b=mN2gSmCxPOkf2RNal/etjp66SkQf70Eq33CagN8mPzrAw4FEpQjNXD16PU4Z28bKG8
         LSutXTlzGGXT1RinBMZ96K5pWGLBd89GyP1YUhfFM0wjjQq2eUmtZx6Yqu6mMl+zhvMo
         2541Zk7mF6tCnKHQjm2gqGka4cZTt0m4JwGlPTHxXZUCxsReD0wZmNgz+UuJL4n9MRHy
         iQvJx/TAhihOWblAZXxADDyAf0Go20R2ydRyLH4Hru6H/X9CVD/Or3+N7y5bySSDisL3
         NMqyrzLrlP2GlB6HL2Wi8D6uBE/Zpe1aKsuy0bb/d/XSaFuI/wWHdOMT7rXqms7EIcm+
         /S3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFhOhOBSk78PmG49Uq8LyOU/BwZU2dRg34pTT3cXvC9A9i5U5zXMqVrJUbmyrKStMUXhwjlXtgSB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYTrNjQSioEnr9ccOJPODrXL5xvLbCUWopU7Wrs00v9UPHyOvx
	TIl1WQu21eZPVe6acfxuw4d0ewrxfBbRXEiwH9U0VS2+uPXXYjre3CAR
X-Gm-Gg: ASbGncuXulZoMqLqsV7Kn2H4XxOJRfjU5ssk/xKedLVrLy7Sp3CLkeIUn3PW2/PfXqp
	YCX70ea9Uyi7ttRp3zQ7Cp9mSPqroDyLrfdfkf6gSDh1p/ymFS55LavGcJvfFDlKuLOE9kgaXv9
	jVHtECHPaLUnTcftKYuIfEpOSwALK45LVQ/WBGYA/RoD389y+tp0K3XfWqcxAM7OvPMfdgUD9zp
	d2I62eZeoVwu86NLxY0QWWgwxgzcjZOHh9YZ2SLVHTWkf48EVQE1DCVR1rLZZVCFHFc2d0/erqr
	UO4W3L6wxIHJDho5l/PPcfORiEPS7fPCrt4Wdq49XCA096/JmNl8frlviFv0QCwplPGrHe9HI/J
	6+aVhgxzF44VRUFJ+P3yl09HCyPHQbkTNqecKPb9y6hJ8CQEzL2hzmWnrtmcM1rMxttPIT5VAHq
	XEdmlzlZ9g9w==
X-Google-Smtp-Source: AGHT+IE6lrXy8Q8tj4IT56byqhqDOcFo2Ljy91kXlQBEAHGBuKzDKR+fUlhhjwifft9Xb8qZcgHL3A==
X-Received: by 2002:a17:906:6a19:b0:b72:9d56:ab52 with SMTP id a640c23a62f3a-b72e02d20c7mr117552366b.8.1762566143114;
        Fri, 07 Nov 2025 17:42:23 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d0ffsm406996266b.46.2025.11.07.17.42.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Nov 2025 17:42:21 -0800 (PST)
Date: Sat, 8 Nov 2025 01:42:20 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Nico Pache <npache@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org, david@redhat.com,
	ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	ryan.roberts@arm.com, dev.jain@arm.com, corbet@lwn.net,
	rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org,
	baohua@kernel.org, willy@infradead.org, peterx@redhat.com,
	wangkefeng.wang@huawei.com, usamaarif642@gmail.com,
	sunnanyong@huawei.com, vishal.moola@gmail.com,
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com,
	kas@kernel.org, aarcange@redhat.com, raquini@redhat.com,
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de,
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz,
	cl@gentwo.org, jglisse@google.com, surenb@google.com,
	zokeefe@google.com, hannes@cmpxchg.org, rientjes@google.com,
	mhocko@suse.com, rdunlap@infradead.org, hughd@google.com,
	richard.weiyang@gmail.com, lance.yang@linux.dev, vbabka@suse.cz,
	rppt@kernel.org, jannh@google.com, pfalcato@suse.de
Subject: Re: [PATCH v12 mm-new 01/15] khugepaged: rename hpage_collapse_* to
 collapse_*
Message-ID: <20251108014220.wpstoj3kqxxnes26@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20251022183717.70829-1-npache@redhat.com>
 <20251022183717.70829-2-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022183717.70829-2-npache@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Oct 22, 2025 at 12:37:03PM -0600, Nico Pache wrote:
>The hpage_collapse functions describe functions used by madvise_collapse
>and khugepaged. remove the unnecessary hpage prefix to shorten the
>function name.
>
>Reviewed-by: Lance Yang <lance.yang@linux.dev>
>Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>Acked-by: David Hildenbrand <david@redhat.com>
>Signed-off-by: Nico Pache <npache@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me
