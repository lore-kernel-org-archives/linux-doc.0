Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ja+GIi8f"
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 628C9D2
	for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 11:09:21 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50a6ff9881fso6904204e87.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 11:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700507359; x=1701112159; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2gT8qI7J4DfNC3fvxpvTeUasCaPniXuz/ND//HAah/8=;
        b=ja+GIi8faaXYKjVFXJ9OKfmt7F2dD8JJiE3+kuBOLkLs5lBCvHzxDuJabAdQOZwImY
         8uowFVdwTNtfkGLTNZadevI1dh8R3MTeuSbaVNX4cqvtAG3lj+BwUoAw4kKE4h1CBAR7
         bG9EUjUJIqeVIuwAe9jzAgH0ctY2j7eQWwF0XdW6LgVXc/7bkmxb5+bqJnRUhE5bkBPZ
         VZfF/1/d3ipOBgMMPSjBAc3k06BDLLLN2j8dUgrHMq0iSQewVNTHv940RIDAMbSaC0vY
         MB9n8UGHeGBs0pFBCyscMtavTuOfn1mXxdQhT5N5XwMnNQMprr2G0gBC5/WLKnKbzHpG
         OdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700507359; x=1701112159;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2gT8qI7J4DfNC3fvxpvTeUasCaPniXuz/ND//HAah/8=;
        b=EcMudKvQx8l/tPXFqUkTW58DHT7ylhlIMbe/qZDRzgV7gaUacs2ss4dYZGyiOTa8Xs
         rBMW8cGUp20+2iPV+Wn/AmznL/eDFIO5XUWd3+yHCZ/dSQiP9vM7BjOaViIPgNmTtANx
         bM+sARvcWyLsXfmurIqL4gfn5PrhXbDkwJa4s0kbc6Tn+d6J2KgV0odUHXvf4MfB+i7z
         mgVp600+FN7AEWrywMOAGLhEg7UfkK5xOdKgIEj+vTN5Krwq7jVuK8dEoquhWi4l2Gka
         kHntmfdk2OPu91ZbXJVG8OAsDYGvNyqz/WmJhMYDVrKAwbfS4Yi9+OfgCcYxO72LAm8h
         zG8Q==
X-Gm-Message-State: AOJu0YzqJs6izcNhS1hTaS/eJULfz5vO7J1CZUiUXo9uDmF83i0BpTXi
	3DemWNlKRrB/fJrphnt759YY4kMJPG4wNp/2brvJHZPqrsc=
X-Google-Smtp-Source: AGHT+IHGnQBVUnDKq67ZDbNx0m3CLb2/+X/wIhjZGaZjOH7Js22qyGNjPvXAWvQudx18IyQHBmX5OfpsKA+lS+QOL2w=
X-Received: by 2002:a19:ae12:0:b0:500:92f1:c341 with SMTP id
 f18-20020a19ae12000000b0050092f1c341mr5915470lfc.54.1700507358913; Mon, 20
 Nov 2023 11:09:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Mon, 20 Nov 2023 13:08:42 -0600
Message-ID: <CAJ8C1XN9NL6Ho5bbRJkrmGkwvpL6sxBhhrUsWPQ09cOssAjmsw@mail.gmail.com>
Subject: I'd like to volunteer to add some documentation for `mount`
To: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I guess the subject line makes my intentions clear enough.

My current focus is on the adoption (over 4 years ago) of the `exFAT`
file system in the Linux kernel. Great move! I've long been a fan of
`exFAT`, and feel it's under-appreciated.

However, while writing on this subject, I realized that there is no
documentation in `man mount` that covers `exFAT`. I feel this could be
addressed best by addition of a sub-topic in `man mount` under the
topic `FILESYSTEM-SPECIFIC MOUNT OPTIONS`. And so this is what I am
volunteering to do.

If my application is of interest, please advise on what steps I need
to take - or how to approach this task.

Best Rgds,
~S
