Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0608287E
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 21:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766180301; cv=none; b=VCd8mzuxrp2uxwK9jloBBiBXAF0DZlsIUxI/Ft1GF0x/DwxXR2F5nW8wOOwHnRVFiVz6tYW3YJ/lVBMzdhvh135bK5xvbXtKB6rytLJ82YFZK9uhjemc4gToxz1AQGgD3NBE3i8UDEmFBx0MRoUVg8TRWUToVy2+U4RJn73dZT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766180301; c=relaxed/simple;
	bh=SBHXkRgMesGUJGSlI+YkckhHJhyJOUbeeY6s/H5FeUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQkuEk+pWtrS0KhQCRFir7on10bCZyhPc5slPg0jamQSLOEBvubCpQsucwsGEEMe4xo7kBsgupQbS42mRX/4uhVacWMFagL1FwYvUbqM+rkeQyrek+wtWmUoYgfnLPOjgaB2au1+WssuoFCk4/tIaqPj9myqJMRAY/Kri6IrBGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZXXDITX; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZXXDITX"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-29f0f875bc5so29966245ad.3
        for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 13:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766180296; x=1766785096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SBHXkRgMesGUJGSlI+YkckhHJhyJOUbeeY6s/H5FeUc=;
        b=PZXXDITX8O2pITtu53MVdLOAN8xLa+E4T8O59SLKUmlhw5IGVuOVSaPVKr3RLgyRi9
         FFkrGh/mG35OypARILyigj6YN0GxLJ3X3MOyK+Jvg6PjLDf3Dq2LmoZ2Sj9s/vukVIFq
         LzzBAqPmENgXRvU7eSOKxVcijftEUHTO1jAq7CC7D0kpCfHRoPh2jBjS30aoCTlf+rtk
         nw9MA21zYZJBvVw3CEwwUHEc5WUM5bMNKamyH44/Jthx3UNRJwNqNDyGqhB/ZUDiPjj8
         /SJ5Mj3VpKOHOujtfOTulYT13laYJWXVJsjSmabdQezKKZkPMS3oWx9RPm6XWm7dEXsO
         n3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766180296; x=1766785096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBHXkRgMesGUJGSlI+YkckhHJhyJOUbeeY6s/H5FeUc=;
        b=T3L13IMheRRZOTZG4JWmV7H9A2l3Erjc//eKF9NHJc6+klIBmu1LhYu+c/LXJSkXsy
         +N89nOeZEXH5D8F/0MI4KQngKCoWwwnjHkhyyn+5Kz5gx2rmtc6XFzjrLGf1KnSb0nl4
         slphGxIwhINmuWa2BHqfDysGj3sjC78c341DNHTAATA+LI0H7BrcQVBuIawBXewdJJPW
         05ssWg4f6oS6bwIYw8n4hDHXJ13PzYXvRCzhmTcmYmi9qdDPubAMx1/9PfRLC+aFPpEi
         VxUFbYL/mL6KG+7Ik1OSKks6o9GU/jVQmZyA4M2DRNL3OT1Bzxew4jlUXkgY4F5J6rqq
         6Jyw==
X-Forwarded-Encrypted: i=1; AJvYcCUs9qfhscAGJDjGHxMm0V+QVkyv5jEpwhGrYo53Yho7wGJvYqU1Q0Ek2OH+lTMbVialUxzUoMifiAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8eMJf0RBa0HwLMfW2m03b85/3P0BK1XCS4090ngLzyNG0Zdtf
	u2Gwcw26UQIvRwu1SphqTBHcl7Y1kUUkMyZ88rhnkHLPEzk8yA2nGkYe
X-Gm-Gg: AY/fxX4m4kJDrxdyWSTFU6R/1B2Xil1hJJUDdLIEANNK1VahO3xwtq8EzcPYwNzmLnh
	AFt+gwRdOE4BoC2hDu0OeWyyd5mZV9kLLQ/86y6B8DWyqA/ObSOJ65dfJtccvZgK9Uf+u0leiWF
	ZE56X/prKL1JAlHahaEjb5DvCmHyweXEEoLmogLgtPp12mKMFFB2QTgGkJnkNEdgUbTRrnSKnaA
	IYl3GFspMf0hELlgTCnQWCkAD1MQGatmjhaz9IRe+hfchQ+NKxz17DFRTTbQ8IyXcTiaY5cuHpm
	zwH/jZw/v/48fWpLgN2visC20fbvKzPhiZK/bkmEjIkau/GnINMGUFKU1KPQQWXZjGdJSuFVAka
	M+k6GE/H7pDemCMEL75QgaWOtun7ognKmwaZwBl3ffkcEDF76qA8yYfHO9/ODyqwjJciW0U1YKP
	n1TZs1qixvL3X5GB2cgbPqHwH7bMRgvBarZe41llPjr1kwfZ6rp7FXbmWLaC8sWHmpvrm0R+QoJ
	aexwgl3UK/ZPfYv4ae7tHArhkK2zPoXuSh89jOStL52OJGWcrAuUqrX/dM0Ky6SjHhw+v02lmtG
	55A=
X-Google-Smtp-Source: AGHT+IGivulZwqOvq9TkwT/0JBobQprm3JRJ6VtJUw4ydSXEmlT/iKTWxEeMw8/Q4ZWRYLdEwZEKQQ==
X-Received: by 2002:a05:7022:e0c:b0:11a:f5e0:dc8 with SMTP id a92af1059eb24-121722f462emr3455845c88.28.1766180295388;
        Fri, 19 Dec 2025 13:38:15 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:5874:79f3:80da:a7a3? ([2a00:79e0:2e7c:8:5874:79f3:80da:a7a3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfd95sm12051531c88.1.2025.12.19.13.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 13:38:14 -0800 (PST)
Message-ID: <34cda24f-acdc-4049-9869-b666b08897d9@gmail.com>
Date: Fri, 19 Dec 2025 14:38:12 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/36] compiler-context-analysis: Remove Sparse support
To: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>,
 Eric Dumazet <edumazet@google.com>, Frederic Weisbecker
 <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>,
 Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Josh Triplett <josh@joshtriplett.org>, Justin Stitt
 <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
 Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>,
 kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
References: <20251219154418.3592607-1-elver@google.com>
 <20251219154418.3592607-24-elver@google.com>
Content-Language: en-US
From: Bart Van Assche <bart.vanassche@gmail.com>
In-Reply-To: <20251219154418.3592607-24-elver@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/25 8:40 AM, Marco Elver wrote:
> Remove Sparse support as discussed at [1].

Kernel patch descriptions should be self-contained. In other words, the
conclusion from [1] should be summarized in the patch description
instead of only referring to that discussion with a hyperlink.

Thanks,

Bart.
