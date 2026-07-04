Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F9F390C85
	for <linux-doc@vger.kernel.org>; Sat,  4 Jul 2026 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783171433; cv=none; b=aQGIGfXSRZ32qHI2ZLXQr+0ydbalHRio10rtlcsPsa6w6tCO0t79XsxFpuuHBOvA4JdG0vbdJwaoU1f17r18F0AfMcCEfdhVFu/6BuSjOwtpavcu/lzfKfkb1efXBobp9k7pyjNAvwE/y0sD2RbhvogUfJLud1rON96K4PJ/ewA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783171433; c=relaxed/simple;
	bh=N1CcU0AWdwex01N/1zK6qktwhq0E3Pj15yq8zzSGzzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzA+5zm1KqLHAyk36gBQDFbNAxgS6EoSZ/tXmeQtYBjd1jON1/Fs+vOOUziISa1UpKIahMOVhMhAiTTzpax5PRuovLPM0MkmvL3bTmCkJHYQOE+XJnA0WWsCAYDZxI60zAuaAkh9WMw4XVRUa8ZY+4F55U0/g7e/CuLc0hbywYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dY4mC5da; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dY4mC5da"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-474303f3c72so842337f8f.0
        for <linux-doc@vger.kernel.org>; Sat, 04 Jul 2026 06:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783171431; x=1783776231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Xy8JgD1t44BZahTr2SwVw+yYZzU4iR+NXyCIO+T8rP8=;
        b=dY4mC5dalNOz9wy9CVeqd/V9yy/dTfQxpzyaMW6jvgu30UtIKpRPzmJlcwaksP1e+r
         SEvXYrfwpcJh5nWXTUQlVWvEpeAJSg5Y1yPRCG2PWmnFqnMzQAHa7IHF01iu034aYU8y
         mr7FnujQrWaD3SQfJBVqPxjSKaf7xya2OFFkldf06znBRj95P+0q6djqU02lR2RbOx1Y
         ShRFVMXSOaoEPst6yC/boafytxWaUWNpRQDdabzmoTER7WClJrbWejyj0RZlmeIKeQaD
         107QJLoqQQDZYBOxaEyGg70Q+pxBu5LWUDQNlBM19P864sQsI8QfujpsF+NitpYH2t9X
         mVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783171431; x=1783776231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy8JgD1t44BZahTr2SwVw+yYZzU4iR+NXyCIO+T8rP8=;
        b=YW8qLe5XSVYDFnsvoqeNY+jWDUgVYJNau+SguMzJ23nYfKELiBSdzIzhCxlcWBe/Vl
         0jPHrRU8IZ2CqvbtIuIrCKxntpMfNiEs2F/4NUFWOK2vSi4kFV/Uj/P8KbDe5q1GAczu
         gPNqpqc0fNA0Z91h7fYR1Ayo1XtEB0lICOGsaSF3zRhFCRtuawTCb8me3Okhd86uQTls
         D3WZgCOSxQJkECqdfQCC0VJu8VeV2vun7i5uIicLxD2c60gT1coXR+IGuqZJQVzxwfmS
         vP+ROM3VymNtYSSOy1ZJG+bdmEyB8GYJTpm84UkRv7VqxGHk6K31jIbQdd7qWfNRaZrf
         SErQ==
X-Forwarded-Encrypted: i=1; AHgh+RryZ+m54jUFlM60GCXe3fJ9Jc76TVGkvHWGNscWJL1BTc8JWLPZeJLRhW4VIpcsI73tEoRkR0cLVcE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm5v52WNo+lY0GZXxaETIUMDtFoOqiQrATfS/1v0dEz3JhZbIi
	NrXd/P8hzN/QTGm9BYPovSNCtnKr3FQM0klzwyTVyoTYR26KKau94gX1
X-Gm-Gg: AfdE7cl84nWvBYX5sLfM437qFdVpeqfL4CtE9DIHn/xaDFZ8aAQ9XWWxbxZ9A0WsD5C
	EqQydxIKbhpXSpmmUsDOSaOov/Kh9TKEJhxvN3OG0gxrVUW9uG6k3TnqH8s+/vOluoGhzRBsft9
	UByL1YFUg3vrLrPot8Vj73wNA8eD2yjMIix6iEOlBMuAcf7SzbZbt5AzMIB5GzNY1I1bjNYA3Jb
	AW2fBzJDDSFEYQQ9iRDD9BjE+yySq9h9nU23amjxm7162E+f+Z66S499cbRsZDGcEjbRwzMQGDz
	CFkuubOilCRdZ/8K1Af6GNgjG2ztfl54fAFOvHhd3qAGtaP0We8w2XRsLiwaSQhupVb5DabUTUy
	PawN8TNJbYAwehllJ8KkXLBF1JRYMQXCBrGOafqRdpWeZWQXOVUOrI1L0u6haKBJldwMeJ688hW
	Rmqbxq9wNVrMptU6bj3hWCYdYiJS204nfNznnpGUepH0pAbniC857XL+mbhjSNZAbO8TRwVrxFw
	1V1GS56
X-Received: by 2002:adf:f288:0:b0:475:f100:360d with SMTP id ffacd0b85a97d-47aac5e3774mr2995573f8f.60.1783171430438;
        Sat, 04 Jul 2026 06:23:50 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a558easm8234031f8f.27.2026.07.04.06.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jul 2026 06:23:49 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <955bf67f-309d-45d4-ac0d-2f53577aa18e@gmail.com>
Date: Sat, 4 Jul 2026 14:23:48 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] kconfig: Support conditional deps using "depends on X
 if Y"
To: Graham Roff <grahamr@qti.qualcomm.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
 Arnd Bergmann <arnd@arndb.de>, jani.nikula@linux.intel.com,
 Masahiro Yamada <masahiroy@kernel.org>
References: <20251215-kconfig_conditional_deps-v3-1-59519af0a5df@qti.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20251215-kconfig_conditional_deps-v3-1-59519af0a5df@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 12/15/25 23:06, Graham Roff wrote:
> Previously such optional dependencies had to be expressed as
> the counterintuitive "depends on X || !X", now this can be
> represented as "depends on X if X".

I have always found both of these:
'depends on X || !X'
and:
'depends on X if X'

to be unintuitive and confusing to read.

Yes, I understand from the docs that the purpose is to disallow
FOO=Y with BAR=M, like in this example from the official kconfig docs:
```
config FOO
      tristate "Support for foo hardware"
      depends on BAR if BAR
```

However, in my testing, neither of these constructs are necessary to
achieve that.

A very standard 'depends on BAR' also disallows FOO=Y with BAR=M.

As I'm working on my SMT solver for Kconfig, I need help understanding
what else I'm missing about these two constructs.

Unless it's just more readable to you all than 'depends on X'?

- Julian Braha
