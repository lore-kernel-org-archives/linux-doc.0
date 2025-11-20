Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CA01A267
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 00:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763597436; cv=none; b=I71fL+jxc/ss0XtezeKAaAimM45PFG88VZPthpVUbT2m7w+qkFpM587nfy0xR7uk2Z5aIzw+a7V/xMMKbfHOaawJXbD2WJlmkvam8P32JqmasVR7DzuQy/tMyVmTWjLXuBXrI7J+lYwWa096cxgvqF+j//BlB2d53DleprBNJeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763597436; c=relaxed/simple;
	bh=jAmQQxE42lgPR8xKS7YR4608nhEwFUcNxWyX+c6LnJk=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=n5bQcfgi2F7u8qs90gtWNarjRNKK7Jsws36tW5T66+sA21oH0GFV8k7weI/ZXIirH8Quj8fKJymfinJfsNBwIH5+K+GyaCwmc8XHEfmSmMIivTwINeClIHVr1mh0BCQFSO2Lg5hK9trlFwoH5Iid6zL15X1Q+oRO/WtV5YiXKMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=YkKi++Nr; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="YkKi++Nr"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-880503ab181so3150086d6.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 16:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1763597433; x=1764202233; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrSe3R2YH0X0AwQPGyj7bOMAqS8/uA2AQXo6L2I2k4M=;
        b=YkKi++NrcdV6Sn6iCV32XTB+2PPM5EcMYw5jy4BulZ2pZrh46S4XG/4yr5uls6pb0K
         uO/3pANaARsmye4xBwovTIaAxs1mR4CrcjxILKGjlDbO1x+8UYuVqpMKUAa8tKkU7I/w
         JmSgkr4jTDZYu2rv7ouEzP9GW28siJzHuKDa4jsgmU1N9eXnzlrJl4bMVcKA2hisGGso
         v7+kLwM5OCUhub/OQL1kaJc8bqbGDD3Uxd/yrxMiE5gIOUzbrpCucPpwJhSYZ+u+Zj0z
         I9Jnz9M06j3Rux5sQ6770T9wrF6N4TNdj6UfM+0hDku4H6zu6hskbd+79Xlfaxbu82L7
         fvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763597433; x=1764202233;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrSe3R2YH0X0AwQPGyj7bOMAqS8/uA2AQXo6L2I2k4M=;
        b=vwlAXy/ZODHzXgc0epOWx+giGpP1asjoqaG/3YtzDwB+jePwPOUV9oSN/wJzXPzpar
         nVdDHA92x/FGhTRjI1Jz8g40sBFzJUKE+QUZT4RmskOgnD8tYqWa0XeWXjtzZrGOEuLG
         WE9t9OKnWCf7arpJZw6bVc0MjHEiSK1tvBul0LtvclKG3Sn63CgW/srV6l0levs0/8Is
         Xcr+jzsg6Pl+qnsXBu8G7GBRt78bwWmDUvwmfia6Lwb5JxjARZQc0SFRXyVowaDd8OI1
         LQu0kt1C2EOvaciLiSeDlVPI2A+w30V4MOh3sgo0Ic+w7ElP/35YKBAdmZ0wcKa94rBT
         8agQ==
X-Forwarded-Encrypted: i=1; AJvYcCUePXbZSVosPlTIBI4n8z4omNIjEP6qfDK4Dw5By6we9OoJ28nfTYV8TM5d4rrHeD+eKuik6GJriuM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7qC7jtGFk53AcbEzZQI5a6o1IJd9YZrIe493Dm1wiNd0q0E3X
	gxCdNN+MCizlpK7KBm1KHh6i8LfXTsKbDjv8nZMrT/yrVUklo7tbvP4JpdwYvOz12w==
X-Gm-Gg: ASbGncuKhhqynyveqeks2Qa4qGwwxHB/JFpEDsOnUNQuqVwtKEy47kgNezFNrQnadLV
	9M/5M3p8JlEpvt4lDdNeeoAFVP2DON4JtQdOU6Gd42jfDE3CkgoVRCLmxS+ONTPK9GEA3W5u20f
	eHxhhK7FfMGwfvvVdun9GqfZQLvmztQP9fNirs/XrRUUiOKnyKFzxVL8csp/tEVBE8UC/iT/67w
	46/InIBqS7jDbdqabYDKq3HybVQsg2VQnleZ3zcQO4dZgbM0n0gnlYs8E+WpM20vRK3nzvVcIEo
	IK/E3L7NUPTbUY9TTZELnY6gnWc1IN3syD9jmhYueDU5C41vdWeDsUbSmLwX4HF36iq3FADXwPy
	xPPrqnAoElN+gi0UTHMsCg4lt7LpwE52V+GyyQEQDLpqSpnLOWM4CRUYJI3+xwGy6+8qevgRL+l
	aXH9D2IprAYEC1egUNCBqk3Josiob9JK2XF+N+XhpwqTMD/sA8fhAehn99AvtNbPXCRG8=
X-Google-Smtp-Source: AGHT+IFfdIdtxbRdfiU0y9sic5iWHSCSHBEO5Ssm+TOKBS6seiq2ElAwNyhFeF/v+WvRHWw9bpibSA==
X-Received: by 2002:a05:6214:4a04:b0:80b:11b7:2109 with SMTP id 6a1803df08f44-8846ee349c2mr11790136d6.41.1763597433258;
        Wed, 19 Nov 2025 16:10:33 -0800 (PST)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e469825sm6110426d6.15.2025.11.19.16.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 16:10:32 -0800 (PST)
Date: Wed, 19 Nov 2025 19:10:31 -0500
Message-ID: <d5efca7df0d2e12ad9d6f3d35afa2828@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20251119_1905/pstg-lib:20251119_1905/pstg-pwork:20251119_1905
From: Paul Moore <paul@paul-moore.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Documentation <linux-doc@vger.kernel.org>, Linux Security Module <linux-security-module@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Jarkko Sakkinen <jarkko@kernel.org>, Christian Brauner <brauner@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Jeff Layton <jlayton@kernel.org>, Kees Cook <kees@kernel.org>, =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Stuart Yoder <stuart.yoder@arm.com>
Subject: Re: [PATCH] security: sctp: Format type and permission checks tables
References: <20251103113922.61232-2-bagasdotme@gmail.com>
In-Reply-To: <20251103113922.61232-2-bagasdotme@gmail.com>

On Nov  3, 2025 Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> 
> Use reST grid tables for both type and permission checks tables.
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
> This patch is based on lsm tree.
> 
>  Documentation/security/SCTP.rst | 48 +++++++++++++++++++++------------
>  1 file changed, 31 insertions(+), 17 deletions(-)

I rendered the patched file to HTML, and given that large portions of
the file are still rendered as monospaced preformatted text, the new
table rendering looks a bit out of place.

Let's stick with the existing table format until the entire document
is converted to something that is at least as constitent and
aesthetically pleasing as the current revision.

--
paul-moore.com
