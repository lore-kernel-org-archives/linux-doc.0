Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70391474AF
	for <linux-doc@vger.kernel.org>; Fri,  6 Dec 2024 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733496713; cv=none; b=iNX7nOd7+kwU/5AtGjBiQGDvyD9HEtpVQhwKYc6Kp8bL46zRGnncRwbgef59ntH2SFjIhjtW4TcVMi4xDME8z7m2a4KTmKVTnadNXHWvBR4IfHOXZXwGc16oCYScIfpG2k9B4mcl1NUc+1KRyEkwibRtyB4sXdbVybr+SjhK7BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733496713; c=relaxed/simple;
	bh=aoMdGajI7M22+mDFWE50yWiBPHP9vf48xFEMCZxOVYM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ujUlProZvUfWm57aZ+lw92RxxpgEaPQx9FTX06HolBYcGTOQyRowrH1SkV2BePVamJr2PsEnMSPqALV/iWY7fjlHdMXyfJy0QDZI2J4ZzBqtiTyZsgJKoT1Uk+gVLSJbPy/DRWXN0YJFacpGq2BjOjutk56fyDrGIdqNwY1lccA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=tOuv9t58; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="tOuv9t58"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 57A7C403E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1733496179; bh=x+pbS9Dwvv4Adx/JS1J63HbDvKycbIrXy3PXJPrKZLM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tOuv9t583lBSCO2GZA3wVDzxKCSFNSuWUfAN9OzxBnlRU2UgP16oIoOna+gDLDu5h
	 KE9fDqNdfzK0qztkAc4jRjfWMU8GTE3bNB4ysomUPUVfXJv+5GMyEyTUPTlK1csHSh
	 4BkbaavdG/Pd0ScSM5dyfJpMjLmqSTwGoJ8komsHL48fuo/xsx0PrBkS2GH6EvxGJz
	 R8sIhKUR/RAt88A33AlgukV4HkpGbWZJODpVCLnxglW/pk3rjl4cFU+uE+qFjrVgxv
	 3Hr7GeXKyQWjeW7keXJ0bB0GdWVxKqNtM6i83K+T/RAi+swHmELTMhuPLXlMot5dom
	 krc30ODWWbY4A==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 57A7C403E4;
	Fri,  6 Dec 2024 14:42:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Guixin Liu <kanie@linux.alibaba.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Chaitanya
 Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH separete v2] docs, nvme: introduce nvme-multipath document
In-Reply-To: <20241206072507.37818-1-kanie@linux.alibaba.com>
References: <20241206072507.37818-1-kanie@linux.alibaba.com>
Date: Fri, 06 Dec 2024 07:42:58 -0700
Message-ID: <87frn0vpn1.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Guixin Liu <kanie@linux.alibaba.com> writes:

> This adds a document about nvme-multipath and policies supported
> by the Linux NVMe host driver, and also each policy's best scenario.
>
> Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
> ---
> Hi,
>   We found that we should take care of the throughput of each path in
> service-time policy, so separate the doc patch. And continue working
> on service-time policy patch.
>
> Changes from v1 to v2:
> - Remove service-tome policy.
>
>  Documentation/nvme/nvme-multipath.rst | 72 +++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/nvme/nvme-multipath.rst

Thanks for working to improve our documentation.

When you add a new file, you need to add it to the relevant index.rst
file as well; if you had run a docs build, you would have seen a warning
about this.

I would also suggest that this material perhaps belongs in the admin
guide rather than in its own directory?

Thanks,

jon
