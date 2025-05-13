Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AF0191F72
	for <linux-doc@vger.kernel.org>; Tue, 13 May 2025 01:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747100948; cv=none; b=cIJxu6JRB33pzrOiKVN/a8+2QH4oLcMvtcPqPwAnxj+T/d0XhGqsR/3THz0JwQj5dughJDS3QiTtQInSSx+cuLvJmD5q7IsFvWd6qPOo4V5m1KcDZ16kyIJ/cDzHvKCPVZ85vfI0qKAZqtERQmdwbkYRJ05DMimSnkgQFkiXUt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747100948; c=relaxed/simple;
	bh=XR0DZnEvtPXz6GqL8llvpmZDHyr5Hnot0r48twYOqzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhYjM637VEi19ShZ3tJWtq51r2HmhkDmwErL/wyw2lkal47BWKfNkaWpV0Zt4nzLZiPU27g4ZtNCgVPQwwmr3Rhdckx1P76x3Hn57914tKHFITp6Wkyf2iyCi2qGyxWjRPh58Jjd7GvJ7ahyjzoub3QQO5P73DpJciI7wH06HVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=MJmnkG1b; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="MJmnkG1b"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d8fc9dbce4so21532485ab.0
        for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 18:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747100945; x=1747705745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bBPDHnkKeDmDpBDa2SgAxE58ZEppnAX8xq/UI8zGOpA=;
        b=MJmnkG1bjWYnKscNum7DMOuLTltmbikXVcEDXrccbKO5O19EtSaBeFBGQWcLL0c/TB
         26aXuKuuA4Ub/m5edStTpvWFUBIhNlZgdRGF/s5JW79bztsFn92+beKrHIutjTNMZSor
         TAeWDLal94IQ13AJS6i7mtxc8V21bu1WKjziBqx5cqjNK6SXlhgk0amB6w3xwVsnHO5a
         kE2a2ms6WApg+97jMVadVD0r9pWSNSgqOsWkIXc8STWqCRSxW94rISRy0zvtPwg6KhFz
         10ueUis//KdHtpmOZAV9FRKd8+0KwzVzZ8/cxwvHEYDROk5j60hDgXerC2Ux9qWvf6CN
         vvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747100945; x=1747705745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBPDHnkKeDmDpBDa2SgAxE58ZEppnAX8xq/UI8zGOpA=;
        b=uHpwyEAsaziFwqyLNL9oWgIPjaPQ2/0x1ZC/V2YvfQQsYSIwKwv4YHskTowX4JeNIX
         pvhgj9vQZ29kwzTENui8lkWHz0M/hSX9lm8pD3BO0FqnV+jD9ywuviTLUpL6w+/bP3LW
         y9HhOjsoX+F53LzOj2PR28s5lziHDdIGcOXMZHrWuGCTT6XkaDURvzvUgnKb1YbSmh0t
         Gw0uUMO/Pp4q8VJQxNFAvXSR44aIk7Fb29Vy0sYnD3XvxZ6qLgQ5A8Y0Y6pzdqaBKAvJ
         BClydI12BfKEnEbDQ4QHUG9qEgwLWNl8H/lf82fcybWYVX8tX2gjbDUv+cpdMsxpM+DT
         /XHA==
X-Forwarded-Encrypted: i=1; AJvYcCVfE1RJt2j5r9gu6F2LnRZLnRdeYtoGp4wic+NQ7J6kOLvID7DVe4c8d6A7bql1sCbmgk/CBNtWnCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YybFhjevQSDXfT55kVrJR17aM1bSLXEr0ElFEZViS6jBQHTYd8s
	4s2z7wulmYXL8Qcyl1ya5obyHg29tMCwlO9bCdeHwbDEzEAOtYkLZPthG8Mh0ao=
X-Gm-Gg: ASbGncub4dk/FrBg3tBCitUNax2M2v5glnEm7P+UY212V4Ig2EmiYtGd+OhKX1Y1Vcn
	VS5mnKKlf1sTVotE1yZJe7D5EAfsNuozLdrITEAs8dOiONwCqpmP5nPklAv0R3LHYH0ZfYi5V+N
	rox+TrLPGLDSEmCuc7vS1DKNHrYLYeks1apF2WBk1tCdpY+FWBXGFr94we4lFgL8EguzobejaLz
	YEEf2Hru1/wPL49nRQKV1zWb97QRQe3+6hFr0mEfDLUpry8F7EGNZ9oAR9tatHpxoL9TDpIwYCQ
	yDQFz733dnrUFBRQWaVfV1h81IjVbmQ8uRtorJGDbTn406SN
X-Google-Smtp-Source: AGHT+IFTJHT5B9YdkW5HUOi235WCqkDs50fBKdItsfkTyG4tYu856BxjsQUtfq0QRa/xjFTzFY+eAA==
X-Received: by 2002:a05:6e02:3b09:b0:3d3:fa69:6755 with SMTP id e9e14a558f8ab-3db663b8eb2mr18525795ab.5.1747100945004;
        Mon, 12 May 2025 18:49:05 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e158975sm26102295ab.49.2025.05.12.18.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 18:49:04 -0700 (PDT)
Message-ID: <70293376-71b0-4b9d-b3c1-224b640f470b@kernel.dk>
Date: Mon, 12 May 2025 19:49:03 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
To: Jason Xing <kerneljasonxing@gmail.com>,
 Christoph Hellwig <hch@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux@treblig.org, viro@zeniv.linux.org.uk
References: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
 <aCGR4EOcWRK6Rgfv@smile.fi.intel.com> <aCIL0zZvf1fvTahk@infradead.org>
 <CAL+tcoCJxoiGi=Ea1KCG4_ri2=GbNhhVhEV5anMLyai6qg2zeA@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAL+tcoCJxoiGi=Ea1KCG4_ri2=GbNhhVhEV5anMLyai6qg2zeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/12/25 6:49 PM, Jason Xing wrote:
> On Mon, May 12, 2025 at 10:55?PM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Mon, May 12, 2025 at 09:14:56AM +0300, Andy Shevchenko wrote:
>>> Also note, we usually do not care about the out-of-tree users. The main Q here
>>> why are they out-of-tree for so long time?
>>
>> We do not care.  If some of this ever gets submitted it can add the
>> needed helpers back.
>>
>> This entire discussion is silly.
>>
> 
> I'm surprised how you described it....
> 
> Now relay works like a filesystem which helps out-of-tree users
> transfer a large amount of data efficiently. it's totally not like
> other pure dead code. I meant what the trouble of just leaving it
> untouched in the kernel could be?
> 
> Let me put in a simpler way, two options, 1) just clean up, 2) keep it
> and help so-called 'out-of-tree' users even if you don't care. I don't
> figure out what the difficulty of keeping it is :S

I think Christoph's email was quite clear, and I also said _exactly_ the
same thing in an email two days ago: we never EVER keep code in
kernel that isn't used by in-kernel code. Period. It's not a debate,
this is the law, if you will. It's a core principle because it allows
the kernel to be maintainable, rather than need to care about out of
tree code when changes are made. Similarly, we don't have a kernel API,
not even at the source level.

This is one of the core tenets of the Linux kernel, and all in-tree code
must follow those. If you have aspirations of maintaining the relay code
going forward, you need to fully understand that. Either the dead code
goes, or the out-of-tree code that uses it must be merged. There's no
in-between.

-- 
Jens Axboe
