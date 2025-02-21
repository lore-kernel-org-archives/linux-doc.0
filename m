Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9745E209F35
	for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 11:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740138913; cv=none; b=bhDKUT5HlQbr0IBvNcyAOFsRxxBZnvZm0x5uamNz9nGz0SMPUn7gIWCyO55j4PdG5taw5LRYx5MiCffxZUbQQDtJY6S8jY0Vd1ZNKkGrkLY6MlMoN4b5ZM/sUWQPRFajZRfazuQFjxvNQ202ik5fg3n+P9GYkvPpNHCVWQa/lSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740138913; c=relaxed/simple;
	bh=o9hQaggU3Tdo3Rs75yT1Fva2Gn/BPjhpQH2KzuyJ2gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X1tmn3T+lqzg2Zlh6Z9FQ8fWdXQ/dGPw3TMXaoFRzlQp9ov/tjyFJeGV1PXfRiXsCJ5AZNVMQkRTykWxeWp/3BZ1SGglaVWNbO6UewuR3nDjOZS5waWWVMX/BnoJbhrSibCsQEytjx3sbOjFFgAU1+E/9ri3/IP2Y06xu/XzC2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=PEwTXyFW; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="PEwTXyFW"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30797730cbdso19816161fa.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 03:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1740138909; x=1740743709; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3/iRbyF06sKBSuXAXawsdJPOX5Xxar4Ru2tRuKb6D2o=;
        b=PEwTXyFWcoHXeYuZSt6B89z7njQlQ9r6soBg6Axpyt8IaMsdAiV4tja9DltEeEcY9N
         6bCcWqagByNttbz+14oOH6YO4YRQgrCU+6/mtn6Ggk0nJeM0i/sj6zJaZEZQAd8PUTKP
         OG6xYHq0atNlMJ8NfDdAWaDl9VVAkMXcF8MZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740138909; x=1740743709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/iRbyF06sKBSuXAXawsdJPOX5Xxar4Ru2tRuKb6D2o=;
        b=YfR1byzaAVkKeEynp05Bg7MdpZURs97war0IlLqfJrldVAN5oAVlwGMIl/BsB2hfxB
         QMuWCMgy56pX6tXSMwpoU4goSGwxKo+nQN4QD5cyDSyjvSZwOhwKeZuEAN3jjJ42jokW
         8/A3eysDv3rq6dZdqkQPmFVt2narPS7lk8tedU4WlhB7nRj4uti7Ck9QI3mV24RXkkSq
         R7+Zuna5s+sQvpH2RttuxoIZFY9MNXQXBexbyhyOVnvB1XKyPKpoULA5djuyp0lKReKN
         UZrhyeUEP2PpQveyRJj9ie5DQGMWi8aIPdeGwkGD+lXWF6qnm9+UcQXDzeXQmrirm7PJ
         uohg==
X-Forwarded-Encrypted: i=1; AJvYcCVNGzAlGGF17ZfPDrpyocmKirJcVIPQ608wLzRGHeXggsXT9XumWiAB89XNxZjibUFo1utNAlAlsr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjkSP2xGrXfrICwVs0rmbpWNA3xXMLaQ0R/xNxK9XU+AKHf42b
	Dlsbl3t3vYMWju6uKI+sUF3tbOOBa4V0B2udIKgsQ1jZaWWoZm3LHgWzUXKsuU1o5OY86C9Esid
	n6D9tE8GJUBH8V8afAilygk+HL5JtqGASI0JNxQ==
X-Gm-Gg: ASbGncuopKdrgTcdfzBarGHKWQTdDr4YQMv0ggK/868fhVZNmvsS1MTosjWnlPxK9oH
	CJNqHJCIDfSDtG6RFYsL7QsYO2SFnmhTuRXZCe3qednXqr9hg2n8ZPt1jDGeW9clFs/F/Hf2fTK
	Af9BD+Gr8=
X-Google-Smtp-Source: AGHT+IGq/dIo+A2JknCfxBPtCWEXSb1e8s5WLFM0DZHAgz+xRkivavGxrBcVWQ1kfkiIjnKC8wn9G/O8JUziZ5NiZwc=
X-Received: by 2002:a2e:9b97:0:b0:308:db61:34cf with SMTP id
 38308e7fff4ca-30a59899cafmr8679651fa.14.1740138908700; Fri, 21 Feb 2025
 03:55:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com> <98289BC4-D5E1-41B8-AC89-632DBD2C2789@live.com>
In-Reply-To: <98289BC4-D5E1-41B8-AC89-632DBD2C2789@live.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Fri, 21 Feb 2025 12:54:57 +0100
X-Gm-Features: AWEUYZkag0YCbmK4501eSholWPOVfmEf5FjMGyae-nYt_GMpw1QMs3yS9iwYbxw
Message-ID: <CAKwiHFi_nngthth0wZkaPviVeS+8SWDtTw6gJcDAHCqiwXAG2A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	Andrew Morton <akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>, 
	"joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>, 
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, 
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"christian.koenig@amd.com" <christian.koenig@amd.com>, Kerem Karabay <kekrby@gmail.com>, 
	Aun-Ali Zaidi <admin@kodeit.net>, Orlando Chamberlain <orlandoch.dev@gmail.com>, 
	Atharva Tiwari <evepolonium@gmail.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>, 
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, Asahi Linux Mailing List <asahi@lists.linux.dev>, 
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 12:37, Aditya Garg <gargaditya08@live.com> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> %p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
> it's useful to be able to print generic 4-character codes formatted as
> an integer. Extend it to add format specifiers for printing generic
> 32-bit FOURCCs with various endian semantics:
>
> %p4ch   Host-endian
> %p4cl   Little-endian
> %p4cb   Big-endian
> %p4cr   Reverse-endian
>
> The endianness determines how bytes are interpreted as a u32, and the
> FOURCC is then always printed MSByte-first (this is the opposite of
> V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
> allow printing LSByte-first FOURCCs stored in host endian order
> (other than the hex form being in character order, not the integer
> value).
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
