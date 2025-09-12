Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27306314A94
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 18:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757702161; cv=none; b=qza0A9V4oTmR5ej8lAzYtZ8A6MpT46a/xjkvhLhDKCuPGLFQ5SvKxd7aQq3yl5jnz5GfkW5RPbQs6TvuwOGGTXMtVYj9sqKzwuMG5Pks+pmNabw7E43WAM0xdlgZdkWo6kzc5MTqr3b7XF62ksYriZ5eBcjqSUwEOgGhZ5Q1Rc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757702161; c=relaxed/simple;
	bh=y4gWWqmz84oG206JRwdNKi7A9nqe8+bM/0jPZWiNXtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mLk+KzscSyDmR8HY1x4FxRaC7mYbOZ4zEixrYw2MOlrh3w8uMPF+Md3KVXATCPK81r3rxh33KZfIydWSS/e3zefPntJnky1XJf22PiFpx7BXCS82ACnKTz+jl4CNH2s+vkmd4c9AcupS/Vt32hpLQFD/l8kSw1OHPEoOymwdd9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TeOxtFpt; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TeOxtFpt"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3d19699240dso1893312f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 11:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757702157; x=1758306957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RTwLCqYrxP4A65CpeLdDZfX/1/5VrrEeFcGj8O2B7PY=;
        b=TeOxtFptWOd1RU9pHqHLwx2CyO2LBGwUxnU+jShsmNmONkCQB/x2UZkLqoIKZlziZh
         /oumduplmrNAWzJ85JCY9ON3Y7PVG2dcE+tOcK/wbSo5wqspnWaObSgEvOkcazk25P41
         OH8Po3w0R0ixOXE6nP+fhUDpHYaiHKcihJRB9k5xqGdZpYxnL3Ty1Nslx+KcvABgzd+z
         VZMG6kYSdLmivO6XWXfZDD8VQSwJ5JNLBu+JdnKZFfJ9a501LJFKaEWknwKUS/ygzUOy
         6U82LPqwAZ2zRvO95NRQzOrUUeBj7DVRvPXm+kjR76ZYzfFfMnc2JoP7wPDtcoBA4eQs
         SJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757702157; x=1758306957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RTwLCqYrxP4A65CpeLdDZfX/1/5VrrEeFcGj8O2B7PY=;
        b=JfgLeB2+uA5s/Ffkzlg6klquEP+kwk6ajyLqyA2T3sYorn0t794AVr4bicQcWXib/4
         gOBIG0RSlhumyO47RA6tek1BYVS1ohB05g/9TlNzQB3s7EKbGy/RPZYFNA+ANn4ZabSK
         GiS5EfVJyacRa04Gywdo3+IqaXIXo85nHL5rdpyEav++SFITmsXBtwSEjOP319+TGJbz
         m2qGHDbG2A30M+D8lfpWGrX00Fzm9xMw39B8RO0CWjz2WNMLlp/HoKc1o8N1KtAoMZ1c
         wZsfvWNRNkbz+/zfZOsHDKFnIz5l7SiIaMi8UhFLwaRxw+QZgXRipcQ/IzK5rsPU+CMx
         IrIw==
X-Forwarded-Encrypted: i=1; AJvYcCUiL+jc2owH+pajJXLfG8HE0Hd/tzlZ5/BCzDX0ZSuiZ+/SxUGFeW2kIhhmr2WL/QlvQc7bXUKlyXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCbi46JIYocSy9elEj9OsqOajp60ZiykOlZV+ABRW1OxMu8ICI
	0C8T70fNCnG3MVAi8PGPTaa+I2HnCyeP36M5F0eOYTd8/4kYOXkix48gb6Jb/7SbBQY=
X-Gm-Gg: ASbGncsK8w9tFqKXJzyz+vhWQ6VLj8LiZUdYuXDPKSbiSCyJFqV3dq2cYuHkgX1GZu5
	Nv7jZPD4Xc+mkLEEeJC0trssJMblPOHZBIop90T4CKuLm3qm8rlbBHo6go4f+Um+xfQ29YlELUX
	KpfmhQsjIyaDpvWRyAxJXbHmSHtIiiOz55tz4nQykTBzJ8q+xLuajT3/cDzV6lIJRJvbZXJS9rc
	ep2TtJA8pZwdgMY54YFISARJI5GaZW7JaJhd56lLs3vs+fYTM+zi4J4MPtPbf5dKoTHagNf5sCL
	Ki54KJWzBDSEOSsBVvk6Aj6t+Mk8ob9MV24+Ti4fvH3JWrOMMuOA+VTmrXS9m3bJm8C84VlMblK
	HGmLAHAAiY0HRouxj3lDnELza/mAYXpqEC7dJL2wP9WZ2VQ==
X-Google-Smtp-Source: AGHT+IEFXfAwL8n5C3J9dCog5MqYjz/0z+tjRYy8VBux8QIcdwHNBxHHgPhwuMllRtUOig1ksCGmnw==
X-Received: by 2002:a05:6000:26c6:b0:3cf:3f1:acd8 with SMTP id ffacd0b85a97d-3e765a2367emr4237912f8f.28.1757702157424;
        Fri, 12 Sep 2025 11:35:57 -0700 (PDT)
Received: from [192.168.68.105] ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd0a7sm7293297f8f.39.2025.09.12.11.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 11:35:57 -0700 (PDT)
Message-ID: <0bc838d3-26ad-4f2f-8bb5-1c34748e1fbb@linaro.org>
Date: Fri, 12 Sep 2025 21:35:54 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 00/16] Introduce kmemdump
To: David Hildenbrand <david@redhat.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com, rdunlap@infradead.org,
 corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <9c2e289c-0258-4e25-aaeb-a97be89ebd84@redhat.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <9c2e289c-0258-4e25-aaeb-a97be89ebd84@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/12/25 18:56, David Hildenbrand wrote:
>>
>> Changelog since the v2 of the RFC:
>> - V2 available here : https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/
>> - Removed the .section as requested by David Hildenbrand.
>> - Moved all kmemdump registration(when possible) to vmcoreinfo.
>> - Because of this, some of the variables that I was registering had to be non-static
>> so I had to modify this as per David Hildenbrand suggestion.
>> - Fixed minor things in the Kinfo driver: one field was broken, fixed some
>> compiler warnings, fixed the copyright and remove some useless includes.
>> - Moved the whole kmemdump from drivers/debug into mm/ and Kconfigs into mm/Kconfig.debug
>> and it's now available in kernel hacking, as per Randy Dunlap review
>> - Reworked some of the Documentation as per review from Jon Corbet
> 
> IIUC, it's now only printk.c where we do kmemdump-related magic, right?
> 

Yes. The other places just have some changes such that I am able to
gather the data inside vmcoreinfo. (remove static, add some function to
get sizes)

