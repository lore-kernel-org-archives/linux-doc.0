Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E2582899
	for <linux-doc@vger.kernel.org>; Thu, 27 Mar 2025 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743076655; cv=none; b=IoFcJyrF2C+2iuxtN91XDkbvi8/p6q6uuS3sWO/WzmVRcyvBIkoTs4K4A4tD1NeSMc6en5AB//KHRVxmPHlH6lle+tJz2GD65LEoY1Uf6ebBFK8xSvj/MQ9f08F5Lxby7v/1TIvMojt/3F77e72Co9Vbsfwovh7vH7cwzISdF4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743076655; c=relaxed/simple;
	bh=AL7gJ87a2UA6E+40BaZ+E4mdcf+6HZXsmDjrJ7tBF8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jA61VGeeWoQ+G2vwrxN1Pw4rOPI3ojtoZ/38ud5klWERVVlCLY0zmezAfXi6+cqp4gPOTWDRBY5QP8tg37KR3duh/oo4MATwlaQVpid1fqIgopbe6YZ76gDT+Ev9I7Rhcs1898IWmzLaDoCPop1RHO8gNyVdz2zVezBZh0+Epdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=KdUG0aH3; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="KdUG0aH3"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso12894436d6.0
        for <linux-doc@vger.kernel.org>; Thu, 27 Mar 2025 04:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1743076652; x=1743681452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xpSvo5VpDe+5C3l3q6WN5wiD27fFfcYVq0S4jyx0P6k=;
        b=KdUG0aH36qKf4ZKce21gUhCKT3ZUf2WNoOC0rZa2gRbutluZ0jCSFAmnnC+61A2sd0
         Njdrt1Nj2fXg43CLfCF44LW9ef95MhDEJWEEmBMehuOBXiRYdTiM30rWbtrMY/aWEGLd
         rYjBgTZlgpvZjm8HkNrGAcL/EbG9VgKscRinhah3bTwjaG8M50uvOVXNokIPSnt+2lkx
         mhlCuyeeTnoP/Xsk0vjebjmQA7seF6lSHIkFYpP3gnAknC14p/N9vvbD+gURC8OIj2bA
         LqbmNtn1g9Wn3vq/xXgwbUBfBwXSqyhktBciKekra4S/rYXgxaWVSGCpYbJtPZPWTipD
         /eJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743076652; x=1743681452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xpSvo5VpDe+5C3l3q6WN5wiD27fFfcYVq0S4jyx0P6k=;
        b=d96OVyVNegqJajTP2XqN9EsVnByAFoio98Fvfl6JMuNda8uu0abIPneruvd2HIcvU7
         qK++SOUMbbX73HTEVmRb4gA59roFEbw1LQoaRsuAoLnuB+jKGLgvi1Nr//35B3y3u0CY
         1d3gcu9XB0VzsDHimXep48uUypYmcFfzsj9Q/ur56lDS8WSnLOpvI/dERxwkm+80SS4F
         Ti3rrTMlCv5nWdaPXAMy12dmlBlUJje+CJpCs1H7DDXBj8jhZb1naTRCbLlmsCacNvgm
         c9u4DqcaRn4q4DFza/STiWE9o1n4tkovH7J+qfrd17VzKmuDqQ2zpKh+Lo7F9Bak9ZP2
         dt7A==
X-Gm-Message-State: AOJu0YyDTwSwmKjnQLbO9gR8ODcOipDnskQr6D9GLuxLaCNJPjeDNWSf
	mvroQf0x8beDUI1nfiWza5UVmwwvf0kSrzVLqzy1CNsgrlK1NKvL5exrpoymur0=
X-Gm-Gg: ASbGncsdPZK5HqiOevbkgBRdpxpsN2ayME5UZ0YvRUjzVfjf7w0j0Z0wpPyV+D3dqSW
	icYWsy6ux/PW7wEuVTRsJaoIKLjUgMv+70Sg4jjI2Q2RL0g4Hkgb8cQK9k2id8V/t7gkw8fikmE
	75ariQDC+EIlz5i+AqltPxTUZAZ/KODwCLJ+owkDRVMHuT2Ved1ufkovSd+lK04L1ibSBxINKyh
	qImHGn9hm8p5Sv5ZBHvO1+JJkDNS+JOLYAtyCqThA+IksYVPj38zouGr1K6ffUjYx+P9v3aUxH8
	jCzUNZdRX12amrnCyUFRYZPkdyYEWSffHQvYwqA=
X-Google-Smtp-Source: AGHT+IHXYc+blwEc+1Jk6K0qq58ubOvP6uoSjfLzJ99a9D1oWzuzwHQ5UPYlNMHK61Rbx4L/GoX0BA==
X-Received: by 2002:a05:6214:19e1:b0:6e8:90eb:e591 with SMTP id 6a1803df08f44-6ed238b72cdmr40938446d6.24.1743076652436;
        Thu, 27 Mar 2025 04:57:32 -0700 (PDT)
Received: from [172.20.6.96] ([99.209.85.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3f0003c6sm79108206d6.120.2025.03.27.04.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 04:57:31 -0700 (PDT)
Message-ID: <2853aff5-9056-4950-a796-d3e19a0f0c5d@kernel.dk>
Date: Thu, 27 Mar 2025 05:57:30 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtip32xx: Remove unnecessary PCI function calls
To: Philipp Stanner <phasta@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
 David Lechner <dlechner@baylibre.com>, Philipp Stanner
 <pstanner@redhat.com>, Damien Le Moal <dlemoal@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Yang Yingliang <yangyingliang@huawei.com>, Zijun Hu
 <quic_zijuhu@quicinc.com>, Hannes Reinecke <hare@suse.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Li Zetao <lizetao1@huawei.com>,
 Anuj Gupta <anuj20.g@samsung.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org
References: <20250327110707.20025-2-phasta@kernel.org>
 <20250327110707.20025-3-phasta@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250327110707.20025-3-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/27/25 5:07 AM, Philipp Stanner wrote:
> pcim_iounmap_regions() is deprecated. Moreover, it is not necessary to
> call it in the driver's remove() function or if probe() fails, since it
> does cleanup automatically on driver detach.
> 
> Remove all calls to pcim_iounmap_regions().

Acked-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

