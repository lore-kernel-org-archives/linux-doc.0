Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2166416CD33;
	Mon, 29 Dec 2025 15:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767022420; cv=none; b=JORFUDDpytID9thUDwIMwvcjEpmSk9noy8YtRfWpwKAsAT5NVIZ6NlU3+cJIGp8UuXTbf6jGc0eFx+/rjd0hkBa8ZiVPCMv+Onkb5XeUtcjNqnh70a+V0dDYY8S7OnwmOdaSuKG2DEk6KW+o8FSKiMMQeH00UYSYD48ecTrl6rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767022420; c=relaxed/simple;
	bh=TYupEXcimJaXNRQjFl8MBGvqGBevJ8G87LZI24w3KJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bNFsR9WVXlwugc9TFLWrVle2RxFHy3klbsC1KVc1VhgYBgkJMJAFXrgUwxf1tdibOgwPDVAtkgbBHqbOjXFQ27SWvzkHvskWwEZ9/GMWWpMfRfWFbBuSSw8sMm3uOBwiXbVo/+d51FByoBgaREyyJSy6ThSO1KYvB9rKYhMf7Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DpSN5srU; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DpSN5srU"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3D8B04E41E53;
	Mon, 29 Dec 2025 15:33:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10E5860725;
	Mon, 29 Dec 2025 15:33:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADBBC113B066A;
	Mon, 29 Dec 2025 16:33:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767022414; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=IDdhD5FiKGQVnfA+qu2cR5kivif94jwoKyJPaFjtOIk=;
	b=DpSN5srUGDhJY2vWsbKpOcR853HjKBBoXojKTvJdWquQxxmNq0sLMeGLVCdyOhuTPlJIp1
	iiwAtd2yct88YMJsd4H8Utx74JC8giC8hhF7QfKT5/rrbEFOrdinKnbuUN7QDaryaBrPtn
	WlFyaggxO8ZwzDajUuIj1cAnvFhpjDsoNnGAqh0c/svE1mk/6vXDvh83NDfiumuubX2lJT
	zhMv7N5xJp7pv7o5NORCgQa7ppJcOE6mzMnparxqGGlPEUCQWuDfmQa6ftjMfYUym93HDN
	mf58KqssbikXTA7jxegmTWoQhK/UWAhGftvJu+Kw1NGnd3HkvBdPKhxH0WiQJQ==
Message-ID: <8bed1d97-be75-4918-b033-698d3a49e61b@bootlin.com>
Date: Mon, 29 Dec 2025 16:33:47 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
 <aUyMiJvJX1KhffVb@archie.me>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <aUyMiJvJX1KhffVb@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 12/25/25 01:59, Bagas Sanjaya wrote:
> On Mon, Dec 22, 2025 at 11:11:20AM +0100, Louis Chauvet wrote:
>> +What:		/sys/kernel/config/vkms/<device>/planes/<plane>/supported_formats
>> +Date:		Nov 2025
>> +Contact:	dri-devel@lists.freedesktop.org
>> +Description:
>> +        List of supported formats for this plane. To add a new
>> +        item, write its fourcc code prefixed with '+'. To remove,
>> +        use '-' prefix. Use '+*' to add all formats, '-*' to
>> +        remove all.
>> +
> 
> Sphinx reports htmldocs warning:
> 
> Documentation/ABI/testing/configfs-vkms:199: WARNING: Inline emphasis start-string without end-string. [docutils]
> 
> I have to escape the wildcard:
> 
> ---- >8 ----
> diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
> index a7fce35fcf91d1..3839b6e3c9c935 100644
> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -202,7 +202,7 @@ Contact:	dri-devel@lists.freedesktop.org
>   Description:
>           List of supported formats for this plane. To add a new
>           item, write its fourcc code prefixed with '+'. To remove,
> -        use '-' prefix. Use '+*' to add all formats, '-*' to
> +        use '-' prefix. Use '+*' to add all formats, '-\*' to

Hi, thanks for the fix!

I only have to escape the second wildcard? Not the `+*`?

>           remove all.
>   
>   What:		/sys/kernel/config/vkms/<device>/planes/<plane>/zpos_enabled
> 
> Thanks.
> 

