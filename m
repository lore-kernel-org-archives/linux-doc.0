Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1343EDAC6
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 10:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459528; cv=none; b=d5PtCkMP6uimwdE2DQZG+0cIVKCV1uXjX6Rg/pe7bombaHeFJuPyBgsBo/zUoIuEUr1oMsdVOkV7RoLnNKCn73ITQXCFbbdFU1LZqBLdSO1XDXQdIVKoJnxdho7F7Yj00QB9afipDm6PW4G/Q4AglKGGADw3sE1crWoIOsbu2cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459528; c=relaxed/simple;
	bh=hoXt7ll+WEhBmdEZpAR0xBoFE9j/qYKVvqF3h/ndA2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sxm41MoVJCKKJvrBphJXfrboMRNTe1S5kUZK0ybfJHgHlORs5mfcsv0ZW0JuXrz9o1nG7Pd2kqWlQyYTl0S/NOZE+Z+UvK4FxH1riDEyUnfV7xIstFy7LUSZBr3/uE8HoyD+0BlbxPkHh1s1WToeK53sa/B9ucWuDChQQcWMbtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CK+cdYyr; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CK+cdYyr"
Message-ID: <218957c5-9c95-49a4-aafd-dfcaf7a84ecd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777459520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQKftdkdX4eFNl/ajOq4nBnGRZp77nSc5y0FjzWpvHU=;
	b=CK+cdYyr7kmcbQabEoOeAmbglzjp8wm7WUdOjmE6NXb3xL10okjl5KgNmcYuyTTEGUjXkr
	yWnulgycH4ZuecNoNMeKM6JJ3lQuyT28KwEvCf3z2qNZAMBflJFP1FO5HtMWwjWDs9Q1w3
	McWL+HrobKSBxg9TFn/8wNv4OZ8ldOg=
Date: Wed, 29 Apr 2026 11:45:14 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next 1/2] dpll: add pin operational state
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
 Jonathan Corbet <corbet@lwn.net>, Michal Schmidt <mschmidt@redhat.com>,
 Paolo Abeni <pabeni@redhat.com>, Pasi Vaananen <pvaanane@redhat.com>,
 Petr Oros <poros@redhat.com>, Prathosh Satish
 <Prathosh.Satish@microchip.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Simon Horman <horms@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260428154907.2820654-1-ivecera@redhat.com>
 <20260428154907.2820654-2-ivecera@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20260428154907.2820654-2-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 28/04/2026 16:49, Ivan Vecera wrote:
> Add pin-operstate enum and operstate_on_dpll_get callback to report
> the actual hardware status of a pin with respect to its parent DPLL
> device. Unlike pin-state (which reflects administrative intent set
> by the user), operstate reflects what the hardware is actually doing.
> 
> Defined operational states:
>    - active: pin is qualified and actively used by the DPLL
>    - standby: pin is qualified but not actively used by the DPLL
>    - no-signal: pin does not have a valid signal
>    - qual-failed: pin signal failed qualification
> 
> The operstate is reported inside the pin-parent-device nested
> attribute alongside the existing state and phase-offset attributes.
> 
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
