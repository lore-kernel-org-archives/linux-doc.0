Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631940;
	b=jq4VzBzgfh/ODX7LsNnmUHNi60wqc+qyAGTVrzO3ZWXl9VHpFKyVcjHhP93Q9cDHGLig
	 +eQKi9WYQEG8uzbo2QVSGGMrKV6bXeflGXOBJKaq6fXeRmimEkft9QvUtvVvE/FDC/Fl8
	 7PQkztk0PsoF4YitloJAJ10Up1wuMYxyLWBs0iGKt0ds40d+id8Q6LwWtlGC27TMlrdNq
	 QEALpPGj45K0R5jXV+ixN9FyQ2GIXBeT2nSjeYMFpbSQdFVE//uXBQWEi0WAbyx3xjJbL
	 kc+UDYFRU20Iv9nGGTUYY1VUIu7eaTxAqeN0qx7YO/elsFNGIFrdkmY7j11BQRMelsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=16KmY+5SMzN5j7+9R15dmTI05WFHA1t98OiX21uElTA=;
	b=uFZN1qwi1nxPgwNAYOY96d0FWmalAALMhFHvBXGzgaqRf1MeVDT3E98IlOxFshxKivPk
	 SHqH5PvBfcTchoxzUyGJPQ01/Kp6iW50nBJMfWcIruklxdQikyHynCvz92+nWNCSV0cye
	 LyMLvi38dLBw10cKjBD3/xNe9aLm4Xpjes6V1ElZe/wuvWpQWkjkusqp7ycf+/xtpV8fi
	 4la3+k4jiJGz1YSgHXrlyQcVHpt1KLEjzgZZjaOAzce1BgRkXzuYRb0M+i9NBgcpGBoTn
	 lmgJBpeym4XJbgqmi1ys6Fux00uspsIBcXy98QIiw5/HKs7X05qV4Sr694+pqL7A5Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UoYunkSY;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D054606AE96
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 15:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D054606AE96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UoYunkSY
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a208d93758so33545385e9.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631938; x=1794236738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=16KmY+5SMzN5j7+9R15dmTI05WFHA1t98OiX21uElTA=;
        b=UoYunkSYxQznh5bFA75G99i2y2WW9E086osI9oKEp6qIqKaUZRR8w4CxHUrPRkqq5S
         FfmqCJGlVnKa5ovIyVvTW73QdAbq7tDgFU70uuBcb+R92YkXxYaOc6CL8ZMXYWHPP754
         wnsrxDcNSQBDr4jBTgmIADLNqhAKGAMdasjK3IrK0W6zgen1NiBV5tV2pWpdcjzjLeNI
         cBi8+BY4ejD39ai1Abt1TdY+LOIdW/wMxJ/Q8fXMJii7S0kVXjVQQPDvpFRIa95v+eWH
         QOTM3mH0vfW6dScDz4mjR07lz/jXDaBKe8q4rfMgUMR2OvxIGPW1WvDHBlLe8jXj9orb
         jxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631938; x=1794236738;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=16KmY+5SMzN5j7+9R15dmTI05WFHA1t98OiX21uElTA=;
        b=xBG8EUH2AUZEG2xcvouRQiwA4l+nd6ZKyPTWa7ALw3XTaMraLArfDEzKVHbZPpLXIH
         /cqveyarbjYCeER2SYeX2nzAmcGnUdtF6VocQCbufsWyqqCthzcwsG3jBpsvdpR7EQVT
         h8CzDwXjFyOvcVDCUvnwpbPUs681GSnOwV21DX2OtrSSEmI62FWFeTya78qIqBhg3bqL
         pTSZ6Sv5PEGm0lWx1DUsN2VN1FsBUhXVn56ViB2VNdkdRyRR1jG/OdAfEsDQlDc5+e4O
         Zv3etlYalC35Id8ZT/CHbcqduTz2v7kkrkNzmJtlEIVQlEIiRAkqXydASZUfzdxyykHi
         ln1Q==
X-Forwarded-Encrypted: i=1; AKwUvBy1c4FHeBiC8P3t10Ygr4YeHR5tNlLlo69mexpTCTVrdeHfQl2csp3wB7YcozQS2fwsDLbAbe2LCF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKj3To6VfzIpbgn6LWsB/7kiEWKZKC4uXHmFUUiMING+AFwYMer
	m4FLzU65+sUfU6pcOrRGgvkdd11oDIzfQgR8b3ur7N7ewdZcxuBe6N/Y
X-Gm-Gg: AYBFou3JZPj3UQr9QULjf9HH5AScEfP8DwbvmKz8l6jLQ67W/esMde9xA5UZOV5EJqG
	hxaABwtAObKy1keh8/7K67PtJRuOOakzDl4Xdy/gAq7YYLCclez6Pq77xpKQKZt72podXwCewfr
	QkTfN7P3Q6Sb1nTI5Y08UiiphqCE4Q0C/nGmveU5mV045aOb5fMHCnM9y2Fo69P56O+odu1MRTu
	W4PaD3Dg1vjFvqGoOuUbZXz3qxH0TrqZgSnH5Eb0IB/VUYMKQJlkFpMow6+MArgq28+JGix9JOH
	5l1UfUqaoG9WkOr8O04AiTClAkSLnlfEPbh1Q6UbF3E57bgsOjzLJlRGilN6MO7xOZ5HZ4O7xww
	iXNNBDk9QUHnb5nxB8XqThs41QntWkxiEkexG7HQm69DVpCi7rV9Bc+iQ3NfAt2ruOGVBCg1ia0
	hV4ZzVQGESR7VhaiDjcjpVEtHqI2rPQmoyB9zYGGCrKdJ/toyM9Z2k6ZgZVCUyS82W+AuGM3mQo
	WR4SL5J0FLfbxznvSKvGMDrjUbQ/ElVE1CGRZdhO5VZL0qni+o8ORuHHYXFcpSBwZIA5xGx2OBw
	L/Yqbzo0F38i9yswJcDyKXwEvwUAQ/KWyg7t67Ej/d/QhZc1zW86vOjOyywD1fck
X-Received: by 2002:a05:600c:83c5:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4ac19329ea4mr206305535e9.33.1793631938076;
        Mon, 02 Nov 2026 07:05:38 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ad414e298bsm128041915e9.2.2026.11.02.07.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:05:37 -0800 (PST)
Date: Mon, 2 Nov 2026 15:05:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Joe Perches <joe@perches.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, users@kernel.org, Federico Vaga
 <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, Carlos
 Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang
 Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan
 <wy@wyuan.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, Petr
 Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Message-ID: <20261102150535.6c5689f6@pumpkin>
In-Reply-To: <87a4nrfgjm.fsf@trenco.lwn.net>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
	<20261102093206.50b6c9ad@pumpkin>
	<20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
	<CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
	<87a4nrfgjm.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 02 Nov 2026 07:34:37 -0700
Jonathan Corbet <corbet@lwn.net> wrote:

> "Rafael J. Wysocki (Intel)" <rafael@kernel.org> writes:
> 
> > So it occurred to me that it might be actually better to stop sending
> > messages directly to LKML subscribers and only make it available for
> > download somewhere and as a Lore archive.
> >
> > Is there really anyone depending on receiving all of the LKML traffic every day?  
> 
> * raises hand
> 
> Some of us crazy people really do depend on it, yes.

I certainly scan it.
It is also useful to have an archived local copy that can be searched.
I can see a point in not copying all of netdev to lkml, but there is
little point not copying patches to low-volume lists.

David

> 
> jon

