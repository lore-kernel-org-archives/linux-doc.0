Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481C635962
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758549697; cv=none; b=j9LVss74yn4aBqdywF7C9MQMSgykmlpB2uOPVeQmmHMQZA3CV/v9g999slUqq7JEJ1Q9y4ERTe9kTkftoZaCEn9rbPLTKrmim6cq6/UFlPtyCNMXrzsONt+9HuHGZqFbzkR8IhdyqpS/4caB/uDSh+IHP0hwsUXI1o9BDnZklTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758549697; c=relaxed/simple;
	bh=UZjjThwwJZGVVrDbQVu3djnqq0f0cHLoax1dEyX8gx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t3N6wZGwPXkveC9crOw05Ahi2khPJ03yn3mfrQxij4QMRvvUSQiTHzlFAmk41vtyMeyrS28EYiMr41T1Ie4+Qf/SC6OE0/SV6lOoUVfban2RcitiPadCRSpcdTd+U2V61xl37Sfqa/qomhNzmZPN6CAmCMFmZ1UdkXpQt2QYQ80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNQyyHpu; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNQyyHpu"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77f35113821so877977b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 07:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758549696; x=1759154496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fKCwA09uzuhqOzWAVdE6ynBeU1Drahgo1zKeykBUIgA=;
        b=ZNQyyHpuEAmkQweemQ5+oZWcIw0D0Dg6LHu+wMpjNp6IidrSLYIV9prpKVXyIa2BWv
         0z1FJ1x+pn5Da6tdjEEF6Wa9nVOLSQN5pfhJfeX6mUH8+xCd1DlKnHrvbmiV7dSc8Mli
         69ECXNoKHReM7B84ke25VvzBu5GDmiamQ/+NgX4nKvTspEWrHG/sMdh8W0nqREwSKpGB
         CImZUSb3CbZHqcpsEXDPyUrNQ8b8WqD4rk76skYT1HuK5nRAHf20E9p5/3krz1WfJTOw
         kIcP2Rkn0PiKLhPAglqOgfnVsOsnbXmrCV7Z3i4DOKgKN955zkU85ZEfypvNOHLDFtJk
         OqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758549696; x=1759154496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fKCwA09uzuhqOzWAVdE6ynBeU1Drahgo1zKeykBUIgA=;
        b=juKUM+Bv3K3D8zo3bdoyHTg6nXzPxBJK+lyfxigPZIpf5YbjVaTfnPkwcRyxLEY9ns
         9QJCfONdj9dRXLrS2CxjtDr8V+m2rDmByEZTcyODdpuUWltGIfMI5I8j6bxxMTsAu6o6
         LWcFbP3yMgR7w0KMmq8r7tukuZWVm/gj21kbHf5tRHhKJNQ+c0VER+kNl6ke8PHU1VAu
         cD3tgYEwSjufN0YqOZbOzGlqJR+qgFvVsLkeETI2XfqHn5iZEKJUKLusCqYXosLeo3IY
         DE8xGP04tFpcRZ3eZBzISsTHGTvcmsIBsy+VPvUu+GPU05wBqB2AKjvGBI5PmfCLH/K9
         j5lw==
X-Forwarded-Encrypted: i=1; AJvYcCVmX7D+Ps3Sqb9S+r6eJ6lny4iGi1FvOXj1UlJn67oVll/mRAgMgkn/wGL2RWmE7j7ChtIGvFNh27w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFwfUncGe7Gb0k9CMc0oXpCrboVaT1F34LSkV171sNDZ+OXNwh
	1JzFWpt94n5zvgS5flyIWs87uQUVATGVzt1tJR7vrX79o7xK7ouk8qxzO0S8Og==
X-Gm-Gg: ASbGncs31TEk4StBdnm+J0NglwOLI3sjRedHVbOOEDOMRQjQVb6ERg/IE6WHimzCYJX
	ba152hddsDHiEBVIMdHYj4RPM1hLLEJW14CFlgl78PTwiIHczT2vRS5y8WebwVH8l6usZ5SySJN
	IgIXzzv9LegPrAkIbo9U7iezu11NxYMlrij/CA+d/Fv5Lz9rsyO4RDfgj1sTqJQAnwal/kFsSiH
	jVV86YB3KQMd/VQLaG9P4RpsEha7+BjVs5OuFqvbNLse81bk+FpH/K1OBuL59VDZ9XXOtcg40ke
	cvOj8zVBmES/35TAP8nZCsfH3zk8LQzH1uBYD/OkoKF7/ePUZMb80RVxw44iqO1IgVV9jjRfbaM
	kPbIKtaFlH294WzBbxZsvrOFwazIFiA==
X-Google-Smtp-Source: AGHT+IGrmrGvSmosds+W3wTUoh6DC44jNVPqPse8MKhb2Qiqm6JwSQCRflUH7JmR95N5n8TSktl7BQ==
X-Received: by 2002:a05:6a00:22d1:b0:77f:414d:3774 with SMTP id d2e1a72fcca58-77f414d38e0mr3142062b3a.4.1758549695190;
        Mon, 22 Sep 2025 07:01:35 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f4d204aa7sm528770b3a.44.2025.09.22.07.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 07:01:26 -0700 (PDT)
Message-ID: <ff092ff5-8ee1-4e91-b7f7-e5beb1d6d759@gmail.com>
Date: Mon, 22 Sep 2025 21:01:18 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: process: Arbitrarily bump kernel major
 version number
To: Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Workflows <workflows@vger.kernel.org>
Cc: Dante Strock <dantestrock@hotmail.com>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20250922074219.26241-1-bagasdotme@gmail.com>
 <87h5wu8x7o.fsf@trenco.lwn.net>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <87h5wu8x7o.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/25 19:53, Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> 
>> The big picture section of 2.Process.rst currently hardcodes major
>> version number to 5 since fb0e0ffe7fc8e0 ("Documentation: bring process
>> docs up to date"). As it can get outdated when it is actually
>> incremented (the recent is 6 and will be 7 in the near future),
>> arbitrarily bump it to 9, giving a headroom for a decade.
>>
>> Note that the version number examples are kept to illustrate the
>> numbering scheme.
>>
>> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> 
> Just FYI, I've pretty much shut docs down for the upcoming merge window.
> I'm probably not the only one.
> 

So it is slated for 6.19 then?

-- 
An old man doll... just what I always wanted! - Clara
