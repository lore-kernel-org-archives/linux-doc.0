Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9D43ACEE2
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 09:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184266; cv=none; b=mRQb/YU9mDnT3SaOm5mC6nOEVFoqs+1fUc7SsmeeSwfMbA4ukTTg3XeSsvLqADABD/gWV9RgBP9k2FlofwNLUmPEbbA0ALHFK3WuWZ7/lssWB0PtbVFseArZOa70F5hJjjK0nWrAMbf3P90Uu3NTRuBWA1Q80pjoAgFJenQZHFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184266; c=relaxed/simple;
	bh=VV0WQeCgbPqBTi7yab+uEYQeq6u9LFtTUX4clbsM2Vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFBu39/ZVrBR6emV2JlxxjEopao3ke/GwdIaaBQrYFC+CdJLAz6XkQWKFDI2KDkYMlS+gTmMJ3Gfq7JEw5NMQOcduYWr9O50058SvmdaJl9Wi7ms7WJfdxk919AD43lFqWGrH+45A+oVkPlPXfDAt63iySb4oWC04UrKV3M3QWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7de4a9cb8eeso3365632a34.0
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 02:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184264; x=1779789064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+2SZGl9spcuw3ZVraVsNeWL62/l5e6HnqNdDh6fCso=;
        b=l0AR9jrqi1+aGnbtbyzWTMkCoDjaTSlBgqYbqz1btWxaQppu03yb8H53qMe90JoKaO
         6391E9hgAtA7VR/iN6Cx9W9i/pjmF3G9e6eLCUfw5dOvbCLQqzs/zJo7wlzpY4s8cwrH
         tJPHHHwGfDtkvhV+uMTmIOLSTvnM5/bJbhsQbxQsWX+NBIugnSDpTvNpU7vYWiDqYs1T
         ceFpedGXgQgwSi4DMkOipfLmEO5nuqQEUInXw1d6RcdMhBT3PTEk1/pxZxUvhhXxL2vV
         OMwnJAOlC+Trmwovh3rQ+HKzJnynPukkkhHvJlzObwgfc3qkpSeJ5CGKezKaxXOo7TJO
         x0mw==
X-Forwarded-Encrypted: i=1; AFNElJ/gchTdzMYdtCrnDtE1o11g5QYp7iaOAd9RegT+uSeMxf7aM3HGr3JS7YNyBVuNVN0IBtk49ihzbj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyLSpqaXFO4NVbacejyoCbZuFD74VPuB5AsOzjo73dE8eOIoJG
	30uLdny/G4WDViULnR+jCg6eh9/SQ8brlUUVteYszv6FZqTlsDLa2c+QWhPirkvg
X-Gm-Gg: Acq92OEEHsHU9TO7vrGp/DzYlh0/lk8cJF39EroxvYtfEZ6vRbwSzJlHkbX5YiThGBI
	JHZ+ooLO1KXx0w9N9De3Ce6CxXZ+xSfjOKi/QaFTNQIhUW2RH6OLMpj2SDJnLkpb5+0IG2Ra4wR
	tmG1VFDqJ+YaEFRKRwN/9NaCKTSLsI2dlKb7SZ6uyPV9z7ovZk8i7tYKfs2bBZdIDJYumvDEiJ8
	gKTSmLlFlW1qqyvRiygT7lG+ZH+OJznAgxPmiWwftiCH/lonraKaLV/SLh8kVdsDaDyv71SbO4U
	PdVCl1/GRc0FUbjr3NRyTLxw7brJKhQx8TIS06crozj1ABT1SW4BPI38bfU05tmUwwI6OrM188G
	R6UfRb5hjnAMYCma8BuACinpCJ0Rk9xpkQn2RLMczFzdnjV8mEAPl7TMIkEBzdByMLN4iDi9YFz
	ctpS77pM/0zstOHBSxLXt7zkyW3L9DP1+Y/Z/XCQjJKOLF+GTdI0J4vWgfEE7G
X-Received: by 2002:a05:6820:990:b0:696:924d:2956 with SMTP id 006d021491bc7-69c942daedcmr12666385eaf.14.1779184264244;
        Tue, 19 May 2026 02:51:04 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a956f4957sm6953437fac.12.2026.05.19.02.51.03
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 02:51:03 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7dbcb467f2bso3315132a34.3
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 02:51:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9U+acAhAv/sGTNt5olB83M5vsiVNaVkPJS3y0gOGKXUq4QK2qVu02xsf5/eRgqaymfkMrBKcHITUg=@vger.kernel.org
X-Received: by 2002:a05:6102:511f:b0:634:d42d:15e2 with SMTP id
 ada2fe7eead31-63a403ac9a2mr7077474137.26.1779183821499; Tue, 19 May 2026
 02:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518042833.272221-1-enelsonmoore@gmail.com> <20260519094820.1f05ab8e@pumpkin>
In-Reply-To: <20260519094820.1f05ab8e@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 May 2026 11:43:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVw349EBZUuYZAns3FnTndx0A=PHbznxarYuAQr8nbqDQ@mail.gmail.com>
X-Gm-Features: AVHnY4Lfn8Mcrjf-CZtgFTL8ilhwbGlXFwz-O3Z8xcIZpla9SRL4d3C994HiNs4
Message-ID: <CAMuHMdVw349EBZUuYZAns3FnTndx0A=PHbznxarYuAQr8nbqDQ@mail.gmail.com>
Subject: Re: [PATCH] nios2: remove the architecture
To: David Laight <david.laight.linux@gmail.com>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, workflows@vger.kernel.org, 
	linux-arch@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-csky@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Dinh Nguyen <dinguyen@kernel.org>, 
	Kees Cook <kees@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Dave Penkler <dpenkler@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Tue, 19 May 2026 at 10:55, David Laight <david.laight.linux@gmail.com> wrote:
> The company I used to work for used 4 NIOS II inside an fpga.
> The instruction timing for one is pretty critical, it has some code that
> has to complete in 122 clocks (worst case).
> Our solution was to spend a few man-weeks writing a compatible cpu!
> I think it came out with fewer pipeline stalls (in particular it 'lost'
> the one for a (predicted) taken branch).
> The maximum clock frequency might be lower; but it is ok at 62.5MHz and the
> higher 125MHz in just impossible for all sorts of reasons.
>
> OTOH I really wouldn't run Linux on it!

Sounds similar to what CoreSemi is doing with J2 (nommu, also for
predictable latency), but their products do run Linux.
See the video from the LPC session at
https://lpc.events/event/19/contributions/2097/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
