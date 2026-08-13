Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FC7478E5E
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 14:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786631727; cv=none; b=aQm9CecyC81pGbfEoxKi56gVAY08lvdFkBTZXvEFAHiOipl/siYLIli3IcdDBpiAhbEzVqmG5CpaoprBo+OL8WnxKRVLRYfVQ9/brZllvQI32xcnHI+I9ZE5KhvFpNv2hmKYvvQMQ4EmlSfHL0moXGePBTmrdPPMyykAZmkC4tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786631727; c=relaxed/simple;
	bh=dZ5wQck7H5A8UMhBer/w9ShOARPzT/cRPjlPb6a55H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COE/vo+Jp55CeETnjiBdLYAazb1sog6moBD341bXJyAV5I6eFd1L4a44OfMNHAWIcTVJFXv2NZ5SmbUGw5XJ//2ENfG5SjMsNcR1LroTVisOx/OTmw07ZbjAOl/IH7EdsMakjXQusuwHDlJ/CdgRWIVCuPFEqUXLc6d4vX/mGi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMcp4G0s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMcp4G0s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28651F000E9;
	Thu, 13 Aug 2026 14:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786631726;
	bh=VVMlbQ46Mo6FlSx62rCWVtV5s385RB38R7F2cq3RypM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OMcp4G0sW+HYALPi/HZ738Z2R0vjWWsr/JWwHt5jEfM1kuE5g2IHtY2dS8XlgxKEg
	 JBTm7MCmp/6GPrCyOHqdEhT12m9Bauo3UtQW1wT7j6QEsqxCEHBX0eDSGmP2BRbMMy
	 0pJWQm9bnFK5EKNhf9QhW8FkalkosfgrLiAR+zPN3pXf+topeiZ4EoyvqGbN8UIhBc
	 /H+RlYm+hSdkRVAHVjT3+aKSnysHlzYCouW0VkDcLY9EduC0pu4mhEDk5ngVHwZKnt
	 N1pNS0NInpiPG/HYzihAqxEjQ0MaWpbnzVq2+mZKfclmhcyCiuiT47EFKYDEmWYUsW
	 7KF335klZnqGA==
Date: Thu, 13 Aug 2026 15:35:06 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Jinjiang Tu <tujinjiang@huawei.com>
Cc: akpm@linux-foundation.org, david@kernel.org, xu.xin16@zte.com.cn, 
	chengming.zhou@linux.dev, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	shr@devkernel.io, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	wangkefeng.wang@huawei.com, sunnanyong@huawei.com
Subject: Re: [PATCH v2 0/2] docs/ksm: fix advisor documentation and comment
Message-ID: <an3VdkvUvLapWzmw@lucifer>
References: <20260813031722.569983-1-tujinjiang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813031722.569983-1-tujinjiang@huawei.com>

On Thu, Aug 13, 2026 at 11:17:20AM +0800, Jinjiang Tu wrote:
> Fix typos and misleading description of advisor_min_pages_to_scan.

This is a very bare cover letter...

>
> Changes since v1:
>  * remove fix tags for both patches
>  * update commit message and comment for patch2
>  * collect Acked-by for patch1
>
> Jinjiang Tu (2):
>   docs: ksm: fix typos in sysfs knob names
>   mm/ksm: fix advisor_min_pages_to_scan description
>
>  Documentation/admin-guide/mm/ksm.rst | 8 ++++----
>  mm/ksm.c                             | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> --
> 2.43.0
>

--
Cheers, Lorenzo
