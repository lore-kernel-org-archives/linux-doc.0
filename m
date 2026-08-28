Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD023F1059
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 22:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787956685; cv=pass; b=HkX5mzx2g81/cKHaUfvuC+rHx2QT8aUKs1e7VxcdUjQILvPCsxKDJug57sKIkcyaihW1cfsK7jFQFtgL/WGWdrTyUQEJT+xKBMVD5as5y0OVQbX4x0BKASfKRjk+XMS7LSQBu8gW72HxGTFnHqVOzGT+g4aLNh88H45wATEgBAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787956685; c=relaxed/simple;
	bh=RB6EgyhlXjG0oQQVZFu5K/wv2js1PnprY6edbmp2RAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jz4LRKIdRD7x8ZpZV8M44yFVmf81aV3BI80skoS9GubPJ36Hh51bCEPxvGFlwdSYOaMRy7gE2k0sX3L4P8s2rA2B1M5Y7SBY3hl4LL/cOahfIX0wwuEDVHCKEsIDp5DIJF1BBggP09qoyAvA3hqWSIT+NZ32x45Awc8YD9qva1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ID5mZDp2; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ID5mZDp2"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-52fac937235so42711cf.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 15:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787956682; cv=none;
        d=google.com; s=arc-20260327;
        b=mcWlPyYIVCNAWDVVuXpStPaAgyLLC4rE1h8/Wvez0yK9QX2RPFfto6t5/uWG9rQQNX
         LTAziBUkyxceDIrks3uybe6AGsHpALbvmmMp0nMd2XcHszqkZ8nrGG0BDWob0NaefqYQ
         Gjv/6EUUhl8kY0DgS8rfnXnknowGZxNLrFCMjGiFP5sboIxXwipl/g1xYl9gXvEhA1lz
         SHOCYgXOvZgLbsphwfIVG24NQmbKXulZMJO27DwwLqY06kI4WGwtreMBaHg76MYpAuAM
         LJGs53OxVHaFg9uGrHTOT2wHfPwRfuW7J1aJ1CLAG1ZLA8S5Fq2Zt7Pn6r/QnlzTLerh
         Tqkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RB6EgyhlXjG0oQQVZFu5K/wv2js1PnprY6edbmp2RAU=;
        fh=7Nra2CKy2GLhlbiFUvC9Mif/JE+oKl8JPsD16smysVI=;
        b=Fakzfe5c0InpY+ZustgZZLgbgzkLrKs7jXSKezbq2HKd0JWA+a3/UuEOEzb+tj/8X4
         kRuZfp6tfb4vLcZwdrhL9oN73LqCIaBtOXJxQ5BgyOyHBcasL31P6b8zFL/nAWJu/09b
         5TpBj3s0YChJw5mEZw4LkqkdPb/7BP3CjPm9nZ1iZWAXUP60pXgs9SbMWQQQb7SY3bVo
         iwQaB5NWEt3bUZ36mjIKnMsGt4pnMCz1iEQyAg/J9Cu7HbUNDCOnbmdxziE0wbXOFzcv
         0rmSvlvLoLuxRL1hZtHyCxvEaWLznAopQ/VobNau+JFQGCZhMQ45I55X5M/T4EaEEAjt
         RmFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787956682; x=1788561482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RB6EgyhlXjG0oQQVZFu5K/wv2js1PnprY6edbmp2RAU=;
        b=ID5mZDp2G8G/bAizuCCd5akSB9hnuwrl9zWWrUPt2DFd8nPMYot0On39tlUVH1hDre
         Y5NRJgt61+snKFc8CsQJoWXPYO1kE8AQIDdR2QQCHVzfscUwstUKFiMRYrHa7O2LZCes
         QKWYh0UjwYkw4JbuLBfDXjpNQo4naqvdfKLHTzWZ4k516CZA67dNX0r0X9/4Td1VsZ/n
         Y7GLQS7H+c5jR/idDrJokFS73sBZ9miL4O1Mj35BmFnPzoGj4N9P996kVGrB+yu2Y11y
         A7iMZ72g2DOh856H7amiJE3HeSaaVH0z9oe8N+17DZSNPW0FBqJ4B8+rnhCHLNQmhUx8
         zJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787956682; x=1788561482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RB6EgyhlXjG0oQQVZFu5K/wv2js1PnprY6edbmp2RAU=;
        b=WygJIYnyBmGUjRVbyussLfEAQ+jHrBV5Bz6QiYQbVEVOH5VltJIf7+SfBR8yTglGVC
         baiCZgXYlzSlPijQillsQ11um9RIgls3t2Sslk3ZEmzN4uZAFSxylEG2x566vFfc66nw
         7Qb0wUWmsQMsBoNtokw2UZe/vtdzSQZABIUoqCh1imFWivkKWFaSrjlXVpjj/94AI98E
         O9OVOloQbOq/1oY35i8l9uCv1hk7pNFzgVGV0F1F1rDd9oEbenr3IyF8jbrBgqAhDJTp
         k85hFLfy0f4JUI+WqCsd0HokysdbDdWS3XInJoE2jxpff+o1gA+vBFBC//Xj5LD6mpH8
         7Duw==
X-Forwarded-Encrypted: i=1; AHgh+RoW8Wi8afgYQ+wvoYv0XKqdELsEjFdhkW7gCo7dyid295sSoH/GzpyPg5AlnwXwTXP27VfHlhSw1N4=@vger.kernel.org
X-Gm-Message-State: AFuF++lCVWoMnyfzAyqRkJ0k0fXAyh5WJ0hLL1Bm14kX9qFV4mjVsDeP
	NBDR7Fq2ShXq1Dpr42GlCfazyp5gTLZzLfNoHaaiGmgyaV9cqp631EO4vb89t9zdrdCj1ubJeHO
	Wo+yh223k6ifiLfANm/Ubc/YLUkVXi9fPkFUhFS8d
X-Gm-Gg: AR+sD13oSlHm0hfn40f+NJxHdHguQOB3Qt09su1Lull3nRcg+UHElkwNcKLKCvilhZz
	cu/quuKMbCY1daxx9Sn3kPWEQypmakhoMK3uGXXEmDIA3VH0mCA3ZLoHe49MsdDszbsT5RcmuhK
	6GUa+kWgTEh/ZQfJO01PAUKVlbLWVqaqHDyzUzPpLNC99aaw0DF8dxu0OSFuxYDgkd94/jjzJpb
	iuNnT5CxkVsiJ4sLWSEndFPgf4UkxxxDkgxEd406//Hod32THnDf/+gIk6iFyB8SJfRarpxXgF2
	VSEc2CxLInxlQE6GVEOS7DGorLrmz/eb8WtvXAr44jzCGW97y4TR4TOiV0EEkU/DbdzutmES3jE
	eMRuncQBWbQ==
X-Received: by 2002:a05:622a:587:b0:52f:9ed4:8d75 with SMTP id
 d75a77b69052e-52ff741283amr4482141cf.15.1787956681880; Fri, 28 Aug 2026
 15:38:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com> <20260806020850.1221381-10-rick.p.edgecombe@intel.com>
In-Reply-To: <20260806020850.1221381-10-rick.p.edgecombe@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 15:37:50 -0700
X-Gm-Features: AcwNN1WYsa0jAMLKRbnvpEBaceT5sA4-DylkYo8BvJ2OG5g_t8qOkwUGOnWXXA0
Message-ID: <CAGtprH82XzEmV+y-riufdOTAzJRwDavUtsRQY5BS3hYMGheD6w@mail.gmail.com>
Subject: Re: [PATCH v9 09/11] x86/virt/tdx: Enable Dynamic PAMT
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org, 
	kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org, x86@kernel.org, 
	chao.gao@intel.com, yan.y.zhao@intel.com, kai.huang@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@intel.com, sohil.mehta@intel.com, 
	Hongyu Ning <hongyu.ning@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 7:09=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> The Physical Address Metadata Table (PAMT) holds TDX metadata for
> physical memory and must be allocated by the kernel during TDX module
> initialization. Dynamic PAMT is a TDX module feature that can reduce this
> memory use by allocating part of the PAMT dynamically.
>
> The TDX module exposes whether Dynamic PAMT is supported via a bit in the
> 'features0' metadata. Unfortunately, the TDX module exposes the feature a=
s
> supported even when it does not support using it with the number of keyid=
s
> currently configured in the BIOS. Since no TDX modules exist today with
> that issue fixed, make the feature default off to prevent users from
> upgrading their kernel and encountering TDX erroring out when trying to
> enable Dynamic PAMT.
>
> For the decision of whether to make it a boot time option and/or compile
> time option, consider that Dynamic PAMT's memory savings are significant
> enough to make it a good default configuration. That is most TDX users
> should want it unless they have strange keyid configurations.
>
> The feature increases the kernel size by 2KB (when TDX is configured in t=
he
> build).
>
> All pieces are in place to enable Dynamic PAMT if it is supported and the
> user passes a kernel parameter.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
> Acked-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Vishal Annapurve <vannapurve@google.com>
