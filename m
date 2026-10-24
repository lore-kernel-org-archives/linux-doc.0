Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792858398;
	b=ujiDSLatuxGDHh71Sn/VLfXxU8LpoAxvcwmZGJaF8i2b+N2fJdaxhJ3qm9H62rKYdtLt
	 kufQuewo6JO3hyr3t3t4MBFSsEOUkNtqbfcC1WDXti3jlMBjiHyATu41eAuXD9GC8w2lz
	 lONfERt4O8Iu4+tCFNfIfDKWuqmXVGGcW4ycNuqsOKo0UYM+dE4au3Ma4gDrGR4uRW9t5
	 7NP3bVVPjM6Urm9jrym6sdFIWFiuJPfEjDTMkFPHHO/UrD5Z5dSJq0ZMGE7bsL4dkuKv7
	 XWMmycN8tX0lVsEthgQ3ddmgjncqvjy5PU5BY1xWne7mHSejoiDKVsnwkRGmxdokFfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792858398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8m4A9jkTkwuo4ipkSykg8HyuJpfZHAGONM9dzpmnNxQ=;
	b=Cev68ZFMIHWZyfDuEN+L2LPj6es/lebO5hIqqfkPpbLdYYvakOcmu2UIuP45Te28cFfl
	 cWCcyQ5zLU+3QpPBaTPL1HO0T8k8tWF08sKtkxk8VzkvKKNFeazr5GWycmugNuUZlXn5V
	 G7I7FEa/lS1WiS67AZTjoe+ktC8GXcWChT9sQcxAtKArsUJVvlcNWuW3FBtcIRzY2Ufbf
	 hnzxHRFd0fw3wDBWz23jK1jNg/I57CYHIzMKVu1xaX9UdT2UAP+OqHVYx3x1ajneKowXK
	 FuzyZ3xTUKjcDRnygfcGzX2iSBjqjQTfQ/HpwElmF6CHbukAW0B8jcSP6EtLt1tHbQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LOwkl1uJ;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49708606A31A
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 16:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49708606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LOwkl1uJ
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91b8b456dbeso21175936d6.2
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 09:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792858396; x=1793463196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8m4A9jkTkwuo4ipkSykg8HyuJpfZHAGONM9dzpmnNxQ=;
        b=LOwkl1uJjZXsyTq8dwsJoMHwAKpGn77KQcY3H0yw23C9r4dTTVvcDlgLDEikbuJY+4
         Ao/uvrFCciO3LdnUywnotj6RN588OeRabGyqdlDG6XQrn6ecjwoIvditQV2+okx3PRCI
         qHAIDX+fcPbPxKJjhJovUMMwo18HTYhyyYX9IsKIWYcCnr0gPBFPAXGfL7MeNpu8AHSw
         q5TB07O1KXthKywbT/uBoivV4wNHY7NJPxPO5X2zf+pgbqHX4Fo4HmW7ob34IHZ3JLbD
         mx8GEW8h3wxFZVouORyiokQDKPFY/dzt/l3DWAqoTKEUvyefvizzCr/ZNem859PHjQ2D
         K1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858396; x=1793463196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8m4A9jkTkwuo4ipkSykg8HyuJpfZHAGONM9dzpmnNxQ=;
        b=zitFA0DXmzfl/IseJKiSo18AOE0lGMjVaVlakvGZ57D7X570myM1SOlPxNNtX8iZd5
         HqCHGFjX7vYkfYnqs2qtZJ1ys99hCL3jnk7vnr65n47A8bxq+JRCSJ9RDRg/v1++SPdy
         gbrTZiRwzspDMJQXa2FDDmIhvFtccfoVQYY/FFH1RSeBRqPW7xACDwAIHwVWh1KBeiGs
         XzjfX5180tQ2UZ79ENTu9r88uL0D3ddNEI1CF9/Dm8w0s6wNAEydINYozgjMdD9AACBS
         y6G9PJu4jJJT+CbqodfZqReYFG9DYt+EZFEt0W6Y8I6+uktWLKionOEofpEAseg5Vm+i
         WREg==
X-Forwarded-Encrypted: i=1; AKwUvBy3NSQLubV6B6ru80rHndmddNaToMRkD2tktTSVvTMDlSo/7FLmbOSzuIWJzSpcJigbiwbi0E1D4n4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIlrGvOE5Rbdi3cP0Zad+5LArhaVL3e5EgTejEcVaAysMFMgG2
	PU2v8eBeI2PaVUgp3MVwyuUiCBZGxxSAJMYTsh28XuBybxdspxOXD4EDW71I98RUi7M=
X-Gm-Gg: AYBFou22i34JVch3z21wKrVjzynZnnEAe2hF0vGcmvISek69QKqJV1c0rYfV0cFoRe/
	anfOfuwvGfB4QuRBVF8ryY4k+jX2Nu6Z/fgDbb1QsTG26FWeRYqP9p08YrrImpvv0Noav+tRidb
	fCjlFpswjMwDLAq0EffyQ5T+5ZptNQMPZ517v3mXdvnyLg1v14HgnvVso0uao2nM7hIbZN/Qaoz
	93a15Dy9SlrXP2QCZUM0dSFz8rtyfXgXiyj9T5rUKrEensXlne0izKDo/CMktPCqqBjy/v89WhX
	3EmYZxFkr8ex8YkbqvNEtVf0mJmJcv9p1tDK8kPCTiiL13Ak/vcky7ofTRS7pxs3/BqzUUlYZrm
	Ub7SONqOd5+RWnYhHa1/s/kVPszedS2Y+FvNyhPqU4gDQfZgQqU0/FzeFHf2ihYxkK3amnSCH+N
	TwtZB63VXZXSHK3zs5jcmXzNfs/LxUAJiu0mV7PXzjU8J+eUOEGtjl4mQcf2YFGRgkAscrDqpPt
	RJ+LtgAOXOlaiyPjhqXChwYAtXq31+BRmsk8p3ZntQYxEOyae+nsG3qXpLXu7x06FQorbGYJdO+
	thB382n8DcvKSoNs0OGziDif6QqjGSHMiJXZfjfXSHvjUMMwTP095eoHGY1zbqYBzjFofUMIpBN
	lum8oE00BWkDNrLDmrqLONKiesVaVY/wvzfw=
X-Received: by 2002:a05:620a:4515:b0:93e:fc4e:c490 with SMTP id af79cd13be357-940ef913660mr339909185a.15.1792858396158;
        Sat, 24 Oct 2026 09:13:16 -0700 (PDT)
Received: from [192.168.0.124] ([134.231.41.122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0a9720csm210593385a.42.2026.10.24.09.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 09:13:15 -0700 (PDT)
Message-ID: <59ad0f62-dd4c-4d42-b50a-ab91bf469fb7@gmail.com>
Date: Sat, 24 Oct 2026 12:13:14 -0400
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
Subject: Re: [RFC PATCH 0/1] ALSA: add PreSonus Quantum PCI driver
To: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-sound@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260820083646.11383-1-nicholas.johnson-opensource@outlook.com.au>
Content-Language: en-US
From: Jamie Steele <steele.jamie1991@gmail.com>
In-Reply-To: <20260820083646.11383-1-nicholas.johnson-opensource@outlook.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/20/26 4:36 AM, Nicholas Johnson wrote:

    The driver provides playback, capture, raw MIDI, sample-rate control,
    clock-source control, XRUN reporting, and surprise-removal handling.

Hi Nicholas,

I previously encountered sample-rate switching problems with this 
driver. Another Quantum 2626 tester has now reported similar behaviour 
using the August 20 RFC with Internal clock and direct ALSA hardware 
access, without PipeWire, JACK or a DAW.

His 15-minute 48 kHz duplex test completed without new xruns. At 
requested rates of 44.1, 88.2, 96 and 176.4 kHz, measured capture 
delivery remained around 48,000 frames/s. A nominal 10-second playback 
at 96 kHz took about 20 seconds. The actual hardware clock hasn’t been 
independently measured, so the cause is not yet isolated.

Full setup and results:
https://github.com/jamie-steele/presonus-quantum-linux/issues/34 
<https://github.com/jamie-steele/presonus-quantum-linux/issues/34>

Is this a known issue, and is anyone already working on a fix? Is there 
a newer patch series or development branch available to test? I’d like 
to avoid duplicating work if an update is already underway.

Thanks,
Jamie


