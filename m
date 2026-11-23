Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446021;
	b=L9G2B4v9Ui+eHjc4BCedxs/JzOSxJBtWtJgxAcN0yrEEzaCQ0Uq3a1gZ7jISpSNZBUvb
	 RHZwwWzPhXW+OnkrXXG1r0VjxcC91/u9Hd3QzVK10XTneAtzRVmwJUffqfKqJcBsmjFLO
	 LLILJnia2CxUjSwEPGbkItralqEF0grSDEvTuGPOW8Vc8bURf/ZLJWzgr0LD2ne3sxvu7
	 TZTqqqNR4SATlcLG9saVk92w4lc4BeAXGmePw+xfpkwhidLPF5oOUsoGGfmKosl72bvxK
	 a9mOP+btTbfC75SN9PQv+UR4VPeaVdFrdVQpiMTKO892zUuQpKQliScZU8nt9M43/Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446021;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=byP1kMDVZHEXOHaPsdzqxrOuK3QLySv9pjAZMI2VCWQ=;
	b=YOqqfWtOCu3MJEE/vEZiEXBKXn9KgIPQJxoye80Wx4NJiESjTGFEeAVyMZWVBa0+olp9
	 mi92+TfenTsJcOy4k4shHzmetPJHXQP9dG6ppW4a60U/WlGe8TMXDmyxW5vhuGJNU4dYG
	 7y/0W8X/smoJscWTKeGI6k3uFOkVBLO88BKUX2PAdzHMYqJc4r+06PaQ1X49YXmVmEKLI
	 RYUAITOI0/bN84MNfnCA4X5zBFoRpZqfCDIohdyPfXFtQIVFAfG+A9oWtvaRkjaEXhpte
	 sg9LtE0OLTNTROJF6EEfSsBm9af9nIr6YPzcrT+cBkx8M004G+OqNc+/3tXHIOk6sXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Q9RoxlwF;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290A1606A32D;
	Mon, 23 Nov 2026 15:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 290A1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Q9RoxlwF
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ECF484E41631;
	Mon, 23 Nov 2026 15:00:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 952C0601E1;
	Mon, 23 Nov 2026 15:00:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D950811E68EB8;
	Mon, 23 Nov 2026 16:00:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795446015; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=byP1kMDVZHEXOHaPsdzqxrOuK3QLySv9pjAZMI2VCWQ=;
	b=Q9RoxlwFV/d7u3pieMNnWNcAZHglsNUae4Eh1WJnS0nCUIFvoSZB3cmzBOOr0ZH99awg+T
	islPHguKhHYqVdkKu4dooqt+kDfirixH6wFTZ3FY73v0hvN1c7zO2JeQqVX5SWMP8JsUYg
	g0lGE5MYSQZMJhLLZsUa36jmO7AnlgjUjQuHDGAalDYCnqga6HG0PdAbMKsL/9vuaWV21R
	5pc6tph3UobKuaiAjjI2ENhlOri/5EQU3qdyFgcoyGWnmqnfstRRXwRK838byy5hmadLQz
	fdIB10/niK5sJ8IcgVAKvTt4o65XAJUmJD8yjAb/PShd/XHlOg0S68ltfAFrqA==
Message-ID: <18c7d8af-1156-4bee-be0d-f78334d1908d@bootlin.com>
Date: Mon, 23 Nov 2026 16:00:04 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/43] drm/vkms: Introduce config for plane name
To: Oarora Etimis <oaroraetimis@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>, Harry Wentland <harry.wentland@amd.com>,
 Lucas De Marchi <demarchi@kernel.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com,
 victoria@system76.com, thomas.petazzoni@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>,
 llvm@lists.linux.dev
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
 <20261120-vkms-all-config-v6-18-78ace90f4fc1@bootlin.com>
 <awRQxKxzVyw10pFr@ArchOarora>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <awRQxKxzVyw10pFr@ArchOarora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/23/26 15:56, Oarora Etimis wrote:
>> @@ -265,7 +266,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>>   					   &vkms_plane_funcs,
>>   					   vkms_formats, ARRAY_SIZE(vkms_formats),
>>   					   NULL, vkms_config_plane_get_type(plane_cfg),
>> -					   NULL);
>> +					   "%s", vkms_config_plane_get_name(plane_cfg));
>>   	if (IS_ERR(plane))
>>   		return plane;
>>
> 
> Small one: with no name configured,every plane ends up as "null",so they all look the same in the debugfs listing. Before this patch, the core named: "plane-d", which was pretty handy.
> 
> Could we keep that fallback when the name is missing, as it can improve readability? :)
> 

Make sense, I will do it for the next iteration:

if (get_name())
	init(... %s, get_name())
else
	init(..., NULL)

Can I keep your R-by with this change?

> 
> Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
> 
> Thanks,
> Oarora Etimis

