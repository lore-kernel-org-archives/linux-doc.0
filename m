Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE7938A72A
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 01:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785116505; cv=none; b=Yp5jnL33FC/MAkcMBvR/bBPi4TBldOqhRhxs+6vZMVZYd9Kz2gTbaaSd21dfZzCLjV0L8SJdCmRjNqDWLsTwqDD8qUZ/EOd2WaNn9aB+Gn9FNlw6C6OIkzBQ+0w5LR4YEnrEs4d4zHz2C7TlyKXsF8RoKerlZf9UDmmLulO420Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785116505; c=relaxed/simple;
	bh=P+IeIdV3xEFBB4H/lA/+B+OOLo8fcz/TNMqrT2maHzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oj74fPl4imEx48jGQ3DgY8jkvjk6YgGQIjUp6534jKCWsnWVuDQd7vJtUciLnkQuoUQ+X7MonsivuDLIXvQkzLs6MNWAqlOQSXCjB0o3L/8F5eky1XmZoczMQJNCxA/HPJxTstLAlpYF/uxhVxJRuVl5hngAM9OOwg8L1XMfuAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwlkO8IM; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwlkO8IM"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81ed073fed0so26472257b3.0
        for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 18:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785116503; x=1785721303; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v+AzfghQ44TeGSX/5Cn91O6zQUgy9oiVe8cggLcOOnA=;
        b=XwlkO8IM90uGxg/QmyF4CowRaw2JSW7FdpVt+Px5e4dRFsQhsPae2mJ5WAoFzOG2Jc
         pNooiSItaYF0q7c60gPZGfy+Bh4LPfmCWd80QNMQy3quxGfLGlO6HCAHPUmbIsD7Em/E
         C8bWN3sV63e1YOr32aEdCTgx9oQ1xgEUAI3JKmocJ6ii9zuIqiVtSTWirDegZKWg9Or5
         S9MnzoFRPOjaGbPvWZJpFcq4gi9YY7APxD5yhRaIDobm7g67QFFAQ6gUYtR9JtdQNsuB
         xvsQu4Ky80UgUngsKZxOG94pilnFQZba5BkqotN4vQDQaKwhw5d/Z6aYtUTLv9fL4ZpC
         fhZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785116503; x=1785721303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v+AzfghQ44TeGSX/5Cn91O6zQUgy9oiVe8cggLcOOnA=;
        b=p08nwUP3QjaA5ZRE9vtaL24pv7N+jgBAi4+W/ux+tk/JFyHIiXf74fkioqkCUfMDF6
         cV3Ce9bIQ7ucletnWhRaoYTlgl2mX3rRFas9Pg+LGfZ/hDV2rB8pTP/X98ZJolr7fhYp
         CiJ5+CNVDaCfKy71alVxnr08Y4xxO14MyRMLkKHXRE63VKnX7JHhdu5rK3/ZDWvDBI+q
         RZP0CIqcWdaCptdYCuTbdQcub3YxB3004d5Jv3tGWquDWWNFf6uTUP66oDJWasWSzyMD
         mHMCmivcgcBv/hsWHWMPLth6m/OQ16JyY8033ZiRRcqBKSjC96BCEsxi+EPyDCqkJ+Ut
         sL6g==
X-Forwarded-Encrypted: i=1; AHgh+RqVPVKUp8cacL0HF6W3qhlEVeHOQLfLLiNmr9TuxbtVN4tHvD4mcypIuGmwecT07ZSAMMhNRoEMz90=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3pku6fhPh9ASzdl5SikGOPPPL2xHHxNAafNIkm9dInJAxN3FD
	myeOTjWt12Mwr0TBYjLHOg+G3/og+7a1+0mEzLnDWSAqy27JZ7iplNvk
X-Gm-Gg: AR+sD10Ln84mNw8xAoDHh5I7CrBMqVw42QtvdoP06XbNY0OUDe9jU9nQIimWXyDdQmc
	bEJuiyZ79NHlfSTvU+8DG1vBF/XGvZaYOqXTh9sfEHGRN87b7KheewseDj2es+zAgeR+CjBVQB+
	odTsYXoDbR8d7Y+l9xHsVkvvcO5t2kAmyUEzu2pzUToxhfDg5uC6dZWYtYy61YPOhNQsyb8vWXq
	yfOdQyfzTAK9crNU6Apgl1MdnaoPhP4Bp7ngMIT33oxKduqbnb5xGPIe9ZWWJH9qps1W0m/u1W7
	JVpPXQFB2Fnpb86L/IXW4SSUdytRd4ZVjzWJ0hXluFDzdxSXgoBO9zyvwX4MTasqKvn8cWK3mPo
	xbnJmgGKkEs3Jig0NDH6TIWJOZwRtjnfT1s8vioI6Yj66dtkK6GhX6aOln9RWVOLksq6MdXY/3P
	aPHvXo1CNK8GnlOtIfLauoQt8PhMY3aTY=
X-Received: by 2002:a05:690c:317:b0:81e:29d8:fae3 with SMTP id 00721157ae682-81f69e5051bmr20875487b3.46.1785116502789;
        Sun, 26 Jul 2026 18:41:42 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6e:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6592ec1asm25204717b3.45.2026.07.26.18.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 18:41:41 -0700 (PDT)
Date: Sun, 26 Jul 2026 18:41:37 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Arthur Kiyanovski <akiyano@amazon.com>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Wen Gu <guwen@linux.alibaba.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	David Woodhouse <dwmw@amazon.com>,
	Yonatan Sarna <ysarna@amazon.com>,
	Zorik Machulsky <zorik@amazon.com>,
	Alexander Matushevsky <matua@amazon.com>,
	Saeed Bshara <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>,
	Anthony Liguori <aliguori@amazon.com>,
	Nafea Bshara <nafea@amazon.com>,
	Evgeny Schmeilin <evgenys@amazon.com>,
	Netanel Belgazal <netanel@amazon.com>,
	Ali Saidi <alisaidi@amazon.com>,
	Benjamin Herrenschmidt <benh@amazon.com>,
	Noam Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>,
	Evgeny Ostrovsky <evostrov@amazon.com>,
	Ofir Tabachnik <ofirt@amazon.com>,
	Amit Bernstein <amitbern@amazon.com>,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	shuah@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>, vadim.fedorenko@linux.dev
Subject: Re: [PATCH v4 net-next 0/7] ptp: Add PHC timestamp quality attributes
Message-ID: <ama3UYqwwoJ3j8bq@hoboy.vegasvil.org>
References: <20260714020340.25014-1-akiyano@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714020340.25014-1-akiyano@amazon.com>

On Tue, Jul 14, 2026 at 02:03:01AM +0000, Arthur Kiyanovski wrote:
> This series adds quality attributes to PTP Hardware Clock (PHC)
> timestamps, allowing userspace to obtain error bound, clock status,
> timescale, and system counter values alongside timestamps in a single
> call.
> 
> Motivation
> ----------
> The existing PTP APIs return timestamps without any indication of
> their quality. Applications that need clock accuracy and
> synchronization status commonly rely on external tools such as
> ptp4l, which implement synchronization logic and can export their
> measurement of clock accuracy.

Yes, and what is wrong with that?  Nothing, AFAICT

? For managed PHC devices — such as
> the ENA network adapter, whose clock is synchronized by the device
> without userspace involvement — these tools are not available, and
> the existing APIs lack a way to report quality metrics to consumers
> of time.

So make some user space tool that advertises your device's qualities.

Don't push this stuff into the kernel, where it doesn't belong.

Thanks,
Richard

