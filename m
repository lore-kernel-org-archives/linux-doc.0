Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F253D30FC1E
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 18:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005500; cv=none; b=NrkJKTUiBuhoo43ns4JIYZlBnnHETRaovmvOn/GgOxDE4Ojykd/RuBJZZjqBw0jCgqAzoHbX7SdU0IwyCoVc+Ui76BHhb862KQ8fQ3x6LS3MCSVQvMPptsvrEnAum8lnBgQEWVrHOFTWppc5/kBhWuxPR3bMXDGZUZfJ2107Q7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005500; c=relaxed/simple;
	bh=8BLWvL3pQJD7WvtrZjA08CCrXVJhJAisOKhnvofZksM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M46Uf80TC2w0w+ic/ZvRFF42MjBZS2NK/cKj9ibGRRf/800p9+iv6BBsPC3Ny5PxTVTJ46fqSpF5JgJvNpP8b6BJa+moyTbgPRANsOhJnazcuo7dlwFlWCybIQiflHohZzlPYB/eKAJiGZFYMa2lC9xlGeGwINuuRQEvIdr0pd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g6JBE3Up; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g6JBE3Up"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dca00c1591so1771911a34.3
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 11:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778005497; x=1778610297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AiWl0VvmCcmAvKE7k/xTFIVAHM3vfW7H3kIFu8jks8Y=;
        b=g6JBE3UpZb9/ztrnI/tMixvPdvmxQg9ODUI9lJN2QGIRl73iF8KDw3Y31gOKKIZ0NZ
         u3y1uAQ2Hl5w53inVa8ueUuxfXL8CQeILz7mY53DNsNVgcjaef/21J1g+2BIulY0Qyb5
         XQ8KCGwqqSYdTPuMQSh0+gFMtE3DJm1MzPrk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005497; x=1778610297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AiWl0VvmCcmAvKE7k/xTFIVAHM3vfW7H3kIFu8jks8Y=;
        b=I6Q7jdIj5H/l4j+EBHMwdtMXTbm2yUp8jU/u0jqQ87lul53uP8x0BIKFRGS2T60pyQ
         VqfVFrShHUe693u8SY+OxXFxizgdWck4B7flDxhKgB5oRtAcb0p4v3DeRnjBbxQzc3Kg
         VG0zrI11+9KyrZ0crAGmL9/NZbpIqGYZ7Rnf+saMjNJQJ57yw+dols9EeZPTYlj4iv0A
         16KCQTGcTGAdMaprMHEsSffMncmoafXV2CKW7Q92J07sQNTVOiujOkwxrAaK8FJvjpI6
         D2VvhbsfTFkZU9fG3jx9d6iJ9o2M/eSSYm/igl/SPQVZA8sv4W7OG6KblF9iC7HsbtDO
         XyMA==
X-Forwarded-Encrypted: i=1; AFNElJ/HStk+OwKhuPYqERBHqa7RXu2fkJhLiJUato62Jm+bXx0JrDTBMQnLNaDYYI+kANich/g1WAPIOCU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9UiumOZja2+8vcoIsNkBpBKGCsB9Ev8Z1vymLkmfhKw83ziaC
	lOXFdoX3Izq11+ev/m05FZnK7mAI/CKnNIOs4f2ZvEN0AduFVdFxvDpk+yWVGnMUI3v0kEwf5WO
	RzGyc
X-Gm-Gg: AeBDiesXIEbkCUvyNc59z7zl2Lw2F9s7c9d0FOwmAZ3F5W1biEiJZp+EjTFFoigu+Nw
	aIznCmfN5kS8JLazaUFDIC5buOFyibMj8L7wK4rOd/C2eUzwPDiuYxU0UUHb6yk/3ipPnU4pq1m
	JriTIkFYIhXNzpEuLWolXvRTTJifP23dDbLVpXR5pyapxl14IUHAS8uLJwLFhmtQ6Bo4O0oa6yT
	tOP1OfU6YxfJaU+AiVyqJdFa4NvyN2Qtk9IjkGtscAMNWMBYLE688odgbmkwi0U5wDAi47rxfSJ
	/lQBoJNMuZ2PFr6UM2u0fiUNGi9c1paFMNQRySSN2Ovv0JIt7IprZWrvvhRSz3xmTMx3NHHIR32
	p5vJz4cRD61KkFGZ1zfGWZFURuWUXV/pntIoDOU51J0hEDNyjvsHcVH35i0uV6ALe9BzR/8u+08
	Of0VpON+TCZrf+K84MRH1qLEQ7BWkgsLfGjqbJmlh0Jw==
X-Received: by 2002:a05:6820:f011:b0:695:818c:e552 with SMTP id 006d021491bc7-6998da4cbc7mr2424572eaf.55.1778005496865;
        Tue, 05 May 2026 11:24:56 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69689708304sm8096324eaf.12.2026.05.05.11.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:24:56 -0700 (PDT)
Message-ID: <936f9719-9e24-47f3-9c68-080040a5d0e0@linuxfoundation.org>
Date: Tue, 5 May 2026 12:24:55 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] docs: admin-guide: add IGNORE_DIRS example for cscope
To: Cheng-Han Wu <hank20010209@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260503101429.254394-1-hank20010209@gmail.com>
 <20260503101429.254394-5-hank20010209@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260503101429.254394-5-hank20010209@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/3/26 04:14, Cheng-Han Wu wrote:
> The workload tracing guide shows how to build a cscope database by
> running cscope command directly. The kernel build system also provides
> a cscope target, which supports IGNORE_DIRS for excluding directories
> from the generated database.
> 
> Mention make cscope and show how to exclude Documentation/ as an example.
> 
> Signed-off-by: Cheng-Han Wu <hank20010209@gmail.com>
> ---
>   Documentation/admin-guide/workload-tracing.rst | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/admin-guide/workload-tracing.rst b/Documentation/admin-guide/workload-tracing.rst
> index c49c2a00a8b8..314e5f03474e 100644
> --- a/Documentation/admin-guide/workload-tracing.rst
> +++ b/Documentation/admin-guide/workload-tracing.rst
> @@ -202,6 +202,15 @@ database. To get out of this mode press ctrl+d. -p option is used to
>   specify the number of file path components to display. -p10 is optimal
>   for browsing kernel sources.
>   
> +Alternatively, the kernel build system can generate the cscope database::
> +
> +  make cscope
> +
> +To exclude directories from the generated database, pass IGNORE_DIRS to
> +the cscope target. For example, to exclude Documentation/, run::
> +
> +  make IGNORE_DIRS="Documentation" cscope
> +
>   What is perf and how do we use it?
>   ==================================
>   

Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

