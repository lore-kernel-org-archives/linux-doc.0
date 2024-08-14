Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5891B32A6
	for <linux-doc@vger.kernel.org>; Wed, 14 Aug 2024 18:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723658772; cv=none; b=amyrM1zGXBAY4/s0uFXj/jZfiaX3DiHczAx/NLcNjmj6H88YzdHr9H0RSenY+0O0SCcPZcNa5ChEiHbU3O0ipGlQkYTNYf3JWt482tUfJoJHCXO6QSDzpmtY3YbOcOaJ4xhNJFzz4+zbTrZwKidAvjCeJfnBwH389Q1szeXL/RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723658772; c=relaxed/simple;
	bh=OgIYuErwO6Wha8ijUYepxLZo+72rXIbdzn155X1Axn8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WTunPlPqbIqPeFH2l9IJ0CbBjm+EhAVplcEFEoeS30CkcRKDkwXUzsgfyd4qNie4PPmkNYHZWtHY4LR7akhWuo8WiE2aI45nXYYQ/dtzThuMjXlVlebdTSkzsK8q15xXxuIOyqI6ksP95Vw1Fbc4wQ9yPB8FDmbnuplkcRZ13Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bAi9/geK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bAi9/geK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723658769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Df9gZ6Z3uqpeeR66D13HP17LhwcRwrnrCAW9SGd/xw=;
	b=bAi9/geK0QISUb+9xYl49AyxSqeIQvQcVurzafcZ8UgLlAMpUSVMgS0FC2noXzPRaXh9OC
	cqZUXivolWfiu35bpuoAae4ekbRNlR8Q5pgU6uZCPd1DN0UrIyj9wtjsk2MCAYqPW9YoZu
	1sqcKQbh82L/Q2Lqs3YHFtWZaX3mzvU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-ai6-DSeFPPGh8QM_F2NpRQ-1; Wed,
 14 Aug 2024 14:06:06 -0400
X-MC-Unique: ai6-DSeFPPGh8QM_F2NpRQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F21E6195419A;
	Wed, 14 Aug 2024 18:06:04 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7FF8E19560AA;
	Wed, 14 Aug 2024 18:06:04 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
	id 2649C30C1C18; Wed, 14 Aug 2024 18:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id 21E243FB48;
	Wed, 14 Aug 2024 20:06:03 +0200 (CEST)
Date: Wed, 14 Aug 2024 20:06:02 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Eslam Khafagy <eslam.medhat1993@gmail.com>
cc: agk@redhat.com, snitzer@kernel.org, corbet@lwn.net, 
    skhan@linuxfoundation.org, Daniel Yang <danielyangkang@gmail.com>, 
    dm-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: dm-crypt: fix Unexpected indentation
 error.
In-Reply-To: <20240814174812.3695813-1-eslam.medhat1993@gmail.com>
Message-ID: <589acdb-3c5-fcef-ebcd-f6efc531df4b@redhat.com>
References: <20240810211557.42874-1-eslam.medhat1993@gmail.com> <20240814174812.3695813-1-eslam.medhat1993@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12



On Wed, 14 Aug 2024, Eslam Khafagy wrote:

> Fix indentation error at Documentation/admin-guide/device-mapper/
> dm-crypt.rst when compiling the documentation.
> 
> As per sphinx documentation: Nested lists must be separated
> from the parent list items by blank lines
> 
> to reproduce:
> 	just run "make htmldocs"
> observed error:
> 	Documentation/admin-guide/device-mapper/dm-crypt.rst:167: ERROR:
> 	Unexpected indentation.
> 
> Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
> ---
>  Documentation/admin-guide/device-mapper/dm-crypt.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/admin-guide/device-mapper/dm-crypt.rst b/Documentation/admin-guide/device-mapper/dm-crypt.rst
> index e625830d335e..dc6ded632b22 100644
> --- a/Documentation/admin-guide/device-mapper/dm-crypt.rst
> +++ b/Documentation/admin-guide/device-mapper/dm-crypt.rst
> @@ -164,6 +164,7 @@ iv_large_sectors
>  Module parameters::
>  max_read_size
>  max_write_size
> +   
>     Maximum size of read or write requests. When a request larger than this size
>     is received, dm-crypt will split the request. The splitting improves
>     concurrency (the split requests could be encrypted in parallel by multiple
> -- 
> 2.25.1

Hi

Daniel Yang <danielyangkang@gmail.com> already fixed it in 
git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git 
branch remotes/origin/dm-6.11

If you think that his fix is insufficient, send a patch against his 
version.

Mikulas

