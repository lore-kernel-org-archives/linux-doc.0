Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBB032548C
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 02:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108788; cv=none; b=JnnpPyLktLrhtcLrfRlw4Sc40ePSvR7roldq3N0RDI4iNqo3iGNlAQStuqS8HaAqnIhQwCFQdhErHDqp+/y2oKqRMeYhTWS/1s3B5GFakwQ0om/9KdDK2rCgw6iRKLk+xHvtt+c42zUdQ11jTF+8JY3OxZnrFUD828f63d0Avh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108788; c=relaxed/simple;
	bh=1ROmmXzbNCiQ0bHU48N4Ll72y619B1NhI2NdEeFxvyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Myqr53TukBmOouMeZ03rjvT5VAxXuPhgiSk1MA6Km0Nikw3frKbyA0hJNwzTo6SofgUIMcgW3EihQ9sPS+ymvZtB8PCh++3/14ekwmzVDlb4oGXXZzA3U4kEAiZYa4XTNne9TBYvvAA9rbaVzP7SJHXjfZW70XETaMF9gigQfGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y/KZloKb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y/KZloKb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773108786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aCV6AtrZqJOTKDcJoDwJvJmch/wh+FICVhihLLbm0gc=;
	b=Y/KZloKbriAlDtoWps59zaxradMOJCq0Hnu7gjetn41Gb17//HA3YahidQFdlQIJBYTVCC
	wZw8XnpWmuPv2CsyQqpZOZpxF01iiNjEe8f5t6YxIcbQHCkfKGURZoqZf67/+DHwCewtUh
	z1I9aOFUEyfjCuqbUXnpeOH3PFhjcHg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-76-GhrlQYu0MNSCZLjJsHwWOQ-1; Mon,
 09 Mar 2026 22:13:03 -0400
X-MC-Unique: GhrlQYu0MNSCZLjJsHwWOQ-1
X-Mimecast-MFC-AGG-ID: GhrlQYu0MNSCZLjJsHwWOQ_1773108782
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7DC02180034E;
	Tue, 10 Mar 2026 02:13:01 +0000 (UTC)
Received: from localhost (unknown [10.72.112.10])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C06ED1800761;
	Tue, 10 Mar 2026 02:12:54 +0000 (UTC)
Date: Tue, 10 Mar 2026 10:12:45 +0800
From: Baoquan He <bhe@redhat.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, robh@kernel.org, saravanak@kernel.org,
	akpm@linux-foundation.org, vgoyal@redhat.com, dyoung@redhat.com,
	rdunlap@infradead.org, pmladek@suse.com, dapeng1.mi@linux.intel.com,
	kees@kernel.org, paulmck@kernel.org, lirongqing@baidu.com,
	fvdl@google.com, rppt@kernel.org, ardb@kernel.org,
	leitao@debian.org, sourabhjain@linux.ibm.com, jbohac@suse.cz,
	cfsworks@gmail.com, osandov@fb.com, tangyouling@kylinos.cn,
	ritesh.list@gmail.com, hbathini@linux.ibm.com,
	eajames@linux.ibm.com, songshuaishuai@tinylab.org,
	kevin.brodsky@arm.com, samuel.holland@sifive.com,
	vishal.moola@gmail.com, junhui.liu@pigmoral.tech, coxu@redhat.com,
	liaoyuanhong@vivo.com, fuqiang.wang@easystack.cn, brgerst@gmail.com,
	x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v8 0/5] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-ID: <aa9-HYdKT8MhAjhi@MiWiFi-R3L-srv>
References: <20260302035315.3892241-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302035315.3892241-1-ruanjinjie@huawei.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 03/02/26 at 11:53am, Jinjie Ruan wrote:
> The crash memory allocation, and the exclude of crashk_res, crashk_low_res
> and crashk_cma memory are almost identical across different architectures,
> This patch set handle them in crash core in a general way, which eliminate
> a lot of duplication code.
> 
> And add support for crashkernel CMA reservation for arm64 and riscv.
> 
> Rebased on v7.0-rc1.
> 
> Basic second kernel boot test were performed on QEMU platforms for x86,
> ARM64, and RISC-V architectures with the following parameters:
> 
> 	"cma=256M crashkernel=256M crashkernel=64M,cma"

The whole series looks good to me, thanks.

Acked-by: Baoquan He <bhe@redhat.com>

