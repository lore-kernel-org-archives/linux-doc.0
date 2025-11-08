Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C4D1F4606
	for <linux-doc@vger.kernel.org>; Sat,  8 Nov 2025 01:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762566271; cv=none; b=hR8uqaIzxywpy7f2X14TWMsZwOSeZkG/Cve5ccAFRyDfq/TuRVWn0fQQiKuN8ya/ZBqUIDSeKsGrirt5Psyqin3jFwZg/mOxyI900rsKHToT+ltznttAgszPgaYkg/iOtMnX2CRa+ZNNtfSv/W+gpxWzUYKky/pW93l57EogYI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762566271; c=relaxed/simple;
	bh=0guTedJhI823d1qbNjlNhspFMNH29JHvsn94D1G+3oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mobUX/UFy6une3l7G47bjpuG+DhhOSEazxXwFBEQDC1JJ8BIY/MFOHMshQ90ij6NkTsRxMFdw9h60a+MAdgs1nKmOO4QdCfY1gJDI3nSB11u0uzISCZLxDS2DkfJicaE2pS0PI+2mCUPIYQUJjkOhmAPG+3sjPI7HtSDlm1w4ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bp0nCpkk; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bp0nCpkk"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640aa1445c3so2051255a12.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Nov 2025 17:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762566268; x=1763171068; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHGSN17jZMfxWvKzapCEmQ8MEhEu5sMdAfX0dihLnKo=;
        b=bp0nCpkkMaYh7dUHEUS16T/pw83qBP84bj5zTMZT9adHyfSJK2L4EM7t8OVYzkQSwT
         igVn8PqTPGwXEXia//a5B4T7gUqULyIjvDt4U+CKhclQHo4na0H9hK4+Hq9IZsbwbwkS
         xaoTCpLkhSM2BMRmlPXfBnCog45FwB5oiqM+FYylAqiTIvDfdajgCxPpU8X4PC9xuDWY
         ZIGlLzi5AHUwp/1Ecbq9IKHC+WJv5b2UBQBTB9UEho5FBrn9gagur806LOTZRXK7PT3Z
         YpVSXrTxr8DZc4fVOl+Bm2ywU+VgrMTgRNnnJ4ylmobXYADqxWtB3qDHXYPr9Rbjp3yI
         rdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762566268; x=1763171068;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uHGSN17jZMfxWvKzapCEmQ8MEhEu5sMdAfX0dihLnKo=;
        b=H8cYTuaQRjPVqdxCwEnX+MFjtsTSs8ilvdAzQ4q/KHrOuttCUk7x7cE5haepyorEti
         B7sJIgwGwyJtnzbJawiEGDGksqlxXx7QmyZSkLHv2/l5cCUmRS0ykKVjbmhyEl2FRNBt
         QqZYsoEhAOih6Jzhn7e41EDzsqPUxY57w4ykNa2uUPnWm4fAb0qTkiLYHP6IisK/HUEo
         kEnQ0dnt56QQQ0TbxUJosskpQ+4LtDTIwCNMmKfMv/RK1j51HW1LJ31rTA8CxlH9Z8h6
         +Jq6EH7UWJ3jj9PE8jr8e0i63D62eRKtllgV1EAyYh8DMansVU8+qr8pJAMjqOEBb/WI
         NTiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNdDOw3ocjSrwZZb+61Uq5jM3/aHU391StRmjsk8A3Nc8IBaCiBaI37lrSlV5/dqf2ExQBKH7JtTE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3JJYNhdP/+XOnA88Slipr5fgpIpdygK9pQVw54qGZg2bD0aXF
	FQ0gCiBp+pj4n900PUx12emvJEDT1cwjsdZHNmzdPr4HIabfGK4mJoKC
X-Gm-Gg: ASbGncvlD/GKNrW5ffJ0oQR34pO3P7ewLwymDnKE83IEwtxlVJT1VGGWYnbfqKWc9jq
	MN/GFwr5XAySRxQyWsayrCwg0smJ8o4v+/1GGTqCVCut4rtk0Fz0Z4ux4BbEBe0f0VUCAUzoxhX
	1WI8g1px/rz3AWpgcUm6p9IMvnrMEbKTzDkS+4BSUacQnhlDvcwxcl78gt/XSMYvbZ+GqclgpwR
	GifQ1YN4MiZZZFX6llzMJFxppgyEEfl47/hxedcECwFkhO3BlrodvNbB55OFSNzFx4cSwbqNCH0
	F3PVcflgZSQEwdk5DbTzgHctIN8IDBCCuQGFUZi/ahUV8uHXdhH+Fqi7o+3gqZAxEMxb64FInmx
	zKfEs8rvKER1vqp0PtjN0gVaIpUDOvW87J4/qwQ5aYBA/Bnq7EubXuAqlR2v42qhU2oL2oHN0vn
	ilI+EIueAp/g==
X-Google-Smtp-Source: AGHT+IHhwXLk7xWiTIAmHwBxke3RFdw4hY5rd+dV3nC2lXtWeKTLFKd/7oouP3Wzzn4re7c2VoD8dQ==
X-Received: by 2002:a05:6402:524f:b0:640:c454:e9 with SMTP id 4fb4d7f45d1cf-6415e5cccfbmr868352a12.4.1762566267419;
        Fri, 07 Nov 2025 17:44:27 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813eb6sm5471242a12.14.2025.11.07.17.44.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Nov 2025 17:44:27 -0800 (PST)
Date: Sat, 8 Nov 2025 01:44:26 +0000
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
Subject: Re: [PATCH v12 mm-new 02/15] introduce collapse_single_pmd to unify
 khugepaged and madvise_collapse
Message-ID: <20251108014426.5lwchfsvgkoo72fc@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20251022183717.70829-1-npache@redhat.com>
 <20251022183717.70829-3-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022183717.70829-3-npache@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Oct 22, 2025 at 12:37:04PM -0600, Nico Pache wrote:
>The khugepaged daemon and madvise_collapse have two different
>implementations that do almost the same thing.
>
>Create collapse_single_pmd to increase code reuse and create an entry
>point to these two users.
>
>Refactor madvise_collapse and collapse_scan_mm_slot to use the new
>collapse_single_pmd function. This introduces a minor behavioral change
>that is most likely an undiscovered bug. The current implementation of
>khugepaged tests collapse_test_exit_or_disable before calling
>collapse_pte_mapped_thp, but we weren't doing it in the madvise_collapse
>case. By unifying these two callers madvise_collapse now also performs
>this check. We also modify the return value to be SCAN_ANY_PROCESS which
>properly indicates that this process is no longer valid to operate on.
>
>We also guard the khugepaged_pages_collapsed variable to ensure its only
>incremented for khugepaged.
>
>Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>Acked-by: David Hildenbrand <david@redhat.com>
>Signed-off-by: Nico Pache <npache@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

One nit below.

>---
> mm/khugepaged.c | 97 ++++++++++++++++++++++++++-----------------------
> 1 file changed, 52 insertions(+), 45 deletions(-)
>
>diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>index 6c4abc7f45cf..36e31d99e507 100644
>--- a/mm/khugepaged.c
>+++ b/mm/khugepaged.c
>@@ -2370,6 +2370,53 @@ static int collapse_scan_file(struct mm_struct *mm, unsigned long addr,
> 	return result;
> }
> 
>+/*
>+ * Try to collapse a single PMD starting at a PMD aligned addr, and return
>+ * the results.
>+ */
>+static int collapse_single_pmd(unsigned long addr,
>+		struct vm_area_struct *vma, bool *mmap_locked,
>+		struct collapse_control *cc)
>+{
>+	struct mm_struct *mm = vma->vm_mm;
>+	int result;
>+	struct file *file;
>+	pgoff_t pgoff;
>+
>+	if (vma_is_anonymous(vma)) {
>+		result = collapse_scan_pmd(mm, vma, addr, mmap_locked, cc);
>+		goto end;
>+	}
>+
>+	file = get_file(vma->vm_file);
>+	pgoff = linear_page_index(vma, addr);
>+
>+	mmap_read_unlock(mm);
>+	*mmap_locked = false;
>+	result = collapse_scan_file(mm, addr, file, pgoff, cc);
>+	fput(file);
>+	if (result != SCAN_PTE_MAPPED_HUGEPAGE)
>+		goto end;
>+
>+	mmap_read_lock(mm);
>+	*mmap_locked = true;
>+	if (collapse_test_exit_or_disable(mm)) {
>+		mmap_read_unlock(mm);
>+		*mmap_locked = false;
>+		return SCAN_ANY_PROCESS;
>+	}
>+	result = collapse_pte_mapped_thp(mm, addr, !cc->is_khugepaged);
>+	if (result == SCAN_PMD_MAPPED)
>+		result = SCAN_SUCCEED;
>+	mmap_read_unlock(mm);
>+	*mmap_locked = false;

For all cases, we would set mmap_locked to false. Not sure it bother to adjust
it.


-- 
Wei Yang
Help you, Help me
