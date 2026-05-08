Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4EA20E702
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 23:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283406; cv=pass; b=C6fV0oJ1Hm5a/x/eUE1Ie/DeOhv3bJnvHF/PKH9l2qhNKDKok86muYDImxmVDDn4i6IOMkiZdoKbQoUk68+sOmG4G08nPcyzTAFCXzZzSY1av0MnWla+0DaFbWhOqDFMUr4sWSO95INYhLa3Z/tNr2tXUJ2GnY+ctVJZ7Fjb+n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283406; c=relaxed/simple;
	bh=qugc+0Ib7z8RHG2l2I3zLFMp2jsqIX/yclDbZ06fydk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SIWN7o0LrOR4GZoALhSYirKBojD/kFY91beLc7dmxIcbiG22xrZBytHpl7nCg8MjrpgNtsHDwIgbVksFYw7Vd69ZGsLkg0F81jWK7dlgXt5yUlGIuY8VRtiCunaEPyutWDZ+yibJ/s7/q9DThdaEDUv2Z+1MbVVFZsLAYdC1wNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L3pNc6Pu; arc=pass smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L3pNc6Pu"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-575320e6f2aso1808835e0c.0
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 16:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778283402; cv=none;
        d=google.com; s=arc-20240605;
        b=UC8cy9LoKavk8LHFEquWHJmYrP+Eso16B+g2uX6fo5R0wPBRyqK/s+chYIifAAAfjY
         wmptF4qcC9BP1BrRO1srYp2GcztSlmTpIMTqLV++IcRv3EJzS1AFd1aUdmwrolW2fIBG
         70PjjNN+saVs0YhzJW9A3MJmdX+tfZNaVF8WS/8JHvnyVV1/oXg9kYDsRNHaAvvgwKqC
         1wezb4zYYOp4LKwXuynbd+gmj9JRJZl86wRAKqusXBCsMSHRH5R6Av/sxl2S1RjLFHRW
         p7+KTQaNsOmI5YM+MTmLw9jJFrfZmsLvqJJoSkJNqE3HxSa8RlYbhfFhYv/KIHIHIxuY
         UMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=10imNO/dPWbMThTpLIZ3BPvS8U4RD3Gbc9CIOJSztJQ=;
        fh=pQvaXI8mNJMlUbqJXiNhfWCCCgsGlvOg1WfQegzEyzg=;
        b=lv9yVU4QyjjgTvKe3rlB3yOTRtjkTZb//yHjd5//ZUJ23yZ1uJ90xSWdx+uLydVonT
         QKNGkSvNWyusriBjMea/iR8AXrflXi3SRvbTbgHfc9JDVP34RKPAIIMFnVcl+N6SiCgP
         dbraxyAYP8eJSX+kmdmhTlUxLqYxiWpLIHBnBxzxwU2jDy2neg2gpcYKVo1c06O5c5hF
         HqZub/cXKKuzlN1aMuIdK2P392G7fPyYGvQcOH8p++/HDJbg0+sIIYaCr/ZMQFXBbp+I
         9uv9MDEWTjfhtpCAatYnC6NlYNYLStxNPQSy/S1fMIfDPnLbNM4wpFG5CLhxMU3IBsQL
         n2tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778283402; x=1778888202; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=10imNO/dPWbMThTpLIZ3BPvS8U4RD3Gbc9CIOJSztJQ=;
        b=L3pNc6Pu9SyBBUWj3BFV1Su5NM9Nj4vJG762PMMFC9iznQnIWPZl4U5dIYvHQL2wSW
         LX9d2cXP+e4Mec6XmkPIpGMcnIXMSEEbtnSnZZGrzHfoqPm1fMo+wnZw99PNL193rZgI
         keQxXGgwPDFJ+qT9CSUFHQpBFD5S8iDK8/NG8t8qXUsg0hRAFVznzS0USPnaR11t2taz
         9YqD0VfRAP4YAzYKKwUzxjC1DozIvgpIFll2PFNl4upPvddNpOZcqqtT1nnhHgKwEOnq
         O0ifF1uZKYjMoWJyreDyNvfbpss3+/8erlISn2zKZhhjtd3rxDUVSGLbrVCO2Flh2E3t
         2X0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283402; x=1778888202;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10imNO/dPWbMThTpLIZ3BPvS8U4RD3Gbc9CIOJSztJQ=;
        b=cdqFEoX2t4UJV3Md0PDZTgijlxehSYNAM4ym0u/jymzvN/vTEmMBfsJ0Hi6NieuUZT
         FPSzlk1IF2V+dmg6q9343v3fEulwLOBrpuiGleSu6CzU744GqP6uRJYYIFyzr04pJqEg
         JQBC8pVzU9vMFZUzT3FDj8elF/AVOSZJ58nbOjwrdPbZ/Ro+TfoHDhx9H1ixadDiA1fN
         wDwi05/0daX1zalruIQ+n+3LHxatwTBF9WkWSDUlMCay+sQK/FWRl/fSoMEusHoFpwAL
         UzuF7X9TINpoyTg7CQGiuOZkbzWVZ/4iz1mtdf+dcs+Ff4hWyW8uCEK097LYUYLbcpIW
         Jf8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9lDX/vez2fVPk7hziVsOFri+vtUj4oqj2uwxs6zagj8phcy4yXcVxgMCA6f6e1Ej7EfsnNvgN10D8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrGLNXbT4j4z2NLFV0CUQrcnB1shf5OqK7ITxihfEK8cejmUvc
	wipE8nqTQWu6R2Oa+Mh10WgCSCJIv99ji6FA36u9k7YIi8ec0s4owl+njQ68uQWn0exfoK1BpBR
	w96CWyqjC7Kpitp7tCuy8vvIdW6YAFVcacb585lu3
X-Gm-Gg: Acq92OGpJYxq7U2NHshp41PL+Qe/HglVYZf244Aytt2XnP6koANbfkp7LZ3x1SjiaXu
	xl3RG3vZq1A2Bsug4P+l4PuZAx3xG5qANtV9DBI9Y9h+ZEfyAjy1MS4xwyCMmvXTosqGc2zhTvQ
	iss8XSyJCzMdURHI6aF5W00X/LjqvTEJ64kmIo7PsYq3Ay6uAYuK/NhcvKgZbg5SC47etUdvzX7
	ubr2RjI0kX1Zn1oiUB4vTisbKCasNz9amTU/8JiKsDlIhj77N+AGSVFE+nwirwrr4d4Lb6xCWsx
	i/x26kFW0J7w7NscknzBgIFUtIaLiwkPwarQWkeaAy++RCZ8p1am2+YP9XoEQdDhpwPXVoJa/3D
	QRoV+0BVu1b8sPJ8=
X-Received: by 2002:a05:6122:3208:b0:56e:e80c:bb25 with SMTP id
 71dfb90a1353d-5755963576bmr9165277e0c.13.1778283402011; Fri, 08 May 2026
 16:36:42 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 May 2026 16:36:41 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 May 2026 16:36:41 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-1-91ab5a8b19a4@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-1-91ab5a8b19a4@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 8 May 2026 16:36:41 -0700
X-Gm-Features: AVHnY4LvPjVICPzN5-_CJPHTIx7ocT885vUY-RO5A-DcMZDUx5r_5g4UegbM0fM
Message-ID: <CAEvNRgGF-n5gmTR5G7wZqH5gBZsOp6WMR-RSws+=g9tcCkfSiA@mail.gmail.com>
Subject: Re: [PATCH v6 01/43] KVM: guest_memfd: Introduce per-gmem attributes,
 use to guard user mappings
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
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 69c9d6d546b28..5011d38820d0d 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -4,6 +4,7 @@
>  #include <linux/falloc.h>
>  #include <linux/fs.h>
>  #include <linux/kvm_host.h>
> +#include <linux/maple_tree.h>
>  #include <linux/mempolicy.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/pagemap.h>
> @@ -33,6 +34,13 @@ struct gmem_inode {
>  	struct list_head gmem_file_list;
>
>  	u64 flags;
> +	/*
> +	 * Every index in this inode, whether memory is populated or
> +	 * not, is tracked in attributes. The entire range of indices,
> +	 * corresponding to the size of this inode, is represented in
> +	 * this maple tree.

Concretely, if the entire guest_memfd is 2M in size, indices [0, 511] is
represented with some value, either 0 (SHARED) or
KVM_MEMORY_ATTRIBUTE_PRIVATE. [512, ULONG_MAX] is also defined in the
tree, as NULL.

Since guest_memfd uses xa_mk_value(0) to store the value 0 ("SHARED"),
that makes 0 distinct from NULL, which works for guest_memfd.


(Liam and I discussed this off-list due to a email configuration issue)

> +	 */
> +	struct maple_tree attributes;
>  };
>
>
> [...snip...]
>
