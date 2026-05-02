Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A6934DCF3
	for <linux-doc@vger.kernel.org>; Sat,  2 May 2026 14:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777733344; cv=none; b=hBLsM1dh/0gaf/UTUGk2uEiPBU3fL8nCOTAxogF8oa4A7YVpNEFN2VidshYh8/rcAuA7JLjeCLSXUHk/m3NHDO1VxxZ1pOHA4AFDBCZr0VC1mC8SUSLalBFiooPUAAqY8d+CTf0d1Jx3aSssKy1o9C/bdpLngm6nRJJhrL4i7jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777733344; c=relaxed/simple;
	bh=X3saAn0kDIMyWd4v82ev9rZZGpRdPnZJdGTSgCRrBGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IznCdl6xGOk9U4RA+kM1Al2mdUIBvznR/ewewZSXBEYS3+3wtjyPsP4Vhver+64IYIAnwPDxLne/kYCe5vYnVpkLH5xFFiyN1nQF5zcHrK+5kZBCMOOuTwnNrlX2VEflisnI0AJhhgBXCV/+CU/VvXDQG/CJJFDJ66x0rmcQFmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvyAdmyh; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvyAdmyh"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so330687eec.0
        for <linux-doc@vger.kernel.org>; Sat, 02 May 2026 07:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777733343; x=1778338143; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9M8hk3eAzRKPrESSHI4vYUT6nL1UcHum5wMkQVevMmc=;
        b=JvyAdmyh1QF871Lh8A5BUwhraL7rfF+T9uQUU9sYm3p4AnKQciJCUPhmynh58H+xef
         zPxMhTKAdJ9mux0SY20QPP7umhwjJCu0OjcDM/NTi8xCgej+/IvgVsRt3o4wBvX6RsBb
         hugx4gti1EKe58SdDwHHypOUw17M22bDH70TFo3MY3MAM3s6v9fHhzcpJe16GSvav+sz
         l9le0INrSRQWoo/AjlGsvj2JiUw6sop8Vu0EBt74UO1qbd78bcK6vra3hs3+s63Ve/h9
         /sdi/Phme5cke0wir/n5EpazeaTo1U/BFOTCGfg/C08q0OPA/t+Cle3Zs74vfVLxTHEX
         6srg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777733343; x=1778338143;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9M8hk3eAzRKPrESSHI4vYUT6nL1UcHum5wMkQVevMmc=;
        b=Dns8X6dxb9mIIpITOJd6HW9VLcfRBChRG5oj7bkPPL6wHyg0QI5c+CLLArwSSfIJwi
         tCBn0s78CQ1PGQNezuuqEaKunkk5jo64Z/8AkEfrVuS+e/8PO28oHxLc1+vVpb8mmecn
         ycPj9drzvmnfoUxTUFQBUMOsxMlouTHnhUUx+Tt73mWXcIMlJCVYnEJ0R/+OMZZt4+hM
         OONL9a8SooB5MhYViIQqbWtahytgQmgRMFgxSoYlYrO6EjYI6+hLrXGoPdm/vq7JHL5J
         nDTXEiK+lmxUkPlgA1dD9dCYbg8t8FnAhThAYbwWM8u0QpzigNFqtKxgGcE8KNOvzgT8
         4XYg==
X-Forwarded-Encrypted: i=1; AFNElJ91ZWxXGOsoFoJKXbdIBmO2RmlBdLQC0QgU77iXfWpzUMYZlm6+AoyR9M92+P8ypX/hvx6PYyZeutI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoPHHcA3hFFkssTFSlgRYjEsyszXTLCmXfZo75EZUlT2+bEvUP
	y82CTkKZGQUeBrC4JbNDRl0z50QmrH1NftxmQgTIdSEQhqPtWQjj7UHh
X-Gm-Gg: AeBDieug8f8Yy7mTlc86qQniRL5V+AXiRbxyYW8MHbEGIuz56yae4nY0pxRBEj2bhsk
	M7TvPO8QLA6OsZI2ixaMMonpOQD36x48bzVu/9GEiO7udKoJ7iwe0EqxQqovIhju03jLtZq0wLi
	KG413jkizyrIY/a2at29/FbDEIyZFq0vlCYWLg7nQjJ1GaA/iiDWZlO/+Br3YvJUQZdNYfeALRo
	V5j0sty4qiXVOQC8iQVdCiGOxB3FaHkiNgREKAS1Ssbo2Qpu4Cl6lvE/8fsdZeJ/GLr8iufT6h5
	Hfwex7dv/7Ii7k6VDrYNbYPkzVsKkTf2AfRXPGdZzzSEHyAtTHZ/Lbuu41q32o4OfouUSY4Bq6R
	x1PHqiOFhrJuY052nWLWMpZ/1Dnlg8cec/9CAVma41c0jWkAJD1uh7j1yJL3SHh2XDXjDW5Wizn
	XiLyyU0HENUn9m+YJE993Ozdp0B0K1gzlfM5Rbu3giJuSMTS5MMPb8L3KiEMvseF2mnxjp7Z2Ch
	DbI04ClOIk=
X-Received: by 2002:a05:7301:2926:b0:2ed:e15:c927 with SMTP id 5a478bee46e88-2efbb878917mr1540867eec.35.1777733342626;
        Sat, 02 May 2026 07:49:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3c05dc28sm8213767eec.30.2026.05.02.07.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 07:49:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <91cc8a45-cd9b-41bf-9946-06d66f511b9b@roeck-us.net>
Date: Sat, 2 May 2026 07:49:00 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: watchdog: Fix typo "oncse" -> "once"
To: Wang Zihan <3772548978@qq.com>, linux-watchdog@vger.kernel.org
Cc: wim@linux-watchdog.org, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tencent_61E8FB326F4582DB0074952B9FE4A239CE05@qq.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <tencent_61E8FB326F4582DB0074952B9FE4A239CE05@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/26 04:19, Wang Zihan wrote:
> Fix a typo in mlx-wdt.rst documentation.
> 
> Signed-off-by: Wang Zihan <3772548978@qq.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

