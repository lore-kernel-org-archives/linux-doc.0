Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364D833A9D1
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 07:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782371033; cv=pass; b=shMrHVnTKEH01iec/lJYY+B0zDDT3tA4mDyxdgJQyyP/a5D+aQG68x1pR8Gr7YP4XzGIdSxcRkg+x+Y8ZlLPbJD1ajTfPkZl7uqKjg61/e/esErE5ezZnBcROuuQ7Ct8kw5oDcA21EwrF8g92rNETUzAOIBgJasCEoVgbd5dL1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782371033; c=relaxed/simple;
	bh=Ez7Zm7P1hEGa0blOb+96zp9ELCwRYL924NP/R/74yK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bS8uBuUhbXSSN5PykaOca+9QFooeDNTl8SouKiOzkvKcmcN7IMh7XOQ3d8Uz96YO/6bGU3BjLvxyX4fFo1Xu0wL+8UAHebyOEKxvAk0J3JiDLqOE3CNHVO5YZuuQT8VpOwiEniaIVRcoihe9NQ3CqzA4qFinFsMHQmNjY3OdsSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ukieVSaJ; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ukieVSaJ"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5177d1ff061so135501cf.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 00:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782371030; cv=none;
        d=google.com; s=arc-20260327;
        b=dqTWj9QCnqQyCGnOeaZV2MTF4wGHeJ3Uw+k55pEuMwyM1BPUWoiAYY5y442+Q6dgtu
         7NjqWjrlSC2Qx7jAQ47cWWDaX1ZPxk6vqLedywwt6RNUCaFetB+TAtluDw9N7dCYv1Ma
         vVjB+xXpEI5BMRYPOp0PUZ+v3Uod9ZmHQRxqnqSUZvrYc6T6FB5w7fhwySRvwtcyxZZ4
         OOrcQvCGvODGQIkr6/J25xrsfmuek/qojLjNDsE1N/clGWRIzcC46Yz7zAHu3bisDSdT
         T7WZgtNkq+bsHIx8IYULrGj8AWSZHF8nsgSpw1fcmo0Iz6qFqdIV9LwCeP8q5XUcsW8h
         Brjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cxrlZg8b53cTZGaXTuMmmJujU2vJAW9nQq1QLfM1210=;
        fh=zq3xKmrltvuwuPrbA/riZWmM8pKvCnbtqwbebaWO9sk=;
        b=ItMjAlFFe3fN6UclTxXJdMmFqK/E+NL2tFbiboTOWeTTawb8y+YrNTlv/Xb83o+im/
         P58Cioyh1yvIKIv6WllWbVkF8ztEAJ7xFd56G2s5p3+fsJvYh3i1C9bP7cILfgxmqJJk
         djalDvYFXbq+sG9QLUyZG1VWR9/cgiqpE7YjLuAp4qhL4Cw5rAc872nHdc01v0rIIQI+
         7Y3WPsh7awF8O6JUqTyXAStw2ClAfLhYBZXH7bRLN1qslpXHFEmvt9B62H1mGRmZbMSQ
         CI1m/z9cOXs9Zrup9kVJ6vd9Z/V3UFPoZ15arWj3rN6+Lnoia1g1Qr1TqLbFChNi/2jH
         +ZCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782371030; x=1782975830; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cxrlZg8b53cTZGaXTuMmmJujU2vJAW9nQq1QLfM1210=;
        b=ukieVSaJAzEUdhev5GVx9vncSogL572gObnX1cR6Us+BKrty0xPVxxD8SyiIoqTV+C
         PwwcfiE18SD1Kc9dTmCtcZH44T7ICizZf+V2/WFdSCu0eJumYPsse/LwsEzhVcSGH0jU
         yEGLlMYOWVSo6mQvuaG2uDGZvzTFZ9J4U1hJLJxzviz5yRofEnqkzTXEbMQFYv/oCOam
         829B0+z6e/vXi+xnx3FFvGxA5VGeYcqSR7BskYQjF9ECoavaqjbAjPL7MdbWl6Iw2ohc
         7UpLyNyUhACLiIKRlANEYiBn3yQlondiNBRv5rpnn45zRiNFZyKRfiEuv9Z328m9MDUO
         j7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782371030; x=1782975830;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cxrlZg8b53cTZGaXTuMmmJujU2vJAW9nQq1QLfM1210=;
        b=IgV5s7LMo5oEdEq9XO8eqGYBN7/BQOM8zmwFwKCIFta8M14/NdjriQ2QYoGFVqu6gw
         g3DHDGOEjfbNyws7XgAFz9ikdONvjH1RoTR/rRBEtVZndDSw8v8PhkbowQOQ9Qz35qJs
         rPx9Aqz21Pc5KHuI7eKVjH8KbfKIOQ6MMy7BlCTwwJ5jDrIM2h8hfVH78kgJPxg+K8+7
         0VfWDBbS+sjX+a8UKGnOuXebxbI4+JpGZjs8SmLhahwxXAiO4VmN15gYb5GmZ7TqR1hy
         SPU663MFWbpidC/YGaGg8PJZCJ1L2rpl2c5L3Kh7pNWjElLmvk1aPH8wpYMHBiSnPoz9
         WI5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8vQyMge18c0vdMWAwe1oEBwYME0Dp0/xi+k+oz2UBo96soMSXxyRF8oCrGVtYlp/J5x1tzkNgJ6Xo=@vger.kernel.org
X-Gm-Message-State: AOJu0YylYVTO9ygGlpjqJRvkyNDT8ftNMGNnLnS0s/p/3LIO9cU5JI2j
	c7VUJsJ0hkVaXJSoG8ul7+K/lxkcu6GoVyLqQyPCJKirIFOI0bjOOys3G37uh0K7YniPenQ+1kR
	euqGhzYQ+M1qgqDazuDUNriNNM92k7vKCnagwRPKd
X-Gm-Gg: AfdE7cmZIb7cLhbuRK/JI8Z3UgoCOS7XjDDuPt/VCSaPuVWstKSujxQV/zr3nZ0PnUq
	+qCtvwfRqUG6ir3nAKQMiiqwiJJ7TWu5eA6ej3noC+fxUwta8Dxy8kc5YqP7ZIoTH6rt276qFmR
	CjiXnQPDf3Rlal7azDD+WDcx5V3QXeOheXGXi3MJqHdp+UnKq25ynsEz+U0wZCez0SgpVVbDagK
	nnO8B9Qdl+ecotDLfQzUELf/ZWNmTFmeQd5UD5xvUfOTybkLFfTsz1HZnTBJ7FSKZtQCIbG7g==
X-Received: by 2002:ac8:5913:0:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-51a709566ddmr4167481cf.7.1782371029299; Thu, 25 Jun 2026
 00:03:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-35-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-35-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 08:03:12 +0100
X-Gm-Features: AVVi8Ccml7uePn0yWr7psf-IlIIJeOhhOzFV38YDt7BElEVA1ysUJR_9AnFc0ro
Message-ID: <CA+EHjTynteewQUd4VTobSypO=oFObYSBLZ_xyK-CGNSRNcrViQ@mail.gmail.com>
Subject: Re: [PATCH v8 35/46] KVM: selftests: Convert with allocated folios in
 different layouts
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
> Add a guest_memfd selftest to verify that memory conversions work
> correctly with allocated folios in different layouts.
>
> By iterating through which pages are initially faulted, the test covers
> various layouts of contiguous allocated and unallocated regions, exercising
> conversion with different range layouts.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  .../kvm/x86/guest_memfd_conversions_test.c         | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> index b43ac196330f1..0b024fb7227f0 100644
> --- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> @@ -279,6 +279,36 @@ GMEM_CONVERSION_TEST_INIT_PRIVATE(before_allocation_private)
>         test_convert_to_shared(t, 0, 0, 'A', 'B');
>  }
>
> +/*
> + * Test that when some of the folios in the conversion range are allocated,
> + * conversion requests are handled correctly in guest_memfd.  Vary the ranges
> + * allocated before conversion, using test_page, to cover various layouts of
> + * contiguous allocated and unallocated regions.
> + */
> +GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(unallocated_folios, 8)
> +{
> +       const int second_page_to_fault = 4;
> +       int i;
> +
> +       /*
> +        * Fault 2 of the pages to test filemap range operations except when
> +        * test_page == second_page_to_fault.
> +        */
> +       host_do_rmw(t->mem, test_page, 0, 'A');
> +       if (test_page != second_page_to_fault)
> +               host_do_rmw(t->mem, second_page_to_fault, 0, 'A');
> +
> +       gmem_set_private(t->gmem_fd, 0, nr_pages * page_size);
> +       for (i = 0; i < nr_pages; ++i) {
> +               char expected = (i == test_page || i == second_page_to_fault) ? 'A' : 0;
> +
> +               test_private(t, i, expected, 'B');
> +       }
> +
> +       for (i = 0; i < nr_pages; ++i)
> +               test_convert_to_shared(t, i, 'B', 'C', 'D');
> +}
> +
>  int main(int argc, char *argv[])
>  {
>         TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
