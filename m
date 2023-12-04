Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Df48uiE9"
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 101312D42
	for <linux-doc@vger.kernel.org>; Mon,  4 Dec 2023 06:26:36 -0800 (PST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 025FF3FB62
	for <linux-doc@vger.kernel.org>; Mon,  4 Dec 2023 14:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701699995;
	bh=yrj69QBqcJ2/0+no6KMFGYnNPrNFydkA4S5q1Y5aJZw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type;
	b=Df48uiE9G+llJWCIwyMND8DmH43lU8Aho9yuXppz6x+v3BTm/c0FW1T6Oi1Vm3w46
	 +AnskxD200LLc7LsQg87p44ukpg7tJh7BYGHUJbA4YheeKL7Luwojd7KZl04jPWX56
	 LJ0gA/DzjhetGVOacbrvzPqrEFl+IPaU2lospQJlhuKXrXmBQdRjxWZ2I3sfun/R6h
	 ma1AOBFevmrCmNxxeYQ+stotytQhAn3SyuXUjqlQFRrrcbuPlFVh57GWk/DDHJ6MaG
	 bpC9EuYYRgB+x3qF0VEmPnq8WHWdZo9FqLWCnkyV7x3tLYB+zfBBqBFeFgHuj4wYJr
	 FX6FJ3uJZghIw==
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40b3dae2285so35007095e9.2
        for <linux-doc@vger.kernel.org>; Mon, 04 Dec 2023 06:26:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701699992; x=1702304792;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrj69QBqcJ2/0+no6KMFGYnNPrNFydkA4S5q1Y5aJZw=;
        b=hsbxYW7mNQspBymia/PLE6n4M4U4FVyX4zMEcOM8X/+h7YHeoPi0DiEvNnmwMjbbjd
         FsRWB835Snd7+SZZbZ2vOBzSApQx347dS1l9F4hFfTRFterWyZYtf2TaTUL2hos6vST/
         NvXQgYCOiAoon4s3OQQWuvjBWrxVoVETbAWAC0YBgps7uP57QYmtY6dGsrJVLyHwUo3S
         KavGDkFt3Q92yID5Ow8izCY2eXKKwW8P3LciWIo0DbGJsO9CFOMsZ6tqRU0WOfGEO6oR
         Z/IQYZ70cwaOardZtYZkgGdIGz8Zad7ceLxiV1QXdxlNnjMchNBhoxyTTVsD59TOEQ9W
         WTxQ==
X-Gm-Message-State: AOJu0YzZ+oKfw/wxNSmeiDtc6SKw89ucTe08NJiTBY7Q+NMTsIj9HQ3t
	WCut0pmHbdiKZiHMLaXWQS4+ir9ddWsOXtwFu8Tn7zryq5FtlsW8Q2zwF+CszIAbVtG5Cz8g+j9
	CYa5cRrcrJ5qBjbDw3IS4JWvtnD1Y0To5SRf8x8mNQclfizIJUyX/vRuTU5aMdwMS
X-Received: by 2002:a05:600c:54ef:b0:40c:33d:9b92 with SMTP id jb15-20020a05600c54ef00b0040c033d9b92mr1375220wmb.62.1701699992499;
        Mon, 04 Dec 2023 06:26:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvLlHhcU3Gc7h3Rn17LrfqyAPp8cApuaxpodpxOeyeSvrgZgV4xsXZkpEJttjlTW+azdLXQTQw0bYhJ6MkzM0=
X-Received: by 2002:a05:600c:54ef:b0:40c:33d:9b92 with SMTP id
 jb15-20020a05600c54ef00b0040c033d9b92mr1375215wmb.62.1701699992188; Mon, 04
 Dec 2023 06:26:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date: Mon, 4 Dec 2023 14:25:56 +0000
Message-ID: <CADWks+Z=kLTohq_3pk_PdXs54B6tLn25u6avn_Q1FyXN2-sVDQ@mail.gmail.com>
Subject: Converting manpages from asciidoc to rst2man ?
To: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, linux-perf-users@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

I was going through build-depends on linux kernel in Ubuntu and I
noticed that whilst most documentation and man-pages are written in
Rst format, there are a few that require asciidoc.

$ git grep -l asciidoc -- '*Makefile*'
tools/kvm/kvm_stat/Makefile
tools/lib/perf/Documentation/Makefile
tools/perf/Documentation/Makefile
tools/perf/Makefile.perf

$ git grep -l rst2man -- '*Makefile*'
Documentation/tools/rtla/Makefile
Documentation/tools/rv/Makefile
tools/bpf/bpftool/Documentation/Makefile
tools/testing/selftests/bpf/Makefile.docs

Are both Rst and asciidoc preferred in the kernel Documentation? Or
should we upgrade kvm_stat & perf manpages from asciidoc to rst2man?

-- 
Dimitri
