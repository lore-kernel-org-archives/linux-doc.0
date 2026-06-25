Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEF837F00D
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 09:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379222; cv=pass; b=ocpw2AFY2VI3IyucZHdgrsQ6q5CxaQ28a8jIeIH61vCD2fRK8Lvwh7Xo5eqKMctcCrmsG6hI2z6vLpZwnb6QD1e38YZnnUcK3NuefaXY5v1PDDr6GtPI4srkNDtHu1vtAT12LQhSC7FnwhMhMS99oeHegupZgnZlbCp4oT1NBRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379222; c=relaxed/simple;
	bh=VvJfZbIRil3c4qUEVncM0B4gssrwDmoZt1aKoqwRohw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5Jh7TbPb/QheUJjTvLS46rQOV1WITKttfZDvqJWcJ7yO1sbNFBE2LEWZSj9UwGtH6d6pAHuUYzyXrJ99oHPtBHtf5qeRHLziPoMeQdCIQYGWm+DJp1N4ZLjoMi9kXWcpJtvD/Kb7vYsUWD0lAO/fWW+vmxEnY12ieBUvH8CdCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sHoCqtxc; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sHoCqtxc"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-519ed52bcc6so218631cf.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 02:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782379220; cv=none;
        d=google.com; s=arc-20260327;
        b=r7mKxyu8BtQoHAG+jvtnLWW0l7wY+30rUj8Vl0M0yEOniZcfXVGimqUdPV2jCtpqqV
         U0a3bjRdudin+Tl98yoAQ4Y26VUhInHtte3CnPL/5wHW/CW8w1g1a5DSFVHiLsHKT8sS
         BS4jm5QrhOGfBNCCantxBYwNb/zmnaGL53nAfNQ42WwnJsGt/pjSvBvaEM9AImM549zK
         YHHwxi4ic3iT403E0pSDEOWwpGejjehgrtYWNUEG2TaSZkp9ocuWlLsElotmrJp18ezr
         DZIlgMmpTTwvuLwCJa8xxrj5GeRGGM70NrRxpDlLo6tsvf5kBTJliI6NIEYpAAVhxw81
         zH5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9sNVNZ83P6g0a7P8tPRt1nDyKQGm49SitMTFhdy7JFs=;
        fh=YDWea0M60owC7FYh5Twsg5MfXLp/LdoKYh8fN9j/HkY=;
        b=YbSURTw1zGd+9OsMpn53oETQD5FabeFm8ZFS37OkTL8BKCr5i1fq6z5saI0Q79EVCd
         gEVNLKhRK8bsDu1OxEzEkJ14aCxKTFHYJeMt9F01ujp8D6X062SJ+YcU6o7FUSRv+2Ku
         UnbpTgVXjHxuS0csLAzNfYkWFFMcCXCdHrPrd6HCmicWVmXDWE4tFULB8EaEWKMeZlIA
         P2YGYyziagyTz+pfGrDrnacp0PMSKW4vOCT/0i9swG/TGl700kajQjIwBaMnOUVoh+bD
         tI+e/l0jR4JWm6jqhGxkJjIDjCJOMEtCJISC2BcggANNFuOGa6tec613qAhL4AgULRFj
         wncg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782379220; x=1782984020; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sNVNZ83P6g0a7P8tPRt1nDyKQGm49SitMTFhdy7JFs=;
        b=sHoCqtxcsBpRGQR93WwrL4Rprcr1QwyvppQmBSKllNaiQKveEBRjCnonKRFZa7Z6m9
         +oOVGonFyUHMnZb+kZnS6iUCwNoCqG3Ny8+m7LrN8WACHABB83NkHapybUKORqHCauZF
         SEgIM9jSGnc+bD8NUFUGz81LgV6IFzMywzmXIVngK14vKU+I5M9ORDekRXX0DrnMltd9
         qORudEJ4Opzx/t8Gp+odaQo5QAgGZqIQefx7RHmiEHMkAlLgMrYdOBnsUqUDd7HTl566
         qSkdexSW2GvQXS6JErTD/Yu8fd0w5H+0Rg1WIRe7QcvxoG3iGKpgA4jH1NReHf+IqfRo
         sCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379220; x=1782984020;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9sNVNZ83P6g0a7P8tPRt1nDyKQGm49SitMTFhdy7JFs=;
        b=J12QWiLuiuSHpVo34WIWtt2uFu3AwCZ2tCGCMBqFPZDoB3HwIOAtsF9ishLvyJ2luE
         kz0V/ZweUbFfkUBzKpcY+cvYcsCTQ3bi6OIOkPE3VNuOwVwFuUrZh77ow/XGMEwdXgL9
         10tq3n78B8qgcxSmMeMYqIHP///7Ug9lLX13qB8JoJ4M8iEHmqI/7zvapBI7dS2za/Es
         ypn7ud7HLCSHQyAf7W8mRzRqddcULgy0NzRTgZjXqb0u9biNCAUmZofY3VUtvchSgr9U
         dJA8qlNSU7XB8Al9fGXdeCn/dGy/kq96Uy3lA342N3DrHIr1q6/guhKzI1+4SgToQ7P6
         7YTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/s6QI0J0BFZibip5A0eY5B1U5wAhvdOdmjTHqle/6GT1ZDXpjMX9mV0O8GmUjh8tRsM5BOhn+FlqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaPcNWJiQRJYZlP5+YLd8dna/HeHeD0/BYrozOHXYPKTAc3SDY
	E4cY+Otbf6lAqwb281olPBGLEACxEeGlETXspZ9zGxM5ri3UGSUboAusHGXUJFcJ3fKNL77Y9sa
	Qgffvlr9u/RDX5bDVvwQ0APpHa0sAiYlPaUXi2r/E
X-Gm-Gg: AfdE7cl3mChJo3lHbhxiEVmF31qmcQLjvRWsqbR+wtib8Qg2hL6+ltbLvfMmrHSNc8e
	Lbr0uyhKbq6NrGPQNWqeBbJBvbMInwTfBEn0iSxthFj5rsbCetIh/IJNEtChwD+bLlXWZjLP3F3
	qEjvqFs18F+n8CNxXtAzQcOi6WlpkaWfJps68YSaAqT1x15Srcc0/sgf46bp4sCyrqGOGgLb6mG
	k25Wk8493fHaZlHiYjLP5NkxoA2UyNA2UGvmgpwSsK52ybx+/GLJk/1O8UrGTuf/DQA07rNPQ==
X-Received: by 2002:ac8:58cb:0:b0:4f3:5475:6b10 with SMTP id
 d75a77b69052e-51a6e9af205mr7810381cf.8.1782379219049; Thu, 25 Jun 2026
 02:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-43-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-43-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 10:20:00 +0100
X-Gm-Features: AVVi8CeL3q_KiSPnBQlDtTbHhecm2C_9dXyC0RdNzrEqsxqa92mG6-FntXo0Q6U
Message-ID: <CA+EHjTx3z48aykAeQ36d=pOGEEcChWst9_T5+rOFNcxP3n9vZA@mail.gmail.com>
Subject: Re: [PATCH v8 43/46] KVM: selftests: Check fd/flags provided to
 mmap() when setting up memslot
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
> From: Sean Christopherson <seanjc@google.com>
>
> Check that a valid fd provided to mmap() must be accompanied by MAP_SHARED.
>
> With an invalid fd (usually used for anonymous mappings), there are no
> constraints on mmap() flags.
>
> Add this check to make sure that when a guest_memfd is used as region->fd,
> the flag provided to mmap() will include MAP_SHARED.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> [Rephrase assertion message.]
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/lib/kvm_util.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 0b2256ea65ff9..6b304e8a0e0d5 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -1110,6 +1110,9 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>                                              src_type == VM_MEM_SRC_SHARED_HUGETLB);
>         }
>
> +       TEST_ASSERT(region->fd == -1 || backing_src_is_shared(src_type),
> +                   "A valid fd provided to mmap() must be accompanied by MAP_SHARED.");
> +
>         region->mmap_start = __kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE,
>                                         vm_mem_backing_src_alias(src_type)->flag,
>                                         region->fd, mmap_offset);
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
