Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CB33EF65B
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 22:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845354; cv=none; b=NcEx5eghBLfB7vcd1y8U/3P29+HezJ3j+JX+Ruo0HKmeEfIUrm0Z/nJWvlbuXHY3l0Q0BconAvi0dVO9DWNC9xcLhLbcHmz4wz5s9O7OCB4/oTqcl9FpM4x2MbwnU+HB3HdPaNZ2BcVrlWcwwwnHpa/o7PlVXHjNw1wZuhYR5SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845354; c=relaxed/simple;
	bh=Wvd75UyM3t5SH/M552skzv7ZTvYbtFThnmEOgAthFuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGdyqFLptlse8OMzBsSutYD3j+hpMZglFHyQwSL84km9BOb/cIxpSKRY8VgNW5GSbuNy7TPueYKQRuVvv+S816UydW40/c4Afellbptr5GR5rUUe53uqHGjdKYhEArv30l1/ztyDG8ryS+Ur0PUuZeC8tr6HE4M3JVR/7DTVBjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnhdiESF; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnhdiESF"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso4655205ad.3
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 15:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784845349; x=1785450149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vzwHTZR2iosFUiZOe0Oy97LjUFogfrOTmiFLxNsdVTA=;
        b=TnhdiESFNVee+/U2SlhG1d5C8d33gpY2U5q9rvR+za+5edsgbVRJ2KygeDUSPGNmwE
         nNL5VWLWBSRrOd+WiAL35Mv94IrHxwhp+nbkF9f50UTB+30QNNu/203dDPg5UvK6gzPb
         +J4XuIJctudBv4vgO6hYlMVEi4zlGu7LV7dVEEj/M7+3sTAQz9gaCB5EHcPzJra4PYXJ
         8eblodvrNtVlOQ21kGfIBcqrv2x/dAZVzb1Tkxq8SPE3zCzMZf7+1W4FBDAY0XDPt83Y
         fJWq+R8rIP5tXQIxBJ81mSegmXIggPxBUFr/tVwAYyLONUnJyv/QkO7K7KoMoQK50MU7
         eUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784845349; x=1785450149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vzwHTZR2iosFUiZOe0Oy97LjUFogfrOTmiFLxNsdVTA=;
        b=FCegfpumtAK/eQGhvmwAuZR+h4REZwlocGsJcU5rfYgfo8ykOOZdrbOqhOrfrWZfrd
         zPCy3svzmnGZTUzrt/GowEvuXUJJXqbUNA9OVMseRem4ji60NtTSl5h9qk8OpRQuWxM1
         CQJGj+0amN0cpZkyEzkWqy39FkDdGvWLkyXldfRZeA1nyg4vCzt+nzuGoB+HYPFysyeZ
         t8VdBM6dQgRXMTW6gm9v6OOya+xt+E9kx5G1vSeK/26wrgVj3m8OxjI6+PmJQD5eNDUc
         nIiJ4Md1MHVWB27JyKDsyguTAZ0c249LOxLPUAqh1wiuVdjx21+1e0Jfd4+YnxPnOg7q
         K59g==
X-Forwarded-Encrypted: i=1; AHgh+RoqhD8aqTRbG9KQiS6ETEnfRdfBgKzMbmy614G0XHLKjgWsXG/FbFNg1gtLnc3mYgE+Z708o6Y9eG4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcj6QpcAIFYOJCZIlDxnymQYT87dNkVS8mZw/OLQKJkOTpjiN5
	7iu4tz68Ksv/Eo/gZgmPfBR4SW1EDx7UqaJZiNa1DS78G1myjU3Fgl0I
X-Gm-Gg: AR+sD13yAwhJ3IhAElHQsrVOdx0L/q2xLT2LWlzPcnHgGNHK1lsfox7FjE40QiCqGCT
	HhYE9uQozV9e8KycJmp3TNxAxbS6qJOgjL6PYmZkE3B8/MxxL/k37IpvPdFGvST3lInUbn2l1DZ
	BcICa+k9hfLAYXtYSNsUIxF3EmhxkbCU/DBsWJ4h1VwxQp3OmxuOMntmshPUKs7yfdN2WI4t2rs
	/YNonvYET/GUqyc6fcsPSS2XMCC/apt9RU99nbHiGKlf/NsbKjuW4Ct4XiAM4AD1KfIZ+eMsar7
	ClqQvjCepx35b/nHW54dU2anmZScuNws9gJ+/fwu6Ab1rGj5rTzCAoh75esxdc9nouFEv6Xm7/U
	pNZSdEQ/CFYvNv8WUSJIFba5jdeBkgVtum88ZUheRnueAt4I4vqZoOiXzFLan6/yIAED9zJzz/z
	bbgLAseuVNsf/bdPaRTc/b1z1NHbRz26Tr02+/eiWhnyjP
X-Received: by 2002:a17:903:90f:b0:2cb:2b53:559f with SMTP id d9443c01a7336-2cfa6c793d3mr60755125ad.35.1784845349134;
        Thu, 23 Jul 2026 15:22:29 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f38757esm40198575ad.75.2026.07.23.15.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 15:22:28 -0700 (PDT)
Date: Thu, 23 Jul 2026 15:22:25 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
	Oded Gabbay <ogabbay@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-hyperv@vger.kernel.org,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v11 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-ID: <amKUIWpMfVS6OFkQ@skinsburskii>
References: <20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com>
 <20260723142242.5d3f87208d47819d873ae458@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723142242.5d3f87208d47819d873ae458@linux-foundation.org>

On Thu, Jul 23, 2026 at 02:22:42PM -0700, Andrew Morton wrote:
> On Thu, 23 Jul 2026 10:36:32 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > This series extends the HMM framework to support userfaultfd-backed memory
> > by allowing the mmap read lock to be dropped during hmm_range_fault().
> > 
> 
> Thanks, I've updated mm.git to this version.
> 
> AI review suggests there may be some problems.  Sorry, I don't recall if
> these were considered in previous versions of the patchset:
> 
> 	https://sashiko.dev/#/patchset/20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com
> 

These look like new findings, perhaps from a newer model or review prompt.

I do not think they apply here.

The unlockable path sets FAULT_FLAG_ALLOW_RETRY only when HMM provides a
non-NULL lock state pointer. The legacy hmm_range_fault() path passes NULL
and therefore does not opt in to lock-dropping faults. Fault handlers are not
supposed to return VM_FAULT_RETRY/VM_FAULT_COMPLETED with the mmap lock
dropped unless FAULT_FLAG_ALLOW_RETRY allows that, so the NULL locked state is
not expected to be dereferenced on the legacy path.

For the FAULT_FLAG_TRIED concern, HMM is not trying to emulate GUP's exact
single-address retry loop. If a fault drops mmap_lock, HMM has to restart the
range walk because the VMA/page table state may have changed. Resetting the
timeout on that path is intentional: a lock-dropping fault made progress, and
the timeout is meant to bound mmu-notifier retry churn rather than the time
spent servicing faults.

Also, the newly converted HMM users are not using this path for ordinary
file-backed page-cache population, and process-context callers can still be
interrupted by fatal signals. All the existent kernel thread callers are
capped by a timeout.

So I do not think this requires a code change.

Thanks,
Stanislav


> > 
> > Changes in v11:
> >   - Reject unstable address spaces in hmm_range_fault_unlocked_timeout()
> >     after taking mmap_lock and before walking page tables.
> >   - Compute the remaining HMM timeout budget before the time_after_eq()
> >     check in drm_gpusvm_get_pages() to make sure it can't result in zero
> >     and lead to infinite HMM range faulting loop.
> 
> Here's how v11 altered mm.git:
> 
> 
>  drivers/gpu/drm/drm_gpusvm.c |    4 ++--
>  mm/hmm.c                     |    6 ++++++
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> --- a/drivers/gpu/drm/drm_gpusvm.c~b
> +++ a/drivers/gpu/drm/drm_gpusvm.c
> @@ -1422,11 +1422,11 @@ int drm_gpusvm_get_pages(struct drm_gpus
>  	struct dma_iova_state *state = &svm_pages->state;
>  
>  retry:
> +	remaining = timeout - jiffies;
> +
>  	if (time_after_eq(jiffies, timeout))
>  		return -EBUSY;
>  
> -	remaining = timeout - jiffies;
> -
>  	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>  	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
>  		goto set_seqno;
> --- a/mm/hmm.c~b
> +++ a/mm/hmm.c
> @@ -17,6 +17,7 @@
>  #include <linux/slab.h>
>  #include <linux/sched.h>
>  #include <linux/mmzone.h>
> +#include <linux/oom.h>
>  #include <linux/pagemap.h>
>  #include <linux/leafops.h>
>  #include <linux/hugetlb.h>
> @@ -806,6 +807,11 @@ int hmm_range_fault_unlocked_timeout(str
>  		if (ret)
>  			return ret;
>  
> +		if (check_stable_address_space(mm)) {
> +			mmap_read_unlock(mm);
> +			return -EFAULT;
> +		}
> +
>  		if (timeout && time_after(jiffies, deadline)) {
>  			mmap_read_unlock(mm);
>  			return -EBUSY;
> _
> 
