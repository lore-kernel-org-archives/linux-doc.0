Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8216420DD51
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 07:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757834422; cv=none; b=SkloJIaXbttxNBlaT2jsZvH7eT6TwUaktA6zW1tZ10NJGpr4V80ZVBRPtSpCKGzprNn0THP/eWl8/Lz704Q3sS+5by29btYa26q0s3Wfv8DmjuAR3ztQD9/sc5uMvMRrQIiG+tsqcBZQcNu1onNG07jAk6jGwQYekG3AOBI9pP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757834422; c=relaxed/simple;
	bh=WxHbnp3mXY85vHOyFqflPsDdFgmpqdsippjcQEzh6k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aMf5F+oLTSpKXGOerTPAERQhwgOvVkIir9upaMJj0uZUggNj4fz+RPeavbwXczmuczdykHwNLrDWXXpC1WtRlNiRgL9tRy6ZJQwJPbUVChSpVko6H8Y1fQj2YXgmoR2PDHhZ/up6eTaCIDl07qqvxTodcAXH5T31U5Qd3PKBuig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqJyDFdI; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqJyDFdI"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77786498b5fso171091b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 00:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757834421; x=1758439221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YOgfe+9uFa1Sef9wrFS81gpUBs8pXU8gTxUAzr2W5PM=;
        b=ZqJyDFdI/HscnUlKBH4DfmknZONfXAFUmYD1blLC6PoMbehWZ8akX9AH2JC0+upWRr
         bRhQslB0byyxeTtNdiEHmSobANTMsZQ8AkDsvgrQCmYNH8QCXhdBpcoAemDFYjTV/y1y
         OEDm7137G8r0SjTPoglK/U48uzCR06hv/0opygdJAzmGo+99jq3I0E3Xg3RZejq+N/9S
         rxK3MnF6mSjjTLj0LvgpsrhYcf4x0PeKNqz8QkQGkx9V4Pjhu4aWF3qe9KXb8c19l69u
         nR1RSd2EsQ/W7KWng8YVJs0LS3dyc5CI7ssZRK/mmobebbhmkW7uEBoNfW6b2JjI4N4W
         Dw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757834421; x=1758439221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YOgfe+9uFa1Sef9wrFS81gpUBs8pXU8gTxUAzr2W5PM=;
        b=ixa/IePt3ldrZ95i9yZ5MBLbpGk4xqOzjhCfSt6yiw9iwCnot6KJ1NRwadQ8PBcTqt
         4q8vt8Tw04m8tuXGeQkZwVWWE9ZSa5Uv5bJ1sHv6VQdAMHN+MRJMkDKSJt3tmir0mP/I
         lZ349fhX9QzoszyydQNHgTeFCItDmUWruompgZdsXrl8bySk5WLK6JYpfID45WCoUgSq
         mKdJ9q7EWEZ6qrTIlVAvor3PF2OddmeCt+PoI4l+IQPWUyvw6TqmiDUYA6YkS0ZqAeGD
         YPWDrnGyTnaU2/dIRKJZDrTFVNuYIYQSAectnQ3GxTuIuopTIHLjxZjlJfaMrphpXW6a
         n1nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt2twz3FMTH+PISqSLU2E13UOBUWOysu31kHl/CYcfpYspFOarNwdrWP1Qhmwf5wAy6CemILWtUXM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv0/voMnBZeXMVhKe0rb8KovO5XssUZuv2jFPbMo++bBvwdxsa
	zD8N/6NImYXp0M+fcWv+v6PbnOJM3D60GJLypz/qud5Ye//VMNMomGh3
X-Gm-Gg: ASbGncva8OQ0WVzRUpSoLTCpURNMGmFMjNXdt3VLU0EEUYao9G0npUDDdMjLgrBL7+z
	2OUgTcq3KjrfBXM1NwKq8AWRyGvRCmm19pmVCVuhLgwrDQJQTuydTbGgsDSGz5YkuV0lpqKmMqy
	ovC2gi3/TMe79nFhG9BUyYEQWsfM1zfnqb5w8Q8RfWC0potsozNqNsh1dJTUJTh4ogBTHQvxZKY
	fx6/Ob3iMrjs16N1ChzaHFWDgKqPu3yDvE/7TmFlxLjIFI+ItoWMSXbcQIEMzOZJXC+4UaumaGW
	y5CcHe0BZEhxS06uMDy/3f6fG5MIb4K2UMhcE1W5IOP39MQJsTOJ6IJDmIhqrYHwGBYRjpx+1Yk
	ItDkOUfbbAvScVSOKgann/ix/FRJV9ZvGgsm14Cz/SrGm
X-Google-Smtp-Source: AGHT+IFt34+1ICBGiFFGL68L8S7MvtUKg3hTKrfZfT1RYdTndglwbOB3Hevxm6aiueGdmtq9q7ufrg==
X-Received: by 2002:a05:6a00:4405:b0:776:130f:e1a1 with SMTP id d2e1a72fcca58-776130fe348mr8620872b3a.5.1757834420608;
        Sun, 14 Sep 2025 00:20:20 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a47601sm9815891b3a.28.2025.09.14.00.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Sep 2025 00:20:19 -0700 (PDT)
Message-ID: <b81b16da-5031-4c26-821d-e7bc564dac0d@gmail.com>
Date: Sun, 14 Sep 2025 14:20:15 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: process: Do not hardcode kernel major
 version number
To: Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Workflows <workflows@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Dante Strock <dantestrock@hotmail.com>
References: <20250913015147.9544-1-bagasdotme@gmail.com>
 <61249b3d-3996-4d9f-814b-3794aa42c40b@infradead.org>
 <aaf3dffd-cc88-46e2-a65b-a1ff4fcc6eec@gmail.com>
 <5fcf5f4a-1bbf-458e-8aab-8c66d326fd17@infradead.org>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <5fcf5f4a-1bbf-458e-8aab-8c66d326fd17@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/25 13:10, Randy Dunlap wrote:
> Do we use the word "supermajor" anywhere?
> $ grep ...
> Nope.
> 
> How about we call it MAJOR (like the top-level Makefile does; well, it calls it
> both VERSION and MAJOR[1]), so use
> 	m.x
> 

That's more sense (and that is indeed the term I use in the patch subject).

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
