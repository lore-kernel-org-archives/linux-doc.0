Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455401;
	b=FjRMh6fddqRDBPdEIWKj9xeBo+I78BwnBGPCXpWB79VbsijYRhT4yZKsEfQ4+ekPgaDE
	 O0bnldJUzpLFM2OGGFO5D636e6006IHnHQ5NTWka+UCT47bhxUnXvHkkBVsn8i2AFWodw
	 Hv5gU2TKE1o2vtbb9ok4ikgtTgK5cQvD4Gp+pVgxnhYQ+8x+3QzhF8NxzvK7s4mzFpuKK
	 gxxWmQnAdl/JQhUWykFsTyyPBxQuR5KNO2oc+E9XsJ64awzf/1GuOuI0XFJB2hooAnXfS
	 TRcKBfJJUzTg75sBUv2P24/hyPXPYju9qUKXdJZqJxqm3F1HDAzQ4/FmO1EDQq36lGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=DK0SDoEu6QZPZO8EwpxdCqNFA6Pm7zmMkL47ds9UeV4=;
	b=0zgD7EDuqV3IRj1QiLJNr5Vkj+J4yFbli4Us2tAA+nnQATxNIagInhmDYMpgl218BGBH
	 QCaV9kU1sDWIMcGgDOudiHH62wGnb9OqZqtNojUpbWnqAligswFn+H/erVZXWRFf2lgR1
	 +qyn+KLRz6FVlEdxVLHxbWp837urlgmEh9gb6kdjaxdMjG0yb5UG+B7dca/tMrWVl9IUp
	 DPijkBBGEi6+vhFQsPtKiTeL8NGS2hM7dwf0O8snoGzJtdTrt6KB8hbvUDM0Q4LYKytWb
	 aUPI1s5lo/WjQbgC4YrF6DbLctfKB7qgt02xk2ixIbIXaugvgHIHJEbm9UCirgg1TYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLOBLTjl;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5D2606A31F
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 17:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD5D2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLOBLTjl
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so661060eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 09:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455400; x=1796060200; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DK0SDoEu6QZPZO8EwpxdCqNFA6Pm7zmMkL47ds9UeV4=;
        b=hLOBLTjlDEPHdAG5YmKm/7N6iquRLKq9eIatnIS+g5up1ZOcgtIou2l46hgQj3skOV
         U53/XRJiXmghn4n/XVHKnm+gxe5RzHzgGSHJGvvAk8o/9KA5CuVAWXg7N2MWzZF8ait5
         K+7QZpTJYzgcoRni4NBl9qw23fLyxsFo64zMqZkzFQMqtfqmSeC4zzCSJNGj107g/ysU
         erHG7I/TqCuWwl7b6nMeMXuqZmsgER0AfOeWgjLmtWkzlQK1G7LnkwImpXqR3Jk+KuAL
         zGknTzBumdFwSfJQJUei6zTevzHlj/km2jNCrSKHpTP0khmGJoDsZH5zzQB+bdvPjL2w
         7keA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455400; x=1796060200;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DK0SDoEu6QZPZO8EwpxdCqNFA6Pm7zmMkL47ds9UeV4=;
        b=NHfcuf7B5Kb2/pw5JQpRECiKvtSB2JtizT64F4OOR6Oga5z1dRkiARqAvZx3dYIRgr
         Mr+E6/yyTv3ytJ3apAa2iB5KCuJJvJPKCAYYrysfLZwC+njVwAdCQNVgTXkL1cXHIZJn
         1OD/3jmBbOebZxhZBxE3SYWbY2QyfgvWK2u8gEVemYewnVZdYWQM/EP5fowuDUZsXLig
         RQ4poedxxEr+NAAUkz7a0FpJ+K49umNHox7a24a8rnkik/WpZ/kGV+aZ8/4hnSHWglj9
         MPDMEjUprKg6plRk1khgQUswk5h9QNLkdfnoMqhDLgKixWHbiKOKWKDh+sD0wzBSwMj6
         1qCg==
X-Forwarded-Encrypted: i=1; AL+hErHqAzISBjtzCNR4m+NrKnKogBuRqPI33iHvh9PHcl++HYtLGu8yykB8n9WOK61PyGOVmU5M5EwBhBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KzDWm/RfKmioW14gFyHUjde6Xgzp77WmI5c/CO/Cf9M7464Zj
	0DVbi84y03ZGZEUsE21I03+XN4byOIXQ6IDia6dA0+fhnQgXvbaq3l55
X-Gm-Gg: AZFdTZccPme9A313uRUhOOqoGQfsRNj5ubKFHDmp/Lehafs6dWnkTUH5LKxKD9Bqhrx
	y+CiJbFmmJ4RfG552Kz9M4QruxuN7VRjFcU4hCw82hU8xNPwkj5xUhB098BZNtqwTk8ObdAmpRN
	vsRAp7aV97m7XCl1/MalWSSNbrvIOwX0CivMtJBiJJJo474ETdH4MZ3aVdKzcK654dBVHk9X3NK
	sikuKFWCiQjB3DS1k1euBi7CRB9rXooavINp1AYqDhkZ7h21e2+a52lB1ji6nO0l+qFiHjYN+6R
	wDRY9hBF/AEVdvVMOOYdc21ms8jwHI4GMjiL4zFDMYFXRPS4/RYBalVeso0PsnZt1Cd0eU84wNR
	bIC3Kw8DhIl8MEVUB5rIkmuUT/V+dooUe27eqiqmbTvpZsFjMGTPINqWZUGHAXb/0+ZheNWDXKU
	Fi61HbvHRqSbc5ob+DilwwGHIfwaqUMMfnumPTseYLwoy2GJWU9VyXwErIMGx/5M6YiGQjWt0D9
	Q8eOkw0kZynEYG1g3dmQsyKlBAAvFQpnUUz3dRf1Dd2bhGpbzQYOZDcpHdTYflh3Nx6NnlBjrSE
	rclMF+oU84ygScwQSrrryfzXafHd7ELtgLNlkbWy7BhSwMmOi0cvKu0fvj1LjM6AY5hyDOOaN2H
	QOEo41aGjmv3nDT8GxriYtkKN803RPnfz/QdxX0YCgHKKzqFw3FyIPS2H9trb6g==
X-Received: by 2002:a05:693c:600a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3863f13587fmr10922069eec.4.1795455399630;
        Mon, 23 Nov 2026 09:36:39 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm31532302eec.25.2026.11.23.09.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:36:39 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 10/27] Docs/admin-guide/mm/damon/usage: update for
 report producer sysfs
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 24 Nov 2026 03:49:24 +1100
Message-Id: <179545256499.4.15497978395841877294.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 Lian Wang <lianux.mm@gmail.com>, linux-doc@vger.kernel.org, 
 linux-mm@kvack.org, Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261121210013.130397-11-sj@kernel.org>
References: <20261121210013.130397-1-sj@kernel.org>
 <20261121210013.130397-11-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Sat, 21 Nov 2026 12:59:54 -0800 SJ Park wrote:

> Update DAMON usage document for the newly added report producer control
> sysfs files.

LGTM, thanks.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
