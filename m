Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147E937AA9F
	for <linux-doc@vger.kernel.org>; Sun,  6 Sep 2026 19:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788724408; cv=pass; b=i1/afJkogNcFOXBfZmuNyqqROFHOAXy5qXLNNJsuOqJYetsP/1mruliXJM7l4Jtp8AndXRrE2rjmLY5EftTbVdd9qZ7Iw5cSQQh/NzN4VF1JM/4PlLyVFJGmmc0iyc7ZgcdYjGgG7TUYOiUyddnSDICMt19xdfRgzE2jbP4SHcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788724408; c=relaxed/simple;
	bh=hSYT7Bdx66+CfzHQHP4O4JmmdfZPM3QZr35weq55SDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJHdRPk0n5NORd+g0a9PdsQ1zBHyL+FukxCHXJjKYp4WO5QtL+cP931qdYGRllLCCyVkUqYSk2ng7ZzfBgNLRLpiOIBlkUcQW0v9aWStmhFPjm11J9vCckRmJm4/zqIc31gqRG/DZuh/Lww90tV5easivW6xiHxw3NSs0x3Fxl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzWMh9UC; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzWMh9UC"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a7f27637d6so3477814a12.3
        for <linux-doc@vger.kernel.org>; Sun, 06 Sep 2026 12:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788724405; cv=none;
        d=google.com; s=arc-20260327;
        b=e9/D3PFEDLpfhNY8BsLGLJNLn+blzllklslUyVaQaEde8Xv7M+OwhgWhA+6VL44YZj
         v9N9iWBWUWHjJK66pAycSB5mXUc/IimWcokBtQ9I/od1j46oWDb+G9gjCS9J4QA3chYK
         Q1TCweTOz64yRtjPPftK1wr4ZkjzyyZGz0c1wcMy3PvTxWQdQOgNTrsrVhKtHgUYHmi5
         R4c0mTwFvHfiS0lGARN4xOASqsHlqqc8d7o5N7gZgtR0vwF8VXzyZfo9oC3gQWThH+Y6
         NS6YiRyjCOB2JUKi9TArOuaSzTT5O9cT/ib1/+Fj8j/+syfjzbMkQUUMVs/C4qC4na5n
         ZeBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DxbCH9V+QwRl/rwfPKpCRxtVrgQCFOwACk6jwY2+Cv0=;
        fh=zy5iMEHKXJgCPA4NQlgQr8BLa0IVZx393XmYWdcksq4=;
        b=i6Mvucj3+LczNqKPKIJ7mGPS1poETl7kDra/7G1zZTAqugcsIOMGp861aUV7e4G4pp
         A8rGZFEyJXyrVJ2EaRzxnfn2tx5Uib2QfJ+zA5nw41B3+YE9ryulOH5YpOoA14UkPdNp
         BWn74giFwp5YvkREX63q6L8pFfSLaNFKJRoTZgf2qcNOCW6dCuNQMxUMuYWQ2isMV8ou
         G5zbc2rpno2BBCNZMYZe960fEmV3FASqP6BenScNkTiW2ViixxtV0ksIAAEMZc7R7YCP
         yeO8LEfFTM+iM6cqd6IC21VSIbOgp0FHIEdj2N3IdkR8I/K0u1UX+VmhUBt1rA7okxrZ
         ga2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788724405; x=1789329205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DxbCH9V+QwRl/rwfPKpCRxtVrgQCFOwACk6jwY2+Cv0=;
        b=OzWMh9UC5Kh70Ch1R76xE23eGWOVSAOID3BsCrc6GAuvQvkWJkBfFLRCnuS7qE/17q
         iUdFtwm4UF/sSJ3QpsE397YLo/s6vZXPFJa61RmwO4QXP8Uu88IQeIOTPVmFCrjF9oxz
         DZgta+HbGgxnAxBr8h3kD7WTlwaixQOL8bXiDbMl7NPNQCYaO62HjERqH1GwyuQlDTC5
         lVbofwBXHIxWrcE4gRdYfbLZ4wJJ3tBLuMEXwFraHgxndjVGMoupiT4v0pTNJRsaQ1eP
         NVkX77abMv14+Vj7VdfgYNRJIg53PhjuLRaJchOji1d6CsxXRDzixu0iHviIuCqHv/QT
         cJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788724405; x=1789329205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DxbCH9V+QwRl/rwfPKpCRxtVrgQCFOwACk6jwY2+Cv0=;
        b=IeEpM/g+gpK7l5eaiiRx9lS1jK99cXnPT//ks0UoYLM7B5wDRDisUQvKxJfxdiHM8k
         v0J6ev8SovNzBc4YO+OU5WimQOiI2A7VE0tuuJt3FzZtFevY82Z9nsml5GWu686qZ9Lv
         JitbohGDw940qMIBUyOvsJ5h/ISS9dBUFYjBhE3TrxtLU9BxP2aGZCnhUUjzAdPNxr4o
         SvUrj3+4FvcmEP/rRZvUzZPTNQPyEgoh4h+2A4fW9Bnqyw8vp58LsXCs3akjMgLk726e
         /L4rTlP8izT7bFWv4OObkbjWEuXZeQomOL/tGquhRG+vL7LaoosP1p0uTKa4uGmt4Dil
         M8rA==
X-Forwarded-Encrypted: i=1; AKwUvBwvdrFudYB9YSBqV/4ThqNbP5bjGa1jx+yN93F6slo2KxkYSPbersAhjFNMeiHR24XeHai+/Wh0zWw=@vger.kernel.org
X-Gm-Message-State: AFuF++nA83COp7Xzttd7JkrYjB4rWyEUtqjYFSjegvYU6vtrdwguF34O
	ilQwzRN1nDCjuQWNgEoDe8AyG/1OUqJTX1M0d/V7ODMJPhWgB4pWyOGIQU0wKa64TVlfcb5WfVQ
	bTit1Pn8YA5CkcGezHGRJWfkFzyGecHk=
X-Gm-Gg: AYBFou2l7QkIwxvITSy7jn3NGwNpiOLjTRsfXmQsohB4vhyc2T8aQC7ei3G4Q+9+EPP
	x4I4AYGT76abzyryxsaXFL2mlAZ/Qo2lJpNSblzKsMT8oHRYuAwzR62p8FvdmZF6ZAKzQhXXxus
	HLW/DLZbi0zRdJPZGnmxgPS6xG6061jtru/B7SPEPTiRNh+PlNVdkpwvJoOEJ/UacYba6bk8AMq
	6C0dMTXbjWJLtwdkE1+cmUWzXcIuPeatbL4Ul8YEJV6q1hMSsxvMroRJAdfx8SozV8LCysnOw94
	fFHlQwVzTjoPl9ZHbqi0Q8YzXkwnBjMN9BWWYs+VfcvLBWQLTg7URNoDZ4sPjDVdBMxDyiq0xc+
	MipCEO5JXZU5Mgg5Z1XnzmxyFX7lL/70=
X-Received: by 2002:a05:6402:270a:b0:6a6:32f5:90b4 with SMTP id
 4fb4d7f45d1cf-6a7e90a5f76mr10811303a12.22.1788724404883; Sun, 06 Sep 2026
 12:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com> <20260905-arch-kconfig-options-v2-v2-13-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-13-83e8245761a2@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 6 Sep 2026 21:53:13 +0200
X-Gm-Features: AcwNN1XQRPDvO4h0CLOCTqDWdsWEz7RUDSJzPl7o_oxwW7z9viJRHQIo11NfJJY
Message-ID: <CA+=Fv5REcH-Vj71gWidKiKiOvFUULV-uNKBP-sZGJ2XwBQa-BA@mail.gmail.com>
Subject: Re: [PATCH v2 13/22] alpha: add ARCH_SUPPORTS_PAGE_TABLE_CHECK support
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Kees Cook <kees@kernel.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Sep 5, 2026 at 9:29=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Add the page table check helpers needed for CONFIG_PAGE_TABLE_CHECK
> and select ARCH_SUPPORTS_PAGE_TABLE_CHECK in Kconfig.
>
> Alpha does not support huge pages, so pmd_user_accessible_page() and
> pud_user_accessible_page() always return false. pte_user_accessible_page(=
)
> checks for present PTEs with user read access (_PAGE_URE).
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>
>
> Update the helpers to the three-argument pxx_user_accessible_page(mm,
> addr, pxx) signature introduced by commit cf8771ca4cdb ("mm/page_table_ch=
eck:
> Pass mm_struct to pxx_user_accessible_page()"), matching the other
> architectures.
> ---
>  arch/alpha/Kconfig               |  1 +
>  arch/alpha/include/asm/pgtable.h | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 1d28fa8d3b66..da4ec8399517 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -19,6 +19,7 @@ config ALPHA
>         select ARCH_NO_SG_CHAIN
>         select ARCH_SUPPORTS_ATOMIC_RMW
>         select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
> +       select ARCH_SUPPORTS_PAGE_TABLE_CHECK
>         select ARCH_USE_CMPXCHG_LOCKREF
>         select FORCE_PCI
>         select PCI_DOMAINS if PCI
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index bdff33b505bc..6ebdd90f3035 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -232,6 +232,25 @@ extern inline void pud_clear(pud_t * pudp) { pud_val=
(*pudp) =3D 0; }
>  extern inline int pte_write(pte_t pte)         { return !(pte_val(pte) &=
 _PAGE_FOW); }
>  extern inline int pte_dirty(pte_t pte)         { return pte_val(pte) & _=
PAGE_DIRTY; }
>  extern inline int pte_young(pte_t pte)         { return pte_val(pte) & _=
PAGE_ACCESSED; }
> +extern inline int pte_user(pte_t pte)          { return pte_val(pte) & _=
PAGE_URE; }
> +
> +static inline bool pte_user_accessible_page(struct mm_struct *mm,
> +                                            unsigned long addr, pte_t pt=
e)
> +{
> +       return pte_present(pte) && pte_user(pte);
> +}
> +
> +static inline bool pmd_user_accessible_page(struct mm_struct *mm,
> +                                            unsigned long addr, pmd_t pm=
d)
> +{
> +       return false;
> +}
> +
> +static inline bool pud_user_accessible_page(struct mm_struct *mm,
> +                                            unsigned long addr, pud_t pu=
d)
> +{
> +       return false;
> +}
>
>  extern inline pte_t pte_wrprotect(pte_t pte)   { pte_val(pte) |=3D _PAGE=
_FOW; return pte; }
>  extern inline pte_t pte_mkclean(pte_t pte)     { pte_val(pte) &=3D ~(__D=
IRTY_BITS); return pte; }
>
Hi Matt,

I tested this on a two-CPU UP2000 with PAGE_TABLE_CHECK enabled and
enforced. A userspace test exercised anonymous, private file-backed,
and shared mappings, together with fork/COW, mprotect(), madvise(),
PTE teardown, and refault.

Single-process and concurrent CPU-pinned runs completed successfully,
with no page-table-check warnings, BUGs, or oopses.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Regards,
Magnus
