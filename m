Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EC233C1B7
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780414172; cv=pass; b=g4BjWAJwopaGxq+yYZUcCgvQfQ7mciymlbRPuOa05P6tS1i7zuW0nWhtRauArmGrXjsw7qUbuy6YEN6+mgZxdRMmoPOKuwcm8l1i7oYJUFgQAIiaU+xcKtPQdzh95FdhmEX9J8sdK+ISiMcqjMCpKMzxL8ZqbYuIHVD99P76aVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780414172; c=relaxed/simple;
	bh=a8rzFTRZmTNeGD9TQ3lwEM3tZ9cTaD8C1O4FRKxZ4Tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SaeAPOdLLOx+JfaNBdiwxkPU8Ltl5XnhEXcA5dS8hWItPDA74TncHk2m24iKIzIKiAaa6KUUi03tjOHuAWH/yew+dNmKadp8/q6jL0YKoejioPBPJCPWl2POtk2ytxncE0gG7LOkCRzVwuHdrg18NLB/uU4gXYRNKRL9dNr/Us4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UvBQGYZR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nMLWNgSo; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UvBQGYZR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nMLWNgSo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780414168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zoHOGHc6Dr79Ii3CKFCTRjW9SLXuC6GuIiX+icbDNi0=;
	b=UvBQGYZR92DCU5YJmrGnaZXVjJXQ/AKOBMTOyg9CdFZZ7dE6o/nNLhHkEPQF9l+R+az/E0
	7yaWvxTrZDCktKrz6twuPxvroESGPqt4bcalZ12+O5pf2hAVqVEtD+o9jTG4n6+Kmkeziy
	p6xAmhtotSXcNkoqG+grUJp1JUCGB4s=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-qj6BETVLNZqEtq_-3rJR1Q-1; Tue, 02 Jun 2026 11:29:27 -0400
X-MC-Unique: qj6BETVLNZqEtq_-3rJR1Q-1
X-Mimecast-MFC-AGG-ID: qj6BETVLNZqEtq_-3rJR1Q_1780414167
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66044a47d6fso8005712d50.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 08:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780414167; cv=none;
        d=google.com; s=arc-20240605;
        b=KR/F8OSIGVs3hSoINo595/ujS2aIh8rbj6D8TVrP8Jqr/OwD+4sensfK596HE6Folf
         7fRZkraDaTDzxXMN2ztwn3fOQyYxxzJsoYOP+TOks5mQ59ufvuc+cgJzYXHamGtMYi0N
         JNtHIoDRWVtPRX7kSMkhYv3nYhNbdA2ZxT1wIb3eXxWJfqG4FF5nYUF5d4lbzh+fLtjf
         Vpc3N9cPUnKp5AiaQkAob0t22CN9S7FpQev8yrmA+PPT3P7ypVEDa5eHdiFNSm6B6n8f
         jJD+duIteqOCKP+6Yk9jx5HN9MGpV2/ka1TI8P71v4KYeG25/q1leRZgmn0PMbaE3AEU
         fwZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zoHOGHc6Dr79Ii3CKFCTRjW9SLXuC6GuIiX+icbDNi0=;
        fh=XDVPYYr0tO7jVkbg3g4C6OQoh08hBKHLtB9LdeLY++Q=;
        b=Joca1hasBAU8qluuW7XMXdqF1Hd49tCBXyRsw+lwr+KpQnwA588SvwLqV2at6zn777
         Z6wIO+beZl/w/7Be7OhOaApUy1ixtO+cYlPyskBL6KJdjKxwhITxIv0H1k4LXlzklH9V
         nEf7gKM3hnQtY4gTzNm3rKM+jaUzSMp1qVnzWC3O/878Dv+4x1fcZxGt1cfZfb1J8d9w
         5Nh3aozWV/+UOI9wqd65H+Mn1Fttdt4ol158dYXQ9FR/GM5sKAxOjMlxI6MUfNjOV/Od
         lMIUV7gH7cebwiXGc0HVAQktFP7YF2M6FuRqoc+5V3z6/cF9rDlyFoPJKTGzyj5S2qJP
         +iHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780414167; x=1781018967; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoHOGHc6Dr79Ii3CKFCTRjW9SLXuC6GuIiX+icbDNi0=;
        b=nMLWNgSoqCrKVCZ/A3iyvgsjTU2MCmVKUj/KL1fZ7Gydjn1jhCPCudPtpSqzIOWiY2
         D0WaJk7nI/Shs4Ry8oIeT5rK1UXP6BV13Iw6zcH1IlSJXZ5olW6xMjpLbejoyD+eU3M8
         hwfN89e+vUPtc5fnOe94PtFILAXAUYROA/goQlZRbukTKvaTJNGdNeOs+JkozBhkv0cG
         wboywymMaqJCGodE2GHTe8NbOzqjL4zh9nPrvf6ULSXyU/cNzoT9bmqcaeXG64wZxwIz
         RqLPv5R4EQRr1q9aRIMFk4QKffdZn0ogLL5z+mDFCF8BIfPVkLOiDXrDWi5+y96eTrcG
         JViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780414167; x=1781018967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zoHOGHc6Dr79Ii3CKFCTRjW9SLXuC6GuIiX+icbDNi0=;
        b=J9sLa1a/AdcFmLtqviTnDJj6d2QCIQ0x6DV+/TsyKCzv7xumKgP217MCyfScaKnGM1
         vbu1Iva3+Srk1oZJCAaIuiw5pps4sZYTP+9r3ekhutwZojbshKlAA+a3G9rGi+csLv2l
         zvsYNKm2gIYwRVG10vOhjqB1sNNPr01075Vxbi7+UPHBv6sG1FYvbyEWUA1uMtitwjfJ
         D+uFh3VCuVMO24QS0zfuzbUY5H8VaHvVVrjiBWbPkjU/pSp+DB7lnBjEfe9vOzHTg+2l
         YtqF5FmnsdDNYmnFc6yHhIVFCk5WRfiOymm+ApfLdEtWdgH7KI7Tc52qSKVju8+Yj4K2
         749w==
X-Forwarded-Encrypted: i=1; AFNElJ+vYaIxIQMFupWUOS15H8r6noJTn0jeuxFnXD/3ICVGimK6BiGEHMH/Hm43jJm6uM5kcVJulAIfeX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLVVfRr8bdoqFkYtVOaNvD524yVr+hDWkywTPPlqCppvOKbP/B
	Svjqww21GjhWD/HsLYqYA1LDGglRg+bjbPCuAUoCex7sFd6BFO9Qgqml4AbsMfyHo0yVRN8Z2NP
	VyubftCRbd0cpleqy0oKcecVx7TlF26ilsBWJ90MSNWvNdR/IHDJ9iuJKFtdGQ/ZAm9AwZUKSY+
	1/7cVg/5TCfREBxd0zYwDgTOFcGMByoTwPVo8k
X-Gm-Gg: Acq92OEL36F/jVHffb+k1+0dfb6OGNndmpwULvs5Y2OpgXimzAsZyL2JhLcHcfCX7Fw
	3eOxI3sICRI84tRIy/kZEqOKbuoDyaonVq/1ZhQfHwAQ1Ca3mUypwDX827Ra0YxtLGWJfG8uT/8
	zI34xaB9atNX87cf3L7vvtqTYjHoc5E+5Dm/WRw2/lSxIlfPUWKpzwhm8MVI8HiuzTao8itHuCM
	vVRaBWjGgp+xhO99A==
X-Received: by 2002:a05:690e:4395:b0:651:bf58:446b with SMTP id 956f58d0204a3-660d5e4dcfamr221852d50.10.1780414167111;
        Tue, 02 Jun 2026 08:29:27 -0700 (PDT)
X-Received: by 2002:a05:690e:4395:b0:651:bf58:446b with SMTP id
 956f58d0204a3-660d5e4dcfamr221781d50.10.1780414166617; Tue, 02 Jun 2026
 08:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2024af56-5e99-4799-a586-e9ba756cecb9@kernel.org>
 <20260601032804.96122-1-lance.yang@linux.dev> <f5d38f64-ab92-496d-afd3-29ccc17fec2b@kernel.org>
 <616de1a8-1cfd-40b8-b04f-7b324be40bfd@linux.dev> <6b11bf0a-769c-4ef2-ac6f-2af38200a6bc@kernel.org>
 <baa0a462-46e0-44ab-b583-c722ad253afe@linux.dev>
In-Reply-To: <baa0a462-46e0-44ab-b583-c722ad253afe@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Tue, 2 Jun 2026 09:30:06 -0600
X-Gm-Features: AVHnY4Kv1G0ugXWOd835wx5jHS-wLy0DPKwsrrM_yqPdHcBhPWzJa9aKptOmpM8
Message-ID: <CAA1CXcD7peS3WHueVgAWhhRrjBO_1b19+Xc0CfZBSO8OwJJKQw@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v18 06/14] mm/khugepaged: generalize
 collapse_huge_page for mTHP collapse
To: Lance Yang <lance.yang@linux.dev>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com, 
	jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, 
	liam@infradead.org, ljs@kernel.org, mathieu.desnoyers@efficios.com, 
	matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com, 
	peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, raquini@redhat.com, 
	rdunlap@infradead.org, richard.weiyang@gmail.com, rientjes@google.com, 
	rostedt@goodmis.org, rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com, 
	sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com, 
	tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com, usama.arif@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 4:48=E2=80=AFAM Lance Yang <lance.yang@linux.dev> wr=
ote:
>
>
>
> On 2026/6/1 18:23, David Hildenbrand (Arm) wrote:
> > On 6/1/26 11:08, Lance Yang wrote:
> >>
> >>
> >> On 2026/6/1 14:54, David Hildenbrand (Arm) wrote:
> >>> On 6/1/26 05:28, Lance Yang wrote:
> >>>>
> >>>>
> >>>> Ah, fair point.
> >>>>
> >>>> I was mostly worried about arch hooks that walk vma->vm_mm again, ra=
ther
> >>>> than only using the pte pointer passed in. For example, mips does:
> >>>
> >>> Right, a re-walk would be the real problem.
> >>>
> >>>>
> >>>>     update_mmu_cache_range()
> >>>>       -> __update_tlb()
> >>>>         -> pgd_offset(vma->vm_mm, address)
> >>>>         -> pte_offset_map(...)
> >>>>
> >>>> and __update_tlb() has this assumption:
> >>>>
> >>>>          /*
> >>>>           * update_mmu_cache() is called between pte_offset_map_lock=
()
> >>>>           * and pte_unmap_unlock(), so we can assume that ptep is no=
t
> >>>>           * NULL here: and what should be done below if it were NULL=
?
> >>>>           */
> >>>>
> >>>> So if khugepaged happens to run with current->active_mm =3D=3D vma->=
vm_mm
> >>>> here, could __update_tlb() hit the none PMD, get NULL from
> >>>> pte_offset_map(), and then dereference it?
> >>>
> >>> Likely yes -- that MIPS code is horrible. And the comment in MIPS cod=
e
> >>> even spells that out. :(
> >>>
> >>> Do you know about other code like that, or is MIPS the only one doing=
 a
> >>> re-walk and crossing fingers?
> >>>
> >>>>
> >>>> Just wanted to raise it since some arch code may still have assumpti=
ons
> >>>> like this, and the always-enable-mTHP work is getting closer ...
> >>>
> >>> Right. I assume set_pte_at() couldn't trigger something similar (re-w=
alk) in
> >>> arch code,
> >>> because we simply provide the ptep. update_mmu_cache_range() only con=
sumes the
> >>> pte.
> >>>
> >>>>
> >>>> Probably very very very hard to hit, though :)
> >>>
> >>> Delaying update_mmu_cache_range() is nasty, as we'd have to make sure=
 that
> >>> nobody can interfere in the meantime ... and the PMD lock will not be=
 sufficient.
> >>>
> >>> Maybe we could reinstall the page table with the cleared (none) entri=
es while
> >>> still holding the PTL?
> >>>
> >>> Thinking out loud:
> >>>
> >>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> >>> index 5ba298d420b7..e39b750b1e6f 100644
> >>> --- a/mm/khugepaged.c
> >>> +++ b/mm/khugepaged.c
> >>> @@ -1413,13 +1413,17 @@ static enum scan_result collapse_huge_page(st=
ruct
> >>> mm_struct *mm, unsigned long s
> >>>                   map_anon_folio_pmd_nopf(folio, pmd, vma, pmd_addr);
> >>>           } else {
> >>>                   /*
> >>> -                * set_ptes is called in map_anon_folio_pte_nopf with=
 the
> >>> -                * pmd_ptl lock still held; this is safe as the PMD i=
s expected
> >>> -                * to be none. The pmd entry is then repopulated belo=
w.
> >>> +                * Re-insert the page table with the cleared entries,=
 but
> >>> +                * hold the PTL, such that no one can mess with the r=
e-installed
> >>> +                * page table until we updated the temporarily-cleare=
d entries
> >>> +                * through map_anon_folio_pte_nopf().
> >>>                    */
> >>> -               map_anon_folio_pte_nopf(folio, pte, vma, start_addr, =
/
> >>> *uffd_wp=3D*/ false);
> >>> -               smp_wmb(); /* make PTEs visible before PMD. See pmd_i=
nstall() */
> >>
> >> One small thing, I think we should probably keep the smp_wmb(), and ju=
st
> >> move it before the earlier pmd_populate().
> >>
> >> IIUC, the ordering we want is still:
> >>
> >>    clear old PTEs
> >>    smp_wmb()
> >>    pmd_populate()
> >>
> >> so another CPU cannot walk through the re-installed PMD and still obse=
rve
> >> the old PTEs, right?
> >
> > There is a smp_wmb() in __folio_mark_uptodate(), that should be suffici=
ent?
>
> Ah, cool! __folio_mark_uptodate() already does the job :P
>
> So yeah, no extra smp_wmb() needed here!

are we sure? that folio_mark_uptodate is done before the PTEs are
reinstalled. Then we reinstall the PMD right after. Currently
separated by the smp_wmb().

I was copying this from other THP code that performs similar PTE/PMD juggli=
ng.

I can remove it, but I'd rather air on the side of caution with this.

>
> Cheers, Lance
>

