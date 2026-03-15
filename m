Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF23175A72;
	Sun, 15 Mar 2026 16:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773593356; cv=none; b=jmHLGZ7iCKEKDeY1i6Og2j36EkcM4ECRoddkGaPZhgnC8EJSRHOn2/5u9ZfFodLQRyRYAPqYz9eE0AK5MFzV2JWUdXGMGhL0fkDTytpgLMCretiZLJWRpHbeAZVfxRNsZiRI0Nc6t9p0Ue1qt5Npw48qXaQZzmx/9C7swhVgWj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773593356; c=relaxed/simple;
	bh=cE6R0ylIp0M4VYZZZF7HOAU4FCuCwRcNYhjscn7WuY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T1kAJWWbOmyq5+i6UM8qiRxnq6esvfLfTjHhCcwORu8wqjy3wzsPTK2MGALEZMRvhrtvBtINRTkuAYiuXo+dZoVoEYUQfO1h5CUeqm/OG4fFKwIXxk4Ds5HchfmuhZNmqrSQIlJh2o0YHNCNUXXjuzW0+NFd7I62ufJh7huHteE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oZr7r+Yv; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oZr7r+Yv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=JgRvWov2LKq7Qpw1YUtlS9eugRrilOqhJ7DnD789E2k=; b=oZr7r+YvHJr/0KBVPkllUd7wNn
	GvwuqY6hgtFo3p285iF+UEPskITv0Wujx5BuJEPj5syZmei88FNOkOkHg2u2nErFdYRSkR22TxoJy
	co7KVVY/31JU3YHmY09Ij0xTdUBoc1eJZfgj284dwKlKjvtvNe6BqJGmR87/HX0g8jczJ1gZQPyJ/
	d40mXI0fbqMQwtHA1PQUeOJioLn490GYvt+FIsQBETSZc4lgDMrLReBks1djkjytTf3fJW2BUkrzz
	IjUb/tSbJkLcKF6SxYlOAs/4Ot0K6fOc96nDiaFA+vibpGbSeMZAYx7TIGOfWVc5BxS9euU3DPl2X
	YZ0SCNnQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1oeH-00000002jwb-0wAy;
	Sun, 15 Mar 2026 16:49:05 +0000
Message-ID: <46e39edd-2f37-41d3-afd2-598b7d3d323e@infradead.org>
Date: Sun, 15 Mar 2026 09:49:02 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] docs: kernel-doc: fix stale intel_audio.c path in
 examples
To: Kit Dallege <xaum.io@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Claude <noreply@anthropic.com>
References: <20260315154124.49834-1-xaum.io@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260315154124.49834-1-xaum.io@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/15/26 8:41 AM, Kit Dallege wrote:
> intel_audio.c was moved from drivers/gpu/drm/i915/ to
> drivers/gpu/drm/i915/display/. Update the example paths in the
> kernel-doc guide and its Chinese and Italian translations.
> 
> Assisted-by: Claude <noreply@anthropic.com>

All 3 patches in this series use an incorrect Assisted-by: format.
Documentation/process/coding-assistants.rst says:

  Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]

Where:

* ``AGENT_NAME`` is the name of the AI tool or framework
* ``MODEL_VERSION`` is the specific model version used
* ``[TOOL1] [TOOL2]`` are optional specialized analysis tools used
  (e.g., coccinelle, sparse, smatch, clang-tidy)


> Signed-off-by: Kit Dallege <xaum.io@gmail.com>
> ---
>  Documentation/doc-guide/kernel-doc.rst                    | 4 ++--
>  Documentation/translations/it_IT/doc-guide/kernel-doc.rst | 4 ++--
>  Documentation/translations/zh_CN/doc-guide/kernel-doc.rst | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)


-- 
~Randy

