Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA54A317167
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776953911; cv=none; b=fvsKzwVoH9Uu7g0h12BSfSks0hk6uOgEk46JDq11LMuDCcu+6btylMOVbGD101RwJYDyHvnq2RPOu/3Nlg3HR6l1h/UXvi9ktrxtzWX8SG6kpI52XIvrEiBTytvQtpZEO+KXCeze0gxaBTF5r9fm57vvJfQql+xz8ofowOmjLkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776953911; c=relaxed/simple;
	bh=ClZ4xaF+75tE/H7H8q9CGZtUI27S/faw1Lq5OD0A4j4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tF1J+Mb2J/Uu5R5RDwlwnUNJrz1VJSyFZJTSYZy2JalqM3VKkWsI2Xla66CUVtLfTnnLk/tsHh5oOaP6Xn53OQ0z41D/Co0tMrHkqD1qlfYRVeluZLToCX2JPdnRXZ8qckxndjsoKCLW2H+Oo//sPceeiaa4qQgaALAu0XsouEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E8gEW03S; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=R6dh0Fle; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E8gEW03S";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="R6dh0Fle"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776953908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=smVdIyCG1HCwZ6beFTzK3ARuW1P/bvxD1KH9T2KrE50=;
	b=E8gEW03SNP8Dzk1whcCh7NekMfazmj7GpqgIUAjSM8xdH2AlzrL6mXcB9hvr7Vt+oWYMcP
	EQVpV8z6fcAlvp+FOgVWum0a/I+LODONqtUEkOhI/5QFgFMfMALtX3vDdUT+9rKuwE05p1
	ab5wS/k0ntYxMMaABQxdmvJjmSTDvOU=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-Tr9V96LaNC6XDXbCTZbIRA-1; Thu, 23 Apr 2026 10:18:26 -0400
X-MC-Unique: Tr9V96LaNC6XDXbCTZbIRA-1
X-Mimecast-MFC-AGG-ID: Tr9V96LaNC6XDXbCTZbIRA_1776953905
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b461b36990so71592225ad.3
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 07:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776953905; x=1777558705; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=smVdIyCG1HCwZ6beFTzK3ARuW1P/bvxD1KH9T2KrE50=;
        b=R6dh0FleYiWofxxbOq4X2pBr48sjmZd3DKgp2v0QkwEnasWSTFaQo61VJFm4/cBqQp
         ap2JHOYrBAvupC6v1vRSwSKtS2EPl2+yJuP2Virvfn48hDzfWWRrHl8UXqpS1yb+S9Cc
         8YNJpUXhMNWKheZBcSaBEw6CisQYF+zQPYjpFcp4JNbMOhtVgQ0dohvwcg1fBxLRmSZW
         pkFdwjDGtNuhnDugilmEe9OkANA72xKwAmG+O72AdPqHdKopYbUQGm01VLXutzXCVYTm
         UYRjsWcs8Ei+imf8ZiUGSrCsGmzO4/VX3WgOB4pg1GS53oEkzLVc7FyZnW/GMZmhjvda
         WByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953905; x=1777558705;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smVdIyCG1HCwZ6beFTzK3ARuW1P/bvxD1KH9T2KrE50=;
        b=Ts/B7kI1Rs0jj/bP8/j03k/V1cm5LVfVpx8ltNQZo46mOkVWCUBp/AlaaNGMutojw4
         2sO7R1HMZzrkZSHD+Vu1UD1wG8j12vGv7C31EOXevsDbnkwwe/f4gJZD+Q8tmmaPVX46
         Fq/VCWn+uR2cR4ibPoi9tDVEfDbiWlLKghLTlN51A/qVEXWXkR9oUPc/rTltGWN9jjAW
         P4EYjDCIcfmojFzJtRYiY5DZkWfk+WbSNbi0wfVvi1Pb+KJubTqwMxIs1QaPHz1PWNVI
         jcJHUHMc3QdlI0wgTHIYoiCcmAQwKpEzPVah7kfZ3qltdej0r58HaMYreRLSPfIq9MMz
         f69g==
X-Forwarded-Encrypted: i=1; AFNElJ/Cy22I2xj2FzURNAXCYxdnBkX3TJDb4eCknhVXwJ4uX/AHYG2xgj2gKG8+v/nxNHwbrE3h+70c08g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCWp8PmwH86574FEl2ays/8B+YiLMGB3GndZQsvqSqKUOobkjh
	O7hJXeNa4r8iecCtRaPMxfMkQBybqHeuZbRgiAYpLcTJ03X32Y77NQ7G06PqGVWtH5t2RIj9CdC
	s0iW73YxqAMnbTRsjRSVYKtM8gbGanMiHBk99Bbcl7TWHz1iLmzFy4nHyM55/dQ==
X-Gm-Gg: AeBDiev5UcwOzMwZf/ehXDEg8rkspKoHAJhUF+y/6tjj7pYJVKxnZ9E6/iraEom+QX8
	Au4QSllsnNtClFANQ9H2At7mlvJ3kSMyciuVxGJpy3TLUEk0ly+5QjAtdq92HwGXc0o7sZtSYXh
	ilMO+TKpFdoJJVin2Nt0emeh1svVxpy+H3Gccxfq9F7A5JWuY6GgtJinnqC7IWeVy1bK3qWKhri
	rejNff/Ve6t6LC7I86wW4p26On/KcIeuGMv7l+HFDAZ9FzAwQtOyN5xnwVrf2TR3b7aYiAsfosM
	AmY7hb+Qdw4YsTajOwLN+eZG436PSS5cP1Kxv/6eWERmzWKKmGAC7jRNBrnxubzeQKiQMnh/d6/
	WD2ZIqz3EHJIS7PMdvYio54Yd6o6YGoaXUQnfwddcmWlP5mOh9aeHv/cRtZIPf3HmjC0=
X-Received: by 2002:a17:903:1a88:b0:2b0:5ec1:97c1 with SMTP id d9443c01a7336-2b5f9e85ceemr278654525ad.7.1776953905280;
        Thu, 23 Apr 2026 07:18:25 -0700 (PDT)
X-Received: by 2002:a17:903:1a88:b0:2b0:5ec1:97c1 with SMTP id d9443c01a7336-2b5f9e85ceemr278654025ad.7.1776953904639;
        Thu, 23 Apr 2026 07:18:24 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab20695sm194915885ad.56.2026.04.23.07.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 07:18:24 -0700 (PDT)
Message-ID: <534ef6ba-e4e8-4ddc-aef4-196e7a91e81e@redhat.com>
Date: Thu, 23 Apr 2026 16:17:53 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
From: Paolo Abeni <pabeni@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 federico.vaga@vaga.pv.it, carlos.bilbao@kernel.org, avadhut.naik@amd.com,
 alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
 2023002089@link.tyut.edu.cn, tsbogend@alpha.franken.de, dsahern@kernel.org,
 jani.nikula@intel.com, mchehab+huawei@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, tytso@mit.edu,
 herbert@gondor.apana.org.au, ebiggers@kernel.org, johannes.berg@intel.com,
 geert@linux-m68k.org, pablo@netfilter.org, tglx@kernel.org,
 mashiro.chen@mailbox.org, mingo@kernel.org, dqfext@gmail.com,
 jreuter@yaina.de, sdf@fomichev.me, pkshih@realtek.com,
 enelsonmoore@gmail.com, mkl@pengutronix.de, toke@toke.dk, kees@kernel.org,
 crossd@gmail.com, jlayton@kernel.org, wangliang74@huawei.com,
 aha310510@gmail.com, takamitz@amazon.co.jp, kuniyu@google.com,
 linux-doc@vger.kernel.org, linux-mips@vger.kernel.org
References: <20260421021824.1293976-1-kuba@kernel.org>
 <65cf5447-9876-40f8-a802-ed21b976a91c@redhat.com>
Content-Language: en-US
In-Reply-To: <65cf5447-9876-40f8-a802-ed21b976a91c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/23/26 4:11 PM, Paolo Abeni wrote:
> On 4/21/26 4:18 AM, Jakub Kicinski wrote:
>> @@ -2316,9 +2316,6 @@ struct net_device {
>>  #if IS_ENABLED(CONFIG_ATALK)
>>  	void 			*atalk_ptr;
>>  #endif
>> -#if IS_ENABLED(CONFIG_AX25)
>> -	struct ax25_dev	__rcu	*ax25_ptr;
>> -#endif
> 
> AI reviews notes that this leaves behind a stray doxygen comment. I
> think we are better off with a follow-up that with a v2.

Or even better, I'll clean it up while applying it.

/P

