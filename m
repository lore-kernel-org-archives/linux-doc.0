Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAF7287256
	for <linux-doc@vger.kernel.org>; Sat,  8 Nov 2025 03:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762570902; cv=none; b=Z+jKgqxCsjBegeImgk+G2pQ/uM6zOfVf2vbVVDBc8uyTz1ecEDfz+PnGqW38mwjYN8YKovWDmp9qbkrr9JlRU0L9s0xXoxNJZ2JgG8AvpzE54x00pYpVTNEk5M+Otc2npZPlk3+jhM6RDp9emSZNYEYVGre0yKOxPdVbXi1TE+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762570902; c=relaxed/simple;
	bh=Y9YV3f8Hzry+Ze97F/cP+/xbypI1KDyCVKpqIvt9p8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGNe99sI/+i2zYYuXqtJ70VJ3Wo22MeAeIpzQ1SxI+/K8n7PmssvQLtZtUaIJHhUq6Ynb17+q/zKr2ULDc9XeqEf8N8YOsOwKgOngGQnWTAs7SbOAWNO5bGGsynagDovokI9ZeWnTIYHocN8bPY8hIqfL2t+euno8jZhubR1Rkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqvzXnEv; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqvzXnEv"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7277324054so186440666b.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Nov 2025 19:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762570899; x=1763175699; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvQMGIBRXMAfRMIt2kKWb8Pd94P2qwTUjsmasBUxq4U=;
        b=OqvzXnEv/XhxHmFBcR1ZgdHs7bn8FQ5YaZxR9JHfFjyEalXa+PztZRYnpBlWol6T1a
         iPtyDoT1hfx0gKNJZQfU5X91OFEj27uhQbNL6ifXdIwZuYzSpkouweXU5O3Wm/ngn1wI
         qfQS+yAbrU5xnYzm8bYDYoThZmFG5oFhIpQM+y+ZzmppzZK1BZUBXK52fAqM4QyjRLrZ
         K6tHCMXcKPET8xrjS5whbhh1WridPW5weg0FySMWCw/VTL3kpazSSGiiaRW7ZjBusVBy
         Bva9dSc1kNmSGMxXOWULtg/owMftQ9hTOyYITPwOpNEeuKXcbZxfXMXDSMB6bIpIUkiC
         lnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762570899; x=1763175699;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvQMGIBRXMAfRMIt2kKWb8Pd94P2qwTUjsmasBUxq4U=;
        b=Mfj/Nwos+2Zdcb2SnmCEhci97nUTINs/04ObvxfTyVWCCDTMo0bG7UcgsJXCWtiQkV
         4KiHUpKuPPnpxbFJXTSFQlVFN3FJTN7RwKPHgmIs3TBvyn0zlopZ/zfwbl4ulZw0uqWg
         nX52L83Q5ozE8YDM4dBz2Z7TP6av7SxZe37KObZwbP/5FOTbgYKVFUrwIS1WGpJjsPZ8
         tNZ/6jfA4hfaHgB5/uMkdOqXDJPWN+NKeQpv/KkrUFln5NIHaksvpPo/xWm+eNZCAw9M
         nkJUZGXicdosvsn8USLdJPwzK0r3SCmcg8cBRAH8sTgv+fOKqtHvg7aGqkwwwoJ1fcPz
         RmJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpoiWQcr3uRh0A3OIhg3UNvzFevvlnyYdsbUXTV6Xlt2WPiP0e4kcawGjx3J51SkhRtJY5yZL2YJw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2zumvQ+cBGTAqOfkEqYGtnWcKc/vryw45J7oMLS3Pykt97lwd
	CvaiqA1EFBLvHtG2AljVfPS3j/U4itjm3h8n9kD5YgdLCQwKgKvIkspR
X-Gm-Gg: ASbGnculHjMd1u8Dr13/Iv/7mdW/le7TFM3SBwvWGeGld4ZxEcPkYOCCxbnuEurK8wZ
	Z4q9A8z+DKRCIAlMlonogQWx5vqDHuu0fOoTVzgjFa0ZkzjA/G5weHTtShFvB+AyyBdjvW/P5pQ
	21d9gmgXVLUoA5p7dST7+tHB9moUp7662eHsR24rx+2uqQ0eF8bqYcMdTKzC/0BtChzWm2Jczxg
	oj1fVBM8ucFHi9yMbOWgc9K1PcKPI1+hXOI/xNYa7dNGOO+qRSSFPl+GbzNT8b8o6qIwtiFnn/T
	cYackuRQnrGqE7S/6cDuHwF/GEUCRVXx2qIt3aInXCv+03CT8vo9nQBBytzJbMUbtlCZLly68ZX
	COPDOEhMs7mdbz93ae9kV4DTW9fqhXy7aJPh3uNK6I6XKCGtCwVOXj+nK1+pKsHFUp1OpJ/nLWo
	0=
X-Google-Smtp-Source: AGHT+IFpe9qLqPYcxu/67GnD+yfSvSPuX6hzgETXb3TcPECOp4WGRyEJjWKfcLIhMsnwyzl+jMrZig==
X-Received: by 2002:a17:906:7313:b0:b72:b8e4:3aea with SMTP id a640c23a62f3a-b72e02b35cbmr147921966b.10.1762570898658;
        Fri, 07 Nov 2025 19:01:38 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf312e25sm397398366b.20.2025.11.07.19.01.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Nov 2025 19:01:38 -0800 (PST)
Date: Sat, 8 Nov 2025 03:01:37 +0000
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
Subject: Re: [PATCH v12 mm-new 05/15] khugepaged: generalize
 __collapse_huge_page_* for mTHP support
Message-ID: <20251108030137.mud7xxwg5fxdgm6k@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20251022183717.70829-1-npache@redhat.com>
 <20251022183717.70829-6-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022183717.70829-6-npache@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Oct 22, 2025 at 12:37:07PM -0600, Nico Pache wrote:
>generalize the order of the __collapse_huge_page_* functions
>to support future mTHP collapse.
>
>mTHP collapse will not honor the khugepaged_max_ptes_shared or
>khugepaged_max_ptes_swap parameters, and will fail if it encounters a
>shared or swapped entry.
>
>No functional changes in this patch.
>
>Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>Acked-by: David Hildenbrand <david@redhat.com>
>Co-developed-by: Dev Jain <dev.jain@arm.com>
>Signed-off-by: Dev Jain <dev.jain@arm.com>
>Signed-off-by: Nico Pache <npache@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me
