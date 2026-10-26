Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047743;
	b=Aj3e4vv82W/0GRScWewEvcfavULFmZKS/FqMShkmMdIuJ3nPhnmF5vksSOZ8tyHTetnS
	 /g+uA6Fpa2PYB4lWJ7xOToG0m3Gi1kUi6MnCVzCvpkI4Cnr066dHvYqe73aKAv5O+/TBr
	 SFimOI1yK7oYOLNSzDXKIITZMqiF2A8DQeQY5qqLPzRUA38/TDgF5S2Rj8bq+Lw9hcrU3
	 saAmFFc8JEbObvMmTNE+4CMYL9e0Klb22TaMflq5Ya4w1iCwvF0EgVIQnKhOzOUWK6tGa
	 Nl6weGXJ6ak8GLLfH1+0XK5jEuUnyu74T3cIQ1CRdWBL7ZaCiIX3opgjH76+7E+H+2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VWSRb8yy2C8r4CEpyXfNyN5KcdBnAUygpb0eI5PXXg0=;
	b=qWsnoYflheQV2jA6cXLfIjRRpz6+B1DrGBU/tZZm7UtC1TSXnUoN5QveP5Kosu8uuhAX
	 xyCp2XnMV47delROg7DnrGMMzjgqTXVCVtqkgyYtG6iYXtYWawGvLeiJ852OHtqzZjjJ3
	 eg7gfmmxyYDgyhFnMeHxKsFiWTO4l0zYsQ0yOjSAhnYAAYBwzJKxafIklidzWCYjd3m9j
	 4XwV5SKyuUlylf4yB4E0tTuildA1OxruQDpy4TLI12zA7P7rScIIEop/d89xLvDzgGo1e
	 x64lGsBcfpmSpXNE45DPKwKKaMuu54Ag/Vh9G3ytO+9OnVzSkBOdab+llThLyaHPuWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BbHojwCE;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB971606A31B
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 20:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB971606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BbHojwCE
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so1056170c88.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 13:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047737; x=1793652537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VWSRb8yy2C8r4CEpyXfNyN5KcdBnAUygpb0eI5PXXg0=;
        b=BbHojwCEj3NMw4yL8Qh098Vwpg1TpYShXs8tFqPGTbveTn3VdbWpkkaj2IycjbIJ1v
         Lioq2o7voyp5xc2EAsMynXZ6s6mm82Vz98UJMUTsMfwdm6U9oVTK9SFXoHvKy4gnzdY8
         uOioZbAj6c9EvzZBh9GFTGk4CpseAysMG+l39AkqUgWbHrmAk7sGc7QJ8EMB030iBlbs
         o0gc36eqHukwSWYCQ6qLDbpIWurtGczA9n6RaDmywMIZMUbp3l+Tvr/FMQcow0kGZkzz
         QLGupQiaTfKDJvIJEu2Ffyd3zuoEcnA2Qy0+cJpBHDjQHmXHlgEqqSeet30XLCrfdbsf
         FjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047737; x=1793652537;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWSRb8yy2C8r4CEpyXfNyN5KcdBnAUygpb0eI5PXXg0=;
        b=mI6jDUdd7061Xjp8PnBkAt9sH+wCG8IaNa73qB81utVBrVnzDhlZY+XyqBj2GFDIXQ
         8bjJ5vEEFH2fApw043/JhjXKJ15QaaMRrBb+l4dO5aEmJve9sEiGBzLzMcli4nRF7Bcb
         /1aG5si/mrc6I39ppr2PAPpeVowPgwIYJRnUqxRY+snYzQMr8vDwKcQ8IJe3YNQHWflS
         nAi5wPvlKPZ4a42eER342yrW68CLiM1tlozwtD4C5eMqv155gYQa27vcVyweD5BCR9WN
         4R4r+bkWnHMlVC5lgNyTEqj/qRXoEW7rynUqpiHEZfiB4aZC4Gmx34mIVUJLgRi8M8+C
         M0Zw==
X-Forwarded-Encrypted: i=1; AKwUvBzLnd8je9Ni5NdgF/r11aiyrdjUQY8+pfyV8GM7I1xweOPl5H0zeMxqSe9OZHc8mwCcLo4iGQU9dis=@vger.kernel.org
X-Gm-Message-State: AFq9FYI30hPyQqwwYxvy+lzLWwA+bGM/2Y72lFzDW9lLqp2C7z3HqAQi
	qiOhVR4CQL75gm8B/AOx6GD79iM5NbhAEV/hCpjARppR+j0UCiGgOvHC
X-Gm-Gg: AYBFou1tzOJS0veib1eRwlYNBpT9qyXD/rI2smKW1hGO/b1+6KXnIoa1rR0UX3DBcmL
	sLWZOjIFmdqNPQvNnfsTDegpx4oAr5+3aV41u+sJFUwerCeOe0GQDYaukMT/sIlA0Xk6ttk05PS
	Y5scfzyRMFf7aBrYJzvETqPevD7jMFI1nNrTFR02qNtFbVBSP2DvB/uBsfdCep5Zu1CV6ZSlTt1
	kFvrbiCnLdP39QlbVy/8sqhZ+JAssuORSUZO8h6Zj8yrxR6hqIC26AeY5biA7eRi+ox7yFHuVeQ
	vKMbxKCqi31VFyyp2zl+UnsfuvTYWdRVHsFxUSyJOeuw7l2M05BA9+WAP5fvNRhxYaoid9NzX/D
	4GvuCUX7Rbr05x2uaLji3u38hpvT/Q1idgzN4xyMNCmg2EYgKhv11xgpTtHgzEScWj5FwzH9XeD
	XibTKkAX0lRhjJhGNwzMcphZz+Jwwrf9SkbfIzJNwMrcNJqx84n3QEXK/o/iIGrAxMvVVpQkMG1
	hDKJzdwk7ePhGqTxf6xnYW2dM7XH62QXHuzXRsuaR+eNG/YNqfmVDkxA2leC5FUDq9w1g==
X-Received: by 2002:a05:7022:b90a:b0:14d:baf5:c415 with SMTP id a92af1059eb24-1993499de9fmr11845388c88.7.1793047736520;
        Mon, 26 Oct 2026 13:48:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2eefbsm27592312c88.7.2026.10.26.13.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:48:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:48:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 3/5] hwmon: (aquacomputer_d5next) Validate incoming
 status reports
Message-ID: <6ad47f82-3074-4fd1-bc9f-e3db57171e6e@roeck-us.net>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-4-contact@vasily.cc>
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
In-Reply-To: <20260927191316.4137752-4-contact@vasily.cc>

On Sun, Sep 27, 2026 at 10:13:14PM +0300, Vas Zayarskiy wrote:
> The raw-event callback runs before HID core pads a short report. Check
> that the report is an input report and that its length matches the HID
> report descriptor before decoding sensor fields. Otherwise a truncated
> report can be read past its received data, and a feature report with the
> same ID can be mistaken for sensor data.
> 
> Apply these checks to every device using the shared raw-event path and
> check the report ID byte before updating the cache. Legacy devices keep
> using their separate feature-report read path.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Applied.

Thanks,
Guenter
