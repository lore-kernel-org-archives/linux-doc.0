Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74CE2F28F9
	for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 11:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724335; cv=none; b=gbKJ9o6D2/zfKCM1t3KfvAoorNIprHuWxk4YBP9OCRD8yh6Wsn9mqpfY6bJPqSHO2zy8ru5pdyksPXsIN8iVgPHHtxykc364w1b0rZ41FC+ffrtShhcQIXpcwqd4MtyBVaLqvVUTnnDgn/4TspI6ew5t+9QSWKY2xdO5TDjHU8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724335; c=relaxed/simple;
	bh=8P/0vMrJ7/1yTba68Y+FKzZMS9Q2EMuIiaaIaG79oRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JdAKNG40rv04Ps6SiyIruQHGGkriWIRH3GTEfOl/MxtQTw+TJQbZY6zc/VuTrTgePPM3kU2ZzzrZCWjhAlVhQQF/sXJdg/AzddGdSPnKmovtJXRmmMOnG0ihCz2UD9TPXGDzPwR/2lha08MS8zSHgjjHOBjlAnHLIONguwwJZ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHY9wxoD; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHY9wxoD"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-429c7869704so1624240f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 03:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763724332; x=1764329132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0xm/PimYBI7QTShSUbqekIyDmRlXD3/nFnREaHBgqw=;
        b=nHY9wxoD1kmRwMNLVNWPzFWiTmiq73lKEen9TrTGqRYT/eyUzCDUk1+HsKAG0HT2nI
         c32ujdKVRjaUaNM9ZA0i86s/MknP9pIEQVbTLvUJxczUZNNYlndw96CiiP6NXvycGgms
         9xXuOyaUpa2KEcNdExC7CJDZ/pQgS29imybc8/CNg5EDz404hjUOU8NFv6vzXBkDOwnD
         VWuPJE44JDhuNXBx6/JS/pU49Z0dTlUW+Y1EyUKOLXXeJpc5CO3CNbcE55jAGDV5kHIR
         wy9CedQbHEWuRRg21XDha0o5a7joiUHaOdsN+hZxMPUHpjQtO50aqYZ/yHLeOuUNfh3J
         dQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763724332; x=1764329132;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0xm/PimYBI7QTShSUbqekIyDmRlXD3/nFnREaHBgqw=;
        b=ewa4TqRyqf7Thh9oMQLswJe5ojRZkfrZwrJ37NwwL4wHnlHTUN+roSxfaMQJxf/2gl
         g1g9R3tzy+awsHO4qzRKW7sOx14t+c4x9vzBuE1wRYZeXsX14CWC96n8e+uhSypQ87oY
         rBeij9KDldJ38gUSpwC1EpLwGo7AridK0o4rXu+o3OFytHW1PUDMxIH654X6z6lFUz1i
         gSQL4aSNS77U6IaR9VQ6CLEFpYOfeTvq0vhL6d/6nl0wEth58n4BGoVc+xdw0JKsKq9M
         96XZWDMqxBpMMh0asbrC+GhS6Y+Top1/YHtp2pJ0r06t+GWUUmKsTUT8yb/168dy3Nxq
         BM1w==
X-Forwarded-Encrypted: i=1; AJvYcCVadAxae0vHlYhrtFeL5dLRE9Y4vWRTwR9q/rI1QzvHZsrqrvSZi3SUArTiByxBaTQISkjSqZZheRY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0rTXcJaU1dG7pXMhdrgFPqPvdLQmyUPYbYsxfhO4sIhMkJqiE
	FhEN9bJUpN6grshjFlQ44PsPfAES/Qi+ejb8ov41Ai04YiQFze0eOOQt
X-Gm-Gg: ASbGncvDkPR4JyhfvINBxEy2oC/ikjSLuziOcebWancRMTmfmfJgpdJV2/QkmtsQGyS
	byRh7jN3M+WGV6I/CmZVGNoI4WbTaZZhMChSp0Mn9hEXkYD77URXZ4vfXufez/zZxuX2QB7/v1g
	A+aoaFf6TRcp0I1Ptx8KELHszKD+FNwp65rQRVWXhQPnlSdHYf330fsNXtcPWcA3oeo6k4SyqcK
	fnhIwDaQ+HHxg7mNif6edUf28/BhMH6MqRTRGDwbSMSoTH3waesgUqxOD/fXgUM9Z9RenibLMfc
	OcZsqB7TbseCIcNalA5uQramtX55yooaY9MCxyIx4Nd6bgzVFycy8ajjSRoFPGTfq89eYFkN0xy
	xbKP9jz6cWjVjRvLjMRLxBpCvnG9tD+D4f82PP3ZkYCzVyVvAvsD2h2GfjSQYlYYy3cqbCXk6mF
	9ILFRqX/E/1ptBKH5gdfUNG1s=
X-Google-Smtp-Source: AGHT+IEQgLDezxuB/3Bt5w+9c4IjI+5mMo4URpXWEj4gL76tDkRoyLjFbJw02JhBlsBW/bbk9MSoqg==
X-Received: by 2002:a5d:5f48:0:b0:42b:3867:b3a7 with SMTP id ffacd0b85a97d-42cc1cd5cffmr1874053f8f.8.1763724331793;
        Fri, 21 Nov 2025 03:25:31 -0800 (PST)
Received: from [192.168.0.38] ([86.12.216.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e598sm10317686f8f.4.2025.11.21.03.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 03:25:31 -0800 (PST)
Message-ID: <05dd180e-f12f-44ef-96e2-2a6013da14df@gmail.com>
Date: Fri, 21 Nov 2025 11:25:30 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64/sme: Support disabling streaming mode via
 ptrace on SME only systems
Content-Language: en-US
To: Catalin Marinas <cmarinas@kernel.org>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Oleg Nesterov <oleg@redhat.com>, Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, David Spickett
 <david.spickett@arm.com>, Thiago Jung Bauermann
 <thiago.bauermann@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251015-arm64-sme-ptrace-sme-only-v2-0-33c7b2f27cbf@kernel.org>
 <176341325906.789443.15370787298292895484.b4-ty@arm.com>
From: Luis <luis.machado.foss@gmail.com>
In-Reply-To: <176341325906.789443.15370787298292895484.b4-ty@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[off-list, as I'm having bouncing issues]

Hi,

On 17/11/2025 21:00, Catalin Marinas wrote:
> From: Catalin Marinas <catalin.marinas@arm.com>
> 
> On Wed, 15 Oct 2025 18:56:35 +0100, Mark Brown wrote:
>> Currently it is not possible to disable streaming mode via ptrace on SME
>> only systems, the interface for doing this is to write via NT_ARM_SVE but
>> such writes will be rejected on a system without SVE support. Enable this
>> functionality by allowing userspace to write SVE_PT_REGS_FPSIMD format data
>> via NT_ARM_SVE with the vector length set to 0 on SME only systems. Such
>> writes currently error since we require that a vector length is specified
>> which should minimise the risk that existing software is relying on current
>> behaviour.
>>
>> [...]
> 
> I don't think we'll get gdb feedback soon. Thanks David for the LLDB
> ack.

Unfortunately this flew under the radar for me, and I haven´t been 
following these discussions closely.

Is there someone working to rectify/validate this in GDB from Arm's side?

I´d gladly review it and get it through into upstream gdb.
