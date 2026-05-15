Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAB13B5F59;
	Fri, 15 May 2026 14:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778856301; cv=none; b=pBkDr6TLfwFQZQ4x9TaUsdJUPdGILz5Hu1LLPazBTxvhjcZzchSG392sb12WyFmkm6kpGtczpTUOaJpXGkxrh2AwZI05IpvFOuqdcHigerUYJlfjyaHOYyoCVSPALEG4I0ACpRnXB8jHK1rscR+AvhxYqR4avQtcxY/PBBWNY64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778856301; c=relaxed/simple;
	bh=FXsV0hKANa41CWOUZra6TxD6kV8gSzj5zY4Vsy/aYYI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TRwpUOzqdHfv1qfbWApZd6EHc/0EAeSMZBNdOcDyp7n627obW2hFHSL+hZTSnzcDn8qjwvo9KQ+IUOq166EZ/7Yccs0eDoqdeivKGZrCH/zYI44mxMpyDsZhS94OJl/9YUZbbnJycFuvP2dn5ZOfw+P7GwNXzCJlfchWmdHKvMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ZFj8EEe2; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ZFj8EEe2"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B7D4B410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778856298; bh=Xv69UPFCYWawf5NXIfN0oK2PS/0QmJx70Y4JvKXEhtE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZFj8EEe2IRJ7IUu9QCzbhWBJb0UGVdTYjORTs7i8eqqNMxvs8vZX3cuNNWG4r45R7
	 vxocNRo7R3vIsASQsw4sWh4WImkGgz/5rHw2fPAcCMxtTnKeNfXun+zn14ncFwwcJV
	 XQN3Nc3ggl0FTcBTFYVgZ/ZN99IWzqEYX12d1N8vr8Q+vI5XoxR85+YrPo3Aey+AJV
	 +nBcu7tfzzGDz+T9kgyc+1FhNUHEqfIrsCdK3NDe69DTXZZ/+YHFevYwemYyQjH9DS
	 g8eCKPtMlBDjjoZ4WERVlytsF4CajA2ZF+lC84Heur/tAPn45ndMkTTjoy0PFx7R2M
	 4bRHjmqJLku7Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B7D4B410B5;
	Fri, 15 May 2026 14:44:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Chao Gao <chao.gao@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Chao Gao <chao.gao@intel.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] Documentation: core-api/cpu_hotplug: Remove stale
 cpu0_hotplug docs
In-Reply-To: <20260507134732.254617-1-chao.gao@intel.com>
References: <20260507134732.254617-1-chao.gao@intel.com>
Date: Fri, 15 May 2026 08:44:57 -0600
Message-ID: <87jyt4pw9i.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Chao Gao <chao.gao@intel.com> writes:

> Commit e59e74dc48a3 ("x86/topology: Remove CPU0 hotplug option")
> removed the 'cpu0_hotplug' option, but its documentation remained in
> cpu_hotplug.rst. Remove the stale entry.
>
> Reported-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> ---
>  Documentation/core-api/cpu_hotplug.rst | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
> index 9b4afca9fd09..6de26d1c6a9a 100644
> --- a/Documentation/core-api/cpu_hotplug.rst
> +++ b/Documentation/core-api/cpu_hotplug.rst
> @@ -45,11 +45,6 @@ Command Line Switches
>  
>    This option is limited to the X86 and S390 architecture.
>  
> -``cpu0_hotplug``
> -  Allow to shutdown CPU0.
> -
> -  This option is limited to the X86 architecture.
> -

Applied, thanks.

jon
