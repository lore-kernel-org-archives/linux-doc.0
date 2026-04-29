Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B783A6F16
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 08:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449666; cv=none; b=uXgkmZqyDydwC/BtE9sxdD+GByUyMHagQTAE0vseWqUU976lj2aecvljGCCkc/Z9GPrxaD6K20kroz2dmqlRxLC3LrbB+ksy2T6hejb1HBCUkJrcmcWgwbAKhDE5JIV8FqZ5X/cskP8XJC+8w/5KI+iuew3mHhxV40vzm3xRBLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449666; c=relaxed/simple;
	bh=ryFVdBG1ajgc0fxZzunEYPvb3pz5Q6LyDKZL3IMkZ7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TEmbjF1Hut5aozG9xBExOReV92hUOS91xIDUqQUwsGJejsYyU9Hc4HUb6VWuhgoxg/gzMTgwD/ZDzSbZ7VhguqPzCKosKQt8HVNwx6anxNLK10CaAiekYzk+FaZJ2XOnbTpRBdqcWZkZj9B5CAK3t8ybi0rNkmjhfrJ+wcmpbUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EQ0mHUcM; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EQ0mHUcM"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-445d6590940so166582f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 01:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777449663; x=1778054463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kPx/kD4WGWKxwaJpCnYAciCBrDKMYIK8dIZn6jPFTzk=;
        b=EQ0mHUcMAWKRdCgb4TcX/CqeEKHxNdkLSiYP7CwsFbuQL+LU7ZclPwBWMAbFHS6k/D
         iWxmhbPPDFg4soy/Jt9+4hjrPQpqrbVvfef74S6wKZqcs4RzlBgbc/WUEzAT55Teq4Zy
         tAGKWpZt2+wyKpXvX9dZzcWFu0Cn8NJ8daYPLlNiZ4XdqKImTCW1j5VpucqGHu2cTGmD
         BpAAd8YoK56CxYF5jIo0sRmMEq7bo7Kagc6en5M4nJLq7S+em2Qaycx4u1wrvdVMQwFd
         /CxTIGdgJkU+XfERkzwg1TUUymoFShVx9KoBkzJkWH3a/btwNSjFk3O8/bAl/WZydUtZ
         NJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449663; x=1778054463;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPx/kD4WGWKxwaJpCnYAciCBrDKMYIK8dIZn6jPFTzk=;
        b=o2FVQqpRzsAqevtRz+OEcJwi/coplhQxmGttOgTksi7kw4mUJCC6T7l1uL81n3f9lY
         YhJl+/VWnlIvVr9YtBkr2wSefXMjIrB5d1kNgmHLIg5lW0YvtbN01rX6iflmaMboKloT
         a2Myv3jVAfj5v8XHFq7gTBEcspqFejla0pa3t/Pzdev+9MMNLmIm1FO81raK62RZX5cB
         ByklvUWdSJn0kd+09WHqGtqeqOaWnmSoqNpPIHq86qLHeWGbTAheMlY/QqdISdedEKbR
         rZStXvxCdiL+Zk07+5GePtutJYDIEZe6rLJnTvS0CoHVQ+kqkZkLExAI+6sgY7Oqy8zp
         hsjw==
X-Forwarded-Encrypted: i=1; AFNElJ8IwLPlVZKPkPsQ1K3tI7LLF6uQryEaAxCk3NGAgTlg83XhmWGCzTFs5d3kiGItURTzzLv4FtKS83A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfO1aSxnt/PS3WKEXWzg+Q1JtRvFEDEZG0a2BWhvsckthQN2Cw
	SFNN1GmqXjTTG07B7l/rBNtQB3x5Aa1m2fmpF2seNFxGvtdRGygvOr/68vQ5wRSXi4Q=
X-Gm-Gg: AeBDievYVb8Z1mBASj1xn8IN2N1xm0r87q/ERq12Q2V7xFYH/tteMtrXzpJSzGVT/cl
	PdJ7jwx4Mgv4Q44U/bGPKckjU2f+pEhZJ0H+yzFAf8xamBiXBV6jkkLROB7qe39X4ufJOaNF4hI
	p1N9jUDHcT+ZGEQh+KEYFtsePbJFodImjuZAQ7aTbTtx+zh8RCgevAenihpU0TtvuU65S5FOt4z
	50xo8CXmDJjGWzAELn4VMNCWr3xYCCFpdtSNGa8xR7KXxpT85pgdsO7o96cwzYRQFSoPjAvCG6B
	hOfAzWM3m9yYaZ5KvNRag7DYkkawTG8o/PDbctOWI2Fo95L4pFTzBvHjdv/Y1rqj7pRmoPdWzN1
	DaKo2ac5RTCu7aVRLsyrLdABzE/3SPmD9Ek9X5V2TYnpubsfp4YFPXRivIrXZV+IdMqN1XYqHuC
	fpuThE9AKBP4+FRTskGbe72Khki7icHusXOW+T16eLsi+xlmA2st3De4p7ySOhn+g+pz6w
X-Received: by 2002:adf:e00e:0:20b0:445:c2b4:a284 with SMTP id ffacd0b85a97d-44643e18116mr3536239f8f.8.1777449663151;
        Wed, 29 Apr 2026 01:01:03 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903:1ed6:4f73:ce38:f9d4? ([2001:1a48:8:903:1ed6:4f73:ce38:f9d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca6451sm3922019f8f.36.2026.04.29.01.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 01:01:02 -0700 (PDT)
Message-ID: <1a9ae46f-b43a-40fb-8bd8-750c6e17dd01@suse.com>
Date: Wed, 29 Apr 2026 10:01:01 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] Documentation: RCU: adopt new coding style of
 type-aware kmalloc-family
Content-Language: en-US
To: Manuel Ebner <manuelebner@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 rcu@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>, linux-mm@kvack.org,
 "Paul E . McKenney" <paulmck@kernel.org>
References: <20260429070759.309110-3-manuelebner@mailbox.org>
 <20260429072320.310817-2-manuelebner@mailbox.org>
From: Vlastimil Babka <vbabka@suse.com>
In-Reply-To: <20260429072320.310817-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/26 09:23, Manuel Ebner wrote:
> Update Documentation/RCU/* to reflect new type-aware kmalloc-family
> as suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj()
> and family")
> 
> ptr = kmalloc(sizeof(*ptr), gfp);
>  -> ptr = kmalloc_obj(*ptr);
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> Acked-by: Paul E. McKenney <paulmck@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

