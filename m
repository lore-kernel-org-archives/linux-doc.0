Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C6438837D
	for <linux-doc@vger.kernel.org>; Thu,  1 Oct 2026 06:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837490; cv=none; b=MrNH+YM30YZUJg6Jw3oB2YSPSKl7YAi/b9MRJMPW5Omw17aj2V1AUta480fsP8OmnNGdppUu9TYUtKKydtDeENYpW+BdXh5nvERygBdj5dd335cJQGy+/slSHSdK+ZnA2w2t/29JgFV0XUqnoh0jJafWPxz0vubg/E1tTZ/QAoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837490; c=relaxed/simple;
	bh=3Ocphbxw3GOnWpw7cWSG/ZgxU06mpe0FYivqYzPCV2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YBfiOZQYmHrRBvbBWGN3Az2AS+iWHTBkWrZu3pVJrqRKYm5dzNJP1EN92B9Ue2xiqXq8fkwRXAXf+EWa6uCqkau6xeecipgDSgV1Q6LhshF661QBTQMKVpj2livDVzellDLjnGD2wrKCEczG4g8OLZ/RnD0WKeM3+pOx/I/YLRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U59KlwlL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uKsEMe4w; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U59KlwlL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uKsEMe4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790837488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tzR6xXnTUo4U9hvgl4eSPzMJqUVuWFEfr0d9ZfLkYJ8=;
	b=U59KlwlLsDJ/NzmYfVJL4eOgm1ObZJfM+VVkxz18dHCGig0Z3wRttE0o5vhiA/dwk/dFef
	8CQpjLqqrDVJeNY3/W+ipcv/aqF+wSNlRlSZM+kcH7eiPvZlMjUuGSloV9tKdMnCxwOvuz
	X1Oelk8pB5b9DvE+wBeZWW+aAQwi/ls=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-ddnuuUMINzKm8j5vRKezTg-1; Thu, 01 Oct 2026 02:51:26 -0400
X-MC-Unique: ddnuuUMINzKm8j5vRKezTg-1
X-Mimecast-MFC-AGG-ID: ddnuuUMINzKm8j5vRKezTg_1790837485
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f2de3ba47so4693997f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 23:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790837485; x=1791442285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzR6xXnTUo4U9hvgl4eSPzMJqUVuWFEfr0d9ZfLkYJ8=;
        b=uKsEMe4wauc6OlvYgjOqWfOfqLYYnUdYH17n8q8H6wSNt/nLcWbn3hnhKSa3IPIGLr
         eulCFGHpBrRRQnb8a5VOYXkYhLzLsHDCGTuSYNIPSR+lGCe3UJtSs8UQPIAtyDQQ4MWc
         yRn1shsEtI1C31bt0GoNlGKHkkbz1M8DUQwfRFFZT3je1cc7FvEyDUpZo78q4kTX4P4o
         905S5v4CblyfGNiUTmU60jny3o/SKervYuFqGZkJelfQJPqLPbl0ip461RgVn/TTcl4r
         bC7tXTEiFoQpOcXlc5g7b/EX/hpbpyk6co9iSGBKGWnBdOs//r2S9DrlCgjONfvtpE1J
         mJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790837485; x=1791442285;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzR6xXnTUo4U9hvgl4eSPzMJqUVuWFEfr0d9ZfLkYJ8=;
        b=LtHeSLdom2VChoXXiaXKASCDAsi1M9KUqSXl7pGDmbqJhDwvLj3oW+jiUJlNaW5vIz
         wAlbQR2kp3XND29A7Hxj7Vdr2ehzHkfoUL3eJAWe/R26rCJzDJ7zM+HkLQU7TJGWpCgO
         qtnB9+na35p84NpSdD5JoXL28j1HhNdc5j/Em4dPFwTY6+QgSDmAj95zK0i3CGxRcUAl
         eG3EooNrtAP/n/QE35cI6QOpJha0sZHmR8DD+Iv4nSDJhnEZFERCXmqXKrEceICyRJH6
         j1pNSN+ef+AepXOd/iMckd1IdTA8fDf7a1hjqM0ZVPw/SQP9iwRU8WsqBXBa2YFryWwQ
         EwBw==
X-Forwarded-Encrypted: i=1; AKwUvBxaPsd4X3Pou+TALQMQgkBTa2Xvh4D9uMWyNQmSjDjPTYeh6E3owWgzsQ7C/Jjrkcjemb9jXrMhg3A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSQh79+976IIBCrsRPCQwVd4YbL1Zyj+Kv/omEExYL1bfDICVb
	Jytgasn3nPruuR5oU8d2bkoVrUvosSOcw6w38sVfBBrqyurPV7SgFelxj+PDfF36hKLsQddYMGz
	dVJ7eGcAVBef2MBh67GwvdDvDLo8Po0lxqjw0MiEfiTwgMpGglq47A1eisLOETtkgm8l7tg==
X-Gm-Gg: AYBFou10bQUgAXcf6TBaLGoHNm/yaCpjp1EACZwGOraVJkVRaYywJNK8gkU2vS3KXNn
	GDXsqf1VFNLY92+VvMfA8oANuxc4zD8uUC1+ry9Bmb23V/iu2UDY+tTduZPmVHK08pQyIuMWPix
	RkLF/WG9t34irj1ermyBIXjPqeNp0GI0TTWp4L72J2NzTfBRkkVBhL/BLCUxJ8yEYd0wCsPHySR
	J2CEvN56+ib2+bmb7OHnj85p5gctI5k4WX7OwPzBkqr/QLqMUovom6jxu7gIbgNDipLt9Y3qOhi
	HCDo3uML46bP5ZWqZbct2jFr5TbMlMuvj2EhvJNiF4pYtIUobdkJgMJ1Bce9cBBlnl9L/RM=
X-Received: by 2002:a05:6000:2201:b0:488:8da2:4b16 with SMTP id ffacd0b85a97d-48b024283fdmr6873143f8f.8.1790837485195;
        Wed, 30 Sep 2026 23:51:25 -0700 (PDT)
X-Received: by 2002:a05:6000:2201:b0:488:8da2:4b16 with SMTP id ffacd0b85a97d-48b024283fdmr6873121f8f.8.1790837484823;
        Wed, 30 Sep 2026 23:51:24 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.114.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff64asm3689444f8f.10.2026.09.30.23.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 23:51:24 -0700 (PDT)
Message-ID: <c6cea3a7-4ca9-43fc-96f3-9b389f3d60da@redhat.com>
Date: Thu, 1 Oct 2026 08:51:22 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] lib/crypto: Add documentation about zeroization
 of key and context data
To: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
References: <20260916095022.604354-1-thuth@redhat.com>
 <20260916095022.604354-14-thuth@redhat.com>
 <20260930201434.GA61218@google.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260930201434.GA61218@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/09/2026 22.14, Eric Biggers wrote:
> On Wed, Sep 16, 2026 at 11:50:15AM +0200, Thomas Huth wrote:
>> +What to zeroize
>> +---------------
>> +
>> +The following types of structures hold sensitive material and should be
>> +zeroized after use:
>> +
>> +- **Key structures** (e.g. ``struct aes_key``, ``struct hmac_sha256_key``):
>> +  contain expanded round keys or prepared key material.
>> +
>> +- **HMAC/MAC context structures** (e.g. ``struct hmac_sha256_ctx``,
>> +  ``struct aes_cmac_ctx``): contain inner and outer hash states derived from
>> +  the key.
>> +
>> +- **Hash context structures** (e.g. ``struct sha256_ctx``): may contain
>> +  sensitive data being hashed.
>> +
>> +Not all of these require explicit cleanup by callers.  Many ``..._final()``
>> +functions already zeroize their context internally (see `Automatic vs. manual
>> +zeroization`_ below).
> 
> This should mention that the raw key that the key struct was prepared
> from needs to be zeroized as well.  Every in-kernel user of a keyed
> algorithm has to deal with this problem, as to "prepare" a key, you need
> to have the key already in the first place (whether it's passed in from
> userspace, or derived from some other key, or something else).
> 
> Zeroizing a 'struct aes_key' for example is kind of useless if the
> actual raw AES key is still in memory somewhere.
> 
> Any interest in sending a follow-up patch that clarifies this?  It
> really should clarify that users of cryptography in the kernel should
> apply zeroization to the full flow of their keys through the system
> including system calls, key derivation, key preparation, etc.
Agreed, adding some wording about raw keys makes sense. However, I'll be 
very short in time during the next one or two weeks, so if you would like to 
do it, please go ahead and send a patch. Otherwise I'll look into this in a 
week or two when I've got some more spare time again.

  Thanks,
   Thomas

