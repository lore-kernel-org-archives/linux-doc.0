Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6804613E41A
	for <linux-doc@vger.kernel.org>; Sat,  8 Nov 2025 02:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762569278; cv=none; b=tVXM2uvcUZn6F6si7v09sumwhgMkaQm0uuZzbdky64Fwukdf/ZnDEhHCgDJ56suKjlgwJohlYGkNcjaNJXcWWUexieE1RimZ8qmDwqtKPLDOBJ2O0MAuJeF47M14Bk70vDERBBpAiYKjd9RYbIyV11RXLLqfUpPO9L2PgNKzKMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762569278; c=relaxed/simple;
	bh=Z5X50pyR0wS4lIYsN0HttoXOv4LWl0AVzhpUed4BCes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/57fx9wAZ4sNOWfBwlyG9n3XrZLdsVqJXrXBxq7G18bNAjH4w5z0VP1hG5QYzFmzRSTiAEttcKSFo7s7G3va3ZvLrlY1QzbGm6WP6c7TmZqkwyvTqSXBuRIOCFlNIgjz+c4aw92C0aU+aLdrVFWjzeUOkgwgwWctu7+k3upBaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3DrIOfS; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3DrIOfS"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7272012d30so236578766b.2
        for <linux-doc@vger.kernel.org>; Fri, 07 Nov 2025 18:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762569275; x=1763174075; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5potOoY7oJuZDgAPEu8n/B2FvMnFZR/4eU+wIwynFI=;
        b=U3DrIOfSq41Jo3yYoAQLR69+/6srBs7EQUBw3cFjNj0P+rGMxtjqXzGgxMJehgsBRp
         j+ZdYANEkArSXZNYKh5miE5FSr1n6yDWFYMjLMI+0FXvRygkV1jhMw2SmzZ1NmL6W6al
         Mw6m0eg8s+mmHZOv3rktMgjlYqLPc+yxeJQh/bWwb1VUDpgVx01UQn6x9MzZ7xUmCfGH
         ILAJlVboKdtBmlfLnZhFXbq2qfWXl749HFiPtCvOZUjR3Nh8ug8iWQthDAoExZQ29sPz
         WzsYAGzE99rqQROMErzV22Douo7fDgasIfjtTlbsOGU61teRnXsSyoBp+TLYPGP3akAK
         hZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762569275; x=1763174075;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o5potOoY7oJuZDgAPEu8n/B2FvMnFZR/4eU+wIwynFI=;
        b=c6XpzkaMBlJ8YnQuyFl1+ZOFWUy2W/0e5TjJNzBxZaEG/WXiztGuK5/b1KJYvJa+BH
         bToA/XriUA4RetBxPjYsGeGAVuhgc+RY+x3IbMpQetr8emZfTlp3Xy3Msrp7TzCPSMir
         t71t7E3Xt7lf5dyyt+9vX7ZlNz0kfsznPugqBs2riouu3Up8ALmoJNk3aJgysANiBFuO
         s7U6sN2KhI8jdEUU0n+WkdsiL9QjLEzTKuiC4CuSHzg50cL4LB4qi0+7wGkg9QXghlii
         W7vH+YyVc+hIyh7cNwHtEc60582b3FdUlnTJZ1lLOlUKtUoV2qkzBmQjZb5kmVB17UTT
         5gQg==
X-Forwarded-Encrypted: i=1; AJvYcCWvLK5yARXWXtW2LbjOoM7goQ3uwZd0Yp14j07BH4PN8WO90FKu0Wd4UYQKcksBJ70QCwHQg9i0XJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFKFh4S5eFkEY7m/NCPBrgUGVjVvdo6Q8rINEp7Mb0Jep9/rnd
	RiCN2lWoEkhVMuNRiksigKyGymAJQzMWzRE6RNcWR/XsNCvXfOLH/YUF
X-Gm-Gg: ASbGncs6UhZG9IAYDRgG/OZ4d5ribMFsnaw4evOfktChZvrpHgvI9hEYh8ornuacbMi
	2N+GEc4Zg7PWJaRrRjP51V5cQvKJK2m70bKLyK7fj6AHCXdTMqIpRN3izEEEJsvARUVEVphWBDx
	1rgLOqjJF0pZwLQ09Y+EXOwgTdui8meEVz3dHoYxaXqXv5M1azJKbDz+7i06cNqcm4hf+3omF7H
	3r05V/QgYah52N13ba4T9lVRSRpL3IEdV3cbz1lEbj+Tj+gwTgOHWQsIEmITGtb8vsqQ2/o8RoZ
	fxcPbTiWrvEx/do65X5JscqTKDZUZmI+yerNF6u/lO0yIjUIOeSqq27ibX9OUSTTU+ksf60qyLu
	KAQf9HFrgwF/aUup3K1HiAbMPmRpHtKpewAk5tBJM/9rRtiRx3yITwkGiGYUmIiDW2KxJ5Cw83X
	ithtoAGMJRYw==
X-Google-Smtp-Source: AGHT+IF8sH5AJD5BmsEI+wfEUF+AscOx+lX9t+VpBog4E5GD0fnsTzO8XVh1qgisOXry5AIp9gqKVg==
X-Received: by 2002:a17:906:ee87:b0:b6d:4fe5:ead0 with SMTP id a640c23a62f3a-b72e028a487mr148451766b.10.1762569274625;
        Fri, 07 Nov 2025 18:34:34 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbd1ecfsm391337166b.10.2025.11.07.18.34.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Nov 2025 18:34:33 -0800 (PST)
Date: Sat, 8 Nov 2025 02:34:32 +0000
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
Subject: Re: [PATCH v12 mm-new 04/15] khugepaged: generalize
 alloc_charge_folio()
Message-ID: <20251108023432.yqw7u7wnh5x3xvgh@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20251022183717.70829-1-npache@redhat.com>
 <20251022183717.70829-5-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022183717.70829-5-npache@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Oct 22, 2025 at 12:37:06PM -0600, Nico Pache wrote:
>From: Dev Jain <dev.jain@arm.com>
>
>Pass order to alloc_charge_folio() and update mTHP statistics.
>
>Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>Acked-by: David Hildenbrand <david@redhat.com>
>Co-developed-by: Nico Pache <npache@redhat.com>
>Signed-off-by: Nico Pache <npache@redhat.com>
>Signed-off-by: Dev Jain <dev.jain@arm.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me
