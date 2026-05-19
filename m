Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCB1481FBA
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188882; cv=pass; b=MEhISUGYFIoYNP6UKfIk+eZhyoxbDM9iqWj96AKipoHCEMTnAgL8NBp2Cw+wzcOJKg61L7i5MtGxHZdg/IrMEqU7WI8WZftWQEe+plCq4DXtAfeQmUhJ18iuXNHs2FxBWL4JoZ7YkP93+EXXzlx1aL3kBzucUBf9Yw2r7LUUKn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188882; c=relaxed/simple;
	bh=nhTmhA7EtvBhVzOtpkjubbcdCBekT90z9FnlkG56Nt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJx5MlhHfBSkXLWTKL7ijyMk0UCVz0wXrZhLAdoS5GvW96IM8hwpNRp/yloWdxYYVNxq2ksSQ5daxuGt+MJL5Z2IR5zemuz3IsB6101k31Q39pFxVqT4UJNG91Q+z/fDmxRhMau7OUWxqCDbmtbXL5Z09chLOtDkyhdhoL188P0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkzOT8mX; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkzOT8mX"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f16c892babso172315eec.0
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 04:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779188879; cv=none;
        d=google.com; s=arc-20240605;
        b=HN6Yl7Ud3lSG0NM/xJDo/MRZ1hvUD192enVbD8+pcmqUPtIcmLAAmEPZ0uY/veCu00
         +3s1owWW7dY5hTw7/0lLOi073G1W0j/T+HpG6lYCgoZeegU+z+0+4pfnrhYOEWVs1CPk
         BmVP4lrwKuO+XEe/LlEU0a6A47VXnz3t4ESwQVYtpnl9w3xTgrPdzy1BSxmYJktBANhw
         5zv+Zz6PidfaORp1qGgeVh+VzRC+wHFs5CQUiEaj5RqD5naq6vFkcnC7SQxHXWl+UWP+
         CEPXxYpsW8voWxHc9Mj2QS3VarvtMaRo5iniUZULQ77/KN/MgfR7gKwIDsYZqSSIGkIH
         ANYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nhTmhA7EtvBhVzOtpkjubbcdCBekT90z9FnlkG56Nt4=;
        fh=pRPur3xegN0x2/hHbEw1w6DVs/Fid7DvCImNfvzQOJU=;
        b=Pj1qjJKAufvfpTZzPXGEc5Uqeu+BiSLBV4saF/p99ePKFrma4FNAQm+jzjxDtb4ms4
         tZ33rqaQR7j47+9sBehu+MJOA2TmNtpqeKOzBJa7Tm9AvPNQy2PM2i8N4ye2JaepU/Y6
         RpT2Txlfbrt1pzFuBNl+nFUEfPM2mWlj2/xhOG9N0hDYBhjVVG0oln3V9K8Ote13fPvx
         1oZ+R3vs37ctpk9y7eQgH7TLEkqG6aJxMnRc5P4PppJqotlQaEetDadnMFlMgxjX+WKw
         IfB/anPcx0yflVk4r3Sx6AfUhtBPGf6LkFSVzbNRdJPjvVor0hKg6Q4uJ24oTXJyI1WI
         cGGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779188879; x=1779793679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhTmhA7EtvBhVzOtpkjubbcdCBekT90z9FnlkG56Nt4=;
        b=NkzOT8mXh6bXhnJvqEtApaE4S4veNhy2u4ev1hghBlqH6x0n92yVBDsJ2dVI/ZJivu
         9A8hpggl+UV+EG+gZ3coLNVauocffm06kPS6Vsilr4oCfGSd+pU0V/7UWBN7MJ69Qwj4
         R1O1gypG77mvtOgIEZmtoiOoxIxx/0pznmMVmWyQ4agGZcSLDIFoxyo9RDUI+MxRlN+5
         IdgW+epOIw+p0gT6dT9gkmNG7DD8Tr7Gq7TAph8w2yFKfIgDr2gJ4ppcyT6UkCIFCNyf
         8Jw0CWqYMJEIAQUcdMZMca1DkDroniAfLQjNSAqdcZYDK/d8nqv1CAJ1GQZJXX93ZFJ9
         eCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779188879; x=1779793679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nhTmhA7EtvBhVzOtpkjubbcdCBekT90z9FnlkG56Nt4=;
        b=q2ETlYTe3M/GaoNgEhxgrSD0PhFzGiIqybj6lSlNSbFB6pb9FCo/TCWn4OM6z6UnbO
         jET5mxlYJoYgiSK/ulKWTCaahPSCWMk1gvWQbJ1O+Q3WqgbtkzmYLmHdrVZJcQgdW97+
         vIiTv4sFRUNm+Wi5Kj119Ib+7E7553UFd3UvvJV7uVasZTz/jqXF0ZyT+bCQ1L6FUn45
         C1+wmjGyMpagVaEs+UI429y3yuP+V5tJCG96wr3gAVGYuD4phRNz9A4P7UtVj/dtAUDN
         3hs0gy3ZRYuYy20hSBYrhXrB5dDUbHXEQw6TgRtdiq3MVqhyJp8Mr3wBHhr5ih99qmfG
         znSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9R0H4hzS5bJ5TD4XDjeAcc29f1VZ/6uI7mIDK8TZlaWQSy8nRAjiWyZPYHAjKffP3O4uWWm4JRM7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbI/4MbRgRLsfEHz+VB0rtIthx6j1klD5yDob79X9tZ66tZbg0
	qfhcvMmqXvr3CeD1MAzH3Q2IkUfb9OUFldG8ldQnFmN7CYXjN+b8j3eygwpXfiHtq9x7aRwukan
	6JxPft8jN0N6FiL6H1kSahkTQ3xLo4Xc=
X-Gm-Gg: Acq92OGgrIqoJy295uz5xiSQ7CAgQSurXwz7JJ38s2yUYfQmuUWL0VYX5jD5ePZxnrD
	zzTuUQ5nLvzB89eqNVrsGarMa2xMLaVR+LD+4ekyvCYAodZLigOlygy50WRzkkoVF4AxSsIYX/U
	BPqM0K40pk3yRZfe8inqLFR25kt6brJX8aZnKonVFu25HZ7Gu1x55G1kIipFHKXk2QS3edG8OiH
	uTMYwUx19P/gyv+hlEMLDqguh4QGug040h5rblVB0f2UJWdHiQGj8XHZIibJr8Hif56k7zkcu/W
	A9ksEHGhk/xGUABDGrNKKYcA810jp6OgH+8F7W58TI6WOauQhz7TaVDvUWjnMobnMooPRmgMZc0
	0foRuyTWVK0P1iGoZrwx+6ow=
X-Received: by 2002:a05:7301:6785:b0:2f3:3835:2010 with SMTP id
 5a478bee46e88-3039870650cmr4323491eec.6.1779188879399; Tue, 19 May 2026
 04:07:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518042833.272221-1-enelsonmoore@gmail.com>
 <d40b1e80-37fc-4c88-9d7f-dae6458efe6c@app.fastmail.com> <20260518105735.GW3126523@noisy.programming.kicks-ass.net>
 <20260518172444.zyd47mcagrcwu7wt@dev-vm-schuster> <CADkSEUjhq6HSdg4ignzbuJiN5uXATsTdxFbRJ3BMxs5=WUWLDg@mail.gmail.com>
 <20260519103012.blot4bssgiqfer6p@dev-vm-schuster>
In-Reply-To: <20260519103012.blot4bssgiqfer6p@dev-vm-schuster>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 19 May 2026 13:07:46 +0200
X-Gm-Features: AVHnY4KWOiWEY77zuE66kq3xKsBRyVSkUGj1e6jCXaPb6QA3ygej9CY3aqSmM8c
Message-ID: <CANiq72=6oYtHf0Q1NaLXZ+25uQyYbej2xnvUhtgpHyvozhP7_Q@mail.gmail.com>
Subject: Re: [PATCH] nios2: remove the architecture
To: Simon Schuster <schuster.simon@siemens-energy.com>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	workflows@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-iio@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
	linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Kees Cook <kees@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Dave Penkler <dpenkler@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof WilczyDski <kwilczynski@kernel.org>, 
	Andreas Oetken <andreas.oetken@siemens-energy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 12:41=E2=80=AFPM Simon Schuster
<schuster.simon@siemens-energy.com> wrote:
>
> Sure, I'd be glad to do so, but so far I refrained from it as I was a bit
> unsure about the netiquette (can I simply do so by self-proclamation? At
> least the git history seems to suggest so...).

Up to the existing maintainer, in general.

I would also suggest changing the support level to "Supported",
instead of "Maintained" -- that would help justify keeping it in
mainline.

I hope that helps a bit...

Cheers,
Miguel
