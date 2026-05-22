Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8133876C1
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 23:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779490961; cv=pass; b=RYGxaQytw7J39wq/1rnjsSzlaHNbReC0QTLZaXj1OgdigFmk1hfzhuK51GHZ1Rdf5lDytZ97+viKa5po0PM63CBqBnWkXz44GtH4SxvBC5jmbhjTMaISmMPmKY6lZn+snSOoZMgIQ3HVPyHAwU8TaWC4cLejEjRDZCA2RQZDqjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779490961; c=relaxed/simple;
	bh=ibZMSZEwhsHjGnLBrHCL/QtGJncXCz0nJYgEJjvO8KA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/VY7NyyQ1PoZGqbxs/Ows7AcHtKO+iUE+sUkKBHt910xlR6Zxhh6jeedMFLeC8+BCTVRtAFZZnvP1nuSLrexqiGXTC61YmbGmmAJYxC+sTf7Xq400jpaCjkNz4+vBlRrE1t+GawlQMkh9UUdKSu4ARLYBqSACCMktzMH5pMOFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YQgAgxjd; arc=pass smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YQgAgxjd"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-57533363201so2595918e0c.0
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 16:02:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779490959; cv=none;
        d=google.com; s=arc-20240605;
        b=ggxPPE6FkOYSUzCXngZRIsEVPSysAI0wg49qlaAEUjij1y+0yfSD5he0IGBwiK2Vnb
         wEndlF9jioEnqVkFnPwPsNgJabOTSBZtizvMah0T0H4a8473gdu/Zz3lhcZeb9MwXSxY
         QU9evhxS2t05OZQsyXYyTMYmMb7hSJiKt6XzySbqInXAp/NpqZibtobtrlEb0ObcCg6M
         EMXjni/iXhB5WeIZ1YaDjQaEtY8JqxdPSe5VZxUaEUsuAobKo96BBcYox+EAJIai2IHX
         nFxw0yRWQhNDaVg2adef5EbgOM6gpaWeBtaalaryK5VtBirs43G/xzSy9XE0wGCVPgbG
         8hKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=+lqWW5xTN76UwAfrRbxGlO2NBxcf8RIbZZTDif3+3JY=;
        fh=Qice5M1ZJzrUxqJaBcVaeSpLVAfAhcBdhYoBSyTelys=;
        b=ApxAUhlYcOD542Li+qQLfAQKGdZJwpYHHSp4cw4jezUWguu4Ch7teUSS5GP1J9hVMd
         wPERhVobCeCDlUUO8Oub2q0HZ1txdRYFE4V2A0EDekrwqG/5FPNsfCjX949Vy/BmgrwJ
         VR3htnS6QTloF6H3dgIZg/LrB3o0+qvWVMHXvCMmz7DDFH0+OJYXZeeNBGN8uZXR4ixv
         lfWM0ViRXrP0bmVCBVdmpO+HAujKhStLlo4Eud4CGxKuW+Tuk8Vgahyrt0ewUGO74WLS
         tjF8lnHniqIUj2mGbUq1EKyNMBMBVfmGTf+Pm5haZEaeXdiK/Lwa15cDQue0sgeRNfih
         fXLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779490959; x=1780095759; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+lqWW5xTN76UwAfrRbxGlO2NBxcf8RIbZZTDif3+3JY=;
        b=YQgAgxjdzx/T0WCj/Bi/gjx8L4ZI2/BWximtpzkBrT5ik/C70mWPd2OkJgjGGvhPdH
         zmxB5xtR6GHvDmU+EHbkRJNBh6TLKkNVzDeX+d29UjiSbIK3QGcFPNXW/GVTho3tFmhF
         ZTbgBSEyC1XQIo05GzG2xYS58Su6qOFsJQGaW9a+IQZhPSpOMkeCqH1uViErKDZBd2SU
         H7KcDoFVM0GQagKSWqtwDaXMefIeyNl6ugj6siiOKuIFhaTWenYXrnQrDOkvisFzc/ab
         mGL7evVPn00TMqeLeJyZtuGamzUUGWNLGtJhV6HlOGJen2br9ouv7p3beAG0xX6ph38p
         ymRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490959; x=1780095759;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lqWW5xTN76UwAfrRbxGlO2NBxcf8RIbZZTDif3+3JY=;
        b=gE1nOFqtMHSGuk5ioviWZeycwJ/oFnkQxxke7Az2V6S9twsE3KHr7Odk11Nkw+zYrC
         N7p3n+0S1paL/F3d9wpciq4ldOCUTwmEfnyjF0XGp6lOtj4BAvpvtpCOqfZ3PNv3VBgD
         gQUSo+l91sWSvLWw2MXu57766b6mYNE9M7hrZ3BISn/BSBYc1tC7XdUBsRfFRrwUezqd
         juPXjldW+QEr42dtviDCdJTxgOVts8OzS9Yc9vZtJESW0/ZIWtbrAUXaTqc+5C78LTc9
         YtGXn481lbCaPNSsNB3+j4LK5LLpXsQ/R3zOW638OLHPyWxtJef9w0HH84qQRn5Jy7PK
         RhQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eP14i/bRuoQOFZ8CEf/LKdLmMGMEZ6Gyhqcp+Nvm1N6gJbKWw0nphUkepD43XgM4pDtbnd9nwlpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyuYBWxBVv1YIu0QzbozcZ1PjyR3a2rIoYYiuVP2DZD+Rms9Xv
	ytfmts4x22xldvXMWlD5XCdT4Bm5Jj803l6ErBw769L0kQKQJcaXPznNn8401+4yaX9ERmDfLyu
	kLSgYUpSnnDvgyZgVM3BSSiypogYFgGInAKYYBdLa
X-Gm-Gg: Acq92OFb6dFdV/4P9qeAdq8JSb4uskph6I7vzXrqJ3uY9Ya3GhqqPm2jkUn+JIVvWCC
	V5K4m29k/WTl1KEJcAmZO6R3HMJKLzs4ZLYPHf5VuWnqDvb5l3s1/i6TJmRlhwlU0fSq38EAAOX
	9Zb7MgRg4u2oaPRNcKvOQTclxj2A1Aie2XT31KxM9eVjhAHwIOThTCif9pw1le0v4otjAYDuykj
	UFBtynrL6g0wTTTHvY/b69g1unpWnGAWaoAnCl7zXYqG6NZDgGfC8GkiAzh2ApAIVAIBX9hQdb4
	vtZXEBZaIp3docJofEoPmsHYSNwBuEQNKdqCBIbi6x12v1JviXN1/xlG0NLR+VXCbAnKSBEDmlY
	i3dLG
X-Received: by 2002:a05:6122:1796:b0:56c:db8b:504e with SMTP id
 71dfb90a1353d-58663966692mr3461861e0c.13.1779490953839; Fri, 22 May 2026
 16:02:33 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 May 2026 16:02:33 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 May 2026 16:02:33 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-25-91ab5a8b19a4@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-25-91ab5a8b19a4@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 22 May 2026 16:02:33 -0700
X-Gm-Features: AVHnY4KLpjLWXQlawB-gZxOwicuZUmspmndJ5b1mQf8zRUUhG2Ao-NrVmxpOgcg
Message-ID: <CAEvNRgEHf67kpLtNyET7cvE5hWfXHqNrwv9cP9bRUgk_NKb+0A@mail.gmail.com>
Subject: Re: [PATCH v6 25/43] KVM: selftests: Add support for mmap() on
 guest_memfd in core library
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

>
> [...snip...]
>
> @@ -1078,13 +1077,17 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>  	}
>
>  	region->fd = -1;
> -	if (backing_src_is_shared(src_type))
> +	if (flags & KVM_MEM_GUEST_MEMFD && gmem_flags & GUEST_MEMFD_FLAG_MMAP) {
> +		region->fd = kvm_dup(gmem_fd);
> +		mmap_offset = gmem_offset;
> +	} else if (backing_src_is_shared(src_type)) {
>  		region->fd = kvm_memfd_alloc(region->mmap_size,
>  					     src_type == VM_MEM_SRC_SHARED_HUGETLB);
> +	}
>
> -	region->mmap_start = kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE,
> -				      vm_mem_backing_src_alias(src_type)->flag,
> -				      region->fd);
> +	region->mmap_start = __kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE,
> +					vm_mem_backing_src_alias(src_type)->flag,
> +					region->fd, mmap_offset);

Sashiko pointed out these:

1. When mmap() is done for region->mmap_alias, it doesn't use
   mmap_offset. I'll fix that in the next revision.

2. mmap() may map past the end of the guest_memfd if, due to alignment,
   the mmap_size is increased. That is true, but I feel that that fix
   should go with a bigger clean up for vm_mem_add().

3. vm_mem_backing_src_alias(src_type)->flag may contain incompatible
   mmap flags. This is true. For now, when guest_memfd is used with
   vm_mem_add, the src_type passed has to be VM_MEM_SRC_SHMEM. I think
   this also falls in the category of doing a bigger clean up for
   vm_mem_add().

>
> [...snip...]
>
