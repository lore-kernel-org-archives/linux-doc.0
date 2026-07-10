Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AD73FF1A4
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 10:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677912; cv=none; b=O/T1/U1BFhCWFs55aeRnQ+bZY07strcuUFZ8SCQ73tOBgo67JGxVm98gy8uTwyaJz6hxy21rSBLR6DveD7pihaQKlNSBaRyEx1+aA13gJYP47wQLrT2Q7qRVSfQOMpp90MVLvMRP/TjYyhnK4+/pWcXKVxFZxszbY09Ei5tmobA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677912; c=relaxed/simple;
	bh=Akkf3kL+PsQe7xmYXgLVaSqFrB61iytAQiQ6WDcfnyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfh++wfviJ0o9ERJJusf+tsaEVIQhdQIFMhJx4hrIQRHkTkPQQTXcZBlToonC6mcdT5Mn17tAiSlfUaG8N7mBuuBlFDVY7Al6TSpDSijHZd9Z8zMUbGpq125KxAEpRnEVo4d8sIM81xlgzPyKqOY82Bscn9UaiKM/ziTWjv/mt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-728f9ecd56aso343612137.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 03:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677910; x=1784282710;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4CIBplsIuVz8rQQd1I0ICk9drRx4a3WpiYxfYnZ5Bfk=;
        b=S97qhEXe7kw62G3jay5RHqqHn8HEw09XDQRnRbFwiL1BNuLt4QM/t6R3WGu68xV/VH
         keQ2PlJ+TW3lN6ZrBd8dpuPAaKdB2bPvw8XRRb3nKmybrpTnOPbZD3FyxsG1fNoLU/VD
         kmldO1MG/QnvSrd2KTyUE1y17CBsltChmfwYpMfXilpGkS0+zTLefDcXdSJvQxC9fHFx
         tKTHmXgWDMtUZo+AoHIcMK/JF+oo0UbEaB4mhEGwP4esiCDVAwmIpL0+7YCfz7DVWQAJ
         giNhW6qoonm97PAzoHBVhf86I9coDuBcPA11Tpjxqeft/UGLpdBPYh8UBknn8vHfAGnQ
         Ur+g==
X-Forwarded-Encrypted: i=1; AHgh+RqeAUxAsCD6i1AQ7j/rohXsM9bFjMc7yM8SZKrQLnTJp/VUCGevKomj3CrSTLZKC7TiGadxVKnyjZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVRkTGr9WwxQc8etVqRovhHNtqam4ePnUWmXovMJx+bStbP9+9
	dUDCQ4CEr6ZfnrDpmGppKce4ikjHTwTwd3BSYwkMQpuOwUgDzi5eXzkN+fV6ctRH6oc=
X-Gm-Gg: AfdE7cmGR3EbDPANSypobaiSioe7IjNh+RVCFCbYhyMQV+ZrVO4DCBnP16i/KLZ3W1Z
	3yqypwEQGKpY1oDqecr/+Gi1Kt/Wek2hUo9y/0LaWYJlFBur3BCdhRC8H+/SBvHjw0kLYipLcex
	Bu5O4kqJ9Wf9m9TJaLo8mvlYeAFLvHb6WPcPGhY3sIlfs8kQyWV01hvyq0uOujRFJ8Pp/Y1LBlG
	a1sZPwUYmtPz/eZQjJcXDwX5zXI4MGWDgu14YRY/AodBgJriO7/uujiDflnHYtyMA4al8apZkRX
	eN/j8F+ux0wgv633BTh+Wcr0w5cIPzGQzwLNms9ziLRR0xpUvEaLnlv1nALNbYK+jW1NnwyBLae
	Lp+hKI42cA3Uxke0RyolNvcsadXCAT2IHv1EB/tEMeHfw0cFQcHEUe2yL6rZQDNMUJM3eO8CuW8
	DKWGUOzQLqRypnfeDD/oRrdy0ECIaFMf67zhWnU5KIm9P+zrsMNvKa4g==
X-Received: by 2002:a05:6102:3f44:b0:738:ecd7:1983 with SMTP id ada2fe7eead31-744e03e4c23mr6810853137.28.1783677910363;
        Fri, 10 Jul 2026 03:05:10 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6dea737sm4973761137.9.2026.07.10.03.05.08
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:05:09 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bf94664327so399583e0c.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 03:05:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq4HzwhzLQn1Bzi6V9mPGgHwc7MBEivOXZK6Y6d4PznVhrx1bru+eLBbceCS2Nt5i/DRhwYOIMDAVs=@vger.kernel.org
X-Received: by 2002:a05:6102:5605:b0:737:d2e8:d644 with SMTP id
 ada2fe7eead31-744e01af814mr5812204137.20.1783677907869; Fri, 10 Jul 2026
 03:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709163833.3851179-1-sashal@kernel.org>
In-Reply-To: <20260709163833.3851179-1-sashal@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 12:04:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCAX642tSJhvG_Ku6Y=D8GK3owbyed9qkhzPpgrU1kdg@mail.gmail.com>
X-Gm-Features: AUfX_mzFVzbeb8aPhbmCJAceFXYQjpxJuPF0DPyyv44pDz5k7_z7ZhaQ8shBBRI
Message-ID: <CAMuHMdUCAX642tSJhvG_Ku6Y=D8GK3owbyed9qkhzPpgrU1kdg@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] kallsyms: embed source file:line info in kernel
 stack traces
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Richard Weinberger <richard@nod.at>, Juergen Gross <jgross@suse.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Vlastimil Babka <vbabka@kernel.org>, Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Zhen Lei <thunder.leizhen@huawei.com>, Sami Tolvanen <samitolvanen@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Thu, 9 Jul 2026 at 18:38, Sasha Levin <sashal@kernel.org> wrote:
> Changes since v6
> ================
>
> - Address Sashiko AI review comments.

What does that mean?
Please list the changes, so reviewers know what to look at.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
