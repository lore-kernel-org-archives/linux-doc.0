Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349BC2797AE
	for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 16:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753201933; cv=none; b=jxBiTmZj5ROtOUOmF4vrdiSrcZt3WG8Lz2yjQ2Q/w9MmnAN0iVWVd0Cq7PnJIrykRfQLG2LtfZZp3ujYtOMUGnKbZx16kHtbsttpg18mQtWIbokHFT6WstzN7yqkeXb4469ZF3quZ5L+GI4v8pmCDidWfcESVFY3wGk1wZbGyds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753201933; c=relaxed/simple;
	bh=Pqs4E5LUI8mWz/IsLr+Bi09UwKTqd2EriMVrdlnD4Fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LhzV1HYAkWypydIQ0TgmV+X4c+PVzqCt9wq8Xv7c5Fyl+wS6mFXe0aONrZOqbZNgMbWM7FQOsIT2dDoPIXpDTqeNyB4kyJ/+y+2M8mKxSKkvSnskqPPx9Fbb+IG3dzUzzZ1iUnQbRx4OpPaJIoBVpAj6KkpBPfVp1C15UlqlQkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mW/rTHPG; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mW/rTHPG"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-31c38e75dafso4720591a91.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 09:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753201931; x=1753806731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5dIDnAxZOX8ng1HhpeNVCkuVrJFpRO5masWNAnQ3RE=;
        b=mW/rTHPGNeUnOiOWBv0MaBy+sML7w7kb2oYMREJQDhYK3cPQoihcXSZBaDVtVBtFZT
         z8gMocSw+NQ5XYAmDqFaPoPTPaCovzQil+3a/2MG+hRkdiDVdGvNItxo55KRf8GnslfW
         PG6GuE66CBQTM9utFnPrOl1VWMC3n7dszWvkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753201931; x=1753806731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5dIDnAxZOX8ng1HhpeNVCkuVrJFpRO5masWNAnQ3RE=;
        b=WdJnZn2M8IYexA++VOUet9mYFDLVsv0YeA7oAc//Y+8CCQqROhnhX3Ru91bkfeUjvg
         SC89hHcyn/jWVIqJ+QJkuIIeqmqU/NFvzQYka7ABBkbr8mCZqFPAjQu2mzfmf/cmAs11
         /fXe5hopUa1JfsEpkcsHlRcXVRPaBKKDNFM/J35breXLmjsKU9R1W3TCvEO2qJNSm1SX
         qglCuqYelhORnZdIZRWapEPZoIX6Wx/dU9ctKKGDYsB5urMsZxSUXdz/VnhbDlQVGZ6u
         6dx4/TB5w2hisBkKX56Otmt7eMKqoUbODBaxOajySNOLWbOR0xlhp56vAXRl3/KvSaKh
         fXnA==
X-Forwarded-Encrypted: i=1; AJvYcCV34ar1w8E1ndt6WMEPJccaj1u4Rjj/lvAaw+iJyFjRj0smQS6gDhThxVCWUyIa3sI7Y4Vqr5qtwa8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8bTXY/sOCBck2SzJRACdfT7frwZgv1disvO4Kf0wr2C9yU5a2
	gPHqBNYEOCQnRf+ucdVn4pJAMUl8a8NYomPppdn0JNHgb0ubQSH0hKGqVBRfF3IG94bSrZE0S3S
	U3YY=
X-Gm-Gg: ASbGncs0b5jWROQKBs33GDUj0Y/3vsGhRToiU6dCDVsgqdsncw/gc7WF0yXegIBspqj
	DRF+0OF0d/HiDajKRdhj4km0yG9XttoQp+EJjI/oqfjyqg4GxgXq1zXN94OaY8pq9O6PhUnm6t6
	wLt2prFwAoyNsprJsnfc/mooTzRw6SAiUxxlPBEOxj8Mu1Yvrcll960P3VY7yREZoFjbVP8ov7E
	Iu4ls3eew4D9nS9JQABL9geODUk1UtKYjZ/8Ej40THhWr/IEHCGjCYuW60YFSPoDKp74sUC42Hw
	nsmSvGWguuzJvxAqz8cyepCZoVwrTC6IH7/HQTI5SKEXvtDxksFeqbglxhlqEQUgJiGbSDsiBjb
	ZJDLbqFi7bslrj84e+yGumjrrTAMSvENhiBMFZIb7AeiyYLIiRbny/J1SRd4pEA==
X-Google-Smtp-Source: AGHT+IHWfNzXCCJg0myw1luq8dFJtqpvtfEd46aFSx3RB1ATf+tHlw6LDMKR/c5StQzxPcG7q7IphA==
X-Received: by 2002:a17:90b:518c:b0:312:1ae9:1525 with SMTP id 98e67ed59e1d1-31c9f3deda1mr41586598a91.8.1753201931542;
        Tue, 22 Jul 2025 09:32:11 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f287bcasm12342053a91.32.2025.07.22.09.32.11
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 09:32:11 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so4632379a91.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 09:32:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYKY2PenpAbcbJUAYUajpp3AkwvWr3ag9IwIt2ZnkxgB128KXiavdbjCdWUfkOi/euu4zlYGe3g6U=@vger.kernel.org
X-Received: by 2002:a17:90b:2247:b0:313:283e:e881 with SMTP id
 98e67ed59e1d1-31c9f3ded05mr36938957a91.11.1753201930387; Tue, 22 Jul 2025
 09:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722015313.561966-1-me@brighamcampbell.com> <20250722015313.561966-3-me@brighamcampbell.com>
In-Reply-To: <20250722015313.561966-3-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Jul 2025 09:31:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vg6LoPzOHRj=XzCcSb7rPb=vPuCZngrf4hROZNwfj2Pg@mail.gmail.com>
X-Gm-Features: Ac12FXxeoQ5h83qTRHx6WqFmrhVxXb5TjaxOWmVQAou0S7ba7bXolm4shfJMxPI
Message-ID: <CAD=FV=Vg6LoPzOHRj=XzCcSb7rPb=vPuCZngrf4hROZNwfj2Pg@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 21, 2025 at 6:53=E2=80=AFPM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Fix bug in unprepare() which causes the function's return value to be
> that of the last mipi "enter sleep mode" command.
>
> Update driver to use the "multi" variant of MIPI functions in order to
> facilitate improved error handling and remove the panel's dependency on
> deprecated MIPI functions.
>
> Use the new mipi_dsi_dual macro to reduce code duplication.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 196 ++++++------------
>  1 file changed, 59 insertions(+), 137 deletions(-)

Just for fun, I ran bloat-o-meter to compare before and after.

add/remove: 0/0 grow/shrink: 0/3 up/down: 0/-217 (-217)
Function                                     old     new   delta
jdi_write_dcdc_registers.d                    10       5      -5
jdi_panel_unprepare                          312     260     -52
jdi_panel_prepare                           1020     860    -160
Total: Before=3D4908, After=3D4691, chg -4.42%

...not as big of a savings, but that's not too surprising in this case
since we don't have the whole pile of "seq" functions. Still the point
was making the driver cleaner and the space savings is just an extra
bonus!

-Doug
