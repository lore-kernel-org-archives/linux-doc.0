Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CCA2DFF19
	for <linux-doc@vger.kernel.org>; Sun, 14 Dec 2025 17:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765734874; cv=none; b=FZyPjv3/rwsiysAPO23s2fAkNxYA+lIhETiT1hDU2zHfZUgiQIKpMRdWFLHwkrER/NM3m6Qv1twx8KgTW1UxB1zKtcRkIyhGTOzqF0qiadRZlHTSdvCLK07tnHpdNGaKMeo5qVBJhTumADnrLA5oAnoDXjGnp/qp12DMgNySV20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765734874; c=relaxed/simple;
	bh=q90fwVCsStew8YW3IF36ZU9dwxYnZ0k76Rea/XbpPaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwLm3gD2qrBG24drE/A+r6l9fSa+dH67q/ieJDor5qUubbc7NyBmtBX0DwHvXbsLzOrwKEe4kGeFsBYyjeiy+X0lI1CUrM3t7f+NCzdhtDtbI03CNHkGnGz2sWvTOOPLb27rqt9x7DuVBvHQEiAgak97DsulD3q4Hi4A+ttdjfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5YDoVKh; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5YDoVKh"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bddba676613so1994150a12.2
        for <linux-doc@vger.kernel.org>; Sun, 14 Dec 2025 09:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765734873; x=1766339673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHNl7WC4mCyjKwfsvpO/12hRC13Bl9TwcCjR4KxaRxQ=;
        b=g5YDoVKhelGPwRaldMvD/+yd9KgVKH9TQgHJ4pP+PhqjEDB4vEtbAIwIQD10XhU2JR
         iQHmlADLHX/0G+1zhCOUqpdMG5dgssUQqfTkdzvwYVQ73kImZlvWPfbUQs1LbpqvOqnw
         t7RLoiXzkWpY1M0/uqUiFpY5QqhKWXJgu6PxOkMKuWXU/7+N+AbdsqhTxkq68KdqGkjz
         OEsTCe0gl/7Egfdtkn9VL2ucqnUXeOM7Z2qKkopuXF/r0l1YfxNxzly0X+vcuI2+XWiw
         jgGTDSluWclqLia2s1OmCNWk/Dcyq5sL0JoRPAMfusWozjKtBN5rovsjUlI74knZvvfH
         iqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765734873; x=1766339673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lHNl7WC4mCyjKwfsvpO/12hRC13Bl9TwcCjR4KxaRxQ=;
        b=CHnkKnf7EHJM93H9T7eJ8CrrxbC9aD+cBPFrN+Nw7Cti9F+NlfwKQzlfHqtQFwpWGk
         nW4L1cnOMxD8BJ7fH27tc2wfUBmvehY4n2+4DVPSEKv1kaixg8BvusjemRg4McUlzno7
         U3nEgbizdJ+EaSTfFwFGM6a9V+7JNXc10yMuwGjN9vgrKDefX+7HJ6cPdMsjxpqGelNH
         hbyZKIvqE+ozunZax9HheBdJ3Qvhj9pigtcPcpVQ/VJP+bHwHOsN+8Kzu1NwNxZTLhpI
         zeQ9AwzCbBvMZCLCIGY8eoHgbiLL1zcRJjRvztrmZQS0cnDLPwpMnVSRohYFUNC9RS9m
         fA5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrqbG+l2+XqTn5VHm5OaD03E6SRWYABn6jDUsH4z7ymrY50eQOw0EAck/7r9bXbY07aa1JHkH+Eo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJa7UvlIP3hFujvPBugIS8tLKI33HKFUr3Ztq6fSdQfPDuQDQb
	46Yk5Zx8rpPH4IoLr8UJJnln2yHCSUVf8C0dPGjfplbQ0oojmjEhlS0X
X-Gm-Gg: AY/fxX49TiSvKJEVcbiEovSMB7d2QpsHy1KEsLz0TaCI3SKtoaQz8dyuqS7zaoMYexh
	LwnAYVN06+pWGtSAE53G1d/0igKX4N+xrBB9HqAmuxyZ8zXpYxQN6PH4fQsWDmZPDK6QcUqQvKR
	oylIOU1eCWKoWuOguGdemQFzXChv46CXOkjU7kjyKedhNBkbfaxiZSjxzn6zTg743yPkt2NHtoC
	hPPFp7B5cGzwo378g9LCqRtAheDSHTn8yOIbj5xTNpGYpCMbWA+LnC5B9uVE0IFulcfIuavma4W
	VixCwX3oAS6EjX/oJdpJ1RpubsL9Slj2TCCzAaFi6Z5YvQvyJINT2FK8iOjlDNQKO5BrYgmSPrU
	PqGXH7LZ21ecZmgeXlD+AwCGmfnQRw0eLcNeUksISC4uU1HgiLEKYaDEckSfmGq9vWHuZsqVGHp
	p/B4Odfb+GrAQJDuRKeBO5Hh4=
X-Google-Smtp-Source: AGHT+IEgY3xOmtDCZr4aNfmu52fKGCF97qf+0IdsWoAYaGwxw0Fmw2tARBFEIekN+sLdpxcVlVd2OA==
X-Received: by 2002:a05:701a:ca8e:b0:119:e569:f60b with SMTP id a92af1059eb24-11f349a1a50mr5431084c88.4.1765734872675;
        Sun, 14 Dec 2025 09:54:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb45csm38312053c88.1.2025.12.14.09.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 09:54:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 14 Dec 2025 09:54:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Robert McIntyre <rjmcinty@hotmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (asus-ec-sensors) add Pro WS TRX50-SAGE WIFI A
Message-ID: <78417183-c423-44c9-93ae-4d90e4cab0d9@roeck-us.net>
References: <20251213200531.259435-1-eugene.shalygin@gmail.com>
 <20251213200531.259435-4-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213200531.259435-4-eugene.shalygin@gmail.com>

On Sat, Dec 13, 2025 at 09:03:43PM +0100, Eugene Shalygin wrote:
> From: Robert McIntyre <rjmcinty@hotmail.com>
> 
> Adding support for Pro WS TRX50-SAGE WIFI A, which is identical
> sensors-wise to Pro WS TRX50-SAGE WIFI
> 
> Signed-off-by: Robert McIntyre <rjmcinty@hotmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
