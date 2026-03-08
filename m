Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CE728150F
	for <linux-doc@vger.kernel.org>; Sun,  8 Mar 2026 03:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772939122; cv=pass; b=EN5v53b3McRh/nT48I/w+VX7Z/953AQVb1uSzGkfNhbwcHZuq78X+8D4JSjtHGnoltwYWts50yx1P8EbYqQuxqVSLLrkD9H+p4p8SHAfU/rBFbpjS9A9EO5qM+LToTaaxzqh5gjJtYSTrsOc66B6NaBPDe5N1SVWDxDOQ1pyniQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772939122; c=relaxed/simple;
	bh=XqVF/p+ImAQye2fndI2NjUpZzhPeVdmdlRhtFwnS3FM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GWYse+jW/HF7ww50jbui/vr9IO6cOShIR+0lCV15jcdGxrRYDmG9biYt1juQwii2mFWfEvlFmimYKK0NjI3I+bVaEumn85ODo3yLffUUg03dpWbXeX68kMJ38PhPZ7g7aZM/fSTWrMeIjuj6LNO9wv3C4LkibozPSMKdCMLMxa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqZEf1IF; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqZEf1IF"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64c9a398bc7so9722303d50.2
        for <linux-doc@vger.kernel.org>; Sat, 07 Mar 2026 19:05:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772939120; cv=none;
        d=google.com; s=arc-20240605;
        b=PBD7GaiU8z/6fyQTcGEQWCnwVaPFLm460BGCX/CbQkS/E+jIK+rcvG/FevtFH9Vcom
         O8fUQYfBf01SQ1WgRcBsruD59qPGZY8V8xVVK5Dj6rl+Io/EPUOIfFHmNhOAu3eLvJxA
         R/CDQmqeHym2MmXeU+UhKqCCZtt5TJ8/FhczZesus5WkaU7t/VOjX2zhHrdUtM9Xcr/H
         jldfbnFNeM32LvSrHuio1jjGtChe70v+MwVwGUXztCZp7ErRC+akFSP1d2RHkiLycLSp
         JmD2uwjGqkcD1/tRKLcEYONp6H8AwzfEhOzxbTEkwcE0XNXL7PrvigycBlnFAv2EoJP4
         ivXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XqVF/p+ImAQye2fndI2NjUpZzhPeVdmdlRhtFwnS3FM=;
        fh=GiETUksAhhUNkddUi89uuZ+jC5GRvwCwMD2vbeC4OD0=;
        b=kmHPBbzkhLOHPx+LB6RA+FrOEI+8PanVuA+ZyGOsJ3gh4gg4jGIWJB8Hqi5NuJSMvV
         JpWSPaBKujU1NQxbgqDPM7wzYB3zutXOdBGiE8LtMyk4o7ErQIh9iZCR0RS4IO5XP6Gz
         DDbY032UUxxzZHNezB58gEnC0rC+i/dNv8FuiYbY/jA6oFJPbFLfFJbM0rUJ+k53GNbS
         qapi5bZ5CKxgijfv2oythHiaRUSsJgLYDxk6rcAMzxcht7v+Of78lvQFAQBAwM9PHMQM
         bDFcpKCZD4S5+uVWcw8IfJsJXZP2Kr/e9AUNTxVwatcTe4nTnPQ1B2s9GWztqHEKtkkP
         ACNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772939120; x=1773543920; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XqVF/p+ImAQye2fndI2NjUpZzhPeVdmdlRhtFwnS3FM=;
        b=mqZEf1IFB5PnYS957IQPQw5HZwh0keia8MaZhRo4Wg+9rWipW0PLFX9AmiMJI2JuJU
         sl63xBpUgZJPBcYIvXT6OHwaSOtZntuvZmgtFqR4BZSuV2QwEQbOQP279bw9sxCaN9Uq
         fD80TFTFfA533FDtwyr3PnMz8xzIRRF0jsrYkRR5urqofTOE4a+fFqz/jl5Cg72SfAiR
         4n9ThQGoU46k5voFf2N+n7z2YY2zlnMKfz8ygK54t+e8dk2y9mkL4SA6WtNqodjN95UG
         jobnOMJFvP+sP0Jlka1JKlmzVcliBh9OHmKEHxutEDN7O/Uz4akWJWzfk5p9H2Lgh0MQ
         jHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772939120; x=1773543920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqVF/p+ImAQye2fndI2NjUpZzhPeVdmdlRhtFwnS3FM=;
        b=TFejQ62Z4+QmvplDbCGCQ/4KLHtVznqbbaxLbpAs/uklhAUW7Miw0TYz9T+mHb/0FC
         rq2D5ACePSpZH9f3iyEGtLiJ/7Q0/I6b2TJLH01gJLTeT6892y/eOjvCd47zsHXDCS45
         oPcQsuuZL131wdvZl7bSN0lmKC4zo6AG1fY8ABAGPYXb7l22ceaIs0E3qt/TivcoUWi9
         7eNJVE/tRlLe4Yscaqot4kgAzkyvSxTPtPS2b1qrO1+IgK+pyTiAd45DEcE1twYSzGQT
         muXMpxjibPsbZUu0t9sco7Sk09wjNFtGCVPSL4ZA/SJDP4N14ZVfON/+H/uHrl3suAy5
         EIUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5TaZQqlJ2gTL6aADn2SVnoeRb049zXVMP65fbEUW1PQFsU7r+W6BIZ67mgxwJKaYeqrLyEloNGkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGhHnLtwWIanZWXAyXn2kPWJWCy8g1OzbYeqmK5V/OzB/ZzQ6y
	Tb/nLxVQYnQO2R4UMOhFMfEXT9AhQ1rEBm8h1ZgfIHKlqNVfZEBoSj8HFP2cg5Xh2/76WfiZGsb
	jYYxdX80Ykw7citP45TtLhdgDmgVssVYPn09OE8fKQA==
X-Gm-Gg: ATEYQzxX7hIy4n1H0+HzzodShDGNCehMb1xz8iyNU8xl9h8BFBV3sNZs8zUoW07mvF+
	YsX4yqzabfJglCfHM0yGM4VRoVnpdc/GXR8uLffRl1K+z6xRRrd4rPbkGxMFXuLvUrj2xKBQMv6
	SDpzbUFWRllBPATX7mRNDBTfIZ5v21lPZZjCoYRUyBshJ2ILi/dMyqL9ipHUrbFx68fVN+i1ZVN
	Sn0If1+zWCTjc1Jcs0rIsFCd2sVD7tstU+2YPpXzqq/U1G7du5UyROhrwo7F7kINha9+Qn0x9lL
	6W+6nVP+BkeYx5tAnt+bVFVuzEmNGAGRvM50nTz60A==
X-Received: by 2002:a05:690e:205f:b0:64c:a0eb:c4b5 with SMTP id
 956f58d0204a3-64d14293d66mr5095532d50.52.1772939119973; Sat, 07 Mar 2026
 19:05:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308021811.41199-1-aethernet65535@gmail.com>
In-Reply-To: <20260308021811.41199-1-aethernet65535@gmail.com>
From: Aether <aethernet65535@gmail.com>
Date: Sun, 8 Mar 2026 11:05:09 +0800
X-Gm-Features: AaiRm52I6jeA7gxZoERyr5HYwntXkI-cPR1yC_IGGfyUOLCoDxZg9DJSDG__lis
Message-ID: <CAPLv50pFasDAnFMX8OgXjo2Nrn8rGhUgm1=K5aOeVyKf57Z3BQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/mm/damon: fix typo in index.rst
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi SeongJae,

I just noticed that you already submitted the same fix for the type in
Documentation/mm/damon/index.rst. Sorry for the duplicate!

I'll make sure to search the mailing list first next time before submitting a
patch. Thanks for the quick fix, and thanks for maintaining DAMON!

Best regards,
Liew Rui Yan
