Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8552D5950
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 20:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764017055; cv=none; b=T/hJmgAcZDoYTc4blpz/qoFu3VghMdbMnX2cBuwpPLPTxAe63cyPpAfxFJZ/XOS0GuD1cMy0qdj2cvbJe4ubEcJNpYWdsnB5qupNFsdbO1Q+4J8OYAEzCutzJlumvg3j9S6Yq2yS1Jd7RPC+FX2EUx62rj/+M85n9WZ2qbkOASM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764017055; c=relaxed/simple;
	bh=BBE6LeQp/9dxs9+8oqbQWSo19CZnncAHHP/erXGXDYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mtfD8Ow3mUSCFDWkbGrpzY2CxccSndsZyadFVPeXO/5Rs7shxlvuSrKPFqo/qW6sJHXoBe469YRoP0uHE6f5psj+xhIKqS1sjw2uaBZzVCITGcvyMLBDyMi/z0PVvVeHAZYh6BqtmBOh5eky6jybXhzmh6dpAFEU6j9LGTbqyNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=g8iktMVW; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="g8iktMVW"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-641977dc00fso6788508a12.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 12:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764017052; x=1764621852; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BBE6LeQp/9dxs9+8oqbQWSo19CZnncAHHP/erXGXDYE=;
        b=g8iktMVWcI/LuhUgIvV4WSpMbjXgytvx4V51oSQ+pjqWLbfgytyU/K3V7DMh9pdsI7
         Vr9D+wtwK7v3vQeer3Fx3k6I1pZ9PaR0cO6sDCpXxn7AlUC0gDq6b8guo4Guce67IJCN
         55Pt7JRAZpI5vW3IqAu7wMbflGWFJE9P5QiMO/1jhsyM2ozz0U0RmSCj/w4entfSzV6L
         QJEN1M7HB3At0fWH7JxrJ4Be9BvzoMkzKgWfnSZXoxv3IraS0egse41BT1QNk9L1wGQJ
         WHi0CBEw11KQ2NZsgWBlfsj+C3V59QBoY2yQkhcnxYhTbVZMqJF8PQq5ex27MQrgwYCJ
         kJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764017052; x=1764621852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBE6LeQp/9dxs9+8oqbQWSo19CZnncAHHP/erXGXDYE=;
        b=QAKi/Y4i6VXtWYLBjx2VV2jYqyEG4BNmjNgAFw/MAYUKFXYPGD9cqqJUBuBqril1hI
         54g/MOmQTsr8uwz8XHf35bdEE3X9vtG93Nr1YHtyuJ5YvZ73fmt4hlH6WCHpL+mjM3d1
         Njj4OzfK0WLwNV0N83XOF25BHjMp1p6PCWrVpVSUYnAqea7gWyD2lECmJ39sObaHIZpR
         33cJiu62+VOf+gfpaHUD9xaEjCf97BXm3ohWs1M6frqojLXCPcyZBPfTM0gcZkIWA7Va
         5S/Dk1SqzQ7qw+ZeOV+AGanavWyk9Xy1TPXCyfrLQZ5w/1aAP4+h18+BIT5bLLrHskb7
         Is5g==
X-Forwarded-Encrypted: i=1; AJvYcCXnNnvxbZkdL+CX6qB3ZEjVDp8SjXf9i10VUZwlDdlQDgg4/cd7ujcuL/wSTk4bKqgfO87iZpQ0VFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YytmoaIfmNptKXC7uu6AZvw+XI22rK8JgvkyaHD/Ueqp2OfNsBj
	GtcnruB5jFK4h2QPJzgq6JQPbGErDxsYmPQUU4gW5O5ZibiDotQVyF/6uiSz0Eyv937Hm3JzEV0
	yr8yiDqoNcCAJJaM9PrqkmpFLxropmEU5rCqAV3Wraw==
X-Gm-Gg: ASbGncvJjBnGfWh7A6UrNvlRhnVV9O995vUYAf5kRLfi4dtVyrmLJ5eTbRismAUyfHR
	PSkqm2DBVg3kACywWGr0lirT5RApXSVleDBQfdN+hzuV60plWTtiyxQaTJ3pYhheWbzYPIoQTpS
	curoeqfWKHE/jsOOU/0JW7hB80ygbLdSaSPPjWXyFe6d4YHRbeDvmwkoL+mnX8CgMhrKhpvtZfu
	BpYM8qelMfM2MAURpxWSAy/wVeK20CuRXEdJZkpIaJ/87IyhZHtHBhc5qjtyQPpxGrqWPB8FlmD
	w3U=
X-Google-Smtp-Source: AGHT+IGhvW1zbxphQtXzCMtZtUK6gJJpF4SpaRUxkwNlXNg4phdSf38kNJPBHFGIc5NhOi7Yie2O+dbmmBf+QzpJ1eA=
X-Received: by 2002:a05:6402:35d0:b0:640:6653:65c1 with SMTP id
 4fb4d7f45d1cf-64554322775mr12262864a12.5.1764017051792; Mon, 24 Nov 2025
 12:44:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
 <20251122222351.1059049-2-pasha.tatashin@soleen.com> <aSLsCxLhrnyUlcy4@kernel.org>
 <CA+CK2bCN7x=eMwfTXF-2+vR=Gn3=41z6Xxx6wM1m7i-rxzug9w@mail.gmail.com> <aSPoIw2keoueM2q8@kernel.org>
In-Reply-To: <aSPoIw2keoueM2q8@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 24 Nov 2025 15:43:34 -0500
X-Gm-Features: AWmQ_bl-mLHs5xZHjLqaNQo3tDZr-xY0sDzlZu79iSrnbtwX9ynUfgq6sBNqNvg
Message-ID: <CA+CK2bDqaVV9=gQUQr81euOJCN2d2vJGH+9fZw-Vcymuff3KdA@mail.gmail.com>
Subject: Re: [PATCH v7 01/22] liveupdate: luo_core: Live Update Orchestrator
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"

> > Sure, or I can remove all of them from Kconfig, whatever you prefer :-)
>
> Quick grepping shows that the vast majority of Kconfigs does not have
> copyright, let's just drop it.

Done
