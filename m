Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C708F1D0976
	for <linux-doc@vger.kernel.org>; Wed,  4 Sep 2024 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725450521; cv=none; b=oX2kbDrcRMZeTJ3YmpqZ1oi0a4P/0Mcceztq7pnOQpIsgA4gysdDyz2uF9Dl0vcg8UHrHGPNckNjbJ75oQ0hzrDqmbo1IyQLuWgLzSRb+W0ILrDPqBW+x3WM+D1U1ZN0lh1nh2teITHA+9P8mI9qRkyIVQQe5uLASQhsfVU8rD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725450521; c=relaxed/simple;
	bh=9grxJBulqA4M7mTry0HLRVP5zF0PSNYxyQ99ICIse5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/+81QpnfLenHlSK7A0F6KRdq+cpbHcD13J13pxKN5LRKDGA2jWDyhhZAJPNAvT9w2mY6RNz3YqGp2/1f7O4g7no5Iss+ghNOSVSG/KWAxL7hMnlbzth6OWYEW8nAwkv1ZkzNtvwOG/WhJ/S6mIWg4BO8RXv/1HOnQiELYWqpxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RWRQVciS; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RWRQVciS"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f4f24263acso97475481fa.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Sep 2024 04:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725450517; x=1726055317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7c+oJIY6rjOiXmpMYXeuDRnxHvChpBfHfXKg9Xvladg=;
        b=RWRQVciSMykfeypt0UcljqVDSyQsPyDPi2vjphZINHqUmq2sW5GpPCeJUHzibmuL6A
         mo6hE55jY8b138Yoa5n6Hc/QXYCMHvrwQxJPfg565XJ4WMCqSKa6cKsh/fCVPqT4RxZo
         Tp6N5J2SHAF+G0YEon2kCf1fFf4N3E4usFW9+VA08QrWFyk+E1fnmxDJiZtlcpZSoMbK
         26M5f+FxJ+VJjfS0MMV165MUbFal+bYaFX0f1v/FvqvtzIaTrbxoYu0zrDYLMubvbGJ0
         LV7fS4zNqg8E1rGtA3bQb2VQD8Cm7jxs2U5WhN9DWWWRoLbh7BCvEldaRfSkD9l935wu
         zSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725450517; x=1726055317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7c+oJIY6rjOiXmpMYXeuDRnxHvChpBfHfXKg9Xvladg=;
        b=epfmg6zWBQh2eq4DQMX/2IkzeDtFl0j5eCV3lJn+Ekzv+6UMofjM/OEv09EoiS53J6
         i2CvtLur0Faqq0kLcy+e5GKEuUu7KQnp6fsfNRi3YRcL+hBidrfs5OmnA0nIHs5lHVVZ
         qpyqqfON/nGgHCwO/GGlUgsQRSzFSss4cPpMC58qqBr3VIAem0HVH/6whCeG0v9OOzeN
         98QDl3OIw9k2SnvSQnoZ9ew+1NHvrI3hOpxvgcjrJJuiDB8plz3+paY9bAT+ibg5+/Ns
         qyNTz7AG9jyg506ENont9i+jB0ydUGVjg7yNfNWX2u0MRNhLCLCD4xbAWzc4ViiDKSt8
         ldCw==
X-Forwarded-Encrypted: i=1; AJvYcCX24DHA+ZY2rWj25lvjeEC4dVnZGAfnpCKxJ2vwrUV7UgSAD+0NLp/StrjGWdkiMDTHG4WOJL4/BEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh+eEEs0TKeKgBvnPe/lsKjm2VLsgy0X3dvKLicw55YYbZPLWt
	q+GsXLOBpWV6sZJ3BZWeY0GGcjbEoD9OueIaAhp6jADP4of+iSKCUoa+idt54ts=
X-Google-Smtp-Source: AGHT+IGWQuArwLoBWGS3FkJMZjNYcq/QeFma7aPLpSFDWBKQmp/WL+6f16yVurrf2i0A8WqhB+DPoQ==
X-Received: by 2002:a2e:f19:0:b0:2f3:cd65:cf65 with SMTP id 38308e7fff4ca-2f6107080ccmr150312881fa.28.1725450516688;
        Wed, 04 Sep 2024 04:48:36 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891dc6a1sm810537966b.175.2024.09.04.04.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 04:48:36 -0700 (PDT)
Date: Wed, 4 Sep 2024 13:48:34 +0200
From: Petr Mladek <pmladek@suse.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Livepatching <live-patching@vger.kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marcos Paulo de Souza <mpdesouza@suse.com>
Subject: Re: [PATCH] Documentation: livepatch: Correct release locks antonym
Message-ID: <ZthJEsogeqfVj8jg@pathway.suse.cz>
References: <20240903024753.104609-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903024753.104609-1-bagasdotme@gmail.com>

On Tue 2024-09-03 09:47:53, Bagas Sanjaya wrote:
> "get" doesn't properly fit as an antonym for "release" in the context
> of locking. Correct it with "acquire".
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

The patch is trivial. I have have committed it into livepatching.git,
branch for-6.12/trivial.

Best Regards,
Petr
