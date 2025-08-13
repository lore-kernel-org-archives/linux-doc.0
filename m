Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5CC2114
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 00:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755045274; cv=none; b=BmKoaENBKiCszv79IzhG5ZMjyxQMOrJXHF0EjVt8+zmnMy+Yt8YzN9xAmsO9S3XXIvCfLI006pvakIMxQb1mqUW1PrWS2G6MyG0J2AcElKRKFS1PPz8lXPkRWdFxdaH/0veM1ZJ+IpKe/RUrIPwDH+3J2XKns+yHkwWh0obIMT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755045274; c=relaxed/simple;
	bh=vtp0RC1sRTsM+aidwfpW673og0T8imyaAXUup4h6biI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iiv8GGmL12W/pUw7Sar+ruvjyEnThbSeMJPFJ/SaLYNa/Mhy5HhDI/Sjrkjq6u1nTUEhC1Qc9NW0pulIo/SymYlRoQVHetPqhREPIKcxyMAxpP3Mapo/LhUwgsz5eBxtuaGPe/yE5tuwvIweT5timIxJHAULSX2c5eeNnmQ5yjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sqr5my9F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sqr5my9F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF329C4CEF0;
	Wed, 13 Aug 2025 00:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755045273;
	bh=vtp0RC1sRTsM+aidwfpW673og0T8imyaAXUup4h6biI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sqr5my9FYzLh5XZ06mU/2Enj+aYffEhc2/YEfFKM+1fCCLzkiJO7lB0zCNstiMx1E
	 plRUTjFtHPxEyfMNVkmLGjAmYQIrvRO5TeWig/ZMMmmSbFUW6iby1RukB292fU7dbY
	 XkWd8iKwLqhbtcTagyQt1jTm40+IXkOGcIhTQqZORpuJyOPgMsDYNpy7p/Ejc+sgaH
	 TQsJ2sgU8gEuUFoDmxpmM1ZkqUqbl2pocprfrvYfoNS8lZr+AEh0Jaj2zu/hK8Wx3b
	 w3NiIi6a0/xO6g8hB8YFyf0/d2O+K7OHxAZOh69/9FQr2T1Xl05AHz509kBrsBkDnq
	 tdM8NtHFv6coQ==
Message-ID: <25bd83bd-6b39-48cd-b31b-dd6f1df00f94@kernel.org>
Date: Wed, 13 Aug 2025 09:34:31 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] docs: zoned_loop: fixed spelling mistakes in
 documentation
To: Soham Metha <sohammetha01@gmail.com>, linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, hch@lst.de
References: <20250812202940.70560-1-sohammetha01@gmail.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20250812202940.70560-1-sohammetha01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/13/25 05:29, Soham Metha wrote:
> found/fixed the following typos
> 
> - conventioanl -> conventional
> - directoy -> directory
> 
> in `Documentation/admin-guide/blockdev/zoned_loop.rst`
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research
