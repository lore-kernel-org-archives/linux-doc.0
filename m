Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5643F63CE
	for <linux-doc@vger.kernel.org>; Sun, 22 Oct 2023 23:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TCBEUyQG"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384DFE7
	for <linux-doc@vger.kernel.org>; Sun, 22 Oct 2023 16:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698016718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jX1G92KJ9HaLCLXW5bUq4SsuwL/Pf25kDHN6JaMRMeE=;
	b=TCBEUyQGHlWsPPwXkrvXZa6+Pgt5eTi41BGlhOxAwo13XO45GPqeI1NJ0SkY2gXmFRVySH
	2/Mx75bvkrMez++P5lhaTEC8L+JAeKhsx8IPQfwSmBdnFSn6v9ZqmhNgxjgTOZ+kAGjISp
	18W67a6QuXMPL3Tt1yhZfHtLd/OZ+xc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-4n3qW8V3Pkmn-zUTc4khOg-1; Sun, 22 Oct 2023 19:18:35 -0400
X-MC-Unique: 4n3qW8V3Pkmn-zUTc4khOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BB0529AA2EF;
	Sun, 22 Oct 2023 23:18:35 +0000 (UTC)
Received: from localhost (unknown [10.72.112.37])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 343C3503B;
	Sun, 22 Oct 2023 23:18:33 +0000 (UTC)
Date: Mon, 23 Oct 2023 07:18:31 +0800
From: Baoquan He <bhe@redhat.com>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Costa Shulyupin <costa.shul@redhat.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] kdump: fix reference to nonexistent file
Message-ID: <ZTWtxzSojtHMwrHu@MiWiFi-R3L-srv>
References: <20231022190424.919982-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231022190424.919982-1-vegard.nossum@oracle.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

On 10/22/23 at 09:04pm, Vegard Nossum wrote:
> All the s390 docs were moved from Documentation/s390/ to
> Documentation/arch/s390/ but this reference didn't get updated. Fix it.
> 
> Fixes: 37002bc6b603 ("docs: move s390 under arch")
> Cc: Eric Biederman <ebiederm@xmission.com>
> Cc: Costa Shulyupin <costa.shul@redhat.com>
> Cc: Tony Krowiak <akrowiak@linux.ibm.com>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: kexec@lists.infradead.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  kernel/Kconfig.kexec | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

LGTM,

Acked-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> index 9bfe68fe9676..7aff28ded2f4 100644
> --- a/kernel/Kconfig.kexec
> +++ b/kernel/Kconfig.kexec
> @@ -110,7 +110,7 @@ config CRASH_DUMP
>  	  For more details see Documentation/admin-guide/kdump/kdump.rst
>  
>  	  For s390, this option also enables zfcpdump.
> -	  See also <file:Documentation/s390/zfcpdump.rst>
> +	  See also <file:Documentation/arch/s390/zfcpdump.rst>
>  
>  config CRASH_HOTPLUG
>  	bool "Update the crash elfcorehdr on system configuration changes"
> -- 
> 2.34.1
> 

