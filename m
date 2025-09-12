Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954DB289E30
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 06:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757660025; cv=none; b=ECud1kymq0XUajUaiFhDr/SdCRDSTUyi0ZyK5btKtiS306KIEOO7qi6oaOMpRQJB3palc5CG6YN52OWyWhZWlpLYzUxvQVm4zhe+LGUqo7NRacKRqKRuuqAtT2ReaNfNWUWMYhK1rQ3YksW77EaqAR0ex240EEw+MqVAIvUJ36Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757660025; c=relaxed/simple;
	bh=mPsbodAtPjiJ3OKduxPpYJ0o4XxyNaptVm2EuskVmXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vxf44iirFIqWsYrFPByBdvbzwjnPVFPyI/ge5+JXsCIUV2jYJSwjejXpKNwSiY9q2jE/5k9rgF0sUqhyn02LYM8XDwI3ftsX4SHlDu07PAVFaeotlU5JuVb+jfx4bSCPrKPhmDSF3XFSkRtssDA+IRhesCf7qHW4zbXp6u/Cnu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e5OMHdDB; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="e5OMHdDB"
Message-ID: <f0426e43-3d3e-4dc4-aa6b-31db8b2a2a53@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757660011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mPsbodAtPjiJ3OKduxPpYJ0o4XxyNaptVm2EuskVmXc=;
	b=e5OMHdDBLdx8/XLMpjj24B/LxKFBdKo3LrNueZMlFYbDu8OplqFkfmJwV8zzUIR5POZ0hR
	IxFhM4pvm935YDaU//okrX/mNzl+UWlcLNBHvoGnnCuWplR/ckoeYJgZyAd6vhPQspGqHE
	5sf/MFGwJc+n5FuLIAGL5EdvYp3qtUU=
Date: Fri, 12 Sep 2025 14:53:24 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4 v3] Docs/zh_CN: Translate timestamping.rst to
 Simplified Chinese
To: wang.yaxin@zte.com.cn
Cc: alexs@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, xu.xin16@zte.com.cn, yang.yang29@zte.com.cn,
 fan.yu9@zte.com.cn, he.peilin@zte.com.cn, tu.qiang35@zte.com.cn,
 qiu.yutan@zte.com.cn
References: <20250830170157045JsLLov8_im0lUELq88aLu@zte.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250830170157045JsLLov8_im0lUELq88aLu@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 8/30/25 5:01 PM, wang.yaxin@zte.com.cn 写道:
> +
> +3.2.4 MAC 驱动程序的其他注意事项
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
There is an obvious misalignment here. I'm curious, have you tried building tests?


Thanks,

Yanteng

