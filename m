Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DCA1F5E6
	for <linux-doc@vger.kernel.org>; Sat,  4 Oct 2025 04:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759552270; cv=none; b=BFn259EiKJ2fhL1zlZdd4wCh/z5IMzBNX7UVcDmt5gPrdR1j7K189duD3EJow01gBW+EAvR5xgG7LNYFjHbiMUsA8l3FaJssH+Y+RAB+8O85xNpFu3prPMoCSL7c3NszjeMPSzx9BP7HQ1P9wvTiNZ6HrhYRLVEqrr1wWHIKH2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759552270; c=relaxed/simple;
	bh=enoINwlA9+PevoMLkOQfPIAcWmrKh+doHnEubrvsPIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ux7zceU6/QTx0C35Iqn7M+yzhd3zYawzvoFbCExqmcYraem60cjHoVAqnrl4LWfJ2VN67iuBeLeCdmVftTt19pRq2CW0rqwm9EdcFKARiULI8ZugGLt4D8lJBx7YZ1pp8q70sRNqGvOfK13NNbKQzlS/Bx+OicqIfDTuzQgky6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNluNx03; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNluNx03"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7811a02316bso2186363b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 21:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759552268; x=1760157068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=StwDBKa8ZRSfrd7VD6MhCNqBvOmQ/m+xhmau3mnSCHE=;
        b=nNluNx03FQ5vYhQMHrgA8/vPRPScDDajqnNVNYS0jm2ld3ie4869R/szYqKIg4i/K/
         6D60GvxXCvd+Mgebdcs2V9VIuXLGqaEwGASbNLRHMgst39FzOMCwd15sw9IjO6QgzBUb
         DLzi+mBRzyB6m6bRfnyO/O+23K4JlPsOS3FHDy6wh6ZXJZao0/H4lhzi4vxRSkfBYema
         KfjLNVY5NMtsqvagPTAVR2iKsktEj+nQZO3YvkyAFbXp9DhpCDq9Wc8OKqa8qqCeEsl5
         mVhlR5h1uul5mfBU7AsBEZX2znYqX15CcE5N7xSPnXmyH56GiSHlUBGMJiHCEccQ+wF9
         N1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759552268; x=1760157068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=StwDBKa8ZRSfrd7VD6MhCNqBvOmQ/m+xhmau3mnSCHE=;
        b=aSbJGMW4b6Ul1ohe8MBPfUU2ngHbRJALridYbPut4kmYUPqS7wvOYLW4WkVkypZ4en
         gn7kMXi5juWjFuLRkVrVsmwHwfrriGc/szk+YlThpFRc7q1sa50PuKhfWkYmm1u2q5Tw
         GpPapcyl0aUA5FdNcGm5MaqFZPhwTRV7cgKDhVg4UTRTvgPIN0MCKylRw7vaJAST0LLU
         J1FFegHhYY6lZX+ptnPGwt+wUX7jEpPsfkTOYwdY3pmJni3kC52/RXERVcofZMnBKvrw
         rndyK26mVOGocFPJNgnKLEHoosZOVpy4u+41oVtfgsNzcwDlqi3ZWTboLT9ZHV0S8DDD
         UA9w==
X-Forwarded-Encrypted: i=1; AJvYcCXZEulf2uyTuTWo/QXYU0J1YaSPAHiu6cPDiQCfbjm9kVR/Q6HWr+XFP/l0cNcm0cjZ3VWK7sbsZqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/hzeTYZ+IQlfqv9AY4/AkIGeN84Qcl7Aspk3KuTeU0+l+/+Cr
	n/QTEMRm914nzkCxQCwTU554hpCvU0mUNc5JaCM5Ehz299VSF3YcvvQn
X-Gm-Gg: ASbGnctMxxws00+jtUXAdsn3ThtMvoRQJ4FR/MvH0F6JsQfiPWErFg1/5E945SaIB5Q
	JXBfl7b6GfHsrmnCrijnFfPyAI/2yBHzec5tV9WaVaJoRyzZZMLtOsnTvEtzyor4m2FfEOzYbtq
	XXVrpzCd1drSxjtsYKWiTi4bQENx2teDKf9JurguJWLOoJrLb4oSWLfoG4A4aXJP1Y9FTqSMHw5
	ZxR6CaB07h4Fx65uX6SywTrQ3gfbGMhU3V/DPS1HyMffbe/fszzZFYgtefVCk3ENWxxWD0OWM7T
	HcD/NNFLhflC2gMSuByIi0kI9qKrP/CxN5QCRS5AZ78Xce4qcbNO63cZ+jle6Z9VAcgwpHafr5I
	5E8HXH1c+kPNyS+0eTHCPkB12A+5H62CsQBan2QAYmB9ou5avSyV00/T2tPzDiKAJxUuFnA4=
X-Google-Smtp-Source: AGHT+IGFVdu0idHFioNc6W6G3QpB4+em7I6xbQXdwjM7auYWjIP5jrn2CpWgS3aswdOPecIYETyQ3A==
X-Received: by 2002:a05:6a20:72a8:b0:2f6:cabe:a7b3 with SMTP id adf61e73a8af0-32b62107c29mr7468985637.50.1759552267731;
        Fri, 03 Oct 2025 21:31:07 -0700 (PDT)
Received: from [10.0.2.15] ([157.50.90.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb1b73sm6413167b3a.28.2025.10.03.21.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 21:31:07 -0700 (PDT)
Message-ID: <9a7072cb-840f-472a-9e22-a5252e52ef48@gmail.com>
Date: Sat, 4 Oct 2025 10:01:00 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs: doc: Fix typos
To: Carlos Maiolino <cem@kernel.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, David Howells <dhowells@redhat.com>,
 Paulo Alcantara <pc@manguebit.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, linux-bcachefs@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, netfs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
References: <DrG_H24-pk-ha8vkOEHoZYVXyMFA60c_g4l7cZX4Z7lnKQIM4FjdI_qS-UIpFxa-t7T_JDAOSqKjew7M0wmYYw==@protonmail.internalid>
 <20251001083931.44528-1-bhanuseshukumar@gmail.com>
 <kp4tzf7hvtorldoktxelrvway6w4v4idmu5q3egeaacs7eg2tz@dovkk323ir3b>
 <yms8llJZQiWYVxnbeWEQJ0B_S6JRxR0LQKB1FwVe0Tw66ezuA-H1qZVCyuCUDtsw7s7h4jHTwTh98XivLW3vvw==@protonmail.internalid>
 <425ef7bd-011c-4b05-99fe-2b0e3313c3ce@gmail.com>
 <6t4scagcatuba7hjy4aib5hqfgyhc4wofegr2jrl34wwa7fsyq@5uwpzmpixm7o>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <6t4scagcatuba7hjy4aib5hqfgyhc4wofegr2jrl34wwa7fsyq@5uwpzmpixm7o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/10/25 21:22, Carlos Maiolino wrote:
> On Wed, Oct 01, 2025 at 07:19:13PM +0530, Bhanu Seshu Kumar Valluri wrote:
>> On 01/10/25 17:32, Carlos Maiolino wrote:
>>> On Wed, Oct 01, 2025 at 02:09:31PM +0530, Bhanu Seshu Kumar Valluri wrote:
>>>> Fix typos in doc comments
>>>>
>>>> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
>>>
>>> Perhaps would be better to split this into subsystem-specific patches?
>>>
>>> This probably needs to be re-sent anyway as bcachefs was removed from
>>> mainline.
>>>
>> I just did a google search and understood about frozen state of bcachefs
>> in linux kernel since 6.17 release onward. It is going to be maintained
>> externally.
>>
>> Thanks for your comment. I will resend the patch excluding bcachefs.
> 
> It's not only bcachefs. But most of subsystems and documents you touch
> have different maintainers, so beyond removing bcachefs bits, I'd
> suggest looking at MAINTAINERS file and send specific patches targeting
> each subsystem. It makes maintainer's lives easier, at least for me.
> 
> 
>>
>> Thanks.
>>
>>
Hi,
Thank you for the suggestion. I will split it.

Regards,
Bhanu Seshu Kumar Valluri
