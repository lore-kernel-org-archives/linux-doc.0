Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D4048D87E
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 17:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786728873; cv=none; b=WD/QCleEla3Uf03UvGAOXPo+puPqBhaReLOvIfLIq36zip4nLZqk4s+jPfCnJlf38v1zmZdl4i4yIDXNAEHXJw9xUtnu1G5SQ8ZAe6udS0bwufZEZUHWKwhPM/IaZOXKYMiOUavvu1dTFlL/CexSEw3X+ZxdbhPePaR0S8R9pyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786728873; c=relaxed/simple;
	bh=jod5R2rzftcafJwiv09+Q38USj1FrwR73vMq9DkHyyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gNVMZ910qYhfE/FPfvCOXj9dglfIYBqSXfazymvv8cf9HaKrOsT8AE/3CVrJgrgJJpowmn/iV8pTk/HSI5lpHYE34guEtlOtSqeqdSM2nWXx2d6sNjBnlCzDh/3hJQgI32znkwlK/87Sw90NoT14+t1sdlfUh/zWwdmubKXWq8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akKePMlb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akKePMlb"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4815b8781c7so595401f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 10:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786728870; x=1787333670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TSdNv+mMjSZzf1Ktp1L1v1OUzioZX6gSzEiDVYbmWc=;
        b=akKePMlbq1d47etT0YVzI4NYkKb/8W3Zsn67/3icYN4wkpwk/oIrkGJoUKoNhIPgwX
         zkwoOaopII6pSTy+2rEEvmmNiHi+mtYbEdJXy5H6kg0MGn68MkVVGXBCgfifMuN7SRrq
         Ki9xnhpZigOu4z18Uscz3Yy7HXyCBEU+IH3GUi5fm8NfkCW3vPH1w0tlcBqQ1lzhBmLG
         nUW4mluQJCyhXD/ATiyGxzRrVoXCzFigZvqm1X9wzCIP7X91FUsw29sID1f5tPLRaUlE
         ODuqS3lg3aWYe3xxFTNABG+lKJ3lW6H+3QlVZd/pqzQYafoFiWlzsSbJxO95PF0PaxDC
         D8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786728870; x=1787333670;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TSdNv+mMjSZzf1Ktp1L1v1OUzioZX6gSzEiDVYbmWc=;
        b=DaDJKnwuJJWI/CHItkvPaUWykP6G9tcsdD3pOecJnazkZ4i1uH4LgA/dN+q2waZ1+K
         Qvb6R/Q4MzpoCTDKyUKMV7Mm7OHlgbKuvWwQqzBVRiagtYwQKk+9u2qcjhRvr4835hOM
         2TNXBxhhCN3uFicqcjAlfQCCV6+dfsb0Vm0jGaVBQpbrZcc2//duuuY5qt5iwtXvcFny
         j3xdm1vdyZHo8TV1Rqsd2QAapE3Pcc12kR2vRYVloqjqoOlXtfnwczC3REaocQDxIneP
         z+Fy/dtfE4Ttm6iAqo47Foxsla62bhlx0+R+IQleJvbft45HZ/frQedh+X0nSPdtKwAQ
         u6vg==
X-Forwarded-Encrypted: i=1; AHgh+Rqd69+fCBUIWAltJhUfVOOn3l/JfwEZmyxRsVSJQWG7NvDNPHv1dCVfdPuaa7sKyXoqPlFjolsoRrk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcr9OYm1nH7J4/Gbu8Rp/ecBPwi1JwC2KQRzeTx5Dal3yXVM35
	OCWgzZJWvj5NwwKhDb0SbfQbx6wqkZBSjV66nYlImsSy4EaF4L7RdX4XMVE52mhRJ1E=
X-Gm-Gg: AR+sD11ZCB1m/srqMn7tKlE8tj4EfaigoXwOtI9dYJMHoavU9bsuTaxQo7Awp7ud8VA
	PS6i6E8cyRzY+0S+/GsbkJcI7hOarf1+dd/sAhfG9aE2hPePVeO/94PuEGiPZgWmMb+/dDIl0hc
	S06OZ18MHgcdiBMmrNagiSCPK2Tadr/1+eC8fHO3MqkKNU5UW6x3YYrah8fz2lavz17lSTI5PW/
	P07nBjbTD9eKTZtkQSa+VKpgz4iSGPfoSUqGXm1FBfbqQiNEuhbM+zxFo/AJlbP7oJLQb3gsbpB
	3hh7OIxUwi/XRbag52JxtmwL7A65la9/ayTSf8EalfpCdyvbuPEc3rhdmz2+VJbiTQNiCGF3dPy
	ot7eEC+wC2MGjZz+KTQXt1LPt11wHrv8JjtFeR7fAqvM9r6SEFL7XjFbWyfkQbngX7SXv2uyam3
	QHQTBwpSOd1lCZ2Q/OHik50+XsROTBOg/9vpLyOgJ5c0N4n7pPY/i0XD7Z6zjL7EOaUeN7rB4YS
	vQ3LGDqqwdqTq48rP74XY0pGdalWH5PRC8QNrOjgHQ7
X-Received: by 2002:a05:6000:4310:b0:47f:fe22:c141 with SMTP id ffacd0b85a97d-4816076d956mr10260342f8f.30.1786728869662;
        Fri, 14 Aug 2026 10:34:29 -0700 (PDT)
Received: from [192.168.0.32] (cable-178-148-247-5.dynamic.sbb.rs. [178.148.247.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2b27bfsm9942694f8f.23.2026.08.14.10.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 10:34:29 -0700 (PDT)
Message-ID: <0e81cb71-bd88-432c-aa73-d5770cd81569@gmail.com>
Date: Fri, 14 Aug 2026 19:34:27 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III
 support
To: Arie Miller <renari@arimil.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Will Smith <github@notthatwillsmith.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260812103532.395049-1-renari@arimil.com>
 <20260812103532.395049-3-renari@arimil.com>
Content-Language: en-US
From: Aleksa Savic <savicaleksa83@gmail.com>
In-Reply-To: <20260812103532.395049-3-renari@arimil.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/12/26 12:35 PM, Arie Miller wrote:
> The ROG Ryujin III uses different report offsets and a different
> cooler-duty channel from the Ryujin II. It also lacks the separate
> external fan controller supplied with the older model.
> 
> Add model data and USB IDs for the Extreme and EVA Edition variants.
> Skip controller commands and hide the unavailable controller hwmon
> channels for these devices. Update the driver documentation, Kconfig
> text, and module description accordingly.
> 
> Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/9
> Assisted-by: Codex:gpt-5.6-sol sparse
> Signed-off-by: Arie Miller <renari@arimil.com>

Reviewed-by: Aleksa Savic <savicaleksa83@gmail.com>

Thanks,
Aleksa
