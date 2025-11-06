Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A83A322C9A
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 12:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762430636; cv=none; b=NVAr+XZQIuKrkH7Rj9g8Mlw60GSwBLmv5UAWLzH87C6NsjyiUZ/Kgo2dBOlR6SGwJCD2GQ4xULxSKuMm265v2fwGSdbVI47KVwM4SYS7fCScyoA2KVDC04pjXJo3drDqdb2aZBDy+7IQd8/bhvM/eyBPkR9cwhAgFa4Fd8tGId0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762430636; c=relaxed/simple;
	bh=v9zYAiaJDgaVQYcRDd7YfoPoVoAk9XCmhHvvjCZbve4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=TIIg28oT7K0N6eq1o7kx4EOjXSTK2ftyBycGuloMSz3pWQRWwupV/dkAWzXsV2qgJusbuFfG9WX+nehqBiyCQzgL4UqxruHo0ow5W8u/CiWsNQuSSNVzxlzZPTrJnnFz+ypvSEDoq+z7symLtbyy0VDQ2oeXJ/PQ94wNL6N4iyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dqe05Yjp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qI/KPMzH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dqe05Yjp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qI/KPMzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762430633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ueWgB3UuWMfwahhLGkCf04/sJ0pj16YsiviBfXwtyZQ=;
	b=dqe05Yjph2qfSWAzXpsqA0nxsqVXFVJv1kzB4ZFPvtf+QE9GpVcz5RNOfRFzOsG6miTq2K
	SAYRySzV8M5L17NIFi7gJJ9iJ/R/kRQDCDNBtRn5lNsTNQctxjRMUGPdsagR3sCO0BG3Vu
	ed312WjKA15WkQPuJ8CZBkvqq87WcIk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-Jf81VQahPMW-24HJNFANrw-1; Thu, 06 Nov 2025 07:03:52 -0500
X-MC-Unique: Jf81VQahPMW-24HJNFANrw-1
X-Mimecast-MFC-AGG-ID: Jf81VQahPMW-24HJNFANrw_1762430631
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-471168953bdso11386865e9.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 04:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762430631; x=1763035431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ueWgB3UuWMfwahhLGkCf04/sJ0pj16YsiviBfXwtyZQ=;
        b=qI/KPMzH2fpKbal+l3E7zR3TnvZeJu9i7UA6GyY3yXkGNiCLCXPfYUZY093x1VPRhz
         1nNszLnZbIwDppOJWC08vNTPcWKUg/4WC2awORe8uRytY+r1yLOiGR9+QqvZNPjGvhI+
         dBhGOhIyz/F464piAfkfvAfly7G3d/5BKX5p86cPes+/8qrPFeBhTtrvntxHJqqTAyov
         8u/0BuE4nppDQvL6HKR0mG9XLgO9Abu0+3UkLmemeKxFU4OFzv+RiSnOCzw0RDAL9sgd
         ee1kJbJiLXV7jSHI8lfg7Kp7nsAxIYDKmN5wBs9f7tghfh5AIb7U5LFLIuX+XsJdUmO2
         8xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762430631; x=1763035431;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueWgB3UuWMfwahhLGkCf04/sJ0pj16YsiviBfXwtyZQ=;
        b=ABuJddbXWFUzlzkWrJfcAa1WJRV3BkepwzaT0/b2LDv62EOdDwxfK3wpvH6cRtA7uh
         9EsswjXJuqZA5zCNyvy9LjfXL+Vx5QI8bDEsUwI65o7C0t7Cf1SFUQcyMiklW3ZjMKdD
         b7og4Qh1hHAcb5/ARDEQcOLsMUhjIxPWOPDtNrhvaCOBSZiAR0cHpoy644wFVGzC49qB
         +QJSYTBC2Dj9qH0VXu+3CqLt81g8HAQJ0xWdziCiss9ZJlYfgGA6j6spD84EUliybMl1
         Rf/o2zf8QjB8F7QNZ5Jj/mfXoRJ5ALQKlksmWk2nuAsGomCSwSEOZmtn6A8ibLJ/ir16
         cXIg==
X-Forwarded-Encrypted: i=1; AJvYcCX0bVYB2N9nDXXe69jLgsPQVc5VRHloAE3enV/LRyPHK+xrvhR2sv1KeGRNVSbwQLd9m5Gn5sO8YYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNWthRsG2V7QjKYylTox+u2ulwkp7JxudQTcSV9mTTrsCBb5l6
	A1ShV0jb5gXHmEM9vq2m9uPGcvgGJmWXQOmuhRS4sA1N27geOlo5N1uIVnA6TwipWIKhFUow9NR
	9fNZm42EJVc9DsbdHxoGR+Imllx9FoOCyKd19yA4ZTHTig5PHouMp0uGVDXTJzct7Rl7Irw==
X-Gm-Gg: ASbGncuKOS7ye4wT/rLgv4pPvcATV9JW4di0dXjbxh4JaEY0lha+ExZqgUtj3PYbcyF
	S7/aPL1b1zWXATylCJPKGF2MzGHB8aPLQcl1xbqZ3/rZseJdNopkLfmBsGGuGsACHaU2Ku2p4j2
	/Hgr6cObfDKwfuwKzhjIlhfA8deTDfipDlfuAV9cLUMoFAx6fKPpDdN0BN7cBxvW8wFB2CbIXF/
	64aEZj6MCtiuct95ObH5XxfFkzxnCpdF5ClgPix92TDvikizBmK7FgitJHO7cvbxIJ7AMQHzsOD
	GzznPGbNgCeRgwQOR/vrPW01oQaDCeGML2xK1OKxwsA2X7aLk5x6/i5TUa2JKC1MlSksxwJfx2J
	kKw==
X-Received: by 2002:a05:600c:a39a:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-4776728d457mr11279875e9.1.1762430630996;
        Thu, 06 Nov 2025 04:03:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXHeCbTPXP2ChPwuD9fei6bqVA6QG1MQwNS8dtmzbVKzxYBA9LAe71TTJsAmwhSLucuFcwkA==
X-Received: by 2002:a05:600c:a39a:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-4776728d457mr11279615e9.1.1762430630560;
        Thu, 06 Nov 2025 04:03:50 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477624f804esm44269685e9.5.2025.11.06.04.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 04:03:50 -0800 (PST)
Message-ID: <544ea239-525e-4ece-9523-0ddf42e99af3@redhat.com>
Date: Thu, 6 Nov 2025 13:03:47 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 09/14] tcp: move increment of num_retrans
From: Paolo Abeni <pabeni@redhat.com>
To: chia-yu.chang@nokia-bell-labs.com, edumazet@google.com, parav@nvidia.com,
 linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org,
 dsahern@kernel.org, kuniyu@google.com, bpf@vger.kernel.org,
 netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com,
 kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com,
 jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch,
 donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org,
 ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com,
 g.white@cablelabs.com, ingemar.s.johansson@ericsson.com,
 mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at,
 Jason_Livingood@comcast.com, vidhi_goel@apple.com
References: <20251030143435.13003-1-chia-yu.chang@nokia-bell-labs.com>
 <20251030143435.13003-10-chia-yu.chang@nokia-bell-labs.com>
 <4eef8fe1-b2b8-47c8-a21a-bcb4b75c3a0e@redhat.com>
Content-Language: en-US
In-Reply-To: <4eef8fe1-b2b8-47c8-a21a-bcb4b75c3a0e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/6/25 12:56 PM, Paolo Abeni wrote:
> On 10/30/25 3:34 PM, chia-yu.chang@nokia-bell-labs.com wrote:
>> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>>
>> Before this patch, num_retrans = 0 for the first SYN/ACK and the first
>> retransmitted SYN/ACK; however, an upcoming change will need to
>> differentiate between those two conditions. 
> 
> AFAICS, send_synack is invoked with a NULL dst only on retransmissions.
> Perhaps you could use that info instead? moving forward and backward a
> counter is not so nice.

... except you need to propagate the information to nested call.
Possibly adding a TCP_SYNACK_RETRANS synack_type would fit?

/P

