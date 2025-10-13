Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2493A30B51D
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 15:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367749; cv=none; b=g32pac5iVNvLmxgSAq2XpK5TKLd3/SJ34E9hEmSTQoT2kb0+z0Pvi1jfMneOvX9VublkUlveAt8FUNvMayMcxeraPT8UZUv0k1ZP5XBkKSDMvqaP/K+GaUWFcnzB9smvBDSoDey36v5Kr2/88AqRu4FtHHN6ohg96dXJY0oN5So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367749; c=relaxed/simple;
	bh=XZ4lzHryEJQS9jgidvbUbN7osxHnfwhUvb5lDvX5gJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sE9V3RmWDbBjbLohiJDaB1vOyW28huyciMgdiQjpw8Ui/8pwuZLk8itbFznAVvhhbH4KzLCTROFHH7qmNT2VBGNakFl8ijAtwo3pUMfrVTnvAf8V1j92XM0yYuLVgHpF2SbMuYiWWyNlV0q7ovhPi9R/2vkcipjqwInUxDttmxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Km/+C7xs; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Km/+C7xs"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3f0ae439bc3so2017057f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 08:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760367746; x=1760972546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yh3tjmmjbgFKGhBWocvc5VFMFhZLywRMRFtzLSkbw0s=;
        b=Km/+C7xsfZItqUK1cRI41oQudCJQXawtSlxm2Y90QzKe9b1CH9Lue/2I7UhiV9ElL/
         QbsSPdkyMDOFYhdArM/WwUk4HrRd78V3RT1IKtSrA3tojPLDyJJgw1uFNjhsOatstdjf
         awHA8HXlg+4SOEZ9oEI0WYufnhqiDxH7H1pDa2kElbVfVK/isv9w6THHMeFYOFdsTzrT
         4XPM6rT28Dtw7BCO5UlxgNQd6gurCk9yoS6p4GVG3DiwKS/kZXmT1g4FH0o84SKujCvj
         NNq3v1ken4Lh0yVIZ4HeRdWXMC3yki6pD6VwCI9gK9RKdT3vhvmYDl93+WFdT69sWhcP
         DVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760367746; x=1760972546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yh3tjmmjbgFKGhBWocvc5VFMFhZLywRMRFtzLSkbw0s=;
        b=pHnWdsnEN+2ym7janMTPHTJJqDcUfdIhlddWk+gLlcCxeU+Mn+8jgsubhu72CfETl5
         uhcr/PUjozEiOSEh3g9RF/BNSSAG/qvM1PVe7j3Cx3bg34uu7iwiYlrmywHl6GMXBrY8
         9yNdHOv0BwLua7HZd/aaYoDsqSM2xDjO8sDwIEDw6CDG2wnD1C10jsA0Z61dchs47zb3
         q7mGDf7nRPqrzK7KB+q2oyV6G6cCY+5/Ng7Vkk9aqaRPCLLMnE1gY47oAuF3spIFIf1W
         lcZhBBm4Q0MjT5Kz0E0qskrm4hlsRbmh01shOc/5nJZ/wcmrIpuBRSOUNYKls5sfsOgn
         cYkg==
X-Forwarded-Encrypted: i=1; AJvYcCVilOuWBPBXcWUj5WZLWNaLcP6xtFReWgC8l0T8ANF8tUP1BSVzLHZHjnhGu1sH9YVEE1xFzdXDR/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrEwUW9XNCsDvqumUvZRfYWUsUIMQ8j57zCQKSQH7cZeCehNm8
	fr7PS9KWNW8wTmCfE5RgKndhtAUTcJrJTucTncvZJlXUkwb4oj83XZ0q
X-Gm-Gg: ASbGncsQul1bU0wNM87O0r1FTljDPGi58MwFuYUdhItQRFWhpXZyUP81MutsPxd3dpx
	VNyXB1o4NSr3+MYt/HtCNRkYoTggqtdzF2lo7rSANM6LwR5IKmb+v2lOzuSEANyOHaMXeTq0G+D
	Va4mpV50PeIUf0A9Ya5CLemHImnYQIDMyiDYEq7/YZm9riyK15xH3+4QJ0SoGvSP0YwOm7opCzS
	EzU/QxyXN6kgn7rnZN7ey/1V90MH18V/5Q9SOQ23pqkA7Le2WgUR7aYq6EqwBaeCAWwYthLkFKQ
	4Ai3X7icLFVdcwrnGzwlVqV58vWpCFVmBEqqLdVWtWfE8yglEHXDp+Dl662neDDfn+Sa5ulggKN
	nK41HN2CiGpA8xB4ZVhI+thsuTN+QxKco7IaGEX9IDCnlSY7bHB4jPHHHXR6gZZ50rlIzFNJe1M
	XCRZ6ahZxh
X-Google-Smtp-Source: AGHT+IGNkJ4QbgL7tRzgvPN+I8L7UO5FdEYBSf53xVmGqianIIUKzVvqoD7JkSPO2wQpbIF5bLMK1Q==
X-Received: by 2002:a05:6000:491e:b0:426:d549:5861 with SMTP id ffacd0b85a97d-426d5495947mr6222761f8f.42.1760367745998;
        Mon, 13 Oct 2025 08:02:25 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:eb09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce583664sm18651180f8f.22.2025.10.13.08.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:02:24 -0700 (PDT)
Message-ID: <f0e40a00-ab13-42dc-b9ca-010fd4b115b8@gmail.com>
Date: Mon, 13 Oct 2025 16:03:40 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 00/24][pull request] Queue configs and large
 buffer providers
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>,
 Michael Chan <michael.chan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Joshua Washington
 <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>,
 Jian Shen <shenjian15@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
 Jijie Shao <shaojijie@huawei.com>, Sunil Goutham <sgoutham@marvell.com>,
 Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep
 <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Alexander Duyck <alexanderduyck@fb.com>,
 kernel-team@meta.com, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Joe Damato <joe@dama.to>, David Wei <dw@davidwei.uk>,
 Willem de Bruijn <willemb@google.com>, Mina Almasry
 <almasrymina@google.com>, Breno Leitao <leitao@debian.org>,
 Dragos Tatulea <dtatulea@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, io-uring <io-uring@vger.kernel.org>
References: <cover.1760364551.git.asml.silence@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <cover.1760364551.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/25 15:54, Pavel Begunkov wrote:

Forgot to CC io_uring

> Add support for per-queue rx buffer length configuration based on [2]
> and basic infrastructure for using it in memory providers like
> io_uring/zcrx. Note, it only includes net/ patches and leaves out
> zcrx to be merged separately. Large rx buffers can be beneficial with
> hw-gro enabled cards that can coalesce traffic, which reduces the
> number of frags traversing the network stack and resuling in larger
> contiguous chunks of data given to the userspace.

Same note as the last time, not great that it's over the 15 patches,
but I don't see a good way to shrink it considering that the original
series [2] is 22 patches long, and I'll somehow need to pull it it
into the io_uring tree after. Please let me know if there is a strong
feeling about that, and/or what would the preferred way be.

-- 
Pavel Begunkov

