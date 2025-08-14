Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CFC301029
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 13:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179916; cv=none; b=JKTVsA/Jp5pd8sltNjP7FN8yahyoB5RK4eYzNDrJOAS/9N0mmqnEUiGg8ShkB9SFz4NuVI0o2ObeiPqfFJh9Q7N99A+6qWWeqgh7XeuW2ux/y5EVqXtV7t13bC4fR3bKPGnsLCyOSw0+oslooyCdQZr7encK735b9rYN5DjSg8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179916; c=relaxed/simple;
	bh=RjNP51rWOqwJvFPujRiwfpryaBNZ5h9BXsFdM4LJEDA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HRxoVNsoZ4z+RPrTMm7xy/tMO1m9Ezdu4vEDGK7Y3O99KPqPT37EuK7WNeyFGmC4usLYXRZ5298wcHRGRFU9Ol+BUdvxHb+XTCiyqrVxwP6b/Vu3JEK4nhRZ0txywtnaTtkAQ4vYJkky7fiTreRphWa+FpgsuJE4h1G6N89MMJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bsD7+ILO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bsD7+ILO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755179913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+jw6WbtaoxN6m6sw5E6mdvsLGnRETkf4AVaUkSvs2F4=;
	b=bsD7+ILOXhrUoPJx5WhfmYNiwa1zInSpEdLWZCOSC/WTR+XnViN511EHf8TL/YcuphDFao
	Lk85CMMJRQYKiDYuxDN74ZzPqzBDdSm7UT4pyppoeH0vmAhG/Px1vW0DlDKwJh2CgO+Q/e
	CwDLA3Uo7SviqCkLh6YHX3ZSsCSvm90=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-196-eG3dGHF4N9euJneMVvhlHg-1; Thu,
 14 Aug 2025 09:58:30 -0400
X-MC-Unique: eG3dGHF4N9euJneMVvhlHg-1
X-Mimecast-MFC-AGG-ID: eG3dGHF4N9euJneMVvhlHg_1755179909
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 43B92195609F;
	Thu, 14 Aug 2025 13:58:29 +0000 (UTC)
Received: from [10.22.80.50] (unknown [10.22.80.50])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B521C19A4CAB;
	Thu, 14 Aug 2025 13:58:26 +0000 (UTC)
Date: Thu, 14 Aug 2025 15:58:19 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Soham Metha <sohammetha01@gmail.com>
cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
    skhan@linuxfoundation.org, Alasdair Kergon <agk@redhat.com>, 
    Mike Snitzer <snitzer@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
    Matthew Sakai <msakai@redhat.com>
Subject: Re: [PATCH v2 4/9] docs: device-mapper: fixed spelling mistakes in
 documentation
In-Reply-To: <20250812204952.73136-2-sohammetha01@gmail.com>
Message-ID: <1b392cd9-ff49-2b5e-bc42-c544170c1da6@redhat.com>
References: <20250812201523.69221-1-sohammetha01@gmail.com> <20250812204952.73136-1-sohammetha01@gmail.com> <20250812204952.73136-2-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Applied, thanks.

Mikulas



On Wed, 13 Aug 2025, Soham Metha wrote:

> found/fixed the following typos
> 
> - flushs -> flushes
> - explicitely -> explicitly
> 
> in `Documentation/admin-guide/device-mapper/delay.rst`, and
> 
> - approriate -> appropriate
> 
> in `Documentation/admin-guide/device-mapper/vdo-design.rst`
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>
> ---
>  Documentation/admin-guide/device-mapper/delay.rst      | 8 ++++----
>  Documentation/admin-guide/device-mapper/vdo-design.rst | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/admin-guide/device-mapper/delay.rst b/Documentation/admin-guide/device-mapper/delay.rst
> index 4d667228e744..a1e673c0e782 100644
> --- a/Documentation/admin-guide/device-mapper/delay.rst
> +++ b/Documentation/admin-guide/device-mapper/delay.rst
> @@ -3,7 +3,7 @@ dm-delay
>  ========
>  
>  Device-Mapper's "delay" target delays reads and/or writes
> -and/or flushs and optionally maps them to different devices.
> +and/or flushes and optionally maps them to different devices.
>  
>  Arguments::
>  
> @@ -18,7 +18,7 @@ Table line has to either have 3, 6 or 9 arguments:
>     to write and flush operations on optionally different write_device with
>     optionally different sector offset
>  
> -9: same as 6 arguments plus define flush_offset and flush_delay explicitely
> +9: same as 6 arguments plus define flush_offset and flush_delay explicitly
>     on/with optionally different flush_device/flush_offset.
>  
>  Offsets are specified in sectors.
> @@ -40,7 +40,7 @@ Example scripts
>  	#!/bin/sh
>  	#
>  	# Create mapped device delaying write and flush operations for 400ms and
> -	# splitting reads to device $1 but writes and flushs to different device $2
> +	# splitting reads to device $1 but writes and flushes to different device $2
>  	# to different offsets of 2048 and 4096 sectors respectively.
>  	#
>  	dmsetup create delayed --table "0 `blockdev --getsz $1` delay $1 2048 0 $2 4096 400"
> @@ -48,7 +48,7 @@ Example scripts
>  ::
>  	#!/bin/sh
>  	#
> -	# Create mapped device delaying reads for 50ms, writes for 100ms and flushs for 333ms
> +	# Create mapped device delaying reads for 50ms, writes for 100ms and flushes for 333ms
>  	# onto the same backing device at offset 0 sectors.
>  	#
>  	dmsetup create delayed --table "0 `blockdev --getsz $1` delay $1 0 50 $2 0 100 $1 0 333"
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
> 2.34.1
> 

