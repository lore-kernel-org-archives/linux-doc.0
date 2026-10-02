Received: from mail-yx2-f14.google.com (mail-yx2-f14.google.com [74.125.224.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8552248F64
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 00:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790900378; cv=none; b=nwErp7YLyqAHq0hLvzw6EMdU9WRms0oaGLdStkRTkFRE21QDFtpamXqiGHcIdCFDLaXJXFZ7gGpAc1Du1aDrZYg+2oMjaXDOcMupnEhvIS0XkP0ldl8dFVQ1MpOpwPaTwNctXqyfystzwu7yT0Qvl7XbqGsE+YVBQnyg/OChR0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790900378; c=relaxed/simple;
	bh=ico0QIpUZP4Uo+snrQt7aZKGkSDXP3zOPooGnsV5Ok8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=VJZQpEhKfieTl/qUz01UQfKtASQitr+gi8T/1jQiUSzwPD8x9N7pHw2pJXKXXKbav28BicVc1iBk35KvtzT6M53A76rNE+YotM1004W0s/5QqwUOruj61EwQNYvmcjq7SlSaq36CgV+m5HoRAc3NDsZjv49uat8HVJ/buHY6n0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQSdpbdn; arc=none smtp.client-ip=74.125.224.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQSdpbdn"
Received: by mail-yx2-f14.google.com with SMTP id 00721157ae682-8ab42612328so41647587b3.0
        for <linux-doc@vger.kernel.org>; Thu, 01 Oct 2026 17:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790900376; x=1791505176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fSp4W/DJKok2SYpqEMEDGmT6PuCTnIyUmJTFaN2P0J4=;
        b=qQSdpbdnXIGhrFYKT/farfeth9LZBj1CVxcUBnacPK0ddTNYG6SUIXJQIpnmBTlVSh
         0DrAhVsdqtX0YgGdQ1n5YqI/F6nEHgmO9lMAEIYM4GUKfcHbDfwL52nN+ixuSTA+sMDi
         8J6nqOXI/BNxMvEbxRdTr1Yfbm/25GlhYIu0IkQan3plO+knpwkMxnxLv/kDNYn4XGW0
         GyVtxvj8THKLEKUPN5OmfQCnMKy7KnDIQKBW/IzLFNVaZTpvvODMCEdfX33mw2R7VRun
         sa+/KFIHUkh7m3tpETMsvWWPoZtNC5WK+YYJ1X9aH+t8FNGs5t/9keVRKgnAOKv2UPag
         EqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790900376; x=1791505176;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSp4W/DJKok2SYpqEMEDGmT6PuCTnIyUmJTFaN2P0J4=;
        b=15Xn/t3R+11V38e3aT45YkWb+gPtGH04Xsw5HhDYPEPzHPLfFWa1oPZvXiwAV/1IBX
         wOLnKfmIbijvXiNgZ0Oh+WHY1yA6xBJH6ExHyIi8k0ITqDvAs/Xb45K33mx2bMW3diWQ
         BUX/VPOpn0QV1eL9QgzXtOYWEvHKJwcUgDGKAuFjl9k9J0xZcsRkZwNzIqKLRILIsF19
         HMrsyFG/MBuSurct+PhBv8xsoHGC1y5U5MPmaIhKjO711JwZxHZNSZnvNz1M0sJ5dawG
         Gn+Sbdi9293pZWvm2w2r2XHhT0pep1CJACni8C7OHdwZbc60ZY/0V8EyQUJi1fOWca9u
         Fzsw==
X-Forwarded-Encrypted: i=1; AKwUvBz9V3cg4MqQwja9CkcDLo3+2aBQy/9AAlsE5AQpBkIqKxrsd7takozrjwduYPlKwRv3a+fJ4jOEAJY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfqhgmYBd7V2Sld7wICDppwB9SL/8IpiGCEEUYDK4c3fpy6k7I
	WdpVRdj/5XNqK/TDSGSPRwuplG92qlt+WOeYj4WbMJ6ArOotItIhphIZ
X-Gm-Gg: AYBFou11KEHavjonLTr9gOcoktG+ZUxUHmyCjvZidC3ZowzTia9+p10LPkuG4a5goXs
	yExx7X+EYzx8yt9cy+rV7XmqsQIwsLN3QZQlwMlCyxIKlGAddi5w188AWK8N6WUkqMeKPGILpAi
	zcREB6pBkZpTnbfNpVoqRbVYZ5y8G35qDuSNDcSrL4rXqQJfAaCidT3764xwYXbW418VIExvMcx
	ZV6VHnOlqhPceas6/umoIAjnO4ZyjLNjgUJVrL2kakCxQYDz4oeLbeB0tPd+xS6bu3rr3ROrIzX
	SUbzBR2/cI+KogeoAXtu7IDjAx6FL2RwXUuMphwO6jv0RRUDAYSO6zzWWn7NkCNJEgRWjlwrkk4
	21be0za3xI/FQukY8j12eyCBBznMmSc9qm0cD9XAxzHGxa2B8tSISShpexmsPUax4zOmmLnB1L2
	1fvlkbKddu2o3jils286/xq9X/BTWfOQmMy1OyDjgEIboCPS3+LTd74LuYR165tDmFkvmxI82r2
	xAMSIU3CQIg7xXKUNQBWlqwh/RDr1ibtqwP1G5cpZm92WWoEeQUIgYD19b6PZQ5
X-Received: by 2002:a05:690e:804:10b0:66f:9d03:fa07 with SMTP id 956f58d0204a3-677abdee8bamr306667d50.2.1790900375518;
        Thu, 01 Oct 2026 17:19:35 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae333e9a0bsm3205377b3.36.2026.10.01.17.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 17:19:34 -0700 (PDT)
Date: Thu, 01 Oct 2026 20:19:34 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org
Message-ID: <willemdebruijn.kernel.233d2609b86d9@gmail.com>
In-Reply-To: <20260930-psp-defeat-v2-4-f266e7447129@gmail.com>
References: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
 <20260930-psp-defeat-v2-4-f266e7447129@gmail.com>
Subject: Re: [PATCH net-next v2 4/4] selftests: drv-net: psp: test that
 rx-assoc fails on closed and listen socks
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Daniel Zahka wrote:
> Cover two of the basic psp assoc states that have been defeatured. Do
> not include tests with shutdown(), connect(..., AF_UNSPEC), etc. I don't
> think the coverage is worth the complexity. That should be done with
> packetdrill.
> 
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
