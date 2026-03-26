Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0241374721
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 11:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774523201; cv=none; b=LAf+00Y+Qbs67MMz5bQKTy2QIYsKuk4Uca5k0b9nUJzuJKSNx3qtgA1p0zhSyDSKLI0MBnHTuHMfqXn2YQUrqHYy17kzP+i3FS/+nX75GML3YmmOEe/+x4mq/nxyC8Scpgt9rfgBibK28lf/b1I6MTwIVdtfdTajAXbXWWFxEc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774523201; c=relaxed/simple;
	bh=k+wu+2cuNPZeET/Emq8oKs+zlyzXvPmaUY8+O6El8n8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GNr/T1PmNNm3AV+8qgi5+nhpP6ETvTGCIK9Ea2/6bx54q/7EJBAbTH9p7bhuJXraVWZwXrr/Cd2ssDuvxxHSe3XdlmQrBYzn5cuXDpkZbNlW49jG8eLntv3aPZPKeiv5m1DcEM38LtYTAqPcMmh8aPUM0GK6Hx9dJG5jCPaB36c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GKzQ9M9A; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GKzQ9M9A"
Message-ID: <c3a01e7b-0b3a-4a0e-86cb-f9fe79a90a62@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774523196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t82upu+JkYBPixAK81aWkOm93P++6ewa96nPfYVRcls=;
	b=GKzQ9M9AR79IL1NcYc6CwQLAjkXvhfgt1JwV5btp0LSD3R71Ah86kpegNAN0AUojCgUmpO
	ZJCdK2e88XeZ1taR4aVB2ZZgLejnMmchCWNyBG0rn7o7k4EJVAKjVueU/qqrSuMQI+S85K
	XSGhNNCimStJRgXLVo9pHfTIhZVlyBI=
Date: Thu, 26 Mar 2026 11:06:24 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next 1/3] dpll: add actual frequency monitoring to
 netlink spec
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Prathosh Satish <Prathosh.Satish@microchip.com>, Petr Oros
 <poros@redhat.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260325193914.124898-1-ivecera@redhat.com>
 <20260325193914.124898-2-ivecera@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20260325193914.124898-2-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 25/03/2026 19:39, Ivan Vecera wrote:
> Add DPLL_A_FREQUENCY_MONITOR device attribute to allow control over
> the frequency monitor feature. The attribute uses the existing
> dpll_feature_state enum (enable/disable) and is present in both
> device-get reply and device-set request.
> 
> Add DPLL_A_PIN_ACTUAL_FREQUENCY pin attribute to expose the measured
> input frequency in Hz. The attribute is present in the pin-get reply.

Overall looks ok, but the wording can be improved, I think. What about
using "MEASURED" or "READ" instead of "ACTUAL"? The spec file has this
note already, looks like there were some concerns already?
