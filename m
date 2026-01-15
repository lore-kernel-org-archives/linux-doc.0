Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9422B18DB2A
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 09:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469947; cv=none; b=XUJHncDleI1a8NO0oC71AUs+oK4oX8NGYa1ZvUTsFNAIAjbDk6bkbRnSScx9poN0w60/4qEpPrwU8XQOXpn8XxcTio+wGiWFBb9+xHGFQiSta3UHh3hmtGRJPaF7ISgOcKTg1KD49F0rXmgV1vEKMfgjUFPeocUTJnomlEG1asw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469947; c=relaxed/simple;
	bh=myumK51sHMIA3ao+ZPj7MDTWWVmgAbp9+tymQehhaJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuHXESyOimN4LnHzoCVgCyIu56XndGD+JtTAQ34X4Ns5cUasWqT8BcMHRmAOe2UZC4BeTGhJGWwjpMJDOS/eVBaArbQOQUJMM5kldHzDLGTTOdARWpJRmmbV2WGI+FpspYpGzId+AiBhCosIBRgbg6BAFJXf3R4aKEWQThw8Leg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cRsnSkH3; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cRsnSkH3"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768469942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVVqGZ3l+eUoAxt/83SPf9RM0AnIYY+mCB+ElcBndDc=;
	b=cRsnSkH3HNWFooNCu45BiRhggR8i4eFVIEtaDBZS6rcUGpU4CX2VzbdCKKVVXZEpZefbox
	1JDlPRjWkLPi/F4f3TbeE+mpwORW/695MiDjigp5P+ylTc7GZzfzqC+FKH1TT+SLK3VK8I
	8wdyRK+A0I4ZOEoETVWvkMjzjg4EN0c=
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	bcm-kernel-feedback-list@broadcom.com,
	christophe.leroy@csgroup.eu,
	corbet@lwn.net,
	eperezma@redhat.com,
	gregkh@linuxfoundation.org,
	jasowang@redhat.com,
	jerrin.shaji-george@broadcom.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	lorenzo.stoakes@oracle.com,
	maddy@linux.ibm.com,
	mhocko@suse.com,
	mpe@ellerman.id.au,
	mst@redhat.com,
	npiggin@gmail.com,
	osalvador@suse.de,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@suse.cz,
	virtualization@lists.linux.dev,
	xuanzhuo@linux.alibaba.com,
	ziy@nvidia.com,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v2 23/23] MAINTAINERS: move memory balloon infrastructure to "MEMORY MANAGEMENT - BALLOON"
Date: Thu, 15 Jan 2026 17:38:27 +0800
Message-ID: <20260115093827.12557-1-lance.yang@linux.dev>
In-Reply-To: <20260115092015.3928975-24-david@kernel.org>
References: <20260115092015.3928975-24-david@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Thu, 15 Jan 2026 10:20:13 +0100, David Hildenbrand (Red Hat) wrote:
> Nowadays, there is nothing virtio-balloon specific anymore about these
> files, the basic infrastructure is used by multiple memory balloon
> drivers.
> 
> For now we'll route it through Andrew's tree, maybe in some future it
> makes sense to route this through a separate tree.
> 
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
> ---
>  MAINTAINERS | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index de8f89ca1149f..b974f8c1c2225 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16454,6 +16454,16 @@ T:	quilt git://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new
>  F:	mm/
>  F:	tools/mm/
>  
> +MEMORY MANAGEMENT - BALLOON
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>

Should it be david@kernel.org instead?

> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/balloon.h
> +F:	mm/balloon.c
> +
>  MEMORY MANAGEMENT - CORE
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@kernel.org>
> @@ -27536,9 +27546,7 @@ M:	David Hildenbrand <david@kernel.org>
>  L:	virtualization@lists.linux.dev
>  S:	Maintained
>  F:	drivers/virtio/virtio_balloon.c
> -F:	include/linux/balloon.h
>  F:	include/uapi/linux/virtio_balloon.h
> -F:	mm/balloon.c
>  
>  VIRTIO BLOCK AND SCSI DRIVERS
>  M:	"Michael S. Tsirkin" <mst@redhat.com>
