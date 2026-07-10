Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED44C1A268;
	Fri, 10 Jul 2026 01:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783646878; cv=none; b=IoAbADEPjT6rv6aUFYwYSa+YweUxrKZZOa8M/N4NR2rLV84RVCNsU8CEcH7smjZvcj8KwfyUDI6tk6pZSYzC3O1k3atDlj6T+MtYXnaamhCLWu7wOLb+u1iLWIP0OUkT6q2riJSoIK1pM6MRnblKvSh94tQ+QjkVM/JhGiB0zcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783646878; c=relaxed/simple;
	bh=fhNsIXBASKDeaf4OlCx3aW/Cjcy5QOLN6Z6zTwIEY08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wl9AzwJlF8RJUTGLqO/k7lgpm3XmNAHvwT+Eiob8FcHj3IRlVIEW78cOachHcjaSe5mH8Lt0HWngSAYEfxLk77tkevDknRoUOob1hRITfGxR164uX8ZNi3F/I1pVo8w6yGUs3qWlbADWYWU5TkYnG59McMmASg14iXfozfFR3tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=iUyL4tVL; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iUyL4tVL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=e+N6HAUtyMihAenrrCQB3ihEIKXJ2e2TDyrDYLRkSP8=; b=iUyL4tVLiPmjZBNLOiqKe6M5av
	ZAymqn3poB0Y8gRTcOoG04rZbxhdYuPin7xDzSjV73GmH8BGuqNJ6zwXGdkFYGHsB8Gj5osMJg+Xl
	hei3IPz4Oya4JXYNZvC6LQF6noO3eaZe5D5sA5a5BWZIEvvXuC791mIzh6/BPG/k58jaNbsyQIr3q
	z5r5j9AGC0gYEFjFZIgIrCV/MF1qHLpOPMLWRwWKdznEgyed+1NWKCuN79jhM2u9UMMFEXQGn0c0w
	oDkN2wI0Yz1EbDIivWKLFcGkMgvo4KP2sbUdrTYf6u46K17G2j4rFpkp1Id9pRM7ZmuhD3upzYC45
	x+RbLosQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi01v-00000003uwX-3en8;
	Fri, 10 Jul 2026 01:27:51 +0000
Message-ID: <18366430-144e-4d77-bab0-494d7102475a@infradead.org>
Date: Thu, 9 Jul 2026 18:27:50 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/12] virt: Introduce steal monitor driver
To: Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org,
 mingo@kernel.org, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, yury.norov@gmail.com, kprateek.nayak@amd.com,
 iii@linux.ibm.com, corbet@lwn.net
Cc: tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com,
 seanjc@google.com, vschneid@redhat.com, huschle@linux.ibm.com,
 rostedt@goodmis.org, dietmar.eggemann@arm.com, maddy@linux.ibm.com,
 srikar@linux.ibm.com, hdanton@sina.com, chleroy@kernel.org,
 vineeth@bitbyteword.org, frederic@kernel.org, arighi@nvidia.com,
 pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org,
 tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
 kernellwp@gmail.com, linux-doc@vger.kernel.org
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-9-sshegde@linux.ibm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260709215648.1246821-9-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/9/26 2:56 PM, Shrikanth Hegde wrote:
> diff --git a/Documentation/driver-api/steal-monitor.rst b/Documentation/driver-api/steal-monitor.rst
> new file mode 100644
> index 000000000000..94f4aa1aaa7d
> --- /dev/null
> +++ b/Documentation/driver-api/steal-monitor.rst
> @@ -0,0 +1,111 @@
> +.. SPDX-License-Identifier: GPL-2.0

Insert a blank line here, please, to avoid this warning:
Documentation/driver-api/steal-monitor.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent. [docutils]


> +=============
> +Steal Monitor
> +=============
> +
> +:Author: Shrikanth Hegde
> +
> +Introduction
> +============

-- 
~Randy

