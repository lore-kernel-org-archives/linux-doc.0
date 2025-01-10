Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D93A20ADCA
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 10:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736503457; cv=none; b=omU+0xZGkvxMhFJT5Mmj+e7XQba1fZ4+riNPT3SnkRkFY8A2PavCReggJ6RDThA5cev0aKoWhTeKhvVY7JR6ID/JKLS60fH2sqwiayDgwMZ4x8h81Ue4dnnyKyoNKDf4bsKE/0pfQoLQ01nH+jxdCga1E4muGKtAjhvflja2CjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736503457; c=relaxed/simple;
	bh=qNaQzpehQQCjP6U1Smo/Nd38XDFDvWBgAvAJl4KW8uA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bCM12V1MGqNAWjuzU2Y27fGYqD/nrvZtMpS2mFKhtTpRdLwZCDrvb8WjXaK0B5CL8lijmFYAWEECIP4BCDNd1uG8rjy8vPgk2C4HCLTyaPy1k0VXqR+rJaK5YoFEosqGwzUIZ4YksG6Rd8IhhAgSAEZAasmsGTol8fjxGQmqEyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=T430dLon; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="T430dLon"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2166651f752so39076045ad.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 02:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736503453; x=1737108253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SbCDbM8KQIXhK7Foj8Bp5mpZOBTNVuVCawxI33XikWY=;
        b=T430dLonjsSAlmOPpq7K62Twr27dL4/lXuDT+WU9UJck6NoShVeGAWEMj3/qYGuPUH
         8mFqeyWqrs3KumgimS1EVzKIAbfut7Q6WFp3lbwPxwNIlQW+OXhm2kvjOrHKOSu6iqPI
         sz/FqNdIYJA4ikICrLBHVmtTbdwxQopPQElXiVYW7dAqXkWuZoKMx6Zw89YIS/Th91ce
         Ns0K96mE2Zn4xFfW4n87qUJX3hCp1Gib74kwWQA+fZkHc86483l3Pjv4ZrGuT8cAcCyA
         BBkYOpeD6sTng1k2vf1MDl18Lz3AF5XyU9d57Jr5VnFpopMkpnaVZ8zaYlzJEQ7HL9kX
         0Lpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736503453; x=1737108253;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SbCDbM8KQIXhK7Foj8Bp5mpZOBTNVuVCawxI33XikWY=;
        b=cKqPMbj4B+Lk0D5dufUQ1yLX27o8aotuCLwsyYjEUGhfitae2Yz6eCvlJG+BmTkv7j
         zDPLJqe+M5dzE/b9HgOskZc+eIRg9cE8RoYrOEQUkfj9TvMMo3RmtaDfxQUd2vwokRDo
         EAiYIlE3bTS42Fz2duisaExbu7YESP+JrzKTyspWixzTWCAQOrIX2+v0wmzINnBXtkTR
         IhyVq1wUXEsPR+yMW5VLbXpk+FJofsFeHy44ihxjM8+zKIAucZO2LZEhYeo/hmOgx1sn
         ELnl6NibP9th+JOp9QxyTcq3JTgxRG7w/8LluTmx1r/B1ToDuffWSjIi/YLABRa+FoNy
         Ptow==
X-Forwarded-Encrypted: i=1; AJvYcCWSQI4wnYAJCFjpkilGvsvzS4EyaZaYlyzkd5aWKn70nWl62zhfYYbUS3PT6DobZBMi1tAWcH7DlHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoyRoblTUiVW7wXYoFd4pZ3Sg0vM+NZRCo7JX+eLaxM7960zPT
	XMCqxXo0KR/ZxLyZx5UDhaOFOWESmRH2T+WC/SZ7XZ3E6CSrUGgdrugl3TArbJE=
X-Gm-Gg: ASbGncswIRG4Y7Y40jw8Xtvnwb2LEYu2USq2OkTJCY+xDBw37HFWB00weKd5cE1FI3K
	vJ7QsCTW6Zaj0orIg7Y57tNs9ADcJ+1kL4+pPrqgLTtR+Ad3vuhO7zAK2F6Al7JX1a/1xMPQPZo
	DmEJUP0Eq5wfGj0rGWssPyrGb7fadC6AfN4kTetMSjL1MM0l2i5Me1nHiAX590p/ZV/7T1Eb7bh
	iZfdtUYzcrFf4THIKUEFwYgszgwmPE/XulueAHsLiMX5uXc4WPW3Jkw1ou2Mvki0t4=
X-Google-Smtp-Source: AGHT+IGwGJ74ps/x/Eb/FXDjZwvLuJmQUxKHNbskjBfpmMO+fHvECFMcSxYPTjF3D4hGyGv0Hh3cVw==
X-Received: by 2002:a05:6a00:179f:b0:72a:bc54:84f7 with SMTP id d2e1a72fcca58-72d21f4f2e5mr15271389b3a.12.1736503453610;
        Fri, 10 Jan 2025 02:04:13 -0800 (PST)
Received: from [157.82.203.37] ([157.82.203.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4067e9e1sm1247468b3a.131.2025.01.10.02.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 02:04:13 -0800 (PST)
Message-ID: <1f2908ed-e938-4365-8f1e-9f1c7753fb9b@daynix.com>
Date: Fri, 10 Jan 2025 19:04:07 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: Re: [PATCH v2 3/3] tun: Set num_buffers for virtio 1.0
To: Jason Wang <jasowang@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com,
 devel@daynix.com
References: <20250109-tun-v2-0-388d7d5a287a@daynix.com>
 <20250109-tun-v2-3-388d7d5a287a@daynix.com>
 <CACGkMEsm5DCb+n3NYeRjmq3rAANztZz5QmV8rbPNo+cH-=VzDQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACGkMEsm5DCb+n3NYeRjmq3rAANztZz5QmV8rbPNo+cH-=VzDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/01/10 12:27, Jason Wang wrote:
> On Thu, Jan 9, 2025 at 2:59 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> The specification says the device MUST set num_buffers to 1 if
>> VIRTIO_NET_F_MRG_RXBUF has not been negotiated.
> 
> Have we agreed on how to fix the spec or not?
> 
> As I replied in the spec patch, if we just remove this "MUST", it
> looks like we are all fine?

My understanding is that we should fix the kernel and QEMU instead. 
There may be some driver implementations that assumes num_buffers is 1 
so the kernel and QEMU should be fixed to be compatible with such 
potential implementations.

It is also possible to make future drivers with existing kernels and 
QEMU by ensuring they will not read num_buffers when 
VIRTIO_NET_F_MRG_RXBUF has not negotiated, and that's what "[PATCH v3] 
virtio-net: Ignore num_buffers when unused" does.
https://lore.kernel.org/r/20250110-reserved-v3-1-2ade0a5d2090@daynix.com

Regards,
Akihiko Odaki
