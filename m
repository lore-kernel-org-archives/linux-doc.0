Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521383EA94E
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287343; cv=pass; b=mv/wF3zWaFLcG7lZULHZlz+6Gv5KjsZkFq36diLInLa9JtdKBwd5bvxYKI9s2PBH4IKwNOfRYPJAtxyjdAgQ1q/88HBiox7uzsyUP4d6D4mkPblQAUVQkX2mtFzPb+79UwIRDuBQV+e9UrNpXTZflH0o19cEkultzAQcLCEDOQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287343; c=relaxed/simple;
	bh=Tzu5wTH3o6S2Itis2xyipHfLS/Tdxrt1OgQQN3z2k/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lj4w8znWM0WcOnfKg+4Kad+SCFf+EH24s3A75+N2iAzy1mgN1dYx/juOxYpiyI3mzCwyJYcctivHwB4i6C1euHcLfbRV4EEhDJrC44CmaWvLLBuE5nKH61hO6Tb++7nPOGwUEu/MkDknkPtBwuDC6v67jPplKdRWDw5H6J2dj98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t1fw0aXM; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t1fw0aXM"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-515548f390fso5281cf.0
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 07:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779287338; cv=none;
        d=google.com; s=arc-20240605;
        b=JTiYg7iHzhGz+9zt2on6/yIprRo9rhrlYDsUGu0wk/6vrN36oEnDVAPW87Z3/xjNYF
         aZzefo7Lo4jMwxb/9g7P7/ceJdcEsQ1LPIkkzhmaWJdch5YFKbTuI/uvdQ4o8oXNl1tz
         xyJkLfwl8Pv0E11PHjXrUQypUAll5E49m0vvjYEX3Gny7IUBP4c3RIV3awp/8MHQf8LY
         yLVpVlZ9J6absI/vNDdOJcFTURmuoc6BZ0sFL0l72V0Dy0Wd3mlGcuRD1VrbKCUmbKLB
         qIV6kG1u0PAOsMZL0qYFRUQ5KvhOgv+zaPlErFASl62J0KEPbhJpOjGocobhtAyYiw49
         X7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SDMj41/pkYi0SiyY6zKgWY/JIbItQ876cBH7lhvdwcU=;
        fh=jJ/Wp7NB85Tk9dRniW5PPMWcpejKxoxaooIYwUD0/i4=;
        b=ObGD+4zb+GrA7FlvlDNJyTBHOpNDbrCAvHtGNGtrd9ORhXrE7ykVmNPJyuUUY7j8Wd
         7cG8WS/2fGWwGkpbQ3FzcMkBS32eovMluDSUGDzkaoTGolqiidD44W8coC4QLXIjSbU9
         D1Ta5zZBubIgxT6tftV/vQ2x1UDQ/n4SXSod1pmjDiS3KZc9NumNet/LFju8RQAdII/2
         L88eLxpf7ZvxNmqEPNyA8pQxHXOmzrHEgpk1ZZ854JbNy2h+l6jQOjE0HRJRaxWgDidb
         +KiuG12qy7OrrPHr/KQfy1JaOiqpHtJ/q4+n47jJjxnejx5Fh/6Z6ggjK4gKvvqdFtuS
         j7zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779287338; x=1779892138; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SDMj41/pkYi0SiyY6zKgWY/JIbItQ876cBH7lhvdwcU=;
        b=t1fw0aXM1Ap9k7oaEbUnWmIrrxYO3exbwApRFGwEWwV9gzSMxIndWDA9ACaPyiRPXX
         xlrQvYtIEyoXspvBPOAi6CfY59OYA1D3ydIDB26dGdoKc0xRPZGfRt/UC/3I+0CWG3hM
         eyFKYUlU7/poD35+u/7HIz+aU2Y/nC5dgZcL6xkGx31f72xwtNCDdMUyvf1XWAhKRno/
         tBCNRgO7JPbHQeCUkfx9OVl0Kz4bTThlhp9xh0hP0RMfE7UvJIp6liSLF9HLhqemqZYJ
         EblvFF4DZlbDe3TuBvLSCC4gWgdcaK6iEeMPtD871mgd8O6KlD7BsKDvHSHaixJG43N6
         upjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287338; x=1779892138;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDMj41/pkYi0SiyY6zKgWY/JIbItQ876cBH7lhvdwcU=;
        b=N257sUSFhyn9hUV5yJafH0zN+6eB72E40RlhoxV2xKO75w0H+lAHJsD4qSmA0E36FS
         7oPak5drAlCs8KkWIQPpFETJefegxd+cwrvRDCv6aLDrchxxDS9UEcsz28ola0unJzPp
         gJ2NZmsvMXu7TQkcfUNJ0eewyIOcwTM1hFdJ8ban/+BwDNGaOzJDxFiuyfks75XquKXD
         ckyZ48CY9YCap2nyP6yumBd7vH/E9us5X3qE/bvf6TnSaoHojc6ghGRr4izPxNHhIRLV
         8K1EAHJ77r/4YwkP76Tjg19NqE2X18x7gMv4vLBJ3v2Zn7cMQfRa+VtsQDpea7jqNodz
         fL8A==
X-Forwarded-Encrypted: i=1; AFNElJ9f+swMiugGsneKMX7HDBNPWa+CUm+LayK/f6EpvQmjt34PA0Vgur4I72R8H8CibE4BttE48IfycpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWgJAqybvcGDndyMUzHJL/wbzR50QtSpAxxKEPQGzg+w/K4oIB
	X/8q3gcNAdMliozrVv2ybUemZAboRGc8hrUcmGgt3SbZ4O9jOH0F7R7zZN08q6wGb06W4GCdjrc
	U1Y2dy5RKTOWwQ+EeMJshBEr5c6ZFNpiLgmb8brid
X-Gm-Gg: Acq92OHfn6G7+I0qbUmmApZPvfhOe40JZow16hAxeqO8jQYF6ubEJWWcsbSz5NxaQPV
	OTahMUVSfdL44RKuPz1zVFN2mAG4P3DElGyDGAtHj20dE0BMYo1tzpxJUUTTuR/8bHXreqD1ZRp
	2hIRJmxTHMvG2jZvI7y+YMMuwEZNo9cCcQxg0FYFiK2MRsY8kUvjKlJmSBjSQmyqeaQdhl65wgm
	t2Vt1oaRdj60MobogAiycU/2i88XLAmokNi6GKLN84P4BPNji442YTh2RQgch8UgZl1Yb6/h76n
	p/FC5V1UlddDZeqQ3Hk=
X-Received: by 2002:a05:622a:1802:b0:501:4eae:dbfc with SMTP id
 d75a77b69052e-5167b676239mr20862401cf.5.1779287337177; Wed, 20 May 2026
 07:28:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-11-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-11-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 15:28:19 +0100
X-Gm-Features: AVHnY4L9O3OTsfOAqqdov--6MJhNDxaLQ7PquyLIvNtXq2pe4PNa20rghwvuehE
Message-ID: <CA+EHjTyyah4B6RZRhp=awJ7psp-wSwSSFGyDQF0wt+J9J7aDdQ@mail.gmail.com>
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

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
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
