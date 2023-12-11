Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b="jCSJEg2o"
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704CBED
	for <linux-doc@vger.kernel.org>; Sun, 10 Dec 2023 17:19:15 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-589d4033e84so2331045eaf.1
        for <linux-doc@vger.kernel.org>; Sun, 10 Dec 2023 17:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20230601.gappssmtp.com; s=20230601; t=1702257554; x=1702862354; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGvU7asxA57g0O1jsmUyh3UcuObNds20nZHjcCxr4vQ=;
        b=jCSJEg2ohbVCdgLBWHTXyUU7Jp88la2jwY91060hUMacZbo9GUxVEjDFFKNu8tVAS8
         Gp6HvI+/83Op8FuK6nhpKUslcz++RTr3Qx3hP2MSZgCKCyPYyqvwUuWeDEm+80tQl+Qg
         Vi/iuQD0xwrmRMA3MlzLzkb0l0GVuZIXJV2lZyVzVoSaSM4H/q1Q76OBblchFfWbHtj6
         MH6yRuoLzUcTWef26qQedDZGC067F+iOKenCboS0ertJQLMEtvmPudAkSRU4kaXtP9xZ
         +OMg/9HoCxgTrW+UzIPKrc65P5+Tf6saI1jEztZ0Yp4YkY5nRdM8/aBRbgD1nl0yktwB
         h4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702257554; x=1702862354;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hGvU7asxA57g0O1jsmUyh3UcuObNds20nZHjcCxr4vQ=;
        b=vGWhf5RZ4/AnabwT1Wjn0YYFcK+S4mAfC0g85+3k0N+q28U4LGm8GukMTH2j6wgQY2
         4G+hPTW5cV47l/681oAid2BUiD1cauAaS8RYLn7ObdgWLehB9X7cCiZ+dJLrvHS59688
         zcIqbsFnw+jUwPKzUhNw+Wj1Ib+xWZ0dVf5KdRPj+LmMDnUkvmlkFc6/mmyFEwSrJLUc
         H+oRBF38kkoeZlLhanNyFCQ30L3KMscAzdmdYRYvODC76g4rkP8498n4WwMmpLH4tWxN
         /JAf5TlGr7zNoBt6nRCt8mu22dm0kACoh79NNtOi6azlsna/+V8pOvaWcaqK5Qha8SPo
         O5hw==
X-Gm-Message-State: AOJu0YyM34WASxJQTHN+ygNPE8/HTHpsPAIYxwx/k/cx4mcN+wgE/LQ7
	fdhVe86HZh3cSghkp8GWGx2CMw==
X-Google-Smtp-Source: AGHT+IECW4R6/zUParI62agJ8IEpAm/jjxRxbg6dABbkClG5rlTe4O6+HgK65GXlYKDAr+2RsBFcTw==
X-Received: by 2002:a05:6820:1503:b0:590:92bd:d3e9 with SMTP id ay3-20020a056820150300b0059092bdd3e9mr4013791oob.14.1702257554164;
        Sun, 10 Dec 2023 17:19:14 -0800 (PST)
Received: from ?IPV6:2603:8080:2300:de:29b1:e1a0:8d3c:63c7? (2603-8080-2300-00de-29b1-e1a0-8d3c-63c7.res6.spectrum.com. [2603:8080:2300:de:29b1:e1a0:8d3c:63c7])
        by smtp.gmail.com with ESMTPSA id e196-20020a4a55cd000000b0058d8b0c4bbdsm1668225oob.32.2023.12.10.17.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Dec 2023 17:19:13 -0800 (PST)
Message-ID: <58e78693-82d1-451d-a546-51fb64ef6eb5@vt.edu>
Date: Sun, 10 Dec 2023 19:19:12 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, alex.gaynor@gmail.com,
 wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, bilbao@vt.edu
From: Carlos Bilbao <bilbao@vt.edu>
Subject: [PATCH 0/1 RESEND] docs: Include simplified link titles in main
 page's index
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

NOTE: I'm resending because this patch set ended up labeled as Junk/Spam for
me and I suspect it will happen to others.

The general consensus is that the documentation's website main entry point
and its sidebar leave room for improvement.

Something we can easily fix is that there's too much duplicated text.

To that point, consider the titles "The Linux kernel user's and
administrator's guide" and "The Linux kernel user-space API guide." We get
it, it's the Linux kernel. It's assumed that everything listed pertains to
the Linux kernel, given the overarching title, "The Linux Kernel
documentation." Constant repetition of "Linux" and "kernel" (45 times
each), "documentation" (21 times), and "guide" (18 times) are excessive and
affect UX.

I propose simplifying without altering actual document titles, the text
linking to these documents on the main page ("link titles"). For example,
"The Linux kernel user's and administrator's guide" could become "User's
and Administrator's Guide," and "A guide to the Kernel Development Process"
could be "Development Process". This is what my patch does.

I've uploaded screenshots of the website's main entry before and after [1]
and I personally find the simplified version cleaner and more user-friendly.

At some point, we could discuss an automated way to collect and display all
link titles, IMO manually doing it on the main page is a step in the
right direction for now.

Thanks,
Carlos

[1] https://github.com/Zildj1an/linux-kernel-docs-compare/blob/main/comparison.png

Carlos Bilbao (1):
    docs: Include simplified link titles in main page's index

Documentation/index.rst | 50 ++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

