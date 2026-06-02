Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F2137F006
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 10:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780397891; cv=pass; b=pPLQBX1ByoQU1jgxFuynfcuf7whaCUXrbBIeI7kN1g1zKhWtjcp6J8EWKkyeO9YYGynzgJ8l7aIq4cUXEMjpWEq+6EiMwvnWICRz184F9I+jAhB3wdNyg23YJPr9h2LmfnQUximEdiAv9hI04IUOKMV8ftVtyCdyM2LzpfqrDrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780397891; c=relaxed/simple;
	bh=IThGWOOZGbVGfuCaLgZyh1XcfzbaXpKlfr5NbCDa4KY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bq6Boi5ea7FfNe+Tm4HNYjCAkSJRHPggtf24q0oYv5cawq6Z/kHPod08lZslEuJGwRwy8jdTetJtI+fsqBgG1xRuY6T+em7mIu9OPAw86b5VJ/ZxOaZVThvY4V/aFjnlIdG+MHO4Bf2lHYYuE9ZXdCODaHCTqzB0tZApa7wDqcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W+uq8hrC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FWRhYKLF; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W+uq8hrC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FWRhYKLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780397889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lzLj+P+CIxVIK1VlPvMvdq94QC/E8hMOQaV32XaaoGc=;
	b=W+uq8hrCIiZeSY5aG0+UkAh67C6CKkCXFSs1YTHS1MSMDQyrRbf9mecfXgveFI0f+AauAk
	/w+2wL8Gn9F8tLnToUTzqprr27JnLrEQp+DLI/0EUReqW8oK80Nngg0xh0b1C8JYDVd2Bw
	sLdjUEU+RmWPR1R8kSZfHbzB/WofkCE=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-peFFy0FbMf2oAniZnG2dPA-1; Tue, 02 Jun 2026 06:58:07 -0400
X-MC-Unique: peFFy0FbMf2oAniZnG2dPA-1
X-Mimecast-MFC-AGG-ID: peFFy0FbMf2oAniZnG2dPA_1780397887
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6605694a059so5357888d50.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 03:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780397887; cv=none;
        d=google.com; s=arc-20240605;
        b=VZFvlAqmdrThxkc/Pdij2oHvCoofXWFu4zc3GmYj/U0WlSJdTELVE09u9UDUgoCsbt
         nVIdNe4AMrp4+SjVAqZ7qn0kInhI3DKqj+pdRhD608vDpMUBevZJt58AFQeK/5x88fu4
         jd7WVwLVSKWJfT6J9aNnmBaJVqCSxzUS+64bKfpMpzh8iIP01z6ZnIad6bPq1sRJm4Kc
         iVLPhNAl4WF4A2ZxiI5bXwSLo1VDrP8KGp5pBxgFoa1jjW2kW8Sz8UcSm61SVcptrbZ0
         nIVXrvwt+AeLOLnT0u93YaSRpBy9BBxNcIiyOwqd/hcDoJMR5c4THZmrqn93oF4qN7wt
         VQPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lzLj+P+CIxVIK1VlPvMvdq94QC/E8hMOQaV32XaaoGc=;
        fh=iRmbNBvmTVOaaG15gglLhUK1mnHiint5PALrclwTl7c=;
        b=J6h5n+hgVRBZJ/ITklFcK9kh4lH0dFnRyrOPhg8ZDos3kc0nyDDiEK68anjZGMf2+4
         7F8nw3kJlnP8PTrRmVsA6ANlZVOTqa3tsYi512t569HpRjeCb1WZZp9ID4opECFCl/OF
         ySCu+HpSHy7AybjodeKV1l8haAzGsOeDrGBGCX5mP8su4Y4IHM+x4N/pzlR1J2CIB2UE
         7wM3XP+7MA2jVZS2YGpQDN8w0szjcXJ4eANxYsldYWW79DV0HWkN9ldvOiA0OsIeEJPe
         vdkiqJra7ZeKMyo+O5MVTGRCNdfJghizoL1aldbdA76bJTMFlYO0TR7pxnAlZcUYcA76
         CVsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780397887; x=1781002687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzLj+P+CIxVIK1VlPvMvdq94QC/E8hMOQaV32XaaoGc=;
        b=FWRhYKLFrGgmtK88SrdZ+1Q2uAYrUzcxByt7Jze8CahrRoufFdYCNUfiT00SXg/aDV
         Oy+MWVXHGQGaC5ODn0066KtKEK2x4hsQ/bJCP14/7xDM1mLSBVAsf4g6xUYrg6B8Cvdo
         QgJxVKy2WcZsMK7dgfI33/Ft+EsIpMga2SuKMVSLOHuU3CmDRM8hLmSWGbCCYV3jDqJq
         C9xUFPedYDrpVlWZvx4/paB2aUOZYXejTJ6OFSdvAqvvzecTd5HS2lAz6Rp2wee+GuIy
         y2ahz1ALCphFWkHpsZFLy/3A0dht0q+JNc7jcAE5bhGv7og3nZyvRaWGHPuuYY2syJQ1
         K5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780397887; x=1781002687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lzLj+P+CIxVIK1VlPvMvdq94QC/E8hMOQaV32XaaoGc=;
        b=V6cd5uf8ZtYZyxg8olldUcSyl+92GDh59A+C7BEbRCDvVvQ0x5pUwHkY/IJdjYa/aP
         Hlghru2+Nuz1xYMXmuX87G6yQhU2dFvISiDrUgiUWQlV1yTaOmpzFcUe74rRDmuZY08J
         rMa7lmPgmJyDLLLhe0WnvlUKSaJVa5QGg5TCbzNamTt64G9r9/vkj3Sqr+nN/Uyc0Y2A
         Gr8V23RLSPSj6GtnN11Dzq07BZW8WcLmjl4D8NJtl3tMNYVImDXEXsNagBc3VZ8LuvAy
         +X/XY85QYuhfAwwcXVS4WVJETA/QSwjuef1LRxp8DEfRN64/XA4DMoe9hLR607kTBPW1
         6ihg==
X-Gm-Message-State: AOJu0Yy6B7xGxNNr/5XTHpoX1t6/DC7r/FnMnYqVwB61DcfCWy62lkgC
	5RcEe2Ll4UaJAZ8917b7gzZuxRn23qu3mJTYfLldYW1WMGOVGuV+ZsVjK2k2LH+J4+4iGD2UgDe
	AEkcuBMXtuvcRF63NoyZXQHlGpTefpz4K/4pgXPfr384d2CPx2QLPh+23TGJ/8iV5fj0ig5Cqu+
	/qpuE5kAYDQtSLkCysLA1hgG7eyoZ35igtvaWC
X-Gm-Gg: Acq92OGSGWDMXmXcMCCPNyd7Q8pTcxwALPPBbyzoqlEX/GkBck2m7AKiSRNhphjW4Pz
	z37gcpWnv4Mx932R7cNI7qeW2PcnF5iwFRs99JoRjoN4WuxJnXVOB9VkUGRlVdTCF4yv7HoLsZ4
	Q64LPQ8CfVXFT85hSzezA+Yzc7tjGFzQAysF1CZBZzTCgtS4wwxm0l9fNfgLdPKORGmNdpM/qFy
	gK5ka0UMxhLqGpNSA==
X-Received: by 2002:a05:690e:4084:b0:660:8253:b836 with SMTP id 956f58d0204a3-6608253ca8bmr7541728d50.5.1780397887238;
        Tue, 02 Jun 2026 03:58:07 -0700 (PDT)
X-Received: by 2002:a05:690e:4084:b0:660:8253:b836 with SMTP id
 956f58d0204a3-6608253ca8bmr7541686d50.5.1780397886838; Tue, 02 Jun 2026
 03:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522150009.121603-12-npache@redhat.com> <20260531071845.10875-1-lance.yang@linux.dev>
In-Reply-To: <20260531071845.10875-1-lance.yang@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Tue, 2 Jun 2026 04:58:46 -0600
X-Gm-Features: AVHnY4IqE8U3CJE9xIL2UnupWmTAd82eHE7h-QioX8Ctpe94C2G_M5ur14b-CTk
Message-ID: <CAA1CXcA+oZmp=cxiC2_EBDxqGX94gAd335d9eFPNv=j_0=og7Q@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v18 11/14] mm/khugepaged: Introduce mTHP
 collapse support
To: Lance Yang <lance.yang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, dev.jain@arm.com, 
	gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, 
	jackmanb@google.com, jannh@google.com, jglisse@google.com, 
	joshua.hahnjy@gmail.com, kas@kernel.org, liam@infradead.org, ljs@kernel.org, 
	mathieu.desnoyers@efficios.com, matthew.brost@intel.com, mhiramat@kernel.org, 
	mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, 
	raquini@redhat.com, rdunlap@infradead.org, richard.weiyang@gmail.com, 
	rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org, 
	ryan.roberts@arm.com, shivankg@amd.com, sunnanyong@huawei.com, 
	surenb@google.com, thomas.hellstrom@linux.intel.com, tiwai@suse.de, 
	usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2026 at 1:19=E2=80=AFAM Lance Yang <lance.yang@linux.dev> w=
rote:
>
>
> On Fri, May 22, 2026 at 09:00:06AM -0600, Nico Pache wrote:
> [...]
> >@@ -1587,10 +1749,11 @@ static enum scan_result collapse_scan_pmd(struct=
 mm_struct *mm,
> >       if (result =3D=3D SCAN_SUCCEED) {
> >               /* collapse_huge_page expects the lock to be dropped befo=
re calling */
> >               mmap_read_unlock(mm);
> >-              result =3D collapse_huge_page(mm, start_addr, referenced,
> >-                                          unmapped, cc, HPAGE_PMD_ORDER=
);
> >-              /* collapse_huge_page will return with the mmap_lock rele=
ased */
> >+              nr_collapsed =3D mthp_collapse(mm, vma, start_addr, refer=
enced,
> >+                                           unmapped, cc, enabled_orders=
);
> >+              /* mmap_lock was released above, set lock_dropped */
> >               *lock_dropped =3D true;
> >+              result =3D nr_collapsed ? SCAN_SUCCEED : SCAN_FAIL;
>
> Hmm ... don't we lose the allocation-failure result here?
>
> Previously collapse_scan_pmd() propagated SCAN_ALLOC_HUGE_PAGE_FAIL from
> collapse_huge_page(), so khugepaged would call khugepaged_alloc_sleep()
> in khugepaged_do_scan().
>
> Now if allocation fails and nr_collapsed stays 0, we just return
> SCAN_FAIL. So we won't back off via khugepaged_alloc_sleep() anymore?

Ok I did the error propagation! I think I handled both of these cases
you brought up pretty easily.

However I don't know what to do in the following case: We successfully
collapsed some portion of the PMD, but during that process, we also
hit an allocation failure. Is it best to back off entirely? or can we
treat some forward progress as a sign we can continue trying collapses
without sleeping.

Basically, do we prioritize SCAN_ALLOC_HUGE_PAGE_FAIL or the
successful collapses as the returned value?

This is what I currently have:
done:
    if (collapsed)
        return SCAN_SUCCEED;
    if (alloc_failed)
        return SCAN_ALLOC_HUGE_PAGE_FAIL;

Thanks,
-- Nico

>
> Cheers, Lance
>

