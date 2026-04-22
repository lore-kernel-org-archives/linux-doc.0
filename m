Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2424D306D2A
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 07:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776843772; cv=none; b=tDAa9wLjdhe2fE1zZRU3EoB5t1/lbaMdoauIAPGO6A/Z+OnJ0HAcJLnn+ombHDv9Spcmn9I/BgD0lof/T6/nxtzXREtEfadJJdrd3BFTQEQsDm2Jynevm4AMYFH2O1E7RGKRTTHvU9GjzO/VZKSqW1hGb3dcN702TArmD6Slt+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776843772; c=relaxed/simple;
	bh=fD4N6YiOk3Lw0qJqPZrZNHLLHCdobA7HmjYpR1mnjZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ct0o5NMM14UEf9GaocLQnxNZcnLPq6jud98e7HvsSsLMvihS9a0O10cvnQmyZJAkKpyO4BTjGc3gVxWHnBhfpBeNEmzRnIGFmudGBOleaOlhsavSeZNtM5F6XcMtZdFOaRAH2XMp3MNRoQic7ma2AtSsbNqhYSZD+/eIhssCKys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-60591ade110so3526236137.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 00:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776843770; x=1777448570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4Rnr8wLv+N1gA5zZXLnYHFvuENgvXtTyEDrjuG6/M8=;
        b=I6LmVphFh6+8GseKkXtIyrof35jsv5sjviNej9RdaDMkwqwbK/zKDm6MNkIZlp5LIO
         t9I+leMKmVrBNHOu/8NlF5w6+SW+cPpxgyOuYHBH/I+oPHGSo/t7LCnncdg84Dzim6/z
         RLm0sHg2Cu4EdLmy3MYXqpHq8EJl5EWSLUw94lnuYb/WzRbSI42884xowoBZdlo3ubEw
         j625++veeWxQeyBNSvVDcJkm+wMg2mJG6rtp+yOjbUT1ydKoxWlWOqDG9Nrhkq+/kRbt
         AJ9vHGnpXQiIty/59u6XG/np9OKoNPLog/7AsHk5abpe2VY2z26SsNdXwDxyakrscDP5
         nNZg==
X-Forwarded-Encrypted: i=1; AFNElJ+7fH6uyd3JWd4FM1wQDuabma1h7LJAiiHcbC3PQYIbZEuA5tpsScXHEKp/xtF1il+/a+OHzoA4CxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAM0YecRzYfOu4CED1pynYm2B7GtAiFzQCRsUB6RMmksVsO7Re
	Lm7k5aJzEsy9MlbySQfn8pWb++CdqJ770sthTf4y8OdMoEo+c235YEwKMQaE6obZZVc=
X-Gm-Gg: AeBDieu+xIfFmORyJ9JriPZTgV5ZbD6bTBKYKgtGP2IS/f7YmabCsAILML8vQ3l6zbK
	fnWNDo3brZsMIKT5ozjYrk6m/pqFU3GspphLF6mvy/fV9x8i/HrzVkZOyVQ/imdunhWmj8Sg/AI
	EPV2qU/x++CSrspEeIEtxVhcoG/MoTC+fAVlHa+/Yl2Yq/WkiDtDWPbH514yLVaVh1xTHXC0jL5
	tOPnzZGRrEoz1HKAXODquDqJx6G9tZ8ArhHsAbFja++GsFKICLQ8s0IboSfnDOgjCyDlO7OvXfB
	o2apOx/BPaV/FooiVJA63MYumDLVopx9rxV4vzConrZPOpYd/wUJut3IlQWQY6AdWa3y6gXAce8
	4Pfl+4JGiuJAykhrFvL5Wujzjq9qrQuAOV8MqKRB0p8PRrMNcDa7emQLcu5AWhToj3ms40nDl0Y
	3QBTHAzTji5r8YfTqCVT2dBWwKGrO4yyDd5oJDwFvSk4xIDCngMkvXns2z2yVGjDueWyHrr8k=
X-Received: by 2002:a05:6102:808e:b0:605:8280:5e6b with SMTP id ada2fe7eead31-616f6df5262mr11172096137.16.1776843770051;
        Wed, 22 Apr 2026 00:42:50 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-61747cb52c9sm7762322137.9.2026.04.22.00.42.49
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 00:42:49 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9539d9f1675so3382400241.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 00:42:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+SKBIhzuzzhpeQpp02JbbQd9ozj2gOwlEjxKn/uN9cI5aDVHwU+QuudSxTrcN0EqjWpHH+poE1kCc=@vger.kernel.org
X-Received: by 2002:a05:6102:5716:b0:5f7:2568:abb2 with SMTP id
 ada2fe7eead31-616f4b4be78mr10527273137.6.1776843769367; Wed, 22 Apr 2026
 00:42:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421-v7-0-0-net-next-driver-removal-v1-v1-0-69517c689d1f@lunn.ch>
In-Reply-To: <20260421-v7-0-0-net-next-driver-removal-v1-v1-0-69517c689d1f@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 09:42:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUizJDoOhe-2LmrsxA_9KO2s8dhA5Phvg4hiwM2ktcWmg@mail.gmail.com>
X-Gm-Features: AQROBzBnXX2THXUxNwhNfRNuDrFyV8eZ0eJfo6hdqIs4FC65H46_PpGDjaFPLYE
Message-ID: <CAMuHMdUizJDoOhe-2LmrsxA_9KO2s8dhA5Phvg4hiwM2ktcWmg@mail.gmail.com>
Subject: Re: [PATCH net 00/18] Remove a number of ISA and PCMCIA Ethernet drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Tue, 21 Apr 2026 at 21:31, Andrew Lunn <andrew@lunn.ch> wrote:
> These old drivers have not been much of a Maintenance burden until
> recently. Now there are more newbies using AI and fuzzers finding
> issues, resulting in more work for Maintainers. Fixing these old
> drivers make little sense, if it is not clear they have users.

Thanks for your series!

> These are all ISA and PCMCIA Ethernet devices, mostly from the last

Only the drivers that depend solely on ISA or PCMCIA are drivers
for ISA and PCMCIA devices.

These are not:

-       depends on (PCI || EISA) && HAS_IOPORT_MAP
-       depends on DIO
-       depends on MVME147
-       depends on ARM || (COMPILE_TEST && !PPC)
-       depends on MAC

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
