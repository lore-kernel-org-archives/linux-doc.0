Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2772F3845A7
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 08:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782377257; cv=pass; b=OaUhOyGgUWXsOvAwBkKvN+kk1A21Pvdbj5RgWL3DXh+XYpQbkfRLAy50AAfDN0bZ/cLVRUCtgZ+GhX4CEGGzjuALXXdpqt+J6WTf6h2kTMjiI7mlWci5mpbaD0gjpLcmLR/Zj+0XDpmnefF6ZiTakcGTmt9Lzk+IZr3+hC85yN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782377257; c=relaxed/simple;
	bh=rcYaGj7kmNHFT5KlkfLFAP87Gtcx0zYbs6pHF/7fSTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uqm6U+sSMy8UtHLy0hZoKtTDilkUOqGlwZN5RCpiOkUW4Oc7fEOWh3gvgfYyT+D32zwSxAAawFSDw8JIHw9ex34pdsl00mzYDSivRy7W+r88DwaVokRAl4kr7Q5dcc9GHnmL+pJpCVo17vGKlYWaDTwVyWEHatWyaeupD4lONII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i18uyhwP; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i18uyhwP"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-519ed52bcc6so209221cf.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 01:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782377255; cv=none;
        d=google.com; s=arc-20260327;
        b=jyU3OdEWQofTPa6PY9IMdPvQy9aROPo/+Pq4t5ACn5w/weJbvWgUnNUWnfRUFASaHN
         HKpgQ/H+WPbHbYrh6cWDpn/NwI5U+qvGaqYq7Y1xJSYzJ3C0mqYLeBERNVe5HK/kwGbP
         +XWfhCj5dIafg94Deu/1IF4KqbpnOQQkrJhLFpsokwJ/+CJVpgzffIENLGHztOZF8PEj
         oeZrXz6U3XgyEnqI6e1ufS6iRAvHK946Xjn+xQjeVzJfqZRoPMtZEDyveoZtWOHwNrsD
         YbBK72DNyaGoaYN1PEKYt1SwjAZBMESfBL5ybB3AaxbOVeinbm4YxglrgYeNK1IgdVkS
         pbQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L1P9iL5yW4BU9W6Dd1onnqzvZzuIUKT6XldZibc3Vyw=;
        fh=jEzugfn8h4s/iMVnQPNn5+cc0DeZvdhGFAQJwpYPjqo=;
        b=h40g7Jvx4yxCpJmdgz6I1GS80ajoDW0AYSmjLVHJdNRDtYUcPAGzSszEzkrn+ngzVs
         /+13mSBeO2zYKHhguJx6FHsCihNOelM1do+UDb8jP3fKO7zOx/p7ro2caLSi8HjG7pm5
         k1hpp+mwfZBqi+9ZikcZCoICx4HKH1wsATJcpfgyPy/f/7Q7SX342u3ijEqzXtqsxZja
         D4vBJdA/2tNF+zp8oYAmj+h9ZAr4Nz5AOIk+RRYmW1oBnZFEk7zp1U6+WPNGZr48ZYQh
         WTbpY9ZaE0HaErmlwJh624UUY5e5zbZTfxOuSzYFonRwRKuxpsdIB9QJgKLfPCkov/Xs
         NZGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782377255; x=1782982055; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1P9iL5yW4BU9W6Dd1onnqzvZzuIUKT6XldZibc3Vyw=;
        b=i18uyhwPSpt4uOmX4NzfZvIwT3wKQ8maf2CpLRcblIiKYCl4LpgjDCxqeaPyJvJqRq
         a3GibJSiFgkgs8ou1X9pvIBasPVKaewpazNJ3Rg+OJ3V6uDPV5KWcqpAgjXlqdAog4dS
         OPrLnOOl+2ZO7hnaNrc8CWabV+UgTU+U/yLL2HVK+bACuk1NP+RiDIvqUtwBQxMZ4KQx
         Jk+dubmF0WFdVv93v0QUt4BWfvt+2h8khGN9fD4BVmOd+kt2T219A9MfzXyCr0daSMp4
         Mo9GTDeDZA09xHIxhUrT3g6ycUbAAgKZqYOWA2OYFHfsXd/6aoqzWx1G01jfWsqUWsPD
         KDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782377255; x=1782982055;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L1P9iL5yW4BU9W6Dd1onnqzvZzuIUKT6XldZibc3Vyw=;
        b=EOyZBecCzQ6j1mmnBC0Stfki4wFAyJFMOTc/f8DkfGkxjHAM3l0RGGbShA9ev0gdzx
         rn9/7vQqpjdmfZ895AYovrbbPGuZVikpfD6M+3BtLVUXgPo9PLokngm5H12zb4pPG0Im
         55VtkhLoqjFl6W97jzaDCa/NoT68DaMKDe0I6kCyiBq8nPnOL9zfWyKZKzBJwEdMu98G
         BKpQVCasxOzBVySpaqClHl6sPHnyi1IU5Fo9+bepmh/+AuMYgL0RFaS40iixsxldtlSm
         hKMiJHW8lVM81llSA/YoGrH/+Os4NQ1+nCva5RrRKg5MlDCs2zoZ3PcYTzpq34Shbss7
         h+Nw==
X-Forwarded-Encrypted: i=1; AFNElJ+i4PIgk28CG0D/pNxcJAkUnXCLn1UgfLms7MQ+ngBjEelIVzumRliM43NvGYEZOOOEu3GGvIHoVTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyWMSDjKTVDRT9TfbTuPCDvts7mEiC7SDt5Tn99zKf+9LpeSFo
	DWmiCmVVdCnGg0CUDoiLeUdmGVoaCbQER9DFlwUwnk/ywkc5H3yOsrWGJIOCkub+/P8g/18a+iv
	X8N8x/VZkylNj2z2WmCMaLMZvc9OuBc/VV+xYdnKE
X-Gm-Gg: AfdE7clbk9Pq4HD6FUUhmTvw7ZVKal5G9fwKnnUJeZZU+kiH1t46eEaNqFZEJyAWODu
	4g2ZuL5gDNifJ5o6kv+mbh/Ohtu/CcAkjIDtflqopPg3BqAVMKdQQEzMuv2lup92UZWN1q1X1rJ
	nIi8yj2siTrjIKvbZknJDCqlNd16ZP848vhSegak2KAtAbHNhGds/W4Svd+Oqty8ZN+8iM2qS+d
	gTDfRPDtFT9HqI0X7i+bZsRGx9gVQGkLRk7Q36LwujeVxdy/Uc7lNG2Tj0PhXkfS8E72pb0w19z
	lX3cvf+q
X-Received: by 2002:a05:622a:250c:b0:516:d25f:f038 with SMTP id
 d75a77b69052e-51a6e9b48c8mr8613301cf.10.1782377254458; Thu, 25 Jun 2026
 01:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-40-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-40-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 09:46:57 +0100
X-Gm-Features: AVVi8CfgbrnQMIfXiVsNJJJ0xVsuAP4drBRXl96LSWEK0lsp_b9ZqLBB6cNHuVM
Message-ID: <CA+EHjTxw-28BpsSbPTyuhBEMSzzJa=AWMtrT6Bw=3P+SfBKvLA@mail.gmail.com>
Subject: Re: [PATCH v8 40/46] KVM: selftests: Reset shared memory after hole-punching
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 01:32, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> private_mem_conversions_test used to reset the shared memory that was used
> for the test to an initial pattern at the end of each test iteration. Then,
> it would punch out the pages, which would zero memory.
>
> Without in-place conversion, the resetting would write shared memory, and
> hole-punching will zero private memory, hence resetting the test to the
> state at the beginning of the for loop.
>
> With in-place conversion, resetting writes memory as shared, and
> hole-punching zeroes the same physical memory, hence undoing the reset
> done before the hole punch.
>
> Move the resetting after the hole-punching, and reset the entire
> PER_CPU_DATA_SIZE instead of just the tested range.
>
> With in-place conversion, this zeroes and then resets the same physical
> memory. Without in-place conversion, the private memory is zeroed, and the
> shared memory is reset to init_p.
>
> This is sufficient since at each test stage, the memory is assumed to start
> as shared, and private memory is always assumed to start zeroed. Conversion
> zeroes memory, so the future test stages will work as expected.
>
> Fixes: 43f623f350ce1 ("KVM: selftests: Add x86-only selftest for private memory conversions")
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/x86/private_mem_conversions_test.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> index 861baff201e78..289ad10063fca 100644
> --- a/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/private_mem_conversions_test.c
> @@ -202,15 +202,18 @@ static void guest_test_explicit_conversion(u64 base_gpa, bool do_fallocate)
>                 guest_sync_shared(gpa, size, p3, p4);
>                 memcmp_g(gpa, p4, size);
>
> -               /* Reset the shared memory back to the initial pattern. */
> -               memset((void *)gpa, init_p, size);
> -
>                 /*
>                  * Free (via PUNCH_HOLE) *all* private memory so that the next
>                  * iteration starts from a clean slate, e.g. with respect to
>                  * whether or not there are pages/folios in guest_mem.
>                  */
>                 guest_map_shared(base_gpa, PER_CPU_DATA_SIZE, true);
> +
> +               /*
> +                * Hole-punching above zeroed private memory. Reset shared
> +                * memory in preparation for the next GUEST_STAGE.
> +                */
> +               memset((void *)base_gpa, init_p, PER_CPU_DATA_SIZE);
>         }
>  }
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
