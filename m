Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8647738642C
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 07:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779347403; cv=pass; b=nDK0W2tTdDyReF0RiDt9F+ZP4m83EG/dW8qtAifg+cX++eYTghu8uMO8Eso5upMh/W3E8gr/S4vJNI22/1/64ZeIgmxonwFG4oB+kCDfctRaUIW9zQG7xElndaqBsBWdJU4tRRBUOz9n8SaMbaF6A/gzD7ty9szR4tRyuqzn5/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779347403; c=relaxed/simple;
	bh=2sMZ3N3pKDNUXweZgFu0jWmttOtjjMAkZWVjljF4LfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZG8EH7DdFB3spv0w+JYaI8Nmx7blyi/fyqnWN3Nf5MOe3Bp5XrQbIG14vhElOAgdnKexf3HGcptxk1rzaVb9yvob4vsAgmv1el9tZDazSEy8c1gyrd7c9QFxqyIZWb4zgD7p10ujhwQZN8OJ2+ZMus/lvExrdnL0GE56O/l5Dzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FmxfxaIf; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FmxfxaIf"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50d6b393d60so3361cf.0
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 00:10:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779347401; cv=none;
        d=google.com; s=arc-20240605;
        b=ElwF+PJ83dHNa1g76OCtc7Ar2D7+TaL5t0q+9EzAlwv0wY77Ltq9Jp2nFOCDeAX+MW
         202p1imU94ef9ItJHpRYj/jn5zggCQsF/q5X1P9DpjKM5OkNqp657tMHtqh797koixWi
         364lkbYHJrl2HYc23JuFC4rfJHONFBZNsacBtSGIhy241lAufTCQsC9aan0dD6nMPzSG
         5XxQ1KWaYPI6hXoDkfbZy1Y1qk367OHCEVCKJIvI3Ww1YBc5e1PJpFjHcJOKDSDupHNf
         FCu0r7q5pxwnzt5r2bkHanWfYc6/F42HZFYT8it7VycogiEzh0Dk7gYV0LdJNZExZqaw
         Miaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o1vjKKtiXH21d0SoJcdzf44kDnBJugtM1iizS2M6tEM=;
        fh=BleBvpCg9XT0zNzRTOu587hp+6dgiZhidPdh/EGcccY=;
        b=SvzJoS10/CszdZoswzpbWRjJeEVV+vePsWizJieOTkCr4EmlIOhmClFeiY6EpqxrQK
         +ax0MoockgvhI4b/9XF3hypGXWqfRdTNefilZG5gpnY4DM872oSkmniCLAp35cZQzZlM
         oTYwMV297MWyimcNCACx5WVsFSQMJYMPy9ifqj71eGdEhoqHu42cguldvnPTQQU+Zp0d
         4pyrBJdAGlYvfLyaErGFCBWqjbFgYK/z6RQ6cF3fo47orF2fLlUpxHyhVCGcJP3b/Pof
         zf52lsaGGwkHj4uUbNPKb7y20Jn21pcjmKrlSH2IJqlYa+S5JLJzgdOAVoTs9TVVUDeR
         vkIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779347401; x=1779952201; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o1vjKKtiXH21d0SoJcdzf44kDnBJugtM1iizS2M6tEM=;
        b=FmxfxaIfaDqoWR0mTQU/lX09GH0v7CdE3bOCwsmATn+KA26YGR2zSN7foNG0x3c+a7
         oirTFQHOazMyHE4At6+5nvvIawK1CDokbQnmmR56Ep1190/QcWVDRX6CLraGl8Lqo9RC
         cEtMlCjiLoURLtuXd/SpV5sLOblgbmI/EoWIAlL+j21J4nnYOiZNf7YpnXW9a03LFG18
         p8bdIysvgC+QqMoBXUX7K08uSkWT5S9NSuHSsXKasA0uRvC9joCjIeJSmVTnuNA2BgSj
         E35+psU1SJhHrsslm2ttmyQHp1SDpS/BoA/TofB4RmcxfjaDDaCpoD6tzIR1bNvkVw3W
         cC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779347401; x=1779952201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1vjKKtiXH21d0SoJcdzf44kDnBJugtM1iizS2M6tEM=;
        b=fSceFatsp58WpEZPD4HL72VVThmZMaWB5V0VSodoCXrEoVMdEB7A4umOkxyRJ81tLB
         ZWb7T9Ex6sl/kWlASRwoCvKJcHUe+3DO+09ikgpEuiBJ2qfddkToPJXBhKiHOB5sU57G
         BerFodt+UN1g3Jq6wFqKi1CQP3gVamWFFSEcGcBBAG3FxpuqOFAqqE6qhXPbhhCO8RqO
         Lt56inYPYB3lk91Mjv347bP2WCabbylpLsi2BD5lcQLBG0W1wx6xkg/Yf23buI5zQaO2
         2YnmdrlrFpJ/19dkZV7LWc0x/KAGXtI7nGFS/kOHl1pOpH9nIY/f9WwP9j6jTwCTY+R4
         sAYg==
X-Forwarded-Encrypted: i=1; AFNElJ/C5i/dIkiN0XHuRjzvgWPaLnMGumE+hamiHOg7JpJEhotdAK2pcp/SEXNzSs59itBXwWd5AWaVwwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRFRohzQXxzc9RtniWAk1qybpkWsN9UwEFpvc2HWFbjo4+uplA
	x0qkHziVfylExz/CaSxx2KVrFpVOnAcklEnbUH5djAqLX9V0GBIujbNFnY/zZFS80Q/J59I5ZXJ
	TGRrIz0U9tzGKcLfUGPNgisCGFMBWPASgeXCUSxWB
X-Gm-Gg: Acq92OFatBJXhORDUcl9hgpQKq9+OcvLmdtPUQ6IkdicoQ+L91nZOZUOA2pHcHC6Rz2
	WqDs5Kn2ww7ps8r8N2sPh5EdcIn0ehJ7ONTQej9XnzOW6SG/3QmbmK3obLOLwee9SxfDRQ910fu
	IPqwRtSOJskM0dK91gDC3RmQD9ZlHiBT1qUzp9Ge1JGwfpIDevkZI6Nf0gv2h9OjVPYAcjWs4ya
	KGfQZHenIM2NILW7SBV0Th9ebukhopI4LrWJ7r/32sXJk7sclU/6e0R1TbNlmm8Bl1g7sxZmUHV
	nQAZ1452gL/qobkSZbg=
X-Received: by 2002:a05:622a:a958:20b0:509:174d:3224 with SMTP id
 d75a77b69052e-516c5467214mr4802261cf.11.1779347400098; Thu, 21 May 2026
 00:10:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-11-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-11-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 08:09:23 +0100
X-Gm-Features: AVHnY4Ifhzz--3mXwexBkSyvm4SNx47gRJC3IarQKhzHQwMt2T3d9YqYZRiO-jY
Message-ID: <CA+EHjTyaBpTYsJRRyP09YggoHbi6s-ZgDoWoFgDRxO5k_BkoBw@mail.gmail.com>
Subject: Re: [PATCH v6 11/43] KVM: guest_memfd: Ensure pages are not in use
 before conversion
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

Hi Ackerley,

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> When converting memory to private in guest_memfd, it is necessary to ensure
> that the pages are not currently being accessed by any other part of the
> kernel or userspace to avoid any current user writing to guest private
> memory.
>
> guest_memfd checks for unexpected refcounts to determine whether a page is
> still in use. The only expected refcounts after unmapping the range
> requested for conversion are those that are held by guest_memfd itself.
>
> Update the kvm_memory_attributes2 structure to include an error_offset
> field. This allows KVM to report the exact offset where a conversion
> failed to userspace. If the safety check fails, return -EAGAIN and copy
> the error_offset back to userspace so that it can potentially retry the
> operation or handle the failure gracefully.
>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Vishal Annapurve <vannapurve@google.com>
> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> ---
>  include/uapi/linux/kvm.h |  3 ++-
>  virt/kvm/guest_memfd.c   | 65 ++++++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 62 insertions(+), 6 deletions(-)
>
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index e6bbf68a83813..0b55258573d3d 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1658,7 +1658,8 @@ struct kvm_memory_attributes2 {
>         __u64 size;
>         __u64 attributes;
>         __u64 flags;
> -       __u64 reserved[12];
> +       __u64 error_offset;
> +       __u64 reserved[11];
>  };
>
>  #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 91e89b188f583..9d82642a025e9 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -572,9 +572,42 @@ static int kvm_gmem_mas_preallocate(struct ma_state *mas, u64 attributes,
>         return mas_preallocate(mas, xa_mk_value(attributes), GFP_KERNEL);
>  }
>
> +static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
> +                                           size_t nr_pages, pgoff_t *err_index)
> +{
> +       struct address_space *mapping = inode->i_mapping;
> +       const int filemap_get_folios_refcount = 1;
> +       pgoff_t last = start + nr_pages - 1;
> +       struct folio_batch fbatch;
> +       bool safe = true;
> +       int i;
> +
> +       folio_batch_init(&fbatch);
> +       while (safe && filemap_get_folios(mapping, &start, last, &fbatch)) {
> +
> +               for (i = 0; i < folio_batch_count(&fbatch); ++i) {
> +                       struct folio *folio = fbatch.folios[i];
> +
> +                       if (folio_ref_count(folio) !=
> +                           folio_nr_pages(folio) + filemap_get_folios_refcount) {
> +                               safe = false;
> +                               *err_index = folio->index;
> +                               break;

https://sashiko.dev/#/patchset/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4%40google.com?part=11

Sashiko raised a few issues here, but I think this one might be
genuine. Can you look into it please?

If that's right, when huge page support lands, if start falls in the
middle of a large folio, returning folio->index as the err_index will
return an offset strictly less than the requested start. A naive
userspace retry loop resuming from error_offset would step backwards
and corrupt attributes on memory it didn't intend to convert.
err_index should be clamped to max(start, folio->index).

Cheers,
/fuad

> +                       }
> +               }
> +
> +               folio_batch_release(&fbatch);
> +               cond_resched();
> +       }
> +
> +       return safe;
> +}
> +
>  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
> -                                    size_t nr_pages, uint64_t attrs)
> +                                    size_t nr_pages, uint64_t attrs,
> +                                    pgoff_t *err_index)
>  {
> +       bool to_private = attrs & KVM_MEMORY_ATTRIBUTE_PRIVATE;
>         struct address_space *mapping = inode->i_mapping;
>         struct gmem_inode *gi = GMEM_I(inode);
>         pgoff_t end = start + nr_pages;
> @@ -588,8 +621,21 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>
>         mas_init(&mas, mt, start);
>         r = kvm_gmem_mas_preallocate(&mas, attrs, start, nr_pages);
> -       if (r)
> +       if (r) {
> +               *err_index = start;
>                 goto out;
> +       }
> +
> +       if (to_private) {
> +               unmap_mapping_pages(mapping, start, nr_pages, false);
> +
> +               if (!kvm_gmem_is_safe_for_conversion(inode, start, nr_pages,
> +                                                    err_index)) {
> +                       mas_destroy(&mas);
> +                       r = -EAGAIN;
> +                       goto out;
> +               }
> +       }
>
>         /*
>          * From this point on guest_memfd has performed necessary
> @@ -609,9 +655,10 @@ static long kvm_gmem_set_attributes(struct file *file, void __user *argp)
>         struct gmem_file *f = file->private_data;
>         struct inode *inode = file_inode(file);
>         struct kvm_memory_attributes2 attrs;
> +       pgoff_t err_index;
>         size_t nr_pages;
>         pgoff_t index;
> -       int i;
> +       int i, r;
>
>         if (copy_from_user(&attrs, argp, sizeof(attrs)))
>                 return -EFAULT;
> @@ -635,8 +682,16 @@ static long kvm_gmem_set_attributes(struct file *file, void __user *argp)
>
>         nr_pages = attrs.size >> PAGE_SHIFT;
>         index = attrs.offset >> PAGE_SHIFT;
> -       return __kvm_gmem_set_attributes(inode, index, nr_pages,
> -                                        attrs.attributes);
> +       r = __kvm_gmem_set_attributes(inode, index, nr_pages, attrs.attributes,
> +                                     &err_index);
> +       if (r) {
> +               attrs.error_offset = ((uint64_t)err_index) << PAGE_SHIFT;
> +
> +               if (copy_to_user(argp, &attrs, sizeof(attrs)))
> +                       return -EFAULT;
> +       }
> +
> +       return r;
>  }
>
>  static long kvm_gmem_ioctl(struct file *file, unsigned int ioctl,
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
