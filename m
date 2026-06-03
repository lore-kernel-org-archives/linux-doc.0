Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EB43E63BE
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 17:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780506747; cv=none; b=hovet8u7cs1I62RP9/f2QdgXX02V2eGIDmqcKPsX/qHP55T/O/GZPwtMZzK0ABL4EiH8pmYjP2fQeLS4xWd/eSmm13LRHknJI07IfIMbA4Rwnn0eAdm9ZMMZtwf7oHeJ0pYTbFTLWs3Pew4R/4CcU7PuxT710nMLSvEPTEyM5ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780506747; c=relaxed/simple;
	bh=TN5VN5nZYGpZ0cgk6I+DWPRMt4OBymg3kF+L1ZSTg10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VkMI3MCE/QAe/5sMwLmkGmz9OLqwBBZuSw4mYNuTnhIFUTj5cYS/cftcg4UF2rABotdyq2JCLdCOo/5ghr73s4GoCWp5CIxjBPgZbnkde1YSCYabIuCkgch7hZg1xyMoE8zJIPvhCG7GdIiK1IO/EhD93icShuEjTa8gCsDeImM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=J43NUAr6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="J43NUAr6"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ef372c58aso2984584f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 10:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1780506745; x=1781111545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WShIXeDXg6osn/1BPpnCqqp3TWGu+yv09MQ0gxlHZ/8=;
        b=J43NUAr6UxcD6FhnwU3H5ssro/H+8XGFqQJSoNhiMs3ztDp8Q8P4c0V4dndmvxoB9u
         HGLYWSSg/r/hz7VWdpSLHoZXMi9kTS9DtnC8iKQWzEpjAIUj+BYzxmxi4S7E5BSmqwfn
         rkkklpjH0ZOVxOShxgYaB4k9F71N8npU26s3nDsEymw6CQ+de50yUol829sxw9znEOKC
         tgW2CPTzcTc+wzz9f3pYS+fJ8gXhWlSeVPAGv2b87BtaKX8qFi/1JAVnIrRzksUXckom
         cGdxPwDy3l3pkO/Cv0IoLx3U0SLmT5DwSOr08RKc8RGcbYpX47iCv4rsl1mJ26oum2Oy
         koPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780506745; x=1781111545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WShIXeDXg6osn/1BPpnCqqp3TWGu+yv09MQ0gxlHZ/8=;
        b=E3uDT7Sx/rR5EhcsTZ8c25Pw/f/8UsjNUGO+/py62m7n1pksgXTVePSivsZHKY2PlY
         XCgQ/uR3N6/AzvOX+60OPU1GPO4mtrKqMVH+XgqzM98TXynBmEzxkSgFfEZAlMowj+17
         ZMk0EtCu91U6nM5fBiw/sHDdQ+wxcgPUqU+hUY5qI8ZO9LQMcioWmNbUKFguN52CjlZW
         iRfofo12eI40qKwclgPgtJ/Al7IfiQ+o+UnzfIACvFG+2GluHrsp9o0Xh3WR3dSlvkwQ
         x+xAdoX6Y896DSbWCh+G4LjfkRQCgyR2B++oyO7D0MyGcmXopqJ0ScgAOjRDt/GbvAGT
         7h3A==
X-Forwarded-Encrypted: i=1; AFNElJ8BS797TtitFNzeMSc2jh1i6vGNyLM2LdKaS7m+eu+LpJSTnI8TteFvww+8OCLmzbTZDdtg1nDXWBA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0VRi7knAU+Yka8duJXmCCkClEKPWa17JmvsMfeltOrnf5uuVY
	/bS2LwPfOnf0VUQbtb1Xvyl5Mm8pnuRc/eCC7CHae2Hpc0SDdGsOIYlxs4a0EnxlzK8=
X-Gm-Gg: Acq92OFZAYGv/TeokUhsy+/kUCjn7OhuWGfRsFxEruwkh4DC+Laf/Cyax/G55nKOi3L
	owzbXhS5oJx0r457KuCZgJdLuCa+ZBanyjt5h7FP9NmYw6raIVoYJIsn4WOcZ5MDcmyHj++A+1L
	Q3KemS4cq7WtgNF7ped4kxUnIlFDIX8RCUoJxO20hgTEO7DTtOjDdGkLCDKKPgz9mnZDNV2lerD
	GmcfSXPqPUbP3d6DyTCnEkrPUDck8jGy/tYUUQdtOwXY14g01KncljNR0dxWoNWx3hpy0ikgexZ
	Q+yFdi9N7OaHG8evURfvwzbVOre++DTdqYwQIl6lcgw5Sszx0z2EjRV2M1hOQDggckLN8mqXgok
	vLxt99gP4r1Knsi7g9jbMVsqrIhoW34B+DvMt3i4pjr7tzzF+A1q6JplUt5+t9UvLMyPUWB/hLq
	QT3xvGdhskesgmWY1qmIcwJKnIyWJGmaISqA33QI7NTTc6lSPWPOGivMNK946v/qmC
X-Received: by 2002:a5d:5f8c:0:b0:45e:f29d:d42d with SMTP id ffacd0b85a97d-4602181eea2mr6197828f8f.25.1780506744671;
        Wed, 03 Jun 2026 10:12:24 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm8997419f8f.9.2026.06.03.10.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 10:12:24 -0700 (PDT)
Message-ID: <b087dc20-7398-4ad3-9787-efef883d81b1@blackwall.org>
Date: Wed, 3 Jun 2026 20:12:22 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next V3 0/2] devlink: add generic device max_sfs
 parameter
Content-Language: en-US, bg
To: Tariq Toukan <tariqt@nvidia.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>
Cc: Jiri Pirko <jiri@resnulli.us>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Mark Bloch <mbloch@nvidia.com>, Vlad Dumitrescu <vdumitrescu@nvidia.com>,
 Daniel Zahka <daniel.zahka@gmail.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Arthur Kiyanovski <akiyano@amazon.com>, Petr Machata <petrm@nvidia.com>,
 Ratheesh Kannoth <rkannoth@marvell.com>, David Ahern <dsahern@kernel.org>,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 Gal Pressman <gal@nvidia.com>, Amery Hung <ameryhung@gmail.com>
References: <20260603102646.404797-1-tariqt@nvidia.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260603102646.404797-1-tariqt@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2026 13:26, Tariq Toukan wrote:
> Hi,
> 
> This series by Nikolay introduces a new generic devlink device
> parameter, max_sfs, to control the number of light-weight NIC
> subfunctions (SFs) that can be created on a device.
> 
> The first patch adds the generic devlink parameter and infrastructure
> support.
> The second patch implements support for the parameter in the mlx5
> driver.
> 
> With this addition, users can enable or disable SF creation directly via
> devlink, without relying on external vendor-specific tools.
> 
> Regards,
> Tariq
> 
>
Need to rebase due to commit d603517771d8 ("devlink: pass param values by 
pointer"). Sorry for the noise.


