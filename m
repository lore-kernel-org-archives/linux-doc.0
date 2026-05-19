Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DD7367B93
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 18:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214896; cv=pass; b=jGNiYQsoPexNwbJeZjA1bY1HelIfQgTjCDF9eVkJQ3JHbBTZRy69A9hmtjAbOHZElWTuNuk03Oem1a2tJyibHWT4rNP7M/QpFORd3wMdKcR6kvBufjMd2/2w8l8fEaWZGDCn5i0JFuVMIWBtXxxwDiDwdjREvrcKGYLx7d3nckU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214896; c=relaxed/simple;
	bh=vhtcXwQD8YJQSGdo3aMKsTCwEJjn77r4Cw/82Nag1iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEJ84OVWKJpI/0ms33BPQ7xu8sKyP/iaEd/AqEG0V7/o4Ipr8FH+woxasZ6pIba2hZXmfxO0jw6UFC6ZeW9aRfaS2ZNaiqBgqnIcC4hnonj18EJnZPgZ5/xl1+5aTZ6KT1WctaVfRpF8pBRFkN/zsJ1YH6GRClw+Y2GK+HWG10A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gB8ktIFu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y0Eb7Scx; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gB8ktIFu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y0Eb7Scx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779214894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OxztUpQkc+oYoV60aAGxfNnNqxyt9Qiie0vehvZmWfQ=;
	b=gB8ktIFuH0r4RxuFG2QGld44EMxqaovY/4jQcgsVny7tD6ZIrA5vUpjn/1jzPTBR/kBHdZ
	KTGylB3kNohj+hkeFcFsp5H43O/HdtJ6R3wSYpfTnLX9+VuDXHCOSTaUivGeP4JosOuu0x
	s2t4my//5pasTbwKmQain0yF7Dlhi8A=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-DJaIu_H_N-yjkdftfY7ibQ-1; Tue, 19 May 2026 14:21:33 -0400
X-MC-Unique: DJaIu_H_N-yjkdftfY7ibQ-1
X-Mimecast-MFC-AGG-ID: DJaIu_H_N-yjkdftfY7ibQ_1779214892
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-65c7306e432so7190432d50.0
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 11:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779214892; cv=none;
        d=google.com; s=arc-20240605;
        b=YaJa9guEjYzaoPFWHWICm2XiM/zdAd3DzyU1TwZy01XrXW48QdsWZzr6fy4w9FpwiV
         +2iymox+VzFYlYD2oiugCvmPL61IWYXk2FLvBybvm3lpkK81LM4acgUBaZl4OrJMdY/b
         ZOtK6jX9wd7Sg2MikatNq8Xrd2DCFjeUDr3r2zAQpA7uSB2X1m4K3b6Z5vwHcAs+Dfzq
         14S0AQ1Dp1wMWnyFRuJZMARUZ4XW/oN2L+77eSCnTaVKL7ETM6guFcALV0yD3B0sPBXp
         ja6hk0O8QDG4ghX9Whk/iurVit7f5cLf8OApJL8cwkOdPeTBM5QAlT7/yOzx5nFEcvuG
         PjNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OxztUpQkc+oYoV60aAGxfNnNqxyt9Qiie0vehvZmWfQ=;
        fh=SvM8TPYVHYUvmD/OiutkcfK+gFB42ryEWKY3OngJP+I=;
        b=JbDrEnuh8qL3UEtuP0MmEXCIUhx7PLqT9eTqU+2+vOtb49/mx+vOcjsbuaR6lqbIqm
         VFXs9xSVKHUwJTQ9dndx6BrKBTMaHPB3hvjvF/ZxxjUoSlLFdG9ILy1nEBl7MtCopF9m
         0xNhcj7E7UsJDzzSxjTSdP1LPjcW0/NEy2qwfawHXFEOpteuGBtxJG8YGZSeMk6HEmtJ
         PFmbNWu6QoTKjutOPyQsUc8uuhVbOenNQHjEFrDM5e7SVxPiaN9MiN0GsvpL3/HzNtHT
         9nCqZUljeA+dFHx+Ma+BOzYyAaZ6V+A7vk6/7sBCBrx6pb9G7Tlzz/WsePbGcxK+KIJf
         E+yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779214892; x=1779819692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxztUpQkc+oYoV60aAGxfNnNqxyt9Qiie0vehvZmWfQ=;
        b=Y0Eb7ScxBhPV6XIB1Q6Gdg+ZCQOfQ+22d5PHaW73YMmpWWuIeUfrX/GxAr+zIo6ulE
         tIT6WHzV6Py9l2Rji2fXQpSSjiZjw/eX2LyKaJxl1A6r4+NmNACsz/m8zCwXOwxGmPwE
         eezmuLt6fr2mfzDaDV4yFTVB0bxmsGpdZSYUg77c/x7/RkYI3tyrmY/F7iVGRUdT1zJv
         tERuoPpfLXyR5BQNz+m7RysBOQQTFb9bgv+NWGqnkMClwM+z6eK1j5D+ab3ZFOrniJKQ
         oBHMhJu3HxVhBomOau2ytGTxYvbpZJZJ8c1/7DskMBvlWy0Rvjt62A9PF8wnSLT3mTeO
         xtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779214892; x=1779819692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OxztUpQkc+oYoV60aAGxfNnNqxyt9Qiie0vehvZmWfQ=;
        b=DGUeV2n/SRBlvOriXqCxaXeOIGIKVvPZgnzNmhz5oj2UXMzKDg5/6y0WTPKz8XZt0n
         sxBnDXyI8FE6MmHt7ESWTtyj+oK2Y53sK77k2z8nhA2mrCiDwIoeGVaL0HEJYI3U1qrk
         bxSe9EYhtzIbjMuaU9WzR6qeVJLFDRX5tYwu7eK1z9CpQgcH6r3uh5ikJLtXxwgeI1tk
         PNm/g3H2etAL2E7f8b44MhBW9HMErz8dpDNBWVjr3rcGQlWAGAXVkq708+gGAu3TASI3
         Z1H/WfJTFfc2ETG+0e58Qzu2Q48zjO2QOF8GMy4lVs37BHmgeRoBN/qv1iH9xcs+nK6i
         N0xg==
X-Gm-Message-State: AOJu0YxYd+s4FAIXR5sbgXHEjCtyYi/V+LNcz4OTVs8C6Lual0uWRPZM
	SFFdSRjE7jjJOu59KBrWX0Rj+ENkGX3SSLBvLxtgWO39i2MVEXsPrg5A9jaAcxBzab7wHTaQmEw
	wGFBkjoQIO1Y2ha6yuVkXcxNJG3PNgX7C9XBcXUUGOH+boCKX9kkddC+x2pf7bHQafHlIuvWyMk
	L+nO9cJLU4yCKpaGuMvsunfe5nNNgQ5M0NzyTy
X-Gm-Gg: Acq92OEFyxSVBnMYThV2jJp2xDiVx8WJIx8RTjtllxxQi4ubiQCbx4P5a0RQl1d7oX9
	lUZTvZxIRYK31OYP4MiMu7LOwgQKTiMLmSbiLt9HL4A1a9TiH/+zVQoKP2ZOUx1oXBdDBKQeaRy
	hiPbD8YsOSiZ3Ucpiz1H0tqaTLAQ+WlyTmURQA2EervYsV6t+ZtgCPCaEFqidg80BbKe1LpcUYY
	hm2hQ==
X-Received: by 2002:a05:690e:1699:b0:65c:5b88:849f with SMTP id 956f58d0204a3-65e22893f96mr20651138d50.45.1779214892499;
        Tue, 19 May 2026 11:21:32 -0700 (PDT)
X-Received: by 2002:a05:690e:1699:b0:65c:5b88:849f with SMTP id
 956f58d0204a3-65e22893f96mr20651073d50.45.1779214891824; Tue, 19 May 2026
 11:21:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511185817.686831-4-npache@redhat.com> <20260512044444.71798-1-lance.yang@linux.dev>
In-Reply-To: <20260512044444.71798-1-lance.yang@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Tue, 19 May 2026 12:21:58 -0600
X-Gm-Features: AVHnY4I0H7_VzBvKWPdyr4SDWj9fF1lT1UTvqSSOtSQqNmJ-nBt_6GnPLA5-X2k
Message-ID: <CAA1CXcD=-kia9FPK75DggewQk4x52TvzP-Wwoe-CrcMx9wTg_w@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v17 03/14] mm/khugepaged: rework max_ptes_*
 handling with helper functions
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
	zokeefe@google.com, usama.arif@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 10:45=E2=80=AFPM Lance Yang <lance.yang@linux.dev> =
wrote:
>
>
> On Mon, May 11, 2026 at 12:58:03PM -0600, Nico Pache wrote:
> >The following cleanup reworks all the max_ptes_* handling into helper
> >functions. This increases the code readability and will later be used to
> >implement the mTHP handling of these variables.
> >
> >With these changes we abstract all the madvise_collapse() special casing
> >(dont respect the sysctls) away from the functions that utilize them. An=
d
>
> Nit: s/dont/do not/
>
> >will be used later in this series to cleanly restrict the mTHP collapse
> >behavior.
> >
> >No functional change is intended; however, we are now only reading the
> >sysfs variables once per scan, whereas before these variables were being
> >read on each loop iteration.
> >
> >Suggested-by: David Hildenbrand <david@kernel.org>
> >Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> >Acked-by: Usama Arif <usama.arif@linux.dev>
> >Signed-off-by: Nico Pache <npache@redhat.com>
> >---
> > mm/khugepaged.c | 118 +++++++++++++++++++++++++++++++++---------------
> > 1 file changed, 82 insertions(+), 36 deletions(-)
> >
> >diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> >index f0e29d5c7b1f..f68853b3caa7 100644
> >--- a/mm/khugepaged.c
> >+++ b/mm/khugepaged.c
> >@@ -348,6 +348,62 @@ static bool pte_none_or_zero(pte_t pte)
> >       return pte_present(pte) && is_zero_pfn(pte_pfn(pte));
> > }
> >
> >+/**
> >+ * collapse_max_ptes_none - Calculate maximum allowed none-page or zero=
-page
> >+ * PTEs for the given collapse operation.
> >+ * @cc: The collapse control struct
> >+ * @vma: The vma to check for userfaultfd
> >+ *
> >+ * Return: Maximum number of none-page or zero-page PTEs allowed for th=
e
> >+ * collapse operation.
> >+ */
> >+static unsigned int collapse_max_ptes_none(struct collapse_control *cc,
> >+              struct vm_area_struct *vma)
> >+{
> >+      // If the vma is userfaultfd-armed, allow no none-page or zero-pa=
ge PTEs.
> >+      if (vma && userfaultfd_armed(vma))
> >+              return 0;
> >+      // for MADV_COLLAPSE, allow any none-page or zero-page PTEs.
> >+      if (!cc->is_khugepaged)
> >+              return HPAGE_PMD_NR;
> >+      // For all other cases repect the user defined maximum.
> >+      return khugepaged_max_ptes_none;
>
> Nit: kernel code usually uses C-style comments. This could be:
>
> /* For all other cases, respect the user-defined maximum. */
>
> Also, s/repect/respect/.
>
> >+}
> >+
> >+/**
> >+ * collapse_max_ptes_shared - Calculate maximum allowed PTEs that map s=
hared
> >+ * anonymous pages for the given collapse operation.
> >+ * @cc: The collapse control struct
> >+ *
> >+ * Return: Maximum number of PTEs that map shared anonymous pages for t=
he
> >+ * collapse operation
> >+ */
> >+static unsigned int collapse_max_ptes_shared(struct collapse_control *c=
c)
> >+{
> >+      // for MADV_COLLAPSE, do not restrict the number of PTEs that map=
 shared
> >+      // anonymous pages.
>
> Ditto.
>
> >+      if (!cc->is_khugepaged)
> >+              return HPAGE_PMD_NR;
> >+      return khugepaged_max_ptes_shared;
> >+}
> >+
> >+/**
> >+ * collapse_max_ptes_swap - Calculate the maximum allowed non-present P=
TEs or the
> >+ * maximum allowed non-present pagecache entries for the given collapse=
 operation.
> >+ * @cc: The collapse control struct
> >+ *
> >+ * Return: Maximum number of non-present PTEs or the maximum allowed no=
n-present
> >+ * pagecache entries for the collapse operation.
> >+ */
> >+static unsigned int collapse_max_ptes_swap(struct collapse_control *cc)
> >+{
> >+      // for MADV_COLLAPSE, do not restrict the number PTEs entries or
> >+      // pagecache entries that are non-present.
>
> Same here.
>
> >+      if (!cc->is_khugepaged)
> >+              return HPAGE_PMD_NR;
> >+      return khugepaged_max_ptes_swap;
> >+}
> >+
> > int hugepage_madvise(struct vm_area_struct *vma,
> >                    vm_flags_t *vm_flags, int advice)
> > {
> >@@ -546,21 +602,19 @@ static enum scan_result __collapse_huge_page_isola=
te(struct vm_area_struct *vma,
> >       pte_t *_pte;
> >       int none_or_zero =3D 0, shared =3D 0, referenced =3D 0;
> >       enum scan_result result =3D SCAN_FAIL;
> >+      unsigned int max_ptes_none =3D collapse_max_ptes_none(cc, vma);
> >+      unsigned int max_ptes_shared =3D collapse_max_ptes_shared(cc);
>
> Nit: could these be const, as David suggested earlier?
>
> Nothing else jumped out at me. LGTM!
>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>

Ack on all the above thank you !

>

