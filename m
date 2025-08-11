Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EB22D0C6C
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 11:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754911352; cv=none; b=rZ0PSawEBlkyxuFEP00tMiaoHrJO3O0cc8X34p7BB0sDLkAzWMIyOrjywWUePRUCgSR76D1hWvePJnd919NPIUF8bmJQk/unuue8oAbzRHTU8x+UTxBCzVb1NlGxsGPg3Y2uv+kGUDEavKuZ+A92NTzvd0X8VqzS/8+jWemj/1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754911352; c=relaxed/simple;
	bh=yH9o/+7iQTtEc5jc6WfYbooYmTC+iDCsKE/1zeYeYwQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CslIhMOfrYe3vFKyXOoa2QI6RS9iSEl6NWB55/6LYPvrbPcdw5CZdC5iHs83O3459k3amPDeXRkNvG6t/U/i/V8SOsxqiuyaZaPK1AxcB5UCdVUy+buTlBL1OQtHcx+wJoEHrBNciPDTxYEWVdoqpTTUSzzs3qMI2uvh9itQT0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LICLo1Gq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LICLo1Gq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FwVUSFRZ0F7GHgPHZ+J3/Ax+Q+cwf/vSatx/cEwvjzI=;
	b=LICLo1GqVIBeDhr6ZoegKfAuQxSEppY4ae3lrCCHDRdA6LdF3cTMzQdq7tgzVmzxrauj7E
	wvbdynjU9Vf92hf83J8QVFonV5ghuLRh3BOBRRMM7qqQNUJdc8lAsaMXQDpjVyEdSP72YI
	EnXNJyvqO6E8xflQtSizMuHiPHJgufo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-685-k73NodGxOoSyNSYeShpbMA-1; Mon,
 11 Aug 2025 07:22:28 -0400
X-MC-Unique: k73NodGxOoSyNSYeShpbMA-1
X-Mimecast-MFC-AGG-ID: k73NodGxOoSyNSYeShpbMA_1754911347
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 02A9F1800370;
	Mon, 11 Aug 2025 11:22:27 +0000 (UTC)
Received: from [10.22.80.50] (unknown [10.22.80.50])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7812219560B4;
	Mon, 11 Aug 2025 11:22:24 +0000 (UTC)
Date: Mon, 11 Aug 2025 13:22:18 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Shubham Sharma <slopixelz@gmail.com>
cc: agk@redhat.com, snitzer@kernel.org, corbet@lwn.net, msakai@redhat.com, 
    dm-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: device-mapper :Fix typos in delay.rst and
 vdo-design.rst
In-Reply-To: <20250810113008.27381-1-slopixelz@gmail.com>
Message-ID: <b03394a2-eca7-6c39-6ab8-d3a7ae1c7233@redhat.com>
References: <20250810113008.27381-1-slopixelz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Applied, thanks.

Mikulas



On Sun, 10 Aug 2025, Shubham Sharma wrote:

> Fixed the following typos in device-mapper documentation:
> - explicitely -> explicitly
> - approriate -> appropriate
> 
> Signed-off-by: Shubham Sharma <slopixelz@gmail.com>
> ---
>  Documentation/admin-guide/device-mapper/delay.rst      | 2 +-
>  Documentation/admin-guide/device-mapper/vdo-design.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/device-mapper/delay.rst b/Documentation/admin-guide/device-mapper/delay.rst
> index 4d667228e744..982136160d6f 100644
> --- a/Documentation/admin-guide/device-mapper/delay.rst
> +++ b/Documentation/admin-guide/device-mapper/delay.rst
> @@ -18,7 +18,7 @@ Table line has to either have 3, 6 or 9 arguments:
>     to write and flush operations on optionally different write_device with
>     optionally different sector offset
>  
> -9: same as 6 arguments plus define flush_offset and flush_delay explicitely
> +9: same as 6 arguments plus define flush_offset and flush_delay explicitly
>     on/with optionally different flush_device/flush_offset.
>  
>  Offsets are specified in sectors.
> diff --git a/Documentation/admin-guide/device-mapper/vdo-design.rst b/Documentation/admin-guide/device-mapper/vdo-design.rst
> index 3cd59decbec0..faa0ecd4a5ae 100644
> --- a/Documentation/admin-guide/device-mapper/vdo-design.rst
> +++ b/Documentation/admin-guide/device-mapper/vdo-design.rst
> @@ -600,7 +600,7 @@ lock and return itself to the pool.
>  All storage within vdo is managed as 4KB blocks, but it can accept writes
>  as small as 512 bytes. Processing a write that is smaller than 4K requires
>  a read-modify-write operation that reads the relevant 4K block, copies the
> -new data over the approriate sectors of the block, and then launches a
> +new data over the appropriate sectors of the block, and then launches a
>  write operation for the modified data block. The read and write stages of
>  this operation are nearly identical to the normal read and write
>  operations, and a single data_vio is used throughout this operation.
> -- 
> 2.43.0
> 

