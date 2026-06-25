Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D0C23E25B;
	Thu, 25 Jun 2026 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782406837; cv=none; b=M9fQzqu09jBbW3CF1JqbOm4RhXdKO3t9TS5ArYRqPCHD5fDfksij+kE+uvdNl9n1yaIgua0w7HSXva45vjVMfmXvg6SMuX5KGF6WbHUfqA2AF5eEQ+gr1sLvEEc05w59GlJgiOyOeg8um/794yW8XhUegugpuapejhN9z4veIY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782406837; c=relaxed/simple;
	bh=0H7cABQKXSCOXN6+KkMMYTT76fzxLX9brugQ8ucyJYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IdfJ5sZ/ubcYWr0wdgngbKLqDuo3o757gIa4Z3PYaQKD533sUw9wPfbLyCL6BaF7WHJogrdXUqTzFkU/MV3pfP2qLlgfR2TO9UCOiZzGB8waELXS/42wlC899PapGewwNP65IKEbsqfDwjIU/9ZBsz3/NzKJxWfjsZyPQGu1otg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=O7/eCqQm; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="O7/eCqQm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=XKYMiBsRHeStohcsTF6XftZZ3KTa7NHOj6sdRt094us=; b=O7/eCqQmf363eGna8QcOa4ljHA
	fXk2/EMt2jQp8T6D4yvmkE0LTlntHF/kE9z5tvJ0CnBnXO6Oij+VUaLutYqveHrVqTJAuHHNJ+qgo
	lNUwJF0eCp2EtT2VpLh5ySJCTEVdGb3UQDbqTZM5T9g+f+gTR8Py6l2e6kseKut9AnW7nxXySURIH
	lwLjoJ/uXogAc+qMSZSYcrQPlZQhM0lD3fMDO9GqAzYB+7eSLE2dB2d1DdJ8XmFcyFBM4ks6S0O7m
	i9cWfNYfxtmXKAekte33wR6YJSK02LesdHpZflzHujHm9Z640ANga1q7ze4sUFL6FtWKPfZsk5x4L
	Zv/pv2Sg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnRA-00000009Vuq-2kU0;
	Thu, 25 Jun 2026 17:00:24 +0000
Message-ID: <0e033f0b-f2b8-4127-b067-b960793bfba3@infradead.org>
Date: Thu, 25 Jun 2026 10:00:22 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/24] virt/steal_monitor: Add documentation
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
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-14-sshegde@linux.ibm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260625124648.802832-14-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/25/26 5:46 AM, Shrikanth Hegde wrote:
> Document this module named steal_monitor and its parameters.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> v4-v5:
> - new patch
> 
> Please let me know if the placing is not right.
> 
>  Documentation/driver-api/index.rst         |  1 +
>  Documentation/driver-api/steal-monitor.rst | 93 ++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 Documentation/driver-api/steal-monitor.rst


> diff --git a/Documentation/driver-api/steal-monitor.rst b/Documentation/driver-api/steal-monitor.rst
> new file mode 100644
> index 000000000000..997a22d0812c
> --- /dev/null
> +++ b/Documentation/driver-api/steal-monitor.rst
> @@ -0,0 +1,93 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +=============
> +Steal Monitor
> +=============
> +
> +:Author: Shrikanth Hegde
> +
> +Introduction:
> +=============

Nit:
Kernel heading adornment style does not include an ending ':' character
(4 places).

> +
> +Steal monitor is a driver aimed at solving the Noisy Neighbour problem
> +in virtualized environments. I.e performance of workload
> +running in one VM gets affected significantly due to other VMs and
> +combined they make slower forward progress.


-- 
~Randy

