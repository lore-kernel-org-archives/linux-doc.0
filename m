Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7676212FA5
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739441618; cv=none; b=HvuV1I1N/2hIFYFDzsf13/yumf0FyDvqCRxc5Pi7r8Pho8xuO8pwZ2+tIfZMq5tPwETjiSBQ1Atc0azL8TwB004K4TGeftyqJ3++COVEdZazx+NfxyXKVrbdP9tJ8QHEGDaIRoVSPFPwcyfuJlTtQxQ7yF2Rn4zlroT8sAeDYZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739441618; c=relaxed/simple;
	bh=OOkRWYRRFR6Zppbte+d+FFqoC+1Y9EFEFDdqlrrJuOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KY5W5ubAA5ls2uhJwAlh0Eimf4Zb+s4PxIUjQFYVujw+HNNvQ7okdqWF5SwBnesECbmtajLo3ZP/wRqB3/M4bk1fb9ZfR2rcjfG0mbN1Ybs/BxURPFPk3+GvjKBNz1QnIevldYf8cAloc0xjvzN91RR0m/ctou7S8tKLFsgKEyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R6QGk3km; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="R6QGk3km"
Message-ID: <632baf9c-773f-4bb0-b01f-cd689e0ed1e2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739441603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/IcxawvhyafEXR3b1yO2+HaP7Jg3pLfdgT6ck+3Ic4=;
	b=R6QGk3kmCG9WN2mH4/s4tDxXW/HKVq8O5JMjOgAU9HgAiw4vOqr28QSxS3uBCfqn0ATn6+
	P2LvE6Wyu/fHxxFMLEQTvEqVpNpnX6hV3TfT96sB9WZSk5haJXQRvwOfTMGRG1FeGisWJ5
	M2WSjdLOyNTTkq7K3VqvNNzD7a7wvF8=
Date: Thu, 13 Feb 2025 18:12:30 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] docs/zh_CN: add maintainer tree for Chinese doc
 pickup
To: alexs@kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250213054222.21776-1-alexs@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250213054222.21776-1-alexs@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2/13/25 1:42 PM, alexs@kernel.org 写道:
> From: Alex Shi <alexs@kernel.org>
>
>  From now on, the Chinese translation doc should be aimed here for base.
>
> Signed-off-by: Alex Shi <alexs@kernel.org>

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


> Cc: Yanteng Si <siyanteng@loongson.cn>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c27f3190737f..dbb7f982e9c3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5306,6 +5306,7 @@ F:	Documentation/dev-tools/checkpatch.rst
>   CHINESE DOCUMENTATION
>   M:	Alex Shi <alexs@kernel.org>
>   M:	Yanteng Si <siyanteng@loongson.cn>

I have left LOONGSON, which means I have permanently lost this email 
account. Could you please help me update it conveniently?

diff --git a/MAINTAINERS b/MAINTAINERS
index 92fc0eca7061..e00e0baead9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5411,7 +5411,7 @@ F: Documentation/dev-tools/checkpatch.rst

  CHINESE DOCUMENTATION
  M:     Alex Shi <alexs@kernel.org>
-M:     Yanteng Si <siyanteng@loongson.cn>
+M:     Yanteng Si <si.yanteng@linux.dev>
  S:     Maintained
  F:     Documentation/translations/zh_CN/


If it's not convenient for you, I'll submit a patch separately later. :)


Thanks,

Yanteng

> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>   S:	Maintained
>   F:	Documentation/translations/zh_CN/
>   
