Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025578;
	b=V2G/h4mjoW8Good6Q19HC4KQn6Yid7DvNl+bb3aohI1eGU4N3vxQnqBfb6QnXkCLtwpN
	 +0E6VZsEjA/VKskdOCa/HH0RI8QZz2WHnwzZ9GASNybKdGSBH3sDFwaICI9HHdFM4tWK8
	 8NztU9UDGTZBvDuDJlCMsvvLXuTdJIW+XcGr7r4JnUxhHfzloGaMGPAtkGKp+xJCERP67
	 93Zp8F5uwfUBFpMyFLxhQWGWn3Ky7Z50Pim6N6YM2uozuPcD3fxmy24FPO/BJlWgfM4xH
	 LGYrwbLYE/Wnl7NEcTc4lbQLvz4o3CxJDqU4CYhbtpBIeMOpZe7qhjBoTebTNRWAmTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=JfZYuXK6UL6ZlLrytd1AoBuuVUDo0kktcpMINSiZtew=;
	b=EaRd5VS5L92zMTQ+vvvntWK0OxsDm/X1agjS8sP4KUaB2BWrY66KNg39IIpcVTQIwH18
	 6eKMr6Zoe9fmidbWl4ElJGOO8Y3HewnHZaunEOXlwE5G4zHOjFc6txKHLx+tv6mgVEj6+
	 ATBfkpGlCxMVd+rPYpLerggV93wzSeav3fwp6bMIeFDBuB15US27kiAtJvQr+8l5rb0Bv
	 Mi12LjM99VD99JSbR5DvteocbOb/gGEdv75FPZZf/E11/DbI/4Zz7EbLLubmRRnzIyXwj
	 IBBPUBgNmaRrFT+C1WsyBOieVx3nYPOXcIG4OWxZDoOehaJevNTwLhl3LSjNbQ4n6GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Fbf6RtRK;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CEC606A31D
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 14:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07CEC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Fbf6RtRK
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso2390604a91.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 07:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793025577; x=1793630377; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JfZYuXK6UL6ZlLrytd1AoBuuVUDo0kktcpMINSiZtew=;
        b=Fbf6RtRK7yc7vHavSf8A1PNF12deV+0aD5GUCicKJJVtv1QMcv4Aurlhr3TFhJSKIa
         aMv+pF4ZTutVj0IbTozngeW7L7cmEhxR/1EAE+xWM5sR/E4hCBa81GLlr6iMsMLgw0e1
         vIEYLUciv6btYt5lrl4eDIRTq/TLF1YMiUNKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025577; x=1793630377;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JfZYuXK6UL6ZlLrytd1AoBuuVUDo0kktcpMINSiZtew=;
        b=Vz38TxmZud6elWLMc+lu6J44oZ7wDAhgx4t+PJCtSNvDUDLWZ0Otf0TwsWrFMsOnCW
         b6FjbpKyqreVi7acGGPOTuqcNIXNk7O0RLk4xQQhOpk1+rxKoyutqUNTSAF53W4hMawk
         kDGjyrKjJk4jFN3qEmUM97i5dn7vtEFlhthYrYRjrGfaezuHgeVoAeg0bQOJHbGsB9I8
         x8NDMkm4LPBJdPQbVJdM0CLZbLZWZKbjVHUWSKInTUN70+BtOVR9arcmXKsSJqwHXjDk
         B9jPj2UXO7vCr1U3M/dsQlNQtmLceqgCHdz/zjxt+zqe+4+Jj/5CEFV9TcynVvWYgIgj
         1HgA==
X-Forwarded-Encrypted: i=1; AKwUvByL5c3SS3SOcIrGDfFZ7fPxXFFElXG/PRasJ5aSxIONeNEW1DpP52x4wmRHrNVwk5wa4WCQJ5U1HhA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9BhU+UapT1G8XelFphpsS9qa86Vi2mq/uYyJqW5eAFS0P79dQ
	MCGLOAP1LXo5Cn82uGeDoYNVRMJyngj3VbpHyeEDkKYsLbz6tBjjLM/QLERrs/kaQek=
X-Gm-Gg: AYBFou1WpfMA7JukBVdQWYWkgSzkd0ohIqCgKiVY0qJ/MeBEN7CDVFlbxWXTnTMP8kj
	e91tvG8enAw2mBX0XHu+YeKGwxmxJw8XkRVUd7UCbuiQNV66W00sJJTBY78Uo6PKpYsRKqAg5+P
	RF2dH1ZVKi4+FZruG5zAfdMO3kPHB3Ic4GZYdaUStJ1By+4KKHv3rR1S48dpBFHjWXiMZPfIrPP
	dt9Lpky47DeMSsTgxEfgFe/mdUja/nxbHkgAyhc9nZefYn0QqGHTk5JdqriDsYaE0cgJMgatC1s
	ECMrYKfU/bY0vxjqKIXdCjHFa7nVPFGcsKOfiscYmkZmoIj0TooAEVjCS36fkubH4auMuDTZi92
	mwUdXoybYWhs1Ax8LEOhSI3/ui4d92z4M6MMzg/KOr+ZN9kzf0+c1REtbfl4vSO+ayrl/5fCzZV
	uxGqyIdqA1ibDfhxDnOTnhlFn1zl70fIIztuWgQkCQc4nvO9iEKQ0cgmPb9+Htr0b0TiXzbItYM
	Sk5Of8k/i7XgKPqIkBr8MZW/CtmC+FcGyGqEbhx2RyJ4NrS2u5/Fj4HzpKkrQtD/BssjEaWUUp+
	1NaTgDTsBnLDxIKJqu6pLD+3f5ZpCMrCtqhc5FCsItUuHhyds6Ek0egcTQCuxvxnIKs7rdzC+UF
	bzndnURhKvvyxRJFGLON4F6k=
X-Received: by 2002:a17:90a:e18c:b0:3a7:8c68:6446 with SMTP id 98e67ed59e1d1-3adeafea707mr5604183a91.63.1793025577285;
        Mon, 26 Oct 2026 07:39:37 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebac408asm8726950a91.0.2026.10.26.07.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:39:36 -0700 (PDT)
Date: Mon, 26 Oct 2026 22:39:34 +0800
From: Chris Down <chris@chrisdown.name>
To: Breno Leitao <leitao@debian.org>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sam Crossley <samuelcrossley@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Paolo Abeni <pabeni@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] netconsole: allow replaying the printk buffer on
 demand
Message-ID: <at9mJoA8ZQfUCFGw@chrisdown.name>
References: <20261024-netcons-replay-upstream-v1-0-9613f38496e5@gmail.com>
 <87fqxskdpl.fsf@jogness.linutronix.de>
 <at84qygscue8crQi@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <at84qygscue8crQi@gmail.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Hi Breno,

Breno Leitao writes:
>So the next step would be to add a basic /sys/class/console/, similar to
>[2], and put a `replay` entry in it.

Feel free to incorporate an abridged version of my patch with my From: in your 
series if you like and we can take whichever one lands first.

(That also reminds me, Petr, let me know when it's a good time for a resend. 
I've been holding off since there's still quite a bit of activity on the other 
cleanup patchset)
