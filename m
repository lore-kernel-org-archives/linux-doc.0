Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFA729C33F
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784474286; cv=none; b=ZF23gfGGssnHPRH4CXHNUefbLH+MKwNqwedTRH3tn+2PYtJt02Iq0kj1eMNKZ5gioFAib5GmrwiDMS1mblDr4VQMqQCSlgfNbSdaqB9Xy+BIFl7RQM2u/OIOvd0YaLXHoXhMud0XeoQyFDE2Jeh1EhQ8zFcCzzhYj76H5QFA4ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784474286; c=relaxed/simple;
	bh=sUR3oendVhhPXyDA0z7RF0lCgvgE1pC0vEjiKRP9KFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TdW4sKdoQHlTcvvFyqD1YhoWVoqJxpEZn/jchxu/k1PMWfhS1+CacFwSam9JVJQ3BA8Ejfey5DWo+rLdvCqy91sQgcV7KBMTzHMdSOQhZvnvEHh0uOa4EU54b2I0Ijp1G98pQjTicHoCAU6hQ+ogB2PJ5djVv8bbouvRz0Ds4o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qiQKzxwn; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qiQKzxwn"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ceae1ed204so70318925ad.0
        for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 08:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784474284; x=1785079084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwHm8ifmILtpCgeZhnaMfC9JFTdRpExWbxkxrdMS+t4=;
        b=qiQKzxwnMpkfhpa8oqBtR+idPfpZbhcYRLYpjVcMGd87A3CsZjDFR5o/jLRuWyTkCR
         k6USYjV1n4ktc7k4kfBmuDN+lcfU2EB3v6bIJNPYUBDxqHFEP/QaLm++u+2VuewZVqpS
         V3TZTUWzcteKhpWYkDMq2aQ0OJhNLGnOW3GV5gcS43bqOk7YtNh6MGbUzdPfrLrBZWAU
         r2H3W5rBEQdyrdNGo42sTkrvcpuepzKI3zDAEpYw9glNZGWwAhtthb4Rb+cYJfajcpf1
         5T2F3PQLWdLXXVwNyWnf3GpRs8ZOVmDc/7EjsqCVgjRe8GqiShyadCiWlpc/8WkEL3Xe
         RVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784474284; x=1785079084;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwHm8ifmILtpCgeZhnaMfC9JFTdRpExWbxkxrdMS+t4=;
        b=JgzWUmC9tke8a68+Oq+NC3VyC6QVHkoGGhlWlPzqPXoY4GQ2CoeZY2DDQ67Z6PrbzA
         1s9oY3aXG6l8eo3SiorVDJrfYDiAQbRL3IMvfcf9AsH1Vtb9YG6YqkFA1GkUMqGTv0GN
         2YqnbXUwaPvmibDWVrGckQzydBh2gEMRNyLxmH54njhN5IGRBqzr3R7X75ASul0/XfmG
         v72YI8OtFm8iSpKMSrAGzJRp9py3ePoF7F4J6jvSWJX3u9+8h7ruY6EaRNxo8bsgdaXr
         iQ+rX0roY4X3l5974lh2yp5TfIaptoD8r16vJlrLobIxfz1VF1spG30DJ8fFMjoCHIqs
         jVwA==
X-Forwarded-Encrypted: i=1; AHgh+RrA4l0kNmOHRI5ImVHVqTn7YLq/Lg5hrXpWsUZw6nTcKWc+s8L02WCx2c0PnfkorNPFqfQCqdoUJok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1uUD6JILAKInXJwjFgx1hGzBr9miD6sJvwO5Hd3k2A9/BXMOC
	v9tI9s9irDZLiiJjwrB2UlZdV+2tqROxKvtD5NoNNDAmpWo+7xUQm2SJ
X-Gm-Gg: AfdE7cntWP/npAzBsgSQNnAMj6gEm/pI6EEHnvEnWg2NBrgraOyXvmsgL9LEh3CoEXi
	OJkwQE+PUN+A879ErFjhNwKf5MvWaZjApSfre3Qmsa7iLrnn6uDTmxyNcj4ixAqJNJ47fsxCfJG
	ftxLs8lEgD/YJnhasrr+NluGNnA41xhrP7ci8XKcd0Zf+hM0hk0aTSC5wHJBBs/57mUI8OuA1zK
	LQn+hEs6XTSx2lNE4OR73gQS9ugmgy5g3P4qRYcp2FqZbMN//sM+8oW8pNYndMDCXf3sey1yttr
	aIJszclMpp8bGWsqyc1jFpri1NqjflwYlnCh6QV5o6auyb+VDWUiBOs/uvRD162id2WjStWjBWA
	qf+X6ZBesnJuIyQCNZNDWXA8JaozKzpKfL8y8I4uYuk23EHKjOZjY+pYu4GbGdR8tvSqR0+pZRd
	r40zp1Hwm3CdFTZFT3pWZ4quVnMXS/qt15CCGCdvkeyGfqbcI=
X-Received: by 2002:a17:903:4b4c:b0:2cb:2b84:f431 with SMTP id d9443c01a7336-2cf34a4974fmr117192665ad.47.1784474284038;
        Sun, 19 Jul 2026 08:18:04 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34490361sm42044975ad.17.2026.07.19.08.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 08:18:03 -0700 (PDT)
Message-ID: <b24cbc00-73ab-4989-a0fa-f77cbd8e184c@gmail.com>
Date: Mon, 20 Jul 2026 00:18:04 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs/ja_JP: translate submitting-patches.rst
 (sign-off)
To: Akiyoshi Kurita <weibu@redadmin.org>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net,
 Akira Yokosawa <akiyks@gmail.com>
References: <20260719142002.182921-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260719142002.182921-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sun, 19 Jul 2026 23:20:02 +0900, Akiyoshi Kurita wrote:
> Translate the "Include PATCH in the subject" and "Sign your work -
> the Developer's Certificate of Origin" sections into Japanese.
> 
> Keep the DCO text in English as the original certificate text, and add
> a Japanese note that the sign-off refers to the English DCO text.
> 
> Use a reStructuredText note directive to make it clear that the note is
> specific to the Japanese translation.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> 
> ---

Extra blank line under your SoB ...
Please remove.

> Changes in v4:
> 
>   - Use a reStructuredText note directive to clarify that the explanation
>     is specific to the Japanese translation.
> 

This patch doesn't apply cleanly on docs-next.  Please rebase.

Thanks, Akira

