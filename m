Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8827932B125
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 17:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780592638; cv=pass; b=XlUt1pem258GhcpNEszQpIxng4TO5j2Gdvu/cFruuhEzjw2kzIjUEIci9CwhY9gJIqpRtNNQw8wXM7YoVh/50+V3Hx9+HoHxWqGXTY4VcIg5R+vSk2lHKzMqT6Ub+V4bqldA6U5ZCVWpxD7JW4FPseuoF8jLAg5v7zJ12aL+qvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780592638; c=relaxed/simple;
	bh=CS8LTr/ytbf5VzNbA+58AYmQySqtkVsv4R0NV1X3qU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U96JXJ2CcwqtWjd3TwFRKTTxlzOez2XWOOOvze0ayDZMuWV91+ngNjrhEwvG1mrJ1t/yz8pyFV98pUdAKwGD7QhIqL0Nj5cuEdhQz1h9eczQj0gZbq1oY78WXyGjDG09J515/+ninWOB0zrkotX2QCc+R4cO5UqiKka4xOgE96w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KixjPKkc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mnr2S9PW; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KixjPKkc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mnr2S9PW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780592636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mFdbSvVLclwxYmscPcZ8kkZXJU9Ks9VowvahVknrrs4=;
	b=KixjPKkcIh2mT0u10q+P/TOAblb3SHaXmQr7H6VDzAOZL1j+HZMvdcWNnidwC2KTk0Lv5E
	EdqZZc3Diaf+nx7m3IFz2vQWpc0BdPKy+yn5Ej7c/rzCoAsZ0X1GX0XKNIg4KZ4g0dkTMU
	tCdQHdIpONx3r3f9Lmy6RXjaLSiMU30=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-wkUr9ZYFM8-BSzEIls9EIg-1; Thu, 04 Jun 2026 13:03:55 -0400
X-MC-Unique: wkUr9ZYFM8-BSzEIls9EIg-1
X-Mimecast-MFC-AGG-ID: wkUr9ZYFM8-BSzEIls9EIg_1780592635
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66030c38630so1069565d50.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 10:03:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780592635; cv=none;
        d=google.com; s=arc-20240605;
        b=EA1jUdyiDa2Z4HNpY63cTI8WLTkST3kYvlrit+eiKdJra/IrxgVDdkm4qsGH4a67gO
         9ZDzIsiPNUxyIOLsLJZybe9M6c76ckKpo30fMcuE2u+8XYWSSmVcrj1RMKthZglMUSis
         v6+eSdrJCMpbHcnhEOnsrfiQRv9Z0wC0Ja6dPM76fvWHu8dPykn8O/53To0n16NLv9sg
         JIrxIAMLtuyGw6FCwZ1pVO6r8S4ZJXXhrPeSoA/rQ3T6CZ4rhD66+OwOJl9q1v4ZOUIF
         nL+FfLBalEGq9H5Eb2sFjK7VTf8V5oHsqX72R5KZEGnOwQYzNAbwHWMf9byQfr/B/Xup
         nO7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mFdbSvVLclwxYmscPcZ8kkZXJU9Ks9VowvahVknrrs4=;
        fh=GsejEyc06MadlX6JshkwcR/bTeDgL0TfSU015kOQugA=;
        b=i0Hf7WEPTmjE1QDfBLyIJcUeDKu1fudIsZ+EgNMTvS5PaEgGJpihhwt+NIjw01ivHm
         ZlBSZfostij+ev25URfjpRIHR2TmwM1eeteJ8IHp57iAZrte8GfBFZr75i0To6T1bDY/
         MmjBH88irpoU/pBpwocZGdXafkUH/463pKPkjG7cOa4NkGaXIndfmjDRhVIcBK9WBIAh
         tRSvY7zJeXc5AAJVA9hi/7kSh0AMRGexyrWrLV8s83rv9uILHpbasBjA4wBBtwfPJruO
         B7uBuYU0Cphhe4+mygZrBpGrPq4rJ6NfRZngnepZ6MgMyYvAVwAanlTKI6B/3zQ08PTK
         YlYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780592635; x=1781197435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFdbSvVLclwxYmscPcZ8kkZXJU9Ks9VowvahVknrrs4=;
        b=mnr2S9PWsd/R7OUEDPrbVuP3IYUy5+AVljybs8aW64MgIOlvXAuPmOp71EpWIj6eCP
         BUGWyq4lKK2XeTwvyjQ3BOsgwSaK0VDiwes+UFQxybyExqseR3U+n0blc0N6snJs1vCe
         3oLdR2aH6vc4mVIvgWTKF26olbLm0QdBueYfVak6qV8MfR712q/DNA4Hqk7a5corZAdR
         ufmc1jb8G2xYOBqczWLDtYjF2TUruRtf783ldRIEKjEAaWZV8Sj5x4aBXDmoAO3+xdjq
         GAW+wx6a3PIfOXlKLZqPCqvTbWeO5Vg4vc6pu2NLg3Jn4i38H3D90Y0PUsgDP/7SSqxL
         xSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780592635; x=1781197435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mFdbSvVLclwxYmscPcZ8kkZXJU9Ks9VowvahVknrrs4=;
        b=TA3U1VcQsV7DetrXIAd4ZivSIDzQ8s8yUrOHz/WhTHLYw4xOkEaGFukEoUiC7sRtzr
         bPQP5Aznd0VpIePUbw85S0U6QfmypiA4jyO7j6KYZ1V+27uKqGlRjoy8bfjlplyLFvfu
         CwNojMIc3alkpr6Cxp5NPFSh0OfGalLfFO0beCCI7DpH00zWKQcMXVXzAxOichuApWLT
         tt3FlbKADlRDUgeESKkTnHYTPP83rr8AIaQsins0Fsd0O5kwLbFhKZnTcaUHlWpiSg2G
         b/bov60GU/Dm+c8VkC8w1lQKTpIIixmbywZ1TSXjhicZKXWo8Y5fLfZZLrKgsciHXchk
         X8XQ==
X-Forwarded-Encrypted: i=1; AFNElJ9k9r7OX8ZIjbxzHmt4BG4LgP4T1an0IMX7wIE93LmKeSDzRbJghvADiOWUOao1qKDocMXkl7jKkQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Tz7QL6X2esRi5OkNTf0IaJVCS9Z1vpYUF7hhEuXOk0Dx0AgJ
	NmgPWgZungWx4sHkZgCPYlo3WRdhSuzn0T2ddeYP4VhIVvDwjX3GrhPIaNv5+Ie+3r2kJGxdqMD
	efXoeeauE1hVS1OTdzg6HCMB02saHa4w5nR/JjX7LX+EitOoHPxIbTt1InIx9/uc2Z888l3MiLZ
	c/nUXxuZCxNme0j0/TVMYeF8N8P+0e2LkfHypN
X-Gm-Gg: Acq92OFBzBVwyp9sGmOnyX399DqvdGFtWVq5Gg9/7U0aq/7TAXGt4vdjqTSyMrn4ywH
	Tk8ffK6vKyxCkDbQsf+CgMXwtf8PQEuLXIFsdFmrTuHt0OHFUQvsckRWD+3ymlcXssVcw61Lyf7
	5tzQthutkFUbJv/U4fYIMZUCcDcWx0tR94y8xVE+VwgAploYl308wR+hmFvHsejDn7yEQp3NNdX
	oKa/QR0kTEqdZw=
X-Received: by 2002:a53:d016:0:b0:660:689b:1539 with SMTP id 956f58d0204a3-660dc5af389mr7257845d50.58.1780592634567;
        Thu, 04 Jun 2026 10:03:54 -0700 (PDT)
X-Received: by 2002:a53:d016:0:b0:660:689b:1539 with SMTP id
 956f58d0204a3-660dc5af389mr7257769d50.58.1780592633890; Thu, 04 Jun 2026
 10:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2024af56-5e99-4799-a586-e9ba756cecb9@kernel.org>
 <20260601032804.96122-1-lance.yang@linux.dev> <f5d38f64-ab92-496d-afd3-29ccc17fec2b@kernel.org>
 <616de1a8-1cfd-40b8-b04f-7b324be40bfd@linux.dev> <6b11bf0a-769c-4ef2-ac6f-2af38200a6bc@kernel.org>
 <baa0a462-46e0-44ab-b583-c722ad253afe@linux.dev> <06d9b665-945f-4967-9ed9-b06514478996@kernel.org>
 <CAA1CXcAeEGOsqp-ywAQ7GMYQzXEeco-rUxUkk2hEF69HybC4=w@mail.gmail.com>
In-Reply-To: <CAA1CXcAeEGOsqp-ywAQ7GMYQzXEeco-rUxUkk2hEF69HybC4=w@mail.gmail.com>
From: Nico Pache <npache@redhat.com>
Date: Thu, 4 Jun 2026 11:04:35 -0600
X-Gm-Features: AVHnY4I_L8TwfZPfpH2lQFz1V2RvpVRsRnPJ_VPp-rqHDi22wC_1Io6tlGI8brU
Message-ID: <CAA1CXcBSPVG4CJFCBDvbuodcJ_7eXoDQTpK0ZN0HEhkDPi-DEw@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v18 06/14] mm/khugepaged: generalize
 collapse_huge_page for mTHP collapse
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, linux-doc@vger.kernel.org, 
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

On Mon, Jun 1, 2026 at 9:00=E2=80=AFAM Nico Pache <npache@redhat.com> wrote=
:
>
> On Mon, Jun 1, 2026 at 5:14=E2=80=AFAM David Hildenbrand (Arm) <david@ker=
nel.org> wrote:
> >
> > On 6/1/26 12:47, Lance Yang wrote:
> > >
> > >
> > > On 2026/6/1 18:23, David Hildenbrand (Arm) wrote:
> > >> On 6/1/26 11:08, Lance Yang wrote:
> > >>>
> > >>>
> > >>>
> > >>> One small thing, I think we should probably keep the smp_wmb(), and=
 just
> > >>> move it before the earlier pmd_populate().
> > >>>
> > >>> IIUC, the ordering we want is still:
> > >>>
> > >>>    clear old PTEs
> > >>>    smp_wmb()
> > >>>    pmd_populate()
> > >>>
> > >>> so another CPU cannot walk through the re-installed PMD and still o=
bserve
> > >>> the old PTEs, right?
> > >>
> > >> There is a smp_wmb() in __folio_mark_uptodate(), that should be suff=
icient?
> > >
> > > Ah, cool! __folio_mark_uptodate() already does the job :P
> > >
> > > So yeah, no extra smp_wmb() needed here!
> >
> > Yeah. BTW, I think we'd need a spin_lock_nested(), so @Nico, treat my c=
ode as a
> > draft.
>
> Okay, I read the above and did some investigating.
>
> I will try to implement and verify the changes you suggested :)

I've implemented something slightly different actually and I *think* its be=
tter!

} else {
       /* this is map_anon_folio_pte_nopf with no mmu update */
        __map_anon_folio_pte_nopf(folio, pte, vma, start_addr,
                      /*uffd_wp=3D*/ false);
       smp_wmb();
        pmd_populate(mm, pmd, pmd_pgtable(_pmd));
        /*
         * Some architectures (e.g. MIPS) walk the live page table in
         * their implementation. update_mmu_cache_range() must be called
         * with a valid page table hierarchy and the PTE lock held.
         * Acquire it nested inside pmd_ptl when they are distinct locks.
         */
        if (pte_ptl !=3D pmd_ptl)
            spin_lock_nested(pte_ptl, SINGLE_DEPTH_NESTING);
        update_mmu_cache_range(NULL, vma, start_addr, pte, nr_pages);
        if (pte_ptl !=3D pmd_ptl)
            spin_unlock(pte_ptl);
    }
spin_unlock(pmd_ptl);

The logic here is that when the PMD becomes visible, PTEs are already
populated (no possibility of spurious faults on local CPU)

the SMP_WMB makes sure of the above

And the pmd is installed with the pte and pmd lock both held through
the mmu_cache update.

This follows the conventions used in pmd_install() and clears the
potential for local CPU faults hitting cleared PTE entries.

I think both approaches are correct but this prevents any possibility
of my first point. although mmap_write_lock prevents this too.

Let me know what you think. I can revert to your implementation but
this is what I tested.

Cheers,
-- Nico

>
> Or an even crazier idea... what if we ensure MIPS checks for PMD_none
> before walking a PTE table?
>
> -- Nico
>
> >
> > --
> > Cheers,
> >
> > David
> >

