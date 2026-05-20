Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50278370D75
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 20:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779309335; cv=pass; b=QsjDuncHUGn5w2W/aHR2Km9ll2f+osqznczUD5BSGATr3PHtZbQyRDqAQZYyUcnzRDmdK77H1VxPj5KimwTEoh5UDAprcwibJuwwyQ7jq9aKqrGe6alpddy4Ex98RRh30wRmIDqTMMjT33vkOoJhi6EZvh4vrp0jbcd9LfcW7wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779309335; c=relaxed/simple;
	bh=UfnbwtuocpefoEJwGQVdq2On9IxQDWbOXLMcN0R2rQ4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BvvbTFBYSK7w2a3MqBKVA7JlD15OuHrnomsmXOfxwIpOGPctNn5Xi2sspjPKW6mz1HO3J/RhWQd+xEfJDgXjLKzwQGiO7AXQejTDmh5laegnn0+tfx40HeCIzwZTOfpKWPMY3Kk/thWGLgSq2bPP93wydREu3BheSNYS6n87BH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bUUtZQSy; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bUUtZQSy"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a746f9c092so8397520e87.1
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 13:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779309331; cv=none;
        d=google.com; s=arc-20240605;
        b=HVKMNHYCzgt3ME/LxbDcaIkBmDQDilMI4DzPAZQHMghwe6yMTKuxJg5t86PWZNFR3n
         PJ9tUvrak6c4UQMFeDUx7xGnbrkNgryjeUBwW1ftofcx+sSk2l0L7L5YnHAl/HzWdRyM
         1PO38a3UCBXuROtD9lt0RpekKrGjVKhn0IVMeISV1QlVCIdlGOqKF2CW4x48V+zOv37x
         tHTmP/RXUHbo1jsHHsi0mLXMBtb8Sci2wzJvd89CSfgrWS00ZXbtsE5Pg3cNZVInzPwD
         BwayVhFpkl/wZTQlI9YvWufXrnRy6rqkc1Ikkbato6MmOR0zFLsmEJOqSD1OrCDdx09O
         P6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=y7Uhb594XOL1gZOtZrSL5VavWJB1z/5+87hhs5G/QCo=;
        fh=YMmK9iyp024p1htR05trgPPShXUxJ2JM6oFG8vkvx4c=;
        b=Hr8QRyW2P/eZWk9DnFPrfGUnGP7KrKyD2PyIgcZILDsyUKNvSrcjFc4dkhrd62cQPg
         KXr6WVTWvUbx1tpQpFAwqmBjWzfcubkm1Kl+GT0Xk00mcN8lo30pvteInlUehRUcPgoo
         fquXqQK+pn/QhxbCeefobHI/PDMg86qpt9zN9QUNPNLd758uMlOjNTOzobc/3+ffL75J
         0RNsXUmCVQCgHmiKSc4KMw00AJoJdxbs14PFMlJOcSx/fueOTnaeN9JVXCETc0SmsuTc
         mBELAVdbQ2MimxVWOZ0a5F/ePaBKa35nrHzYw30T7gm1UilSWrP7XIj2EjEWu1gPDIXk
         1O/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779309331; x=1779914131; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y7Uhb594XOL1gZOtZrSL5VavWJB1z/5+87hhs5G/QCo=;
        b=bUUtZQSyucw0ZiahrlwRi1nayWMYp3PHUWX9smKeB2yRk/7jTg4SN0Vdqe5ybWd4Aj
         zdaX86CmYV+ulIb9h5j+jckh8afuCXP5n+ddwtFyebE/nM9pll7Hm2YbHp7z5GrChMJl
         fUgOOx6NOsDu/yVF8BR1zwQYBCV7QrnCX/IFKHb6UlrVGbBgE0SE7LmS66vnz+Ttolvx
         DsvisWioCK0PHRKC669oDeOsUiGlJXxqt/uhw1OiuB9JkCBTdw7ZbE63sPbf+WIf3g56
         kK6CkvA3/yzCOY/LfAsn4cDaO4zIjmT0qmBbQTtItwy3g39l9mkz5rVhj+UB9JNBnaFQ
         vxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779309331; x=1779914131;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7Uhb594XOL1gZOtZrSL5VavWJB1z/5+87hhs5G/QCo=;
        b=npG6xQVnl5qG1JbI+mmfbs7uJOiAHNgeLj2EPeX7iFcMCjgpWJrC/4wEmyG/FTtjne
         TGNbylmg85ILoboj7x8/sAE/ooeXY+scx8yXCz5oHtOeawxD0MqPmhpf851TOvnRUBMC
         HvKUssTYS2rTcBAQ6Tlu0WRx/KY/FHsP1gvlmHlTEDhWGJjZwR0MWVPDf1TKgyjyCqLd
         fima5LJXATpIzmzeXEKWv9wbd9BcKvIFJvxJqainsTacLZBm+64WXb0NM8ncclMGc90n
         YiJj+zmV5eP4WrghdBGsa3PNHM5/3SFSUU5DphQCLlqiMpmxGIo2BqUrXtNudL0fgsRO
         FBVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8KA52hi2oZO5xD6wZaFKe8f7lO6gg0o64LxxE4PzwccdZkpUlCGxCbHEizFVVolg5u4awOT26kYu8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9aFdyVxHvZFKIJ6ykAMfcdaB7/ibAiivBt8h7JiUbw9Z3WCBp
	iUtK0R9dbc7wG9xBKFGOLrItrdV8tOWopDH7bGowHnyqzKppWrbtEMLK8+mk+7+FyZxsHULDEZ7
	fRtCVgWzo3M84m+8/Hc82XfAqtYiyk4vIp6lblpGy
X-Gm-Gg: Acq92OFAH5lzx9YxtohY0BOT1c7D9x+C1dBg1w+kf4aek9dARawb1e8nroUQZrhc8jp
	0h/W+KM/KLKv3bMpL/3w3KeRdPXmEF5c/BngGBiqdRwtBcykK5HRhGobROwBPqGbFjzS/j2/h3L
	W11LfNRyyYQKfnw93qLLteDmb5P6bSilRQ8rTYaqkN8cx2gs/VW9igIP0QAeBsbqbLJg2LDlFEH
	YTy5ST5W1N+uEtSq4/GA793zGLrerZkEDNk8Z3cO+0+e+/AHloUfFPJKX2kH40JsGKJUyDNNZcY
	k28y9BYRwFtnfELwAd8d1rrKovIsgSGWsdcGEEWyNZUHX+6N0WmAhjbHHjvL+EDjN3PwPb6pn+9
	7i5CD
X-Received: by 2002:ac2:5b03:0:b0:5a8:8818:819c with SMTP id
 2adb3069b0e04-5aa2ba8d0a4mr6125e87.16.1779309331108; Wed, 20 May 2026
 13:35:31 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 13:35:27 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 May 2026 13:35:27 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTwOfJ=nCRoX3m5uDt=CcF_zrqGsZVBBmo4MscmPqrBxOA@mail.gmail.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-12-91ab5a8b19a4@google.com> <CA+EHjTwOfJ=nCRoX3m5uDt=CcF_zrqGsZVBBmo4MscmPqrBxOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 20 May 2026 13:35:27 -0700
X-Gm-Features: AVHnY4JCI2WxkpGpEfiZH45uIXCVj4Nb0JRb9mme96xXqvKAS-EEsMTVSDBkz1s
Message-ID: <CAEvNRgFqPSLKKKb9etgfqdt0y81Agu5RwRipuGw=j2y7W2Y0-w@mail.gmail.com>
Subject: Re: [PATCH v6 12/43] KVM: guest_memfd: Call arch invalidate hooks on conversion
To: Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

> On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
> <devnull+ackerleytng.google.com@kernel.org> wrote:
>>
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> When memory in guest_memfd is converted from private to shared, the
>> platform-specific state associated with the guest-private pages must be
>> invalidated or cleaned up.
>>
>> Iterate over the folios in the affected range and call the
>> kvm_arch_gmem_invalidate() hook for each PFN range. This allows
>> architectures to perform necessary teardown, such as updating hardware
>> metadata or encryption states, before the pages are transitioned to the
>> shared state.
>>
>> Invoke this helper after indicating to KVM's mmu code that an invalidation
>> is in progress to stop in-flight page faults from succeeding.
>>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>
> Minor nit below, but lgtm.
>
> Reviewed-by: Fuad Tabba <tabba@google.com>
>
> Cheers,
> /fuad
>
>> ---
>>  virt/kvm/guest_memfd.c | 41 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 9d82642a025e9..baf4b88dead1f 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -603,6 +603,42 @@ static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>>         return safe;
>>  }
>>
>> +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
>> +static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end)
>> +{
>> +       struct folio_batch fbatch;
>> +       pgoff_t next = start;
>> +       int i;
>> +
>> +       folio_batch_init(&fbatch);
>> +       while (filemap_get_folios(inode->i_mapping, &next, end - 1, &fbatch)) {
>> +               for (i = 0; i < folio_batch_count(&fbatch); ++i) {
>> +                       struct folio *folio = fbatch.folios[i];
>> +                       pgoff_t start_index, end_index;
>> +                       kvm_pfn_t start_pfn, end_pfn;
>> +
>> +                       start_index = max(start, folio->index);
>> +                       end_index = min(end, folio_next_index(folio));
>> +                       /*
>> +                        * end_index is either in folio or points to
>> +                        * the first page of the next folio. Hence,
>> +                        * all pages in range [start_index, end_index)
>> +                        * are contiguous.
>> +                        */
>> +                       start_pfn = folio_file_pfn(folio, start_index);
>> +                       end_pfn = start_pfn + end_index - start_index;
>> +
>> +                       kvm_arch_gmem_invalidate(start_pfn, end_pfn);
>> +               }
>> +
>> +               folio_batch_release(&fbatch);
>> +               cond_resched();
>> +       }
>> +}
>> +#else
>> +static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end) {}
>> +#endif
>> +
>>  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>>                                      size_t nr_pages, uint64_t attrs,
>>                                      pgoff_t *err_index)
>> @@ -643,7 +679,12 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>>          */
>>
>>         kvm_gmem_invalidate_begin(inode, start, end);
>> +
>> +       if (!to_private)
>> +               kvm_gmem_invalidate(inode, start, end);
>> +
>>         mas_store_prealloc(&mas, xa_mk_value(attrs));
>> +
>
> Why the unrelated extra space?
>

Hmm this space provides vertical space between invalidate_{begin,end}
and the STUFF it wraps, like

  invalidate_begin

  STUFF

  invalidate_end

More STUFF is going to go here in future patch series, such as splitting
private pages in TDX.

>>         kvm_gmem_invalidate_end(inode, start, end);
>>  out:
>>         filemap_invalidate_unlock(mapping);
>>
>> --
>> 2.54.0.563.g4f69b47b94-goog
>>
>>
