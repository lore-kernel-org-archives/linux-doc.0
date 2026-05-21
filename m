Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219D23A1A2D
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 12:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365552; cv=pass; b=kvdxGryTrGDHfh+0roa4JSgNXlAsAMuFp5IIcGWDflaxzbj15vAYVcr6n2TB8QNOuLK/rZccomKhtzKRZbJPUwtQoR5Fc0UKRX8vBtvWAFFhkKje57WsTE8fJ3Vr47VCdzehCQhG1NcKwVNeAO7Q53KE11EEF3MQFuzjXvk+Jus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365552; c=relaxed/simple;
	bh=mUWTvSyqIoqkETcgZuIds2FYkJwuokmb9q2VYy+exYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d9wD8jkZ9FpU2Yz7rZoFbTy4UnigVgcsRNYbxsuPSkZbn2QtKk3zyRGcDkUIFeBxQwRgIPX+bGFkl9EVrtvCliLracR5PMcrEBdjjj06hPzwog+/pWW/sZEcnG42kKTVAeULJUih7iL/ZRMjZfxY9/ZY5ylOHMZlJkHZUQe7Rbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZMXq191O; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZMXq191O"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50d864c23bdso30801cf.1
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 05:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779365548; cv=none;
        d=google.com; s=arc-20240605;
        b=GggoDiAGzZYLCorWxS2Ws+/zPl1b83TLyF+h3fXWiSuqTaOnlJSwOaZIGHOaGZ31ZR
         xfuEpVRbo5jpFg5PdO8Mh6P/SkRpN9zArGp7AFv6t3igWXt/zgMjNyK6NZNFl7bZmsnF
         qgJwxYwemNnk73nNl+gLnD2ezgqJw2bWdVTzmL3RKcfHOf2gnLUjvO2VHnDBhxahLKuM
         dnlYZoF7ykAJRGujH2MuRkupAHlCKGSK99QZff8K0IxODx2eaBcrEaDnJy87w9I4Z4Z8
         xZabAZfmIy6Rov16ylSt9GVZ1VMNMtVVYhQPtVSzkE6SsH/yptk8MvjuYuugQZrMtYne
         h0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F1wmmG0cNegB4E+dlRzmEOWoIo3QXb0mRCuTWAZdGJs=;
        fh=SznFqdB1HtVSqhwTsfbkiqfiqZdofcOlQZZtSAh3+6o=;
        b=PmIJlbWlpzbPAst1jyOQdQ84uVKeP0MM3Ao5mGio1f5K5CVbH80nOWqr+TbRwqtmRe
         NrFLNMpNnyjqlpHbojRGbY6MbqzT+dIPHR6UGljdCQ1ZKPNzt14BiscTpOLHb8uf87OU
         xSYDsGcRGOqlRsv5MCD5PdGZX76OeAYLt3XWlC/b/jlWsXJkob11CabpDYkX2c3Td/HE
         p7bxB42+ooqiV9WtsnRgy2cU3cfAqR5B3RBZt3zuvv6tmFFOH0SWKpEkhfQgnTyEfE7d
         LgjNdT2TLoT48Q+3U7noOrqPN7kSpqR7CKIE1UyO5n7KVxEZkaKRagurJKpQcO8U2toG
         DGDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779365548; x=1779970348; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F1wmmG0cNegB4E+dlRzmEOWoIo3QXb0mRCuTWAZdGJs=;
        b=ZMXq191OZ0ewgz/38yO4xoFcWd3BfNqgLDROwws0TDhQLamZtSsRTzrbGaf3bXsuu2
         DZd48Qi+/dzZ1Xga+l++OmodGBoY2F9b1gSWkITA29iTX0aSBirp47+9YNqEhhgAJzZl
         VvN+4E9QIQlQqDNqzKadhMMxECjlY/jAfzkIwJmGhbdGFYIhcFaT/xLoem7fGyMQKMrf
         txUDc04l0J//dOf4QdBUzV+Dlr4G4DjN6C/uIj5rbLxY+KSm692iLqeaPJ/smp0e5IkE
         wM3m8zg4wUdoWpoh5HY48FHZmSgODqJENbmsjBjqJ2EBmvfwmsyzdhZq+EaIP1uld0jd
         F70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365548; x=1779970348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1wmmG0cNegB4E+dlRzmEOWoIo3QXb0mRCuTWAZdGJs=;
        b=Yo//Oa6ouxLB9Q5vIlwQVOdVCNmCktP+F6pQqqDtsW4EsTLXj7Kf//lO1OIQSBvvI1
         UvDyx6XnxoBrv/36Zt3bNkuMWLpv9pUeSGGNQJNwIDQSZ5J6ujVLM80zCwLiTZT8JBb9
         N9agcy53lf14Qf0aTlC9KdDzyeXjkTzkKfMUbZ+3HMqU5BxR/UnHSrGSkOU9YuEWnOs5
         iIaqKDBakwGLB9C3++K2pV34LaqzGX80Q9FOgk/NPEegjChnPUdl7NFDZ9y/d8KdmGNy
         lkTSXqUdYJ8DiFFNDHlkjJSgf7jlVuLcQUZMbQxfmaVgB6UtKm7UEoPguc1mcbGG672s
         wvDA==
X-Forwarded-Encrypted: i=1; AFNElJ+6es6rn9wgnEPf+6wvk/8kkP7dE4EmDd7qsA4D+v2ERN4ihVzy9qk3otzYPsRyxe/vUmR7zvbHsT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2cSmA2K+9a9KxraU6262Fel34tzX8ZocMxOMp6y/3iPNofsOt
	UtvkNsqUt5SIlQ+Y4SUJF5VNMoDxGrFslUEPxFk+sink9yrqMTJAYyAGOXwjSVwDkeoely5r6jb
	RDUx+U52IfI34GwXqDmKQzrCEWBU9uYFmx+HRcZAO
X-Gm-Gg: Acq92OHXT4usv3m55uJshIL6njjgJ+e1YhoQx5ThlzbSQuRsqBFydZueut9Hg+oDM+v
	IPs8ONeN/twHIkfVAMNDTMUJUJFr5Y5pKqREAu43BQB3UF9RIeYUI38V6K63J0saVMMtePzd7zF
	GUEYIHV67qr6LuRTrzh6Vvjan6GHmqm9EgKLlO0ZVA4vr237Pr4OyfViY2ok+T7X4IrzyhdTffL
	2clMq24lCRwjvppFheaBVOGFvebCbkBvJsTLiwjw87ovMW64Bg2VPG8Be7TQI4vcXx78ePGVx2x
	5Nf+zVvF7OC/a3H7eo9bZ2PDVvT7dA==
X-Received: by 2002:a05:622a:995:b0:514:c25e:c164 with SMTP id
 d75a77b69052e-516c545d403mr10074811cf.10.1779365546829; Thu, 21 May 2026
 05:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-23-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-23-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 13:11:49 +0100
X-Gm-Features: AVHnY4I9MwIePcJowBi5yVnmSFDQMJen-Uv4dVyPJ1sLPspDsU0lqTAnhNGKza0
Message-ID: <CA+EHjTyftaGzz5-NgZGHZvgvuKDCBVSuhSsWSQ=niP_giotk7w@mail.gmail.com>
Subject: Re: [PATCH v6 23/43] KVM: selftests: Create gmem fd before "regular"
 fd when adding memslot
To: ackerleytng@google.com
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

On Thu, 7 May 2026 at 21:23, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> When adding a memslot associated a guest_memfd instance, create/dup the
> guest_memfd before creating the "normal" backing file.  This will allow
> dup'ing the gmem fd as the normal fd when guest_memfd supports mmap(),
> i.e. to make guest_memfd the _only_ backing source for the memslot.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/lib/kvm_util.c | 45 +++++++++++++++---------------
>  1 file changed, 23 insertions(+), 22 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 2a76eca7029d3..df73b23a4c66a 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -1054,6 +1054,29 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>         if (alignment > 1)
>                 region->mmap_size += alignment;
>
> +       if (flags & KVM_MEM_GUEST_MEMFD) {
> +               if (guest_memfd < 0) {
> +                       u32 guest_memfd_flags = 0;
> +
> +                       TEST_ASSERT(!guest_memfd_offset,
> +                                   "Offset must be zero when creating new guest_memfd");
> +                       guest_memfd = vm_create_guest_memfd(vm, mem_size, guest_memfd_flags);
> +               } else {
> +                       /*
> +                        * Install a unique fd for each memslot so that the fd
> +                        * can be closed when the region is deleted without
> +                        * needing to track if the fd is owned by the framework
> +                        * or by the caller.
> +                        */
> +                       guest_memfd = kvm_dup(guest_memfd);
> +               }
> +
> +               region->region.guest_memfd = guest_memfd;
> +               region->region.guest_memfd_offset = guest_memfd_offset;
> +       } else {
> +               region->region.guest_memfd = -1;
> +       }
> +
>         region->fd = -1;
>         if (backing_src_is_shared(src_type))
>                 region->fd = kvm_memfd_alloc(region->mmap_size,
> @@ -1083,28 +1106,6 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>
>         region->backing_src_type = src_type;
>
> -       if (flags & KVM_MEM_GUEST_MEMFD) {
> -               if (guest_memfd < 0) {
> -                       u32 guest_memfd_flags = 0;
> -                       TEST_ASSERT(!guest_memfd_offset,
> -                                   "Offset must be zero when creating new guest_memfd");
> -                       guest_memfd = vm_create_guest_memfd(vm, mem_size, guest_memfd_flags);
> -               } else {
> -                       /*
> -                        * Install a unique fd for each memslot so that the fd
> -                        * can be closed when the region is deleted without
> -                        * needing to track if the fd is owned by the framework
> -                        * or by the caller.
> -                        */
> -                       guest_memfd = kvm_dup(guest_memfd);
> -               }
> -
> -               region->region.guest_memfd = guest_memfd;
> -               region->region.guest_memfd_offset = guest_memfd_offset;
> -       } else {
> -               region->region.guest_memfd = -1;
> -       }
> -
>         region->unused_phy_pages = sparsebit_alloc();
>         if (vm_arch_has_protected_memory(vm))
>                 region->protected_phy_pages = sparsebit_alloc();
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
