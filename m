Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3A2EB64D9
	for <linux-doc@archiver.kernel.org>; Fri,  7 Jul 2023 12:10:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbjGGMKN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Jul 2023 08:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232344AbjGGMKJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jul 2023 08:10:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3FC2125
        for <linux-doc@vger.kernel.org>; Fri,  7 Jul 2023 05:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688731751;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gORiq5GodS7ZyZ8uTXDDTjpB1bJALeNv6hXNnjMKMlE=;
        b=UZPCgJ0V2c17OjNoLznVOxC/sxVpK40sDsYexIO5+TUVvSkx9SW36zy6CMNtaWHZP5ATF6
        MDAti16tp/YWnCbf/5vq743wL17xd6oWoiG6cjkMHEKOZCnSoGp8J6jwwfFBlzaUZkTjdK
        u2ClZdJ1QmQXvGjC1UFzvZmICDhe1po=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-OBXY8lE-MQO4Ax5lejkZjA-1; Fri, 07 Jul 2023 08:09:10 -0400
X-MC-Unique: OBXY8lE-MQO4Ax5lejkZjA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3fbb18e9bd9so10052965e9.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Jul 2023 05:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688731749; x=1691323749;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gORiq5GodS7ZyZ8uTXDDTjpB1bJALeNv6hXNnjMKMlE=;
        b=k598hsXJB3RNpHTGNulAdxkF2kMI/PN39P4G/20gJty7dWuHyQGPLnU05i4Fze2czF
         fCiuGd0t2XAnijtllFZG+/NVcpAd2VNSEccuonJGHEGh6pjQ1tmxnCqHWj1jntz3WSMw
         wTFdWIcPXRaT4GYQlga+PVayjqHA/gLsQt9oLeqU7w9dXv2vz/KCj5Sp4/p6gwtPG2Ye
         Y8x5MVXyBgquojDCe0ZWQpQ6GSa3Tso6aR6ANDUfgSuMqJmhs2iARmk/KuS02q0g1803
         AyUxWCx6PquRXS99F+vFnFPw2OTRECoPdDWFbHs35l6TJ9dIxAJlEb5B/OKMj61bCQf6
         ozFQ==
X-Gm-Message-State: ABy/qLYYmxgEQwPKVUroAHlowTVI5m1khsY0IRl4luJ3rBryR2KNLSvY
        /qOSCWMfFN3PhF4JHzRfbG1tC0UA2NNtxux+5Feg0RUWuliHDF0OAsnbdSYjNzT0dwNZhkkk1XN
        p7+PbRp9yTlyq6gEXDi4L
X-Received: by 2002:a7b:cd1a:0:b0:3fb:c075:b308 with SMTP id f26-20020a7bcd1a000000b003fbc075b308mr4996101wmj.12.1688731749308;
        Fri, 07 Jul 2023 05:09:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFfKiKrAhyycHkgU5qil5GH1DqpfQJ20sg3fOGI5gZ6Cq9A4H9d55aCtQPRZY9qqIDQHOJH+A==
X-Received: by 2002:a7b:cd1a:0:b0:3fb:c075:b308 with SMTP id f26-20020a7bcd1a000000b003fbc075b308mr4996081wmj.12.1688731749005;
        Fri, 07 Jul 2023 05:09:09 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f04:3c00:248f:bf5b:b03e:aac7? (p200300d82f043c00248fbf5bb03eaac7.dip0.t-ipconnect.de. [2003:d8:2f04:3c00:248f:bf5b:b03e:aac7])
        by smtp.gmail.com with ESMTPSA id o2-20020a5d4742000000b0031434936f0dsm4305585wrs.68.2023.07.07.05.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 05:09:08 -0700 (PDT)
Message-ID: <0d035a57-b502-32b3-0010-d029f62d7757@redhat.com>
Date:   Fri, 7 Jul 2023 14:09:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230707053331.510041-1-anshuman.khandual@arm.com>
 <20230707053331.510041-2-anshuman.khandual@arm.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC 1/4] arm64/mm: Add SW and HW dirty state helpers
In-Reply-To: <20230707053331.510041-2-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07.07.23 07:33, Anshuman Khandual wrote:
> This factors out low level SW and HW state changes i.e make and clear into
> separate helpers making them explicit improving readability. This also adds
> pte_rdonly() helper as well. No functional change is intended.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>   arch/arm64/include/asm/pgtable.h | 52 ++++++++++++++++++++++++++------
>   1 file changed, 42 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 0bd18de9fd97..fb03be697819 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -103,6 +103,7 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
>   #define pte_young(pte)		(!!(pte_val(pte) & PTE_AF))
>   #define pte_special(pte)	(!!(pte_val(pte) & PTE_SPECIAL))
>   #define pte_write(pte)		(!!(pte_val(pte) & PTE_WRITE))
> +#define pte_rdonly(pte)		(!!(pte_val(pte) & PTE_RDONLY))
>   #define pte_user(pte)		(!!(pte_val(pte) & PTE_USER))
>   #define pte_user_exec(pte)	(!(pte_val(pte) & PTE_UXN))
>   #define pte_cont(pte)		(!!(pte_val(pte) & PTE_CONT))
> @@ -120,7 +121,7 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
>   	(__boundary - 1 < (end) - 1) ? __boundary : (end);			\
>   })
>   
> -#define pte_hw_dirty(pte)	(pte_write(pte) && !(pte_val(pte) & PTE_RDONLY))
> +#define pte_hw_dirty(pte)	(pte_write(pte) && !pte_rdonly(pte))
>   #define pte_sw_dirty(pte)	(!!(pte_val(pte) & PTE_DIRTY))
>   #define pte_dirty(pte)		(pte_sw_dirty(pte) || pte_hw_dirty(pte))
>   
> @@ -174,6 +175,39 @@ static inline pmd_t clear_pmd_bit(pmd_t pmd, pgprot_t prot)
>   	return pmd;
>   }
>   
> +static inline pte_t pte_hw_mkdirty(pte_t pte)

I'd have called this "pte_mkhw_dirty", similar to "pte_mksoft_dirty".

> +{
> +	if (pte_write(pte))
> +		pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
> +
> +	return pte;
> +}
> +
> +static inline pte_t pte_sw_mkdirty(pte_t pte)

pte_mksw_dirty

> +{
> +	return set_pte_bit(pte, __pgprot(PTE_DIRTY));
> +}
> +
> +static inline __always_unused pte_t pte_hw_clr_dirty(pte_t pte)

pte_clear_hw_dirty (again, similar to pte_clear_soft_dirty )

> +{
> +	return set_pte_bit(pte, __pgprot(PTE_RDONLY));
> +}
> +
> +static inline pte_t pte_sw_clr_dirty(pte_t pte)

pte_clear_sw_dirty

> +{
> +	pte = clear_pte_bit(pte, __pgprot(PTE_DIRTY));
> +
> +	/*
> +	 * Clearing the software dirty state requires clearing
> +	 * the PTE_DIRTY bit along with setting the PTE_RDONLY
> +	 * ensuring a page fault on subsequent write access.
> +	 *
> +	 * NOTE: Setting the PTE_RDONLY (as a coincident) also
> +	 * implies clearing the HW dirty state.
> +	 */
> +	return set_pte_bit(pte, __pgprot(PTE_RDONLY));
> +}
> +
>   static inline pmd_t set_pmd_bit(pmd_t pmd, pgprot_t prot)
>   {
>   	pmd_val(pmd) |= pgprot_val(prot);
> @@ -189,19 +223,17 @@ static inline pte_t pte_mkwrite(pte_t pte)
>   
>   static inline pte_t pte_mkclean(pte_t pte)
>   {
> -	pte = clear_pte_bit(pte, __pgprot(PTE_DIRTY));
> -	pte = set_pte_bit(pte, __pgprot(PTE_RDONLY));
> -
> -	return pte;
> +	/*
> +	 * Subsequent call to pte_hw_clr_dirty() is not required
> +	 * because pte_sw_clr_dirty() in turn does that as well.
> +	 */
> +	return pte_sw_clr_dirty(pte);

Hm, I'm not sure if that simplifies things.

You call pte_sw_clr_dirty() and suddenly your hw dirty bit is clear?

In that case I think the current implementation is clearer: it doesn't 
provide primitives that don't make any sense.

>   }
>   
>   static inline pte_t pte_mkdirty(pte_t pte)
>   {
> -	pte = set_pte_bit(pte, __pgprot(PTE_DIRTY));
> -
> -	if (pte_write(pte))
> -		pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
> -
> +	pte = pte_sw_mkdirty(pte);
> +	pte = pte_hw_mkdirty(pte);

That looks weird. Especially, pte_hw_mkdirty() only does something if 
pte_write().

Shouldn't pte_hw_mkdirty() bail out if it cannot do anything reasonable 
(IOW, !writable)?

>   	return pte;
>   }
>   

-- 
Cheers,

David / dhildenb

