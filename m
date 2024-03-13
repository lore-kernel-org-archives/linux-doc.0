Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5C45490C
	for <linux-doc@vger.kernel.org>; Wed, 13 Mar 2024 22:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710369642; cv=none; b=VpWD//cXgcdKDnFIxSx3dUOL1MM6qH26JqUHEoQ/J3WhgE8024+I/uZ/Odk8UGD0wWhClyDbDl/SW6f9JiDDuCaFcVbHvbTZr1tBnkD5+A4u8e7UKPzDXwlBDqEo7LovN17aZmU9CNaZ4JsozEUtLudqGuCRLtaPvKG3ajzCsyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710369642; c=relaxed/simple;
	bh=kQPlLLYuK9rGDu9iFj4vfuJRTUe5t6j7sL0t/2BVD8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KxKceRxef5cthCSvi0CXUu6fjvzxLtJvYOk+ZvKuWH8NPOOZMHHdz7oR45li4i1FKGmIoRf+FqIDRp4x/YZxcl1fsTrDIb7wZRQRU7BCt4B+wHdDiUSNP5u4cqOM5H/Md+ig8oJYWIVqoV3kMmX9AkjUpsuQqYBTZwZ1R3wbzbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=Y2rEfMzt; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="Y2rEfMzt"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60a057b6601so3640657b3.2
        for <linux-doc@vger.kernel.org>; Wed, 13 Mar 2024 15:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1710369639; x=1710974439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQPlLLYuK9rGDu9iFj4vfuJRTUe5t6j7sL0t/2BVD8s=;
        b=Y2rEfMztPEsb9qwtGHekpWLd7XCm2JaYlw6xqc/h8v56GK+Mi81Z+u+NcxWSVrK9W6
         AdjMs770/f3GwXDbzbo+6XUybV/2A1sZc4t3mGZM9EBpJA2Ddm7mHNnO5OK3HoxivVzG
         WL/YpVWet0HxlPILL9DFSgzrB3kiua9VIqEi0GXhct7XExq+B5iNqmowgXC658ZKDChw
         Bejtcil3V4/1txuryERZGwJdvzJaUTZwoyRJh0P8pEI23nW8T78UECQoRWufz2UIoBFq
         e/jmzKLevvRCA1MFVBXN+8g6W6f8vevm7/0uK6eODBa2cGFM9rxO3wP316TBNlkEJV5d
         yRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710369639; x=1710974439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQPlLLYuK9rGDu9iFj4vfuJRTUe5t6j7sL0t/2BVD8s=;
        b=ayYmZsORQStbjMeGQbApmr2GY80TvZH6UO6JECD6cHbQvd+ROgDPR9gR8bi4Z51c2E
         Qfj2VhJTMGOUdxmT/teHedDMfl1ZleTU2EEXGI0IJ4Phlyryg+Fst8WrTeW2cfFeJopc
         EMA4XGTxWvvKetHnW5U+/ow2O46lnyjwpwB/qyZk+wRuHBFYNdMiXstljqKZbABPWWnA
         6NWeQxHUgUtCzdVDGHjpFq8Y2zkGgmik/S85KwVzKelX8rZZSKakjhkDScWNsFHKP7k+
         I7od+itpQpypw15ZftWzW9eY/GGh/aNzrKH+F77Y/xiz4NiVwq/Nl+KKhJ8bXazdZC9v
         JFsA==
X-Forwarded-Encrypted: i=1; AJvYcCVZuajwsSayjfK2J1PujFo7Tw+FFI3h43A0K8XO6k2Az7mlBr8BhEetKJ9XgDVpRnT5G4p1vqhrDgeklSutRBj/Wb4Vn8suKrH/
X-Gm-Message-State: AOJu0YzYbzIoAAb87h3aNxoSu/MSGFghxo8doKHQ/IBGi3HVbmd0yeqE
	zhzQdVg1iiwC6R2a9KEfGaxcqFrjjq6ZJgwZISZD8l1i5CGzy6NXsIosDHmEADFJhkIK7YvS+z3
	qBzspCEMVZIvjN/8vDiLvp6kWpfqnUHJGlSPG3g==
X-Google-Smtp-Source: AGHT+IEE4G/qpX58EhUm1MonVHMQobSiJgTN5F+R/XDKRvfIgvrnS2HXR6msMnAV4g83xTteuIsqwqymEt+VSwymYE8=
X-Received: by 2002:a81:7105:0:b0:608:13ee:8f3f with SMTP id
 m5-20020a817105000000b0060813ee8f3fmr15835ywc.27.1710369639489; Wed, 13 Mar
 2024 15:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220214558.3377482-1-souravpanda@google.com> <20240220214558.3377482-2-souravpanda@google.com>
In-Reply-To: <20240220214558.3377482-2-souravpanda@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 13 Mar 2024 18:40:03 -0400
Message-ID: <CA+CK2bAM4Xe7BT3TFZT-+3qQTFGgkYBiYY=oVkdqMN8gyJg_0g@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] mm: report per-page metadata information
To: Sourav Panda <souravpanda@google.com>
Cc: corbet@lwn.net, gregkh@linuxfoundation.org, rafael@kernel.org, 
	akpm@linux-foundation.org, mike.kravetz@oracle.com, muchun.song@linux.dev, 
	rppt@kernel.org, david@redhat.com, rdunlap@infradead.org, 
	chenlinxuan@uniontech.com, yang.yang29@zte.com.cn, tomas.mudrunka@gmail.com, 
	bhelgaas@google.com, ivan@cloudflare.com, yosryahmed@google.com, 
	hannes@cmpxchg.org, shakeelb@google.com, kirill.shutemov@linux.intel.com, 
	wangkefeng.wang@huawei.com, adobriyan@gmail.com, vbabka@suse.cz, 
	Liam.Howlett@oracle.com, surenb@google.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	willy@infradead.org, weixugc@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 4:46=E2=80=AFPM Sourav Panda <souravpanda@google.co=
m> wrote:
>
> Adds two new per-node fields, namely nr_memmap and nr_memmap_boot,
> to /sys/devices/system/node/nodeN/vmstat and a global Memmap field
> to /proc/meminfo. This information can be used by users to see how
> much memory is being used by per-page metadata, which can vary
> depending on build configuration, machine architecture, and system
> use.
>
> Per-page metadata is the amount of memory that Linux needs in order to
> manage memory at the page granularity. The majority of such memory is
> used by "struct page" and "page_ext" data structures. In contrast to
> most other memory consumption statistics, per-page metadata might not
> be included in MemTotal. For example, MemTotal does not include memblock
> allocations but includes buddy allocations. In this patch, exported
> field nr_memmap in /sys/devices/system/node/nodeN/vmstat would
> exclusively track buddy allocations while nr_memmap_boot would
> exclusively track memblock allocations. Furthermore, Memmap in
> /proc/meminfo would exclusively track buddy allocations allowing it to
> be compared against MemTotal.
>
> This memory depends on build configurations, machine architectures, and
> the way system is used:
>
> Build configuration may include extra fields into "struct page",
> and enable / disable "page_ext"
> Machine architecture defines base page sizes. For example 4K x86,
> 8K SPARC, 64K ARM64 (optionally), etc. The per-page metadata
> overhead is smaller on machines with larger page sizes.
> System use can change per-page overhead by using vmemmap
> optimizations with hugetlb pages, and emulated pmem devdax pages.
> Also, boot parameters can determine whether page_ext is needed
> to be allocated. This memory can be part of MemTotal or be outside
> MemTotal depending on whether the memory was hot-plugged, booted with,
> or hugetlb memory was returned back to the system.
>
> Utility for userspace:
>
> Application Optimization: Depending on the kernel version and command
> line options, the kernel would relinquish a different number of pages
> (that contain struct pages) when a hugetlb page is reserved (e.g., 0, 6
> or 7 for a 2MB hugepage). The userspace application would want to know
> the exact savings achieved through page metadata deallocation without
> dealing with the intricacies of the kernel.
>
> Observability: Struct page overhead can only be calculated on-paper at
> boot time (e.g., 1.5% machine capacity). Beyond boot once hugepages are
> reserved or memory is hotplugged, the computation becomes complex.
> Per-page metrics will help explain part of the system memory overhead,
> which shall help guide memory optimizations and memory cgroup sizing.
>
> Debugging: Tracking the changes or absolute value in struct pages can
> help detect anomalies as they can be correlated with other metrics in
> the machine (e.g., memtotal, number of huge pages, etc).
>
> page_ext overheads: Some kernel features such as page_owner
> page_table_check that use page_ext can be optionally enabled via kernel
> parameters. Having the total per-page metadata information helps users
> precisely measure impact.
>
> Suggested-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Signed-off-by: Sourav Panda <souravpanda@google.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
