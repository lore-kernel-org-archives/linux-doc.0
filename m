Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EA823EABB
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 08:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763453302; cv=none; b=OlryLO6qsLU5VjnOdeTnFPjR0HBEpNaSz1MMsPr5PCGjTFIbkVHU8z6IEeR+yRhwKs0VTSj4oIRJY/vQMDsA0L1RyqZhP1MMx8mbYMKWjss6prUIzMaRCF2oIyZ3YrzNV/xr5PpLuS4nIske+9gD05A4d9ZUT2xIeDqv3Y/sZYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763453302; c=relaxed/simple;
	bh=XGiihLBXKPD9ukbo6kQMQ3MBqrEpjs6uCB8MSE1Lgwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNqOhwPjZw2rydhWjvIvOkr/tSkgz+a3ni1ErD/lClNITNF8+zmAvHbnEVh3JaP0be3net6V12Dnq55QAXBS3iWjgOQTtnXsI83SCWsC0t3QYW/jf3604Glt1i3S0TEfy6k6eZSKIHwS+JstmSfjuC8BDcrrGSU6ZRdL2CHZHsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-559934e34bcso1299543e0c.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 00:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763453299; x=1764058099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZM9VzAmTBs3fZeiLb0JvTeogSBBQRAI6GehzZBDgay4=;
        b=k6R69O6KvAmLO+ikpNeZ5QwBT2cDJ+mOH9k2g0ZG1Zo9zM7D0ugvXrE14bD6qJFFyF
         dfTaMse8XOp6qeyrbnpskEo4xhGpbP/LH3FmW3nmv1blXvbd+XYn8puW1oyUHRRo/xsD
         kZdTS7dcTiJEkItHUJQkpzQ4jSiL9Nb2Is6GnGl/acCtc9ZcoGcUQkc+Oiw/g12pi+Pm
         ucArLYPjGWLU/mqMvTUd9TBF1xYGxxswoCjVK5Hnz10lgQNLReCv6CqGA//KLDidREzZ
         OBQZ8j1ZPpeE44xTQuW3bYuoUr39XAVtI1ufcoQtb4yIDTwud6co8cnCdrly/LK+HhkG
         e5Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUqLRgN4JWgKkALYijSQPoCpT7SwCk/160f4f7LHAmyoL7NVmtBA8s6IsuFC75B/XfQRIVegeSgb8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBGV6JIZ+V0T/PPL54zDhvbdqxOkOfyxjJHasKsQ5+u1/wwEcg
	e4U+KGwa125LsNphSZ827KAVz8POSqdpKci4EeKdiBFYhkiHPPr/eGzqJh48I/2UfOo=
X-Gm-Gg: ASbGncvltHKl76Ct4bk0zVhFcKHNjzxq/HfrZCJnp6SHQjKs0gN34lbtZopux6ZyhcZ
	3lMCLPf6unYecJd91t2po54VMlQVVR2qnsbUXuOuD+hP6EW8qBpZ+mi6IfQDNsxE9JGtV1AoxwN
	3SOPSrw1FX/fqt9IUZjklpP7CeTdNNkPza4Xa70tqAtZHS7AxOUTcQA2Q2Nv/Rdp0dPtyE+xkl0
	Phdwm9tVc358nIZ242rg8YMYZbKT7JjjC9pdIxTGIzUNcu/aRNGhp91w+Up4dV4uZyPrJgbNAo8
	iBzZDCkZAPTqGsI2/Ua0HhsRVrvJqfaJ0SEB8GpYCmUb/fMh78bhEN4b+1dRK5KS4Nfb7vx969x
	UQ+2rKeKYAtWc8pkKGAaO5dBBKot/aMn87b4uF8ELbwn4YVfnHDizEJrUY1fA8kr+mBwlGdxVU3
	Nhn+HucrL2YDnwkzS/lonTJqQb76jwivnt87lI2IghZTaSihVeZ7Cx
X-Google-Smtp-Source: AGHT+IF2KAiNa7RZxfQ270LwmdtvxdzYXG2BZSYCDq3/1twkiLpwOOUDzM/YFfKjNvHSCB9Lj9IRcg==
X-Received: by 2002:a05:6122:65a9:b0:55b:1a1b:3273 with SMTP id 71dfb90a1353d-55b1bd3f01fmr5053209e0c.6.1763453299356;
        Tue, 18 Nov 2025 00:08:19 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f35a6d9sm5369764e0c.7.2025.11.18.00.08.18
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 00:08:18 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-559966a86caso1257697e0c.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 00:08:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWQ4j8/TD+O1a0OvQOMxdmQcCY5IP+WAVxG+G7Dw3drmJUiuek4Kt47J94UhE5Jyy33v9xb2xOE/8Q=@vger.kernel.org
X-Received: by 2002:a05:6122:4685:b0:54a:a048:45a4 with SMTP id
 71dfb90a1353d-55b1beda7edmr4592976e0c.16.1763453298630; Tue, 18 Nov 2025
 00:08:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117213801.4077535-1-sashal@kernel.org> <aRvHpfke8hZ--AHF@archie.me>
 <aRvY0QbRzkh94zql@laps>
In-Reply-To: <aRvY0QbRzkh94zql@laps>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Nov 2025 09:08:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXaxo=i+QPEDFwJEMtcuVs-YSa6ZUZTA9sg=Ytw1KeN0w@mail.gmail.com>
X-Gm-Features: AWmQ_blTvdvRHcaJwUYBVX6wV9Kh7ZXYBqeN2r3oaeJBk2fWBhQbVStFTLOfslo
Message-ID: <CAMuHMdXaxo=i+QPEDFwJEMtcuVs-YSa6ZUZTA9sg=Ytw1KeN0w@mail.gmail.com>
Subject: Re: [PATCH v3] README: restructure with role-based documentation and guidelines
To: Sasha Levin <sashal@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org, corbet@lwn.net, 
	josh@joshtriplett.org, kees@kernel.org, konstantin@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rostedt@goodmis.org, workflows@vger.kernel.org, 
	joe@perches.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Tue, 18 Nov 2025 at 03:24, Sasha Levin <sashal@kernel.org> wrote:
> On Tue, Nov 18, 2025 at 08:11:01AM +0700, Bagas Sanjaya wrote:
> >On Mon, Nov 17, 2025 at 04:38:01PM -0500, Sasha Levin wrote:
> >> +* Build the kernel: make defconfig && make -j$(nproc)
> >
> >See Documentation/admin-guide/quickly-build-trimmed-linux.rst.
>
> ooh nice, I wasn't aware of this one.
>
> >> +* Attribution: Agents MUST add Assisted-by tag:
> >> +  Format: Assisted-by: $AGENT_NAME:$MODEL_VERSION [$TOOL1] [$TOOL2] ...
> >> +
> >> +Examples of Proper Attribution:
> >> +
> >> +Good examples:
> >> +  Assisted-by: AI-Tool:model-version-1.0 coccinelle
> >> +  Assisted-by: AI-Assistant:v2.5.0
> >> +  Assisted-by: Code-Helper:model-2024-04-09 sparse smatch
> >> +  Assisted-by: ML-Agent:version-2024-11
> >
> >So mentioning LLM version is strictly required?
>
> Ideally yes, it'll help us keep track of which tooling is being used, and help
> us improve our workflows based on the results we're seeing from different LLMs.

Apparently we already have two users, without version numbers ;-)

  - https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=913e65a2fe1a16fa253c4a016e2306b2cf9ffef8
    Assisted-by: Google Gemini
  - https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=525cebedb32a87fa48584bc44e14170beb2c10d1
    Assisted-by: Daniel Borkmann <dborkmann@redhat.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
