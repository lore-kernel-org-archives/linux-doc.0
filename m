Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647610;
	b=jmbaHOZR3jzs37rgM7t9N0nFMb2Ggm2YcaO1l1f1bIK5Em66cquigNaFMkE9BXrKvXGv
	 MPfEFs70ita4ixO/qK66HmfspFbxWFUXHkoOVIrUIE3hpLuDr+X/ngLCumjGYNBbChRT1
	 2VZYykFVdqdj9rWQ8P8ntkh54iYFkXEGeZ2Mz7pqB4255g8OIut77oG+lCZ7HHfbiMDrM
	 cd32HF0tFj0iXY3MFR3IiyulIS9MYfwFp2pQMpQhbeY9+BMnUrQBbMvt2nvz7ub2POg6Z
	 Aybc0SxT3WmyMq/8ebN62CCueHlk4v/garDOmx2bu3KQ7ejmZ0TSGibXYPoNlG/4aLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GGgFPYYG6oWLUvP1KotHDJ9Xw83iP8ii3ww9kM3hKP0=;
	b=J2FQfJ5Z4FvP0WI390pXCIElkeirYHWw79Z0SPq5GSJimBXK5aCIj8liO31brmuyDAXQ
	 snTy3jR6UYXJCeIeWwtVx50TkvjA2ThJQ9MGajE81ndBbrtgTlh9RFWqJ4oOEA0MrAjeK
	 bG1pCePi9/w0qylxIuKIyV6QS7doZZLpVH6EBn0CElH3EWhbWZDHWh2pRLC333mTL0t74
	 6TtJB0WQTQcO4d9qszC/VP+om0BxmhfPt7YN6g4Tn7jiRiLkyCuPmiy3lvEJFCIuDJmF8
	 li7qEXFFvrSQCrVus/zDIePNuKvUXcD33R9xb9xrMBfEdSHmQSxqQqjsczS1kOM97fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ji5BHOzQ;
	arc=none smtp.remote-ip=74.125.224.130
Received: from mail-yx2-f2.google.com (mail-yx2-f2.google.com [74.125.224.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61F4606A327
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 19:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C61F4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ji5BHOzQ
Received: by mail-yx2-f2.google.com with SMTP id 956f58d0204a3-67569b8cbf8so1728918d50.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 11:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793647609; x=1794252409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGgFPYYG6oWLUvP1KotHDJ9Xw83iP8ii3ww9kM3hKP0=;
        b=ji5BHOzQ1RzwPyqsk2s8cHAViYOWD/O+3bZQY/tAGPh6iajASEYoYfopk4UXn09Dvp
         a8Y3e2wrg8IO3piRB36K67BsnG7u0nhbSW+8Ju9C2+l8e4PSWFRKG3DHntj+sT/fctga
         4R6gRl67e2TJBXI2nqrqp02Uj3sBQ8yzPwhNpwHIW8R2V6i2xrLJ0gU3vj79VkfBnMpJ
         5UoLOdz12VNFiwzSkpjsJT5tWJh95TTv8UHajaoTTo6ciV2sUFHKn09peiEAe3KCubYa
         gmdR7/rtDT7RHk67imJuw2/NIFZXKHl0hTZH0cbZIjhp8KOT1bA+l8VGOwaPX59+N1dJ
         pdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793647609; x=1794252409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGgFPYYG6oWLUvP1KotHDJ9Xw83iP8ii3ww9kM3hKP0=;
        b=S6kTsix9Y9MVQCPI40wz8InWuKHpl2q93rGcImkD20SNiQmmSzGqbcsVA7qGhCAbI2
         lizNhUcB/M5VJTcn5ivlo2astlQd7q/42b/giOuzpIqLSg4mNyEAQf1ho7bjxE5dk7B2
         4S64MUeu3lc0lbr5QJNlR7r0tjLSWrWRpFQWX/+yv+Tl4ztbgKJ0cgWWgbn47+q2AweA
         E1XVjvzn45Az3M80MY7sFJO2iZw3B2LCcdURAuqyiir/lfNIxAzHUxKb5v47A/NIRcHM
         Jlcc/up+GEYiAElSjxozl4vRarVqzpvQmJNZ4id5REmLSdAdzrsSiYL73xy/6dzG41iV
         YrTA==
X-Forwarded-Encrypted: i=1; AKwUvBzbR8TIt3W5OZCjr2gAOKUT1dij3MCY5tiuvjldpuQfusnn4hReEEcItVlKXNT9qcfezkcFiNRmdUc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1TkgETUTusCKUeDDJT0WKKFPsTsSH2ginH1sWr/fs7Dq3kwS9
	S+s7UHwzusUU61uHbTlGncJCcdKnukQaamJW2DHrTOgg8vdEg+VjPmVM
X-Gm-Gg: AYBFou3iMazbHnoKvGK3q8cGmi7gHO5ZBW4JcBC90inCJVpPt4Kf7SDzTykxR5zdoGa
	hfrM07dJcO2k+emd2VSwrNmOz5pVlakqxMVNLx/8k1ZqAix3Ukvd/ZeWBxXUa3UjbH/ddVclFHK
	LLzubxYJ5ntXMcicffuvI2M5Hv5AB3hXHA2roSbWVRON5h/9i9rJKSaPlpGzdlNWPFm4E5HXkZh
	c7dJjAjeyuJG6uh8kFVuKOCxdPIWdqQyq9HvmmD2VbLeIkaYnCHY5E6oyyOjrcVJ8mho/K3PgaT
	NE23IOYRSdxl8vBRFben6p1aPd2cq7K/D470EeRe2rr3sQhp+8DJVnY0ZhxDTn0UjUb0Z34uJ5s
	MgpjltVbeXaEPIHvsI3+uyNfGdHzeM1EqqR07Zk6McK8Fa9CD2yZGCwSgh2NDqfPgxdHJ/4DBjr
	AqetibmfPi++riGfo9t01ZjI7V2Ehy+TBPi9uS/TELHugAXuk7RX3Wn69cNYgXwHDIhuyAJWLrH
	ab7LG8MJGjOj2wtCTnksuxJkoXoGGhllfxuac/vifFmUrP2z0lqgqYcc9KcbDDF4ux31YbijOhn
	/M6xajo+ojMXF9iRZSoDZJlWE5PI/2JC9Cs=
X-Received: by 2002:a53:d148:0:b0:679:93bd:85ee with SMTP id 956f58d0204a3-67ba4ffc1a6mr6007860d50.39.1793647608751;
        Mon, 02 Nov 2026 11:26:48 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf3700b8sm5719489d50.23.2026.11.02.11.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 11:26:48 -0800 (PST)
Message-ID: <d39dfdac-e0e3-4c42-9a55-fbcef6806d77@gmail.com>
Date: Mon, 2 Nov 2026 14:26:47 -0500
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 0/5] tls: perform TLS 1.3 KeyUpdate in the
 kernel
To: Chuck Lever <cel@kernel.org>, Martin Belanger <martin.belanger@dell.com>
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, kernel-tls-handshake@lists.linux.dev,
 linux-nvme@lists.infradead.org, Alistair Francis <alistair.francis@wdc.com>
References: <20261102-keyupdate-rfc-v4-0-f17419972b9f@gmail.com>
 <785aa669-8229-4909-ad33-66f0824687bd@slotpi15m67>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <785aa669-8229-4909-ad33-66f0824687bd@slotpi15m67>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/2/26 13:24, Chuck Lever wrote:
> On Mon, 02 Nov 2026 11:57:57 -0500, Martin Belanger wrote:
>> The matching tlshd change for ktls-utils is a small patch to be
>> submitted at a later time if this series is accepted.
> 
> Recognizing that there may be further API changes, for the series:
> 
>    Reviewed-by: Chuck Lever <cel@kernel.org>
> 
> I don't expect any changes for the sunrpc consumers will be necessary.
> For tlshd, as far as I can tell the whole change is:
> 
> - In tlshd_start_tls_handshake(), register a callback with
>    gnutls_handshake_set_secret_function() before the gnutls_handshake()
>    loop, as quic.c already does. We rely on SSLKEYLOGFILE to decrypt
>    NFS traffic in Wireshark, so that needs to continue to work.
> 
> - In tlshd_initialize_ktls(), after the existing TLS_TX and TLS_RX
>    install succeeds and only for a TLS 1.3 session, set
>    TLS_TX_TRAFFIC_SECRET with the write secret, then
>    TLS_RX_TRAFFIC_SECRET with the read secret.
> 
> - A configure.ac check for TLS_TX_TRAFFIC_SECRET in the installed
>    uapi header, so the build works against older kernels.
> 
> I assume you plan to send tlshd patches, but let me know if instead
> you'd like the ktls-handshake folks to take care of this.
> 
> 
Thanks for the review.

Yes, I will send the tlshd patches. I have a prototype, but it uses
gnutls_session_set_keylog_function(). That replaces the default
SSLKEYLOGFILE writer, so I will switch it to
gnutls_handshake_set_secret_function() as quic.c does, and add the
configure.ac check. I will post it to ktls-utils once the kernel uAPI
is settled.

Martin
