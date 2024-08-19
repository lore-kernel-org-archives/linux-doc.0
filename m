Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D851586CF
	for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 20:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724099412; cv=none; b=ZKft0i6Sxzmbh4vFyEa993KU1cMOZcVT6dH3+dsPXhwbyBQ6N/37yVRu18J3c8Te4RZC8AYXUhhXIdyGNQjGAs0U9EHo4gj3PhcXDKsU3jqLol+dRoi7L0l5eoWFsjJDmv96zrs42cN3T3w80YNXU0SdetqJtcPaIU2YMeHm2Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724099412; c=relaxed/simple;
	bh=dxZzgN8fHT7/E9MQmkwqnJhujKe+x7LyCDMQUazEia0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CrFxFyFfoiCFvbG4H1BWYwIP+ppfkb1KiNpDO2SSog7xEwTEmRUFj5pQdFNhezP0OPcNDd7894PYfarFVuy5fk7Iu8fYYsEjjkn5gaV99BTAPfyre47UFdJ6ficuDOeGSKG+A/vpTUcj0p+8pwsHgjqPIkz3clEm0JR1uxmU3ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YS5OgtbG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YS5OgtbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724099408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hn+U0KRxu/hCj/TyTc49LIfB/amh5yN9k/2aiCsM7B4=;
	b=YS5OgtbGYa2KaqjCMTTLeGBuriiecqCKqeyEzV7kiII6N2MUc/ubp4gL3TeeCF4jP432Cv
	rc9l33N66YAkxm583hae23avrjakMggW7dxlvPmy6hd7FuIOEUvv2XJSPzXe4IGDJ0mLsB
	QNoGxMSh5cYc6jct+2km+TMStQgZERY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-440-z3TYU149PZ-d5vkRbPCspg-1; Mon,
 19 Aug 2024 16:30:07 -0400
X-MC-Unique: z3TYU149PZ-d5vkRbPCspg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 05EC419560B4;
	Mon, 19 Aug 2024 20:30:06 +0000 (UTC)
Received: from [10.45.224.222] (unknown [10.45.224.222])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 431871956053;
	Mon, 19 Aug 2024 20:30:03 +0000 (UTC)
Date: Mon, 19 Aug 2024 22:29:58 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Piotr Zalewski <pZ010001011111@proton.me>
cc: agk@redhat.com, snitzer@kernel.org, corbet@lwn.net, 
    dm-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] Documentation: admin-guide/dm: Fix indentation bug
In-Reply-To: <20240819172401.77928-3-pZ010001011111@proton.me>
Message-ID: <ced0f91b-6db7-df23-3988-b687b8beefcc@redhat.com>
References: <20240819172401.77928-3-pZ010001011111@proton.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17



On Mon, 19 Aug 2024, Piotr Zalewski wrote:

> The following bug was found at `admin-guide/device-mapper/dm-crypt.rst`:
> ```
> admin-guide/device-mapper/dm-crypt.rst:167: ERROR: Unexpected indentation.
> ```
> Fix the indentation error.

Hi

This should be already fixed in v6.11-rc4.

Mikulas

> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Piotr Zalewski <pZ010001011111@proton.me>
> ---
>  .../admin-guide/device-mapper/dm-crypt.rst     | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/admin-guide/device-mapper/dm-crypt.rst b/Documentation/admin-guide/device-mapper/dm-crypt.rst
> index e625830d335e..450c211534a9 100644
> --- a/Documentation/admin-guide/device-mapper/dm-crypt.rst
> +++ b/Documentation/admin-guide/device-mapper/dm-crypt.rst
> @@ -160,15 +160,15 @@ iv_large_sectors
>     The <iv_offset> must be multiple of <sector_size> (in 512 bytes units)
>     if this flag is specified.
>  
> -
> -Module parameters::
> -max_read_size
> -max_write_size
> -   Maximum size of read or write requests. When a request larger than this size
> -   is received, dm-crypt will split the request. The splitting improves
> -   concurrency (the split requests could be encrypted in parallel by multiple
> -   cores), but it also causes overhead. The user should tune these parameters to
> -   fit the actual workload. 
> +    Module parameters::
> +
> +        max_read_size
> +        max_write_size
> +           Maximum size of read or write requests. When a request larger than this size
> +           is received, dm-crypt will split the request. The splitting improves
> +           concurrency (the split requests could be encrypted in parallel by multiple
> +           cores), but it also causes overhead. The user should tune these parameters to
> +           fit the actual workload.
>  
>  
>  Example scripts
> -- 
> 2.46.0
> 
> 

