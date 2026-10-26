Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047678;
	b=43h+omvhtp6MCeVFR/3wlMB3Yr6pVh14tG/4J4F+sjzCO4W79SudEV/1lvOeeuP/8/Lu
	 byc5gNsB5LoiIIXkmPg++xB7Mx9uUsw8B1D0+77EOxHRf1cMFQfJ0CtkCKUkd5EqeQemR
	 BuDOvhSMjBmU56pc5a5Ggn4JxDSOtHkmG/oXGdk1xrZt7F0xDHifDz4iSLKAlMGoGjhaI
	 EHURxR5gA3Xg5TBYSNYrWL0uhRwjZfsyztVKJRigdjscSfvdpM3SVTQeRU1jp64AKZuGO
	 bRNmebd+C26/uqbPv2ryL9cpGcma+TTH4PGycjS3vBwSPJ4NXUtjXWfwj/BOYaE5aew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SBmctSjaoLLILJHNPpPv1PuNvPvq0whtOyZw1gjKndI=;
	b=W6+DAsznhwPOW4Vq/rVMJ1qU7cHw9qgc+NOFPnMoz0sIqB7DtCePvjB4xK1yjysvnzy6
	 Exwro7Dt8xzy5uGQjM3fAGdXeHGR1RB9giXAM+fH6sp6bvwKRh9CkuH7zZT3esKPEz7WX
	 Bsm9+LadmJRVzpNBY3CxOR3Ytzu1WOPjW0NaFQsLnq9Rg8Ip8QrN1bA4n2o5xpGnIUqZF
	 76+08ZZkKHT5MaVkHOT83whONTreLiNzkLE3YSGbVZ7vljfqH4uAiCbsNKEwEoVUREpUp
	 tlx0L7ogxtanBHrMMBZiES0D8WB+hHE91GNgrQKNwlR+my1fJXK5sBTamcX3S8RH7Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=irCKRdav;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4134B606A31B
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 20:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4134B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=irCKRdav
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-19305bcb72cso2564928c88.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 13:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047677; x=1793652477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SBmctSjaoLLILJHNPpPv1PuNvPvq0whtOyZw1gjKndI=;
        b=irCKRdavJ1ic6tR9vsqNpCYqnE/IzH8mECl28f7EEWDTHhJizVrT9hOcsCXrlL6zhx
         NSTeoZXboKZF99CJNcnVHZdKUUSk5kEkbSSU5w1xeKbhNKltgulw2WPFtfizm714ls6y
         aSNJB9P8YNNi8xWqwQiUgEtWrDwZaXsZUHUpfMb0ZY8lDKo230xFmBsilpkMBNegfQP+
         SexeY5JCZOe+PHxJAJ5H9eePOWUKl5K/iewGcknIEklYTQHUg6UXLnMLfi0fxIqeoLXg
         f10hQdO7YPYUiHFezZ0LvK3EPCqgGJ1sN8RaFCl8Roj9LVQbseKNdPAK564zXvqY3N6l
         ftKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047677; x=1793652477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBmctSjaoLLILJHNPpPv1PuNvPvq0whtOyZw1gjKndI=;
        b=Rp/xJA2PuwrJooNcKCd26FEC9uzRtE+eAmlKcjbTeUf2NaH3IQKJpAQzjT9SaNCfM9
         8eiveGva2TkKgN+rOvXqP9HcPblHWStQ44mHkNHp1fUiN3eWC2BN8/USenAEPZxfdBTr
         nC6FNvYVfopSmyQMzWdkKFOD4LsuTD4rF89ofgIdcDsRK8IvrFB/Pwkc6Ta8zKnFEgWy
         zJVrc2inSybmNaSnJ6qBKqKpDWuye3EvCwIQxOwm4kc89nU0j8aDVSbQxLbZtTW+e75F
         jdBJHVRfE9mOiieiimG/WoCPbdAhe0/mfp4216p7D3/DY9N/P+UWkBqefne5daEqxkwt
         /M4A==
X-Forwarded-Encrypted: i=1; AKwUvBwoky5F2Lors/AWx/GUoWOmmgmnxXtLyJ2AUkx9K95untASNR8n6kPco7+TXYIYhMIR+HDA9FMQtHI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUk0WATVwbyssA+eCUJhVvD0JdmY22BBfMwfLn9yWPl9R+GCsm
	MVwIOFZjXG5/rX0qQcJFP6a2NzsiiJ4Plxq8ZZ/Y9PgmQisUK0T3/zqy
X-Gm-Gg: AYBFou19b3BSvtsrEN5wz6Mequc0qvU5yRq6HNHksyFEj/2qIlg1C8nD17xx5BOU+2Y
	xgMvpVjaoVwO9vu26nx2T14K0CNegHvdsqzFW6kKELP7AQPVBqiw9KSrhlz7NJg5cxq3YmdrPQM
	S6yy5XLEgbCE/Fsl7PZp9b+UorhWT+ARY86pYMdjF5tz9Hs7Rr/U/ljajMwHH9A3D2c9YMT2XHB
	798wqjHlv2vlNGOFlOHhXMFE8dJ3MAd9zXYU1QRll3+tBsnsCtumK3iXSIQrBirA/eV3awneRC+
	uYXgsJIwyvl4Mfvp/ND9plW16V2QK23/LQgCt01V9WZVdDpHigizTp4DjKLalhVduh6YN3o4OIo
	OUElB0IOfaa44VJsEWTiA9cuX2tg7+R2uVCufepTXcKpHonk9aQ0e4f9hJU4Ns95Rl5EmhG5lVL
	IhlGXoug7ZXjFwsdfiIVg1vBo+ulLeNxv1yT7xs9qziMkvLtm1ep9HJsigD21dCgNvJB7LO3Rt5
	hCdauPbN6CwFZJlydUUL+vt8HuQfG+hhspG8FyDpWk8C5Ayti7Q2MDUvwZZA0e4v2G+/w==
X-Received: by 2002:a05:7022:5f09:b0:15e:6541:3099 with SMTP id a92af1059eb24-19933e10e21mr12324517c88.7.1793047677064;
        Mon, 26 Oct 2026 13:47:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2eefbsm27586280c88.7.2026.10.26.13.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:47:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:47:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 1/5] hwmon: (aquacomputer_d5next) Avoid truncating
 scaled sensor readings
Message-ID: <494625fc-168a-42b4-9591-cbf5fb2e981e@roeck-us.net>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-2-contact@vasily.cc>
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
In-Reply-To: <20260927191316.4137752-2-contact@vasily.cc>

On Sun, Sep 27, 2026 at 10:13:12PM +0300, Vas Zayarskiy wrote:
> High Flow Next power is reported in watts. Multiplying the 16-bit value
> by one million can overflow both the signed intermediate and the u32
> cache. Store power in long, perform the conversion in u64, and clamp to
> LONG_MAX. The other existing power conversions fit in a signed 32-bit
> value. Return -ENODATA for unavailable power instead of exposing the
> stored error as a reading.
> 
> The power cache is updated by HID reports without the hwmon read mutex.
> Read it once with READ_ONCE() and use that snapshot for both the
> availability check and the returned value. Mark the corresponding
> updates with WRITE_ONCE() so that the shared accesses are explicit.
> 
> Widen the shared current cache to u32. The Aquastream XT conversion to
> milliamperes can exceed 65535 mA; clamp its negative conversion results
> to zero before assigning to the unsigned cache. This also permits devices
> with scaled aggregate currents to store milliamperes directly.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Applied.

Thanks,
Guenter
