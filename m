Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F882E0937
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 22:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758233571; cv=none; b=Qpx/sqOrz9BwkVeh+xRvD4mhJV+kKAAnconcbNcMekNoqjHUKgnAdvnD/enpTt3HanLq/iNo4wHfLZh1jtpHow01XK65z9ce8rQyg3VZy74wB+WlOdoMgxsdxNwI/iyDEd+dz8mw340b6U3R488Dh8ncHmsSx5cdWyJJ03+mnkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758233571; c=relaxed/simple;
	bh=ajjHKpFPzRYGlqwcSKc2w224hArGFHptRLI5Lz1bLnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RsLk/Xf6AFJBEWVE79bRt7Gp8tmXNK1bogIxxAdyliX0R9jRB7ywgWunCRLVV6GcBo8sdjlldOtQSURkbNlqoXKKlbllJ5KTdz3LM+y7fAvoJBUjUZR+aIve3UerhccjCbdC1NG4pI8Gk4Mp4pOYnywNh9O8sI0FkSMuyzxKvbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUXpodGr; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUXpodGr"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b4f7053cc38so1070299a12.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 15:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758233569; x=1758838369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uhJCUp3cTgiTgnYs+CkP/JmQFK0RqK1Act/0NFVgCHw=;
        b=GUXpodGrXj/yoHZYVeN6d0e9MOKEV8ab1v8+cVhZ/ISGrCRo07gFsv8lUsec33yzVV
         Z3HOqZFGJY9geSvqi6v2kHV0rA62may3yDbi7qjrmz9FVCS25mTJnHCKxiV8lSlPvr9o
         +C4AvlD53GeBvdW2JNTucBroYimBrbGZxhmlED8/n7dd68SE3GXh1VOAN1XxZEAJ5nGW
         fZfgdI2bXeF7rpRBH2sNEwk9BNdc8KwE++kiArF+L4y5x0AlQMxUimerjPauzOTH1uVy
         CkLWaU0EAyIzPHl72vnpwF1l+G9ccAxma2qPD5w2e/f1F5rPUZ3YD/0//WJYPAWFUIHu
         MOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758233569; x=1758838369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhJCUp3cTgiTgnYs+CkP/JmQFK0RqK1Act/0NFVgCHw=;
        b=gmfzavlgTruZuvmOCubt7XBvzCGGirmgjHUYl37Uv4q1ifZiHoQHSpUPbR7t5/xem1
         CDs7K+c7Bt9gn7j+w0eWy/xUFOeeAG4F/twGRdStef0U1Tt7t0aQft8BwtoT1rxXTCar
         6RhS3ZJJlMqurNLwaYudr4TM9gwqr8LeSiIS5ihxO8J10zYdtdw5s/EhBMH4lNAWEAFR
         wLWmmdLvL4KWcG8NlYufVOV+C1jlsRq7z4OOSKqVQrMSzA3/2MBXvaCnPxzhbckHvLIE
         7eg7RmVIM++rXC2OPZ8e5PT/FKO3K8oHVx8ggTgT3ofmD1jnTL9yYmg4/3DCfoq0XapH
         zOvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdZaKqHDvwWLtYa1RvHLsBD3UtsARDjQ6DEl8P+tuwvYY3Lv/WNJE/2T9QrLpuqshWsRsnz2ThXZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+I+ZP3dLxxUvkA2YzMW6sA2Txf/kwMOuOfWJE4zREvmPUQKry
	nOTqXHWuKBObilmq31fL51dXsZtF2cTguMIbrCk+yNLj2VDdUvCh3JQa
X-Gm-Gg: ASbGncsaj0qYTcxz7llyHP+nmoarR0tJjZyDXF/rTXipKFa1p++IEWwqFJU7SWJA56K
	l8Mj+TKFNjFY+3iGxa1FcK5RU0qRov7tqsGpgA9MwU0rsoZ5LT+sjWpVbuGoP++4RS8DwkP2kEr
	yCdrut/eq44MdTgmHzGM2A9yQge/y29V+i3OscB7hQWpsTPep3201f038RtlatUh4DUyw6l/A4w
	o+BV8rdSPEseeHA85JFEYq02JszwWtnbw5w5CeE08XuGnJuoFxGIgY+lBkjlDJYhKNSf6w55K4d
	vPswJkQHbcp8CQjpxK8dM5VPR1z58Sfv+ophTOVEU2VUmqs5UsxKNV/EHoB1FQcvI2FdiJpxjLq
	F3wmS5t0FXAN3INyHVHwaV4NoP0Rjq30ESvMD6S7jbP20JGwR
X-Google-Smtp-Source: AGHT+IFAYTSeA07tapHjMoV5p7/O1tEqBeuIBo7k77XWeUxcpjF9dw26+h1YMYgD7yaS4zrWXIacDA==
X-Received: by 2002:a17:90b:2d0b:b0:32c:c40e:db12 with SMTP id 98e67ed59e1d1-3309834e3c8mr1480022a91.17.1758233569385;
        Thu, 18 Sep 2025 15:12:49 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfc248fa0sm3344899b3a.30.2025.09.18.15.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 15:12:48 -0700 (PDT)
Message-ID: <034e7936-0fb8-4ae0-bd84-f1bdc3adfb3c@gmail.com>
Date: Fri, 19 Sep 2025 05:12:44 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Documentation: cgroup-v2: Replace manual table of
 contents with contents:: directive
To: Tejun Heo <tj@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux cgroups <cgroups@vger.kernel.org>, Johannes Weiner
 <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>
References: <20250918074048.18563-2-bagasdotme@gmail.com>
 <aMwo-IW35bsdc1BM@slm.duckdns.org>
 <ul3hrtvui3wuvchludb67wy7kahsroclvppssmeuqrfwieyfv4@vd3gbuuda2xq>
 <aMwsZism0R-ZHLkq@slm.duckdns.org>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <aMwsZism0R-ZHLkq@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/18/25 22:59, Tejun Heo wrote:
> Hello,
> 
> On Thu, Sep 18, 2025 at 05:55:07PM +0200, Michal Koutný wrote:
>> On Thu, Sep 18, 2025 at 05:44:56AM -1000, Tejun Heo <tj@kernel.org> wrote:
>>> I don't think I'm going to apply this. Sure, it can get out of sync but I'd
>>> rather have TOC which sometimes is a bit out of sync than none at all.
>>
>> The TOC is in the generated output :-p
> 
> I know it's tongue-in-cheek but one big benefit of the doc format we use is
> that these are still very readable as a plain text document. In general, I
> don't want to make changes that worsens plain text accessibility.
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara
