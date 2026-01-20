Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E81428492;
	Tue, 20 Jan 2026 18:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768934579; cv=none; b=h1lIH/QcmqAe7K1h4gEwV+AlTrqXAPgjQj5m2LebAYQ5ECe4aXVNHxCC+crj0dsHmPsTmdHF+NGY6p56tvnD6v4C1mJ2eW/ZNGvKUkYmnwPfaxayR++FGmPvZubFp+thZKYa8J3+HioOsGmsrJDF9PbPtQtweIPMlpKwqrVeSK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768934579; c=relaxed/simple;
	bh=9asjItjUuW66QRWbqI3QXT7hKg9DauBgryF6+gZ2LNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWSHGKf4AH0gg/PyBWDQDARuP0dHj/cX3ynyhiMaPVutipnSGuBCXanC7Hwzw6VXhzwFZKlWm+fBoZrJboTZ0vm2MP8Xw8ylDjfMEryTBQOAHClxCeNqKWJySNRKllp3LF31JBLeGo2o8HEL8fQ6O0zBpx3DtbY7IVyYaqh4r6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjqiEUIQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjqiEUIQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABADC16AAE;
	Tue, 20 Jan 2026 18:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768934577;
	bh=9asjItjUuW66QRWbqI3QXT7hKg9DauBgryF6+gZ2LNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SjqiEUIQDfHO6Y7G/RKwZ5STzyAI3pmHlAXYrmpO177JUyGX8ZQ2arH5agwQ1mIQF
	 06Q/WGxNJm5wqvx44LsUPycGl7t9/iaBz6ay83UeQystb/yWY8U5aE4cXTa2HhvIId
	 p4g6qBLQjwFsPg9ld8SgZeCG1wtu8ENI6AGo/S1AMjok8WBwK8v+/JCidE2dfZW40v
	 yiKeRoX1WOHyN6rAKE0zpbSZ6yubd6llKtUZQKTOs5NrqUFsfflDd+ffq/YnzWu5bn
	 +ZGUcPE8CUQKafbu7zRgvs4L01dfbNM7AsTbpwQjfSHIFqzE+m6sm4biqw7EOiKZ/d
	 /qsbKT+M1zyrA==
Date: Tue, 20 Jan 2026 20:42:50 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alexander Graf <graf@amazon.com>, Jason Miu <jasonmiu@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 5/6] kho: Relocate vmalloc preservation structure to KHO
 ABI header
Message-ID: <aW_Mqp6HcqLwQImS@kernel.org>
References: <20260105165839.285270-1-rppt@kernel.org>
 <20260105165839.285270-6-rppt@kernel.org>
 <2vxzy0lscks4.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzy0lscks4.fsf@kernel.org>

On Tue, Jan 20, 2026 at 04:26:51PM +0000, Pratyush Yadav wrote:
> On Mon, Jan 05 2026, Mike Rapoport wrote:
> 
> > From: Jason Miu <jasonmiu@google.com>
> >
> > The `struct kho_vmalloc` defines the in-memory layout for preserving
> > vmalloc regions across kexec. This layout is a contract between kernels
> > and part of the KHO ABI.
> >
> > To reflect this relationship, the related structs and helper macros are
> > relocated to the ABI header, `include/linux/kho/abi/kexec_handover.h`.
> > This move places the structure's definition under the protection of the
> > KHO_FDT_COMPATIBLE version string.
> >
> > The structure and its components are now also documented within the
> > ABI header to describe the contract and prevent ABI breaks.
> >
> > Signed-off-by: Jason Miu <jasonmiu@google.com>
> > Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> [...]
> > +/* Helper macro to define a union for a serializable pointer. */
> > +#define DECLARE_KHOSER_PTR(name, type)	\
> > +	union {                        \
> > +		u64 phys;              \
> > +		type ptr;              \
> > +	} name
> > +
> > +/* Stores the physical address of a serializable pointer. */
> > +#define KHOSER_STORE_PTR(dest, val)               \
> > +	({                                        \
> > +		typeof(val) v = val;              \
> > +		typecheck(typeof((dest).ptr), v); \
> > +		(dest).phys = virt_to_phys(v);    \
> > +	})
> > +
> > +/* Loads the stored physical address back to a pointer. */
> > +#define KHOSER_LOAD_PTR(src)						\
> > +	({                                                                   \
> > +		typeof(src) s = src;                                         \
> > +		(typeof((s).ptr))((s).phys ? phys_to_virt((s).phys) : NULL); \
> > +	})
> 
> Nit: not a fan of exposing code internals to the ABI header. But without
> this the definition of kho_vmalloc_hdr won't make any sense to someone
> reading the doc without looking at the code. Dunno if we can do anything
> better though...

These might be actually useful for other KHO users. 

> > +/*
> > + * This header is embedded at the beginning of each `kho_vmalloc_chunk`
> > + * and contains a pointer to the next chunk in the linked list,
> > + * stored as a physical address for handover.
> > + */
> > +struct kho_vmalloc_hdr {
> > +	DECLARE_KHOSER_PTR(next, struct kho_vmalloc_chunk *);
> > +};
> > +
> > +#define KHO_VMALLOC_SIZE				\
> > +	((PAGE_SIZE - sizeof(struct kho_vmalloc_hdr)) / \
> > +	 sizeof(u64))
> > +
> > +/*
> > + * Each chunk is a single page and is part of a linked list that describes
> > + * a preserved vmalloc area. It contains the header with the link to the next
> > + * chunk and an array of physical addresses of the pages that make up the
> > + * preserved vmalloc area.
> 
> Perhaps also mention that the array is 0-terminated?

Yeah, sure.

@Andrew, can you please add this as a fixup:

diff --git a/include/linux/kho/abi/kexec_handover.h b/include/linux/kho/abi/kexec_handover.h
index 285eda8a36e4..2201a0d2c159 100644
--- a/include/linux/kho/abi/kexec_handover.h
+++ b/include/linux/kho/abi/kexec_handover.h
@@ -138,8 +138,8 @@ struct kho_vmalloc_hdr {
 /*
  * Each chunk is a single page and is part of a linked list that describes
  * a preserved vmalloc area. It contains the header with the link to the next
- * chunk and an array of physical addresses of the pages that make up the
- * preserved vmalloc area.
+ * chunk and a zero terminated array of physical addresses of the pages that
+ * make up the preserved vmalloc area.
  */
 struct kho_vmalloc_chunk {
 	struct kho_vmalloc_hdr hdr;


> Looks good otherwise.
> -- 
> Regards,
> Pratyush Yadav

-- 
Sincerely yours,
Mike.
