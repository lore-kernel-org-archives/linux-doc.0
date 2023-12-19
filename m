Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10162134C7
	for <linux-doc@vger.kernel.org>; Tue, 19 Dec 2023 07:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fpRltdt3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702970938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z41OPAeFuRVfVwpG8mOU7SweUlkIZGPKy5DQ+DlmDTM=;
	b=fpRltdt3jAhImnH+tKZA6Exc53KP8Kiiq9S7DUtSR7ukgV/L1XIfGkDwII4Dahdf4TTyba
	yAkU3m+F4NPykvDgOhM9CZMo1Ca1RA8SCEKzjHdYhZcjHoc5VdWQ4rqZLJW3ymTXGvZfir
	SVKVdQcT0phOTtPMsJ3jnvgz5uU+8o4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-GXz9a8nTNNqDb8SpWVPjkw-1; Tue, 19 Dec 2023 02:28:56 -0500
X-MC-Unique: GXz9a8nTNNqDb8SpWVPjkw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1E92848C02;
	Tue, 19 Dec 2023 07:28:55 +0000 (UTC)
Received: from localhost (unknown [10.72.116.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05E791121306;
	Tue, 19 Dec 2023 07:28:54 +0000 (UTC)
Date: Tue, 19 Dec 2023 15:28:51 +0800
From: Baoquan He <bhe@redhat.com>
To: Pingfan Liu <kernelfans@gmail.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	Pingfan Liu <piliu@redhat.com>, Dave Young <dyoung@redhat.com>
Subject: Re: [PATCH] Documentation: kdump: Clarify the default size of memory
 reserved by crashkernel low
Message-ID: <ZYFGMxkjfN3BVUq5@MiWiFi-R3L-srv>
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

Good catch, thx.

Acked-by: Baoquan He <bhe@redhat.com>

>        2) Let user specify low memory size instead.
>        3) Specified value 0 will disable low memory allocation::
>  
> -- 
> 2.31.1
> 

