Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7633528682
	for <linux-doc@vger.kernel.org>; Sat, 27 Sep 2025 22:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759013565; cv=none; b=VwifVvexhZ9cbDvftdKCt7Nb5QD7C4oJD1y/ZhLhwUfsPGMYEVaZcCkGXOsETBkFTBA8gCxbKgdASAUFyHmmembbS/fYLu0p3mpaRX8yroA+qFV7THlqkc3A03WJot6tR7TxPlFPjCaWMixBabzpgk34ZK0EaKx9IIhgDKYg5hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759013565; c=relaxed/simple;
	bh=/aQMykb19JAsIgGW57ODolQopGsrNbaC9EirkoZrUjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5Z6vFZS/4XxzjdZjWK64RdBjOTbOC/MRKtjYXBqLlyIUh5wMpSb01YiTRDTktqceIrVtZbI2VPbSL4hRO4SJy+yuczXv47BbDOA/rapizhl5orlS4z2TFodmn2E3mgYjK8v1/t/vJuajwdZzkF1wFKR7Fe5Lm/KJkY1x1kuxFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AV/0rMZV; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AV/0rMZV"
Message-ID: <17cf1f38-38d3-4112-bae0-584f0839cdd6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1759013560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w2WHTopxGRmHnpfC+dKNt8XmZhQQZVj0k/p9ca23m9s=;
	b=AV/0rMZVrrGii7FMvci2GWpaaXJXStF8FUhnsXAItjDI5OnxRtatQmLAUzxk0KyC3Xixlp
	snn6BdFOXdvuQn9twXMk5goAgUk62b3dTrc7tjUDWkY89FOdhXM28DMs233x3WhucJcq1m
	+SICNpDPBRfQR5uJNXExl0E1LwV8yFA=
Date: Sat, 27 Sep 2025 23:52:36 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 0/3] dpll: add phase offset averaging factor
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 Chuck Lever <chuck.lever@oracle.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>,
 Petr Oros <poros@redhat.com>
References: <20250927084912.2343597-1-ivecera@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250927084912.2343597-1-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 27.09.2025 09:49, Ivan Vecera wrote:
> For some hardware, the phase shift may result from averaging previous values
> and the newly measured value. In this case, the averaging is controlled by
> a configurable averaging factor.
> 
> Add new device level attribute phase-offset-avg-factor, appropriate
> callbacks and implement them in zl3073x driver.
> 
> Ivan Vecera (3):
>    dpll: add phase-offset-avg-factor device attribute to netlink spec
>    dpll: add phase_offset_avg_factor_get/set callback ops
>    dpll: zl3073x: Allow to configure phase offset averaging factor
> 
>   Documentation/driver-api/dpll.rst     | 18 +++++++-
>   Documentation/netlink/specs/dpll.yaml |  6 +++
>   drivers/dpll/dpll_netlink.c           | 66 ++++++++++++++++++++++++---
>   drivers/dpll/dpll_nl.c                |  5 +-
>   drivers/dpll/zl3073x/core.c           | 38 +++++++++++++--
>   drivers/dpll/zl3073x/core.h           | 15 +++++-
>   drivers/dpll/zl3073x/dpll.c           | 58 +++++++++++++++++++++++
>   drivers/dpll/zl3073x/dpll.h           |  2 +
>   include/linux/dpll.h                  |  6 +++
>   include/uapi/linux/dpll.h             |  1 +
>   10 files changed, 199 insertions(+), 16 deletions(-)

For the series:
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

