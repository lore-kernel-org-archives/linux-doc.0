Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014380;
	b=VHdUCmxxZWbq3gEpy1u8YuHy6wXjkmbab4mGyotWv/rDVsF59APyTUadbVpiXSJyo3eV
	 9aiUWm6I2IumsvaYuZErsobLHJze7EFwdDo+YXbCu/uLfdFiNt/71LRmO+LUwCu1gTgq7
	 JBehesFigL2+Sa9UNPMV4GiUcaUVDrwjr4SJddLaNZWIti77XCY/CW0kR4xijfB4Rrtlw
	 vaghmjyP2d0nhICDoPCGNlxJbqYC6rNK4eFJmWFuP7rrCMAREf/Q2lxarZ98CPXQJQeKs
	 ++soeN3zaD5c1vMhZM1GtxKaiMlGeOvkkGvNU8fsJ9HW6RC8QRiYK125Yrs/qHy6UdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=tKPUcQCwUJ0o16oWcFk1SSJYCflKgF3hlVLSRCArcVc=;
	b=smc1QLL9tBFm3xT6aJ7Q8DBbvVjTRB/XQZ3LihZ6VcDjOMEC0Mwkq89Aacz2gyJCAnfO
	 ESZq2h1FumzDSPEa1HtCdL4JxTaxPY2t5DNeJ3dfm2kxiCkuYLx+uR7fY9dM+GvRrYCNL
	 IdDozsZP0Gh+XFq4rnhxHjF88KrN5AmlDeGSlav+0oFY0zxqXt+3dHKNKUUgFPPOYQOhK
	 qq00M4C0tIuIgE4EUYnSFv6hN2rFXPS6xK2GzKCdTv5SR3S+kd6HebZNrckf7yegSHXj9
	 Y7OoJkkKT/7wPSgoQYpHVn/We7NpHFoxuAm4oPt6dCUSLSybamrKkcrbrxaPsXUctYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oazsg+Kk;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AA9606A33B
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 15:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22AA9606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oazsg+Kk
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-381d542bc29so2107405eec.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 07:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795014379; x=1795619179; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tKPUcQCwUJ0o16oWcFk1SSJYCflKgF3hlVLSRCArcVc=;
        b=oazsg+Kk9ACdNFN3l7hy2qrJxFy5DmqqWudZXT2Ok3anHQMm83IXM/en8tYt/ko5DI
         YIJsIWv4Qxmtotwhu8i8Zaqg6jleeUeXuNwDX5NleJJKFaFf4I+kkAdN9/19ZQqwf7Wh
         5mA8AI6yT3WG5bCugUx8bwYrQVOvYWZ000hGFMXwJr9kLJ//tp3XsKDgtQkLJEEFkhRa
         g6KbCBxFVIgixRK2xvZWa+dQPi5dSlPOnSkO6Ro3WOnKtdngBVvK/fiRZtkI6ICpESWM
         bhXYH0UbMWTWdpKmwSE78M4yJ8yWSsJk3rZZrzekB0zlTVPfHMcPR2duimRPtlIIochU
         mIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014379; x=1795619179;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKPUcQCwUJ0o16oWcFk1SSJYCflKgF3hlVLSRCArcVc=;
        b=y03tdPNR8VCJutUMnW5bXyuHe4Nn457QRKsIUrSFzw0SqTjMBPlaDyRk1OzhY1sKud
         QtvnRC06qM+KQoPQBL3vnkMddMbQVPllyRyyfEMtbANgQ67Nh8uYcp5ctYu1NtH2yW+I
         3uv7qHG7HbGXx6eKfkrvg08VCxIDiYOoI4dqEJQuJOxRZ+jjXGZqtTGzO0bFOsBbMJ9e
         yga3vawQHwZ38aWz+GuznEWOCibz9zlLhOLaHx4tjgOCyYPBvauWVF7z8EGn0v6zTBf4
         OvPlHXUeZVbHYxixtdXFeuZOiJjDtlf0yIF1AI85tik4YCUe5tgPEMP+qzPoXQ0u2CdU
         AhEg==
X-Forwarded-Encrypted: i=1; AL+hErH1PaHec5e6XD0dgj/ifCtiFkiWLLRAwgsg7SxcsIftfrtN6r5A5Ps+HkZXuzOvg06qHHRG+7/b26o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Wp5iqNCk6yWt4Q6DR2mXO+KPV933upkmRInOgQT4TJ/B40Z94
	Gf+d5JrR7wS6E00UKqK2FnMOPsV/kDNf4rquzZyvs2uI9HisQbKxHXiV
X-Gm-Gg: AZFdTZdDYP1C7Q5h7hVrXTeqlqTTO6m8PP8jA6XBEpkLwirQ1Kja3T4ATSHoYVswZMF
	6QwsYe9xdQJiUEwqt5Ex3nz7k46pAwU3+nugCSYjv22TajTU37PopM38/SNODqa0PF5VzA07oa3
	xiIy0iA0O1/hYPAQY6M1kbGlpVJjQVEntZvJ6g/9+oEUPkqcoYXCsH5mpz/zHAxVqicxmqjQbY7
	zkqsFnYLTwuUW0STxDfDniAAJ/ePaTrGS4D9Olud9tHuqYO2JWOQYcIgBCDKJuhGj7GCyoAEhDe
	hy5NeeKO+kK4NQttBtOWAiPvCUlCtcO+84HOoF91Ho2/OTk1Q8MWVWZDlijj+zsaidLasnCTkn0
	KAWlFWbeUObKA0vFKE66NXbIXtb5NGT7y/3rWvF+DdUyF1J6kIC6xpkf5deAZ54I3TPN4vag9dX
	zPC3JdR/BcoUwORM062jPhB25Uh97nUUrKv9j685sRyNOMlZhC3r3W+f3zIiFRCqKmC3UQW+lUB
	L8GqcXKVQ6bL3yu1QW4vMObiF8F31mj2lcupHR4v3ibfGJArarZOh70Yj5B76gN3e1669Q=
X-Received: by 2002:a05:7300:cca9:b0:375:dc5b:4400 with SMTP id 5a478bee46e88-3827dd05a5amr2957513eec.1.1795014379070;
        Wed, 18 Nov 2026 07:06:19 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6df02adsm9897638eec.14.2026.11.18.07.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:06:18 -0800 (PST)
Date: Wed, 18 Nov 2026 07:06:18 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>,
 stable@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net v3 2/2] tcp: fix shift-out-of-bounds in inet_csk_rto_backoff()
In-Reply-To: <20261118144249.358481-2-jiayuan.chen@linux.dev>
References: <20261118144249.358481-1-jiayuan.chen@linux.dev>
 <20261118144249.358481-2-jiayuan.chen@linux.dev>
Message-ID: <179501434217.2486727.13336571553047162527@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 18, 2026 at 10:42:38PM +0800, Jiayuan Chen wrote:
> icsk_backoff is used as a shift amount in inet_csk_rto_backoff():
>
> 	u64 when = (u64)icsk->icsk_rto << icsk->icsk_backoff;
>
> It can go past 63 on the paths of both callers:

I tested the zero window probe path with the reproducer from my report,
an orphaned socket that keeps probing a zero window. Without the series,
v7.4-rc3 shows the UBSAN report, but with both v3 patches applied, it is
gone.

Tested-by: Kyuwon Cho <kyuwoncho18@gmail.com>

Thanks,
Kyuwon Cho
