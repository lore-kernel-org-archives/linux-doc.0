Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960876;
	b=XT8N7u53PphPOSZSgWUk7Y6WD06XN4aU/zFUn8thgNzfl2L1/vN+sPuxFfUE5jlwxzv8
	 K3xn7p33GJnLaErR+sRO0ic4zG5vWlr7nwydwD9g0xLpS72DnWoHcWLf9uG3DgPJ3fL8j
	 mAtXCsN1H41VCroBNYDefB8vqWURVa97tW/eE+pzEldMaTYE7CpoBOMhIW4pB3iL+iMpU
	 N/jdutinSeR80c/0fHYs+JO8A7FEjlOeeJ7gzToHBS8PV0NoE9oz/4/Q0kMUZclUaD9er
	 YzohI3lCtN/GT6CPvRvMSZ6M6nDtahEdSy9JigkALqlp+5nCS8ygbm1H8nOvox2AwNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Zw2mqAnxBP20mmU4JkFKKPUat7kbJuHP4qMgdnhbKtE=;
	b=p7wK+RYUFiKopl5SW7bH4A+lv/2wZpj2ccQZu3DJ7CAsbvtWy8FBqZy9Dz4y6o6Dk8qp
	 IQ8lfHaI0emHFNgzKwlSHJDdE4uXShTF8g78rwvc8eDmZV+64aKzIYVOH4/Y9VCCUQrjE
	 FmwcM4GlMtiX5rwwgzicwUP2Ssu1XwtonSwEnt97i5p3w5gGaG0R1eptqhC1+M0VIeaqO
	 ZP7tncljXzWWtXtocNXQY3QYYpV2VLpv8e8FWuydQnTEGaBsDBtcfgxukoC6m9JS/RUH8
	 C2BaMMJaR4pwMkZDZQDVMmpovx4FAYopJzlj1phE0YALFvPzJAF/bzo1QfrSmpFjBUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LjGcJFJ4;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A3E606A32C
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 10:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21A3E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LjGcJFJ4
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so5876505e9.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 02:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793960874; x=1794565674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zw2mqAnxBP20mmU4JkFKKPUat7kbJuHP4qMgdnhbKtE=;
        b=LjGcJFJ4zD6sm1Muxi7UM29ewQptAT19EP1Ku0SEgGaJ6a6MNokpu/Hi5EKA21Yxnm
         dL0YCBERNvboCmsGGtIEXYlXOjeCbFh8tnalsNWhnm94LPsF4X+rMZ8SvF8XZDf24F3h
         XVhg39Vqls6v79DCTwRJ1U3/cbMGUYlYBfnKF1LTvZsks7PTpYnUgh4ZpHhDVWpX1liz
         RVBjEulnwLIZPCW/pJ3/UIc8rjwGORSpxtnPeC/Z5+2XXQJgowv5EPsIAp1N7dBYt3vv
         XcHHn/wlBzjQOgAjok+Y0MTwfFLmVqeFewzoacCGevp3aBcexW2PNXZUHf5ULNJ9bO5M
         pwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793960874; x=1794565674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zw2mqAnxBP20mmU4JkFKKPUat7kbJuHP4qMgdnhbKtE=;
        b=R9NR9PhurNkOEHsHkpEQCrB/S9peF3DT0XKdK80bZP6nKNbBNHms/+XnSsO+4c7OpJ
         df64G72Em0cYjBIAMR6XJCUaBcN5ESYah7Wzrm5LH5uIKM8YRQpB07nioeFSQoatzPpb
         u/N0N9xy+2YHMTLy3eqaian0cwg3w+d5aDSXbfxCWK511J3rQdBBsOJm+EztbdJXa9KV
         6M4XPCfBmL9qKViNBiAWa6VEs3AXDsQMaYAr0a+rnvPUlLiAuamTVQG2EIoPu2EdodHh
         oPUOw0Hf+AmnwMS1OHrrlrG+XQcpZgpPPjdQsuLSLAEq9uQamQOT2FqJhuxkIqGPIvDM
         RROQ==
X-Gm-Message-State: APuU4Z/XPkwu5E1XpOU3RKjUAFpAV3WbvwH8L7vm8U9MdBylWautPqYC
	fGIN1FLRaKhpkyWDgFOySUDX7u3ClCjgXhhE1202mBtt3ypTpBu0jEEczlqLAzoOzNM=
X-Gm-Gg: AYBFou3jI/9vUnKNB5yT5/jq9rksCr3Kg0/6XtbsJfcX0CaWNVyrnHLxPedygDmoypR
	BTTOF/GSxtFNS9UOKqMa3k3IXZ0le27fDDFJ3jIbuGhdbQSGWBcxUoZFtKMVQbzC5akleHCnoVq
	NRf1ApCqAGuXTPEQmTjZRBxuV6QhAZF7rFpqBH9v+bfHS1l/6ATOD1p//yKFB8GwDJiB6f4Xn+C
	h4UYGmRxE/jxNfE0oZs1M7fXq0PbJGmZN3qADDTiLi3Xo3dFLW/JugzYOcLQdvdLfqsrjmCPqQU
	m7V0C7CxzsQJK7c8vaBulYB17yjB/Ut7yJrZqRU8cVPRYd5DJ58qF2JQyJzdit+tz6JYtuCImE+
	UZvG/9Y4XvKWSWYElXBJTC1PbKtITvRzsFwovA3qSb+AiVEVWFy5Y99nNucGfacu6akZtYz8jTg
	Dt2vr7llcVYrOgZb2iQ5EnW9pnoN277tc0KXF2tgGTq36H6VKuFl6gsayOP+I1A0Qc0GpXDfeJc
	01D9VbPXeCX3/Ht1VletLelqTkPQhC5BwWpFLnjconlFdBpbMrcf0ARstbDyMyGP6njRJNL1lKh
	mlqNSRIFK79gwagCulvw2tDwMxNY/Q==
X-Received: by 2002:a05:600c:34c4:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4b6d82b15f3mr31762755e9.0.1793960874451;
        Fri, 06 Nov 2026 02:27:54 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm126953605e9.8.2026.11.06.02.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:27:53 -0800 (PST)
Date: Fri, 6 Nov 2026 11:27:51 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-doc@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Subject: Re: [PATCH v2] Documentation/printk-formats: Remove notes about %pK
Message-ID: <au2rp0Gas_C-bRgc@pathway.suse.cz>
References: <20261019083040.Fgpb8Jz8@linutronix.de>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019083040.Fgpb8Jz8@linutronix.de>

On Mon 2026-10-19 10:30:40, Sebastian Andrzej Siewior wrote:
> The %pK is slowly vanishing from drivers. The %p already prints hashed
> output unless overridden at bootime. It is not obvious for the user which
> output is using %pK and which does not.
> 
> Some people pointed out that this documentation encourages people to use
> it so here is the removal. I also update the translation since the block
> looks the same.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Just for record. The change looks good:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Note: It seems that Jonathan already took this patch. The plan was to
      push this after the last users were removed. But it is not a big
      deal when it goes in earlier by the documentation tree.

Best Regards,
Petr
