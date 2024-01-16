Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A3B125A4
	for <linux-doc@vger.kernel.org>; Tue, 16 Jan 2024 08:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bHiIZXKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705394869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UncHVfW4Ux3jXdUAyztvDXP0zGW8LLIYO8kgbeAGUyc=;
	b=bHiIZXKnCxA3UbGeVbvy5a23LIhkI+jwpehZv1uY6CQUj/3xOc8pcs7JPqNnL50xr+ZZRM
	fI6tIcvjDmmbNmhH+osP6Umm56XDdy3FwBDulP2t6GBa5uCX/mtf9ZVRfmVvVDDM+zsi3R
	ve1b9yyZ6DmnlCUGJEgLm8weyfTZQIk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-jat0MiqhMQS1Y64ttKZo5A-1; Tue, 16 Jan 2024 03:47:42 -0500
X-MC-Unique: jat0MiqhMQS1Y64ttKZo5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C26785A58C;
	Tue, 16 Jan 2024 08:47:42 +0000 (UTC)
Received: from localhost (unknown [10.72.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05A31112131D;
	Tue, 16 Jan 2024 08:47:40 +0000 (UTC)
Date: Tue, 16 Jan 2024 16:47:35 +0800
From: Baoquan He <bhe@redhat.com>
To: Pingfan Liu <kernelfans@gmail.com>, corbet@lwn.net,
	akpm@linux-foundation.org
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	Pingfan Liu <piliu@redhat.com>, Dave Young <dyoung@redhat.com>
Subject: Re: [PATCH] Documentation: kdump: Clarify the default size of memory
 reserved by crashkernel low
Message-ID: <ZaZCp0LVTgXAmm79@MiWiFi-R3L-srv>
References: <20231218034020.15341-1-kernelfans@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218034020.15341-1-kernelfans@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Hi Jonathan, Andrew,

On 12/18/23 at 11:40am, Pingfan Liu wrote:
> From: Pingfan Liu <piliu@redhat.com>
> 
> The default size reserved for crashkernel=,low is decided by the macro
> DEFAULT_CRASH_KERNEL_LOW_SIZE, which is based on arch.
> 
> Signed-off-by: Pingfan Liu <piliu@redhat.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Dave Young <dyoung@redhat.com>
> To: kexec@lists.infradead.org
> To: linux-doc@vger.kernel.org
> ---
>  Documentation/admin-guide/kdump/kdump.rst | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
> index 5762e7477a0c..a021ff155012 100644
> --- a/Documentation/admin-guide/kdump/kdump.rst
> +++ b/Documentation/admin-guide/kdump/kdump.rst
> @@ -310,8 +310,9 @@ crashkernel syntax
>     region above 4G, low memory under 4G is needed in this case. There are
>     three ways to get low memory:
>  
> -      1) Kernel will allocate at least 256M memory below 4G automatically
> -         if crashkernel=Y,low is not specified.
> +      1) Kernel will allocate a chunk of default size memory, which is based on
> +         architecture, below 4G automatically if crashkernel=Y,low is not
> +         specified.

This is a good catch in the obsolete section. Could any of you help
take this?

Thanks
Baoquan

>        2) Let user specify low memory size instead.
>        3) Specified value 0 will disable low memory allocation::
>  
> -- 
> 2.31.1
> 

