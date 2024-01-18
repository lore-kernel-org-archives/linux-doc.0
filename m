Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F4F2C18D
	for <linux-doc@vger.kernel.org>; Thu, 18 Jan 2024 16:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705593807; cv=none; b=BRXRvOaGAhGu8TLjL2oGcbuz14zRPlyWNiT7ILTeIAHQPudcD7e5bwtpYgTKWF8FatX9XWj/leuoCOhXuWZw8YrfhYw/UHnI5j5abW5uf5PnjK+3YT9x7q5MuvtNLVgrDmyFjybImvqQsEMqRwJgZXObiZwCpHMxAva856BiH2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705593807; c=relaxed/simple;
	bh=tad7KSaWSssymKMcK4Np9WAxHngWFRCzo3BeUGMCQyg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=IvsffQZI50rntNIPh+XOyzDj+Ud0PoVwj/Che18Wy1bRpEEg4I6fe4wtCQCwJ6BxxwVcU+PnO/XXHRf/m2XdzCohrmaXRt2Ew4UjP3vZ8qGRe1AAOf9mpZ/DFdC1zPxnXF1y4hYi7bYBPq26aBcYeVNGyd9I9iDyUE5V+/es4hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TAdxgqI0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TAdxgqI0"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40e884ac5c8so23014865e9.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Jan 2024 08:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705593804; x=1706198604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BRc0fgTAZGl2rH9Uf+/qKB45sFanF47iVVLj8nSeOu4=;
        b=TAdxgqI0Hs+W9wTRbIiHjyQyB0o2HMw52OaOonN87B5KKR+J8/5Y+v0gHoDPfQz6bk
         CUmD/t6ww9w61NV5tEioqcv40IhYorMwZ0qPG7uUvn508jwpXUmezaZXZwRdGD8yIBef
         9Irt30XD4L1osK22EHo5uMknhQ456GC5qMg6lDc5qwipWLGFO6FQKvzEzkKGlQOvy0Pa
         cDDS+lV4tiZCOcwAQ02aqqx2W8ByX+kMqIQ2qsDX9jxKJfmP/0uz7Xw/HkxgphgYPGaY
         Si1Pph35FqLtt69eRM6zgXI7Ibf9NnRrRwuLO6aasX5ngUG8KleJzpqGKTcudFCjQ2Jo
         G3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705593804; x=1706198604;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BRc0fgTAZGl2rH9Uf+/qKB45sFanF47iVVLj8nSeOu4=;
        b=fKRn3lDux707u6LoOeG1yJpbMr93I3IGrSpiuOkHJZGJjsNVB/qTwIjJX8001ANPOX
         u8D8VXDB/ZXYGDl+jKIgsXKuI6lui4qWye06q8Dgo8hyRqNyPHh43bjzkjDTMSrJ3v+I
         SPl6Gmf3DXM3VFiTGoUPJy1/fuRad24EmC8qc0fTW2RvyFJrHw6JuAoJeW7GgEsdi6dx
         GBA/UMvHFy2zRRWoqsfyTyHBIcSKG7zVKR0UPm7PP1catQ6ON79q34N8ftOp1kacGb8C
         esZFnG0RGe99HQ+uvNYHzJpyg9HYInz9Bu3Dbd6s/M/vfpoli5QvPw5Bs81LFsewLWeN
         Njbg==
X-Gm-Message-State: AOJu0YzxvzWhhOS7pcZ1+yBrTBchQqFD8cP35JmMuhXppzBsIJzJx3Xg
	zUDuoP8RzndSdnUvVEJqgTFKoq6F1Mmn4tuQyptKHH1FyRxsADdlnxk63aIt//I=
X-Google-Smtp-Source: AGHT+IFL3Z3Y/XXACyndemduovXLBOu7uGqTJfo1YFml5sKDr1q7/dRA/7GzWbRPBNrESwGGULon2A==
X-Received: by 2002:a05:600c:2058:b0:40e:7065:c885 with SMTP id p24-20020a05600c205800b0040e7065c885mr359964wmg.344.1705593803815;
        Thu, 18 Jan 2024 08:03:23 -0800 (PST)
Received: from ?IPV6:2a10:bac0:b000:7588:7285:c2ff:fedd:7e3a? ([2a10:bac0:b000:7588:7285:c2ff:fedd:7e3a])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c469000b0040e39cbf2a4sm30504122wmo.42.2024.01.18.08.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 08:03:23 -0800 (PST)
Message-ID: <dd0e864d-295a-4edc-bfd7-ad5de88d7a0c@suse.com>
Date: Thu, 18 Jan 2024 18:03:22 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Remove reference to syscall trampoline in PTI
Content-Language: en-US
To: corbet@lwn.net
Cc: tglx@linutronix.de, bp@alien8.de, x86@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231102130204.41043-1-nik.borisov@suse.com>
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <20231102130204.41043-1-nik.borisov@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2.11.23 г. 15:02 ч., Nikolay Borisov wrote:
> Commit bf904d2762ee ("x86/pti/64: Remove the SYSCALL64 entry trampoline")
> removed the syscall trampoline and instead opted to enable using the
> default syscall64 entry point by mapping the percpu TSS. Unfortunately
> the PTI documentation wasn't updated when the respective changes were
> made, so let's bring the doc up to speed.
> 
> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>

Ping
