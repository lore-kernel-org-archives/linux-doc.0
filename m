Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3AC345CBD
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 09:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517456; cv=none; b=MwZ/PWsY+ehkxX4s1k7fQSxT4uf2tyiKWtJ4SV0yNq5erQ5DvsC81a7viPq78ik/At+YNHz0J17JuXEwb14BHptVhdgKS7lvW5CShVtPtlCqdD3xatCN2Q8CnjKHIOTPUoAtorw9JCZf5s+0Dp21SohZHo1tx9PgZKKG18gQD5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517456; c=relaxed/simple;
	bh=QtWyKbyv1CaScLyOexN3V+lc8j75HC9FePRDvJfW3Vc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcZhct+h/id1Xa+Ev4GYLFG28fRqKCXZJKW7Lvp0lnp8BpOGl08Z7DH/VNwyO9CqQ/vKbCK9+Qp3X6s+pjeEEhlYm7vI9y/9nLL66XOA4AM0gTPgNcwXbIWKwzRV1xAfJ0Lo5BF1wimdRjRAnwwod6trwb78B9S0Xq/DOtSmQQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=porNKcjM; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="porNKcjM"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso416973a91.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 02:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774517454; x=1775122254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1YKl4kPmmFXUtashtw2qUNBPJ06qzjJcKZ47z7Er3c=;
        b=porNKcjMXmSD6QRy05xbIgsuan1A76i+Te+yHDSTawMOyk/jWNAeVJSracgZOG0RbM
         f8TVMjN7xYQDZayMn8yvTQ3OjPlg6Nt9P6XxfVIETfxMVJE6cedMI3lJdNmSC3nbsQOd
         qf39FMDAl8lKt77m8jRV4aulHa2eL3a4PBouZigXixC1XtdQFqP07wTX/8d/H4kqMfqe
         jk3vXamWUr883lRuz2Frz6LRKgGDYVobg8QSQOPntUlfUtM76tH7t0gLMkb878vS13bK
         XYxDLx1MbWEtULa5W+yS0HmM8lrn60v+EzHUaNbphNDYGgfhxJbccZAtx4hrQ/raFcvS
         wI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517454; x=1775122254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1YKl4kPmmFXUtashtw2qUNBPJ06qzjJcKZ47z7Er3c=;
        b=AQ7qtGwZo05KJUouGrB44vrE0YfiK0XmUCFhwvX8jiiUiYp+nw92aURZDFbR6j2xXD
         FuHSIPGKvh4Esi1CAeVdJ/Z8v7zWiRUwfsM1xUf/liT4tTDYH0waYWTkYmU0eaGfsuIW
         dJRLPF5I8A+KEulldMghRGZCEQeYNkMYjef44fvWR3TE+knpKvzHXBykdF+cEhZ3pSpP
         EumGDxbqLDxPg7mt934HH4XETPfv3oP0aCgkdyT/649KH0UhA6CHhkq34Bu0LMKzMgEo
         G0z4wjGFNThc94+kneGgV43S+QbEn1ZwgLwIizX93Hv4pNzvNjNeIyq2Evr+XY0E1acV
         A8vg==
X-Forwarded-Encrypted: i=1; AJvYcCVHz2V2HdxUGJKJIjWNr1SqcPXwg9gfhXqnP1LcAFjHdsrTs9U5txr9lau/G6OBV5VqjTl+bglHkXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS139lbTWo02tTS83b9TCtwrM2TKGMP507LCGssRVEci/mTTSC
	pQnLNr/BdDeUmkFwqyGXCzwXnvu2qulmUdNUXv4i/NPy247f8XEmFdKeTKBOrg==
X-Gm-Gg: ATEYQzyfHOkwa54bTWvMHfGTfUJxv47Gh0lMXaMO5umte2v32jNMnChaZy+5rCHQ/65
	Mm4UfWpqq2aAi7GvFoGDRCPQlcpRceOKcpv8DkHA3oVxuDBfTDqOF7eiCiKKBAW2R6Xc/3aihby
	HbDLYhT4bTdeV+5UnY/kzye3WXSc7pVsSUBE0HjYg8dCvw2GwCAQ3Rw3JXH4OPMZ6UXJYDqrSwd
	hgzK8KgTXQgRGR/UACJmmiu8P+qNUxRchZoK+IYhJWLjFFTF7u+iPYx8igp6l4O9/nzrVdzQFfu
	gyEFUp2aAoI9jq9JiekTplzQ/eOTHKxqVyHRUg60yyf162lWM8gkKp+DGceGaeVSTr72uArGKlw
	Q+GFrjCwpBgU4wws3Q+Cqysf4A48gPkNlsAeWcC1TDGP6PhsyajaiP1Jftx25NDzr27bimIPzpw
	83c1J14+PZu/LwsURclMUJEsMR5JLUv5NW0Sm+vOBb2MfWgk88TtxPxJRa0GJ3ajngTcuR
X-Received: by 2002:a17:90b:3fcd:b0:35b:e4f8:7ac2 with SMTP id 98e67ed59e1d1-35c0ddf6e95mr6079956a91.32.1774517453978;
        Thu, 26 Mar 2026 02:30:53 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a7b110sm1456822a91.5.2026.03.26.02.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:30:53 -0700 (PDT)
Message-ID: <7713fa4b-3bec-403b-b59c-50f23196c7ab@gmail.com>
Date: Thu, 26 Mar 2026 18:30:52 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Invalid link generation for equations
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-doc@vger.kernel.org,
 Konstantin Ryabitsev <mricon@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <9b320e77-9acf-4f0d-8c52-6e1fc3a8cf53@arm.com>
 <87se9nejza.fsf@trenco.lwn.net>
 <501de93f-65f2-4a45-a84b-d38560cd9e22@linuxfoundation.org>
 <87o6kbehr6.fsf@trenco.lwn.net> <20260325224015.1ba54eda@foz.lan>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260325224015.1ba54eda@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

[...]

I think I found out what is happening.

Sphinx version at https://www.kernel.org/doc/html/latest/ is 5.3.0.

Sphinx version at https://www.kernel.org/doc/html/next/ is 7.4.7, where
math expressions are rendered as expected.

Sphinx 6.0.1, whose changelog at:

  https://www.sphinx-doc.org/en/master/changes/6.0.html#release-6-0-1-released-jan-05-2023

says:

  Bugs fixed

    #10944: imgmath: Fix resolving image paths for files in nested
            folders.

The bug was introduced in Sphinix 5.3.0.

This means Sphinx at https://www.kernel.org/doc/html/latest/ wants an
upgrade.

Thanks, Akira

