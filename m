Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651B538E5D5
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 22:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773095055; cv=none; b=hAeDCt9H1fde62WSUwEkud2A6twB+IRvAcmDg/ontQvHrp1sSm4PqkJWWk6kQuiPSzTXddWMy9QBAzhBYfChz3mDgLY88t8pG+32qfumTig24NiVq765iUI2n2TmL11jg00L6oXI9qklQ5cJ1HX6WODYjqHLg0fMfKN5h+IXWFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773095055; c=relaxed/simple;
	bh=p74FA63573R7vSgP0Ymlo382GmnT2c2KE5hGfqtfC/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpDe5gnniDibj/QKZ3Wzeoy3j2Pw+/Mj8pm5Pg7M/rKwGYchmOlpfcN38rVkz7a0sJebdYY2396CklAiabw76xO7xrmcH/mW5HoyP8ZCzDvGX8b/ZMfMt4pJXNHUjm8r7gQBbjzdXUXHpgpngwkMsMvJU6ERpF2Ir5arNPId61c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FWQ/dZZp; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FWQ/dZZp"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d749f99691so829886a34.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 15:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773095051; x=1773699851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHnLn6sNqEV/ng1JAOx90FzzxM70L3M7Mka9F9TdMQ4=;
        b=FWQ/dZZpZ8MAhDSERJVLDYZr9GXgNv9ZhTnkIjdqAo2D2KqEojLnCVyWLzJahB2YJ1
         rOe6eckQkDVxozsaN3gSKctLYrFOiodHeblIKTTB8nGpEMWfXUmh4wIYtQGo38PulTIt
         3nfWppAgg4UX5On29+w3COYySDlEdLfo2SbUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773095051; x=1773699851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHnLn6sNqEV/ng1JAOx90FzzxM70L3M7Mka9F9TdMQ4=;
        b=YWa5OVlaF1W+hMGJK1PL8lX+FIDtccFXnHx3/jM97sLIzhxA+nTOwW8ezWH199Q+hd
         NidoixDAVqA6fUNVQIeTy/2i1C4iGeU0GYt+riYmSGe7NGcto0O9wTYB1gXYfopj8YUt
         agWF+0pvOreo+3gOauhVuzLpLhyUpB8bQn9k/hmERf/0O5Sw2GkWYHP+IE3H8sb1w48K
         YTxYB8H4+hroqhoSB1ufB//B+mk+Bp7F5lI2Vfl8Whpl9ssHCm8qWbTJA9SsVZTzsSgD
         Y+VktJ77/EkhMEUxwJBy+nJtJit/rs56Bg9yBsqff3GqiAslqWhI9J1q3lC7lArmHP1c
         D3Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVgtZ5Z3iDhZzQ0wZJaDYQob8GkL4epthsbYlNFPZWFhVw6RItb3B2jmq5BrotIIKJxhsfZxeS7OTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXuxhT6ebMHY2WT3ZjAxPA0DNeBZR8tN5dsK5nZoZShI4W5/Z3
	NTsHfEB18selufpSRWZJ1eJufcAGT8cFoxMubDfsjFWUmI4CLlmt1/N0tAMKlmvGGws=
X-Gm-Gg: ATEYQzw8HsiaKIb5Ba8uSKLl0ASDWsqZgm5R4mFj5HTLRD9d151/qj2c7ttN5QQ7b8U
	bj7BRGmTauLyhqfsLnjQVwSjYjhXb+mDPKap6f6/G1QLlAGzhPodgAKTUbrlv/j2na9bW5QjUos
	e8fE8W+Z4Q2dY8+rDUjHmhYXlJng33NFb0Su5EiQsNAmwjj6z2SRdez/3Kt7eULLY6bw4weMTvn
	edDFTM/9yLn7nnqss+jtKGplfi3xoV/BwlEGe3ZVMBpBWhxXEuXXhQi5L+LgwZVQlaMzJtxEbIr
	3r+iNCX7pFrTDcsFKuMVRRXIehskOEG+MVvZqCvO5tJ8vIHQmQeYJAImfzhUvJj8kgQBfQ4BQjK
	Vf65NdTDmIj9YhEXQwnK5XvbsSIR58yQWAtdz96UljA1py1v9k/YE8mf+cOXebjW3ODYPCZ1RKp
	t4kJbUPMBdI/1RK27HeIt4nSkNVrrvlhfG+/Y=
X-Received: by 2002:a05:6820:151f:b0:677:d91c:2e26 with SMTP id 006d021491bc7-67b9bd3a2camr8004764eaf.51.1773095051333;
        Mon, 09 Mar 2026 15:24:11 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67ba42709e9sm5372733eaf.0.2026.03.09.15.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 15:24:10 -0700 (PDT)
Message-ID: <03136b99-1bcc-44a9-bfc8-bb4ee96c5414@linuxfoundation.org>
Date: Mon, 9 Mar 2026 16:24:08 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, arnaud.pouliquen@foss.st.com
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260309205532.1794202-1-shenwei.wang@nxp.com>
 <20260309205532.1794202-2-shenwei.wang@nxp.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260309205532.1794202-2-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/9/26 14:55, Shenwei Wang wrote:
> Describes the gpio rpmsg transport protocol over the rpmsg bus between
> the remote system and Linux.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>   Documentation/driver-api/gpio/gpio-rpmsg.rst | 266 +++++++++++++++++++
>   Documentation/driver-api/gpio/index.rst      |   1 +
>   2 files changed, 267 insertions(+)
>   create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
> 
> diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> new file mode 100644
> index 000000000000..0f0a3ce3806b
> --- /dev/null
> +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> @@ -0,0 +1,266 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +GPIO RPMSG Protocol

Let's expand RPMSG for the first time. Looks there is another
RPMSG acronym that is completely different.

The rest looks good to me.

thanks,
-- Shuah
