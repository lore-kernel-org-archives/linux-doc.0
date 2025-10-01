Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50AB2FCBEF
	for <linux-doc@vger.kernel.org>; Wed,  1 Oct 2025 13:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759327101; cv=none; b=S5dVkECJqYtsJ5ihuBFS7dzeyntMLsKu23HzqAxDTZjWouejh1/fFPX9xca4IB8NrEHGX13UvOmhC3WEzvFT4KwAg5Ptp2RTej+8XW7XLCWiSHHMuwuTcRFzVlV89162u1kqyAitYGRfr3I5P2rU2n6kvJEnt7IsmLhufOiwTIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759327101; c=relaxed/simple;
	bh=AErz9DRE4zvoV1QAhCMy5Ce5EIwMk6a2u/GPbn+LmQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EY6gUYbwAfKdoZ4S2w+z3XA9/ibdrI+SHDQVK19rIQp02WCxzA0cdRxNsT3XRX8d59eNSrmPNFROscduaUqoLxXK/nSD+RVqO6eevq2Q8KUu+dEgCjsyAEg6kq+pgZRIYq50YZO8+UKMScQQpih2LgAzDD9ZTh7hPjLzccyvsT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1LKbfYf; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1LKbfYf"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-77f605f22easo6665021b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 01 Oct 2025 06:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759327099; x=1759931899; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cHICQ9kYf8w+w6O3p0zJJOxecrN+M89vOZ1OdrVwWEc=;
        b=K1LKbfYfUGXFWYvfX9kmYN4cWonxTWwRsQHoZ/jqJmu2PUT3AZ+tIn6EUVgftXh8tB
         4WXSJ2H2fGyw4k2cz5iknj4W9+t4WvIgkeQAZChB4l+giybjKfJDerXnTOpfPNbAglXC
         tj82md1n4DRn171jFJGeQs6jGmklWW4Rlg3Gy0dViy+sW44/D0J862hcZaf6X+V6ysu3
         /6e1ag5aAFU+CM4J3aewn6HBL74th60oJYAGw2MiR7R6jLXlkQE+UzN2Ptj9lcCX1JvD
         uc5cFR9Efhdo1E+n0KB9ZzUz9vPQ6CHBWFSUY4ttEqc7yeeEeEIHvmkVNPrh64/CGTNt
         z51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759327099; x=1759931899;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cHICQ9kYf8w+w6O3p0zJJOxecrN+M89vOZ1OdrVwWEc=;
        b=pvpliesN/kNC829Yv4lK3Gd1YtadT54uN1VAsR4VREnozxHxlr3DmtjXI394Vw80G1
         3IvWGLlaBZSrtsEWA6H3p3400zwR5IHNPHGdFF7EaQQtiAPkzxmUTyOLwx32dd60IRs6
         JCmv0Rx9o4rAHPEjQTjf8FGyp0kHcj8nGjQH8dkNRHhaNFq5hw8rTV9zMH9h4u7FhOJn
         YTTDguXb6ofOyswaPp348p+ODMdJWsQGSqjDLmqqTiplAwlcO4vALSn7qDPDXdR28yW2
         DQUIaKJXLVX/idDX7MHFxiNFu1iV8p0aW4kSO+EPr20p7nijBf6sIp2msCOkVoa7UNoh
         L/wg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ+w5TV4LBTZ8NL3GwZ97SdIGhbemqTb18DY9+A/9nS46m/vXTOSQ3xwEfo6Par1j1DcVIzrjZ3po=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzHDgF1Iv5vIzEsgn0dbzhHudEbyGOT03JnFPdsOVPtOq1YgkH
	lqVtcWvIoNUDlGAYpLoa5+MV5CFMRz47UCUnSIfYvv4WSdUq14KXpTh4B8zX94m8
X-Gm-Gg: ASbGncs07SAUjT3rq8s47eLR/Iy+7Us+3zxKLiLbgibj3pESGlD0cw54zfiiilqkS0Q
	SEcO55zA+5hsw5PKeCnaNmmj3+1YWa2V92o9rP2K2k87dfs3RAdXmnxsNMQ1bkux4o+SX/En/N2
	ef0aeabDJEFcDrtmjZuykegUNbBBvFmho7Ugff3gs9KaQbnWVw54mkDmzbeOHkVDsTV779bcu7o
	01FeIgoGfPovMkEz5xYuzKsDCVkuSvAa5mQPeTJS3P4SnuD0Tg/H2nDIcl+DqalRPYC+1gJ8QHR
	NYcQdsTSDk1fXvfHHoYtLF4qfVaAmYHj8LnfqYru8XKvVEEsqmSfOq/d39j7PcsWvZL2/FAEd53
	qiyqiDZJSt8nxF6sgPCVBL88UKFBuTWhehqspLLFNKWHya4tZ7rnMC8s4TXasM0IZYwqpHA==
X-Google-Smtp-Source: AGHT+IEVrUrSHnJxKWleti3ip/7ssnZbESbu792noCsfEcKl9fEdE1xbBALgSKgo50vIeSR68LO4xQ==
X-Received: by 2002:a17:90b:2249:b0:330:852e:2bcc with SMTP id 98e67ed59e1d1-339a6f38013mr4558738a91.21.1759327099110;
        Wed, 01 Oct 2025 06:58:19 -0700 (PDT)
Received: from [10.0.2.15] ([157.50.95.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3399be87425sm2129797a91.1.2025.10.01.06.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 06:58:18 -0700 (PDT)
Message-ID: <425ef7bd-011c-4b05-99fe-2b0e3313c3ce@gmail.com>
Date: Wed, 1 Oct 2025 19:19:13 +0530
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
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <kp4tzf7hvtorldoktxelrvway6w4v4idmu5q3egeaacs7eg2tz@dovkk323ir3b>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/25 17:32, Carlos Maiolino wrote:
> On Wed, Oct 01, 2025 at 02:09:31PM +0530, Bhanu Seshu Kumar Valluri wrote:
>> Fix typos in doc comments
>>
>> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> 
> Perhaps would be better to split this into subsystem-specific patches?
> 
> This probably needs to be re-sent anyway as bcachefs was removed from
> mainline.
> 
I just did a google search and understood about frozen state of bcachefs
in linux kernel since 6.17 release onward. It is going to be maintained 
externally. 

Thanks for your comment. I will resend the patch excluding bcachefs.

Thanks.


