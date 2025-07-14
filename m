Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091BA194A60
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 21:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752529673; cv=none; b=bnuk1Pv/HZcENmnYKAHflYImjuQFzdg+P+spRxKhCtPn8JOf7iceaJ3O++kh5RpwfNDbepU4C00v2r+0I0y8XVIqORZEmeBlOdR1hGeIrrHHsG7FnqG8taZ9oz2djcpRKOYhQspwG3Fbm3WU2PjXTnoqYST4bMICpVI2XBVeGfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752529673; c=relaxed/simple;
	bh=V9Y2NIs0QY+zYv8H9yC29XGZyfNuVxgSGOBvL77XYk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdQJvv4zZGETKBZxeBuPjzdJ9Q4BCkUGucl55iBhL3jYQzhnUE45pYqiAI1RXAjbj/S8O6ENgm+gV4F2XwyriiFhuxShPbYMXb+/KLxco1cmEXOFWZz5Z05smbB76/tEP2ri2BeKzx3+xTa6LeFPYCMGbrqdeo8Qwz6EPOmcHc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oTeMhiGe; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oTeMhiGe"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23c8a5053c2so46868645ad.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 14:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752529669; x=1753134469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHUobGGDL83F/rNDnQcpYA+2CpRw+ILTCJaorukvyyU=;
        b=oTeMhiGe6MpBmBH/d3M2mszDxmE1gknA8B1LJjlvNpm8QSxysdP39UcByF7AhonvLi
         220I/UonaJW5coZqAjllzze5NaQ4MtjoxcrX4qqrbG4rj2L9Rd/c0E8OEtbmpRe8WXQf
         UwXrhZpNlN/WvxtDw7lFCgTeIY3YNm9NKBjqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752529669; x=1753134469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHUobGGDL83F/rNDnQcpYA+2CpRw+ILTCJaorukvyyU=;
        b=acOcoJDepGkDBdg7LtuGmIgbD+2NE1uqwdPXSvzCUM7fMD3W3i283y8MalQoTWtqcK
         lZ8DWT2fvpBS4ZzLMgmIYkPkngmZvlAObYSS/CDXrYzK7qxbL43GJFqHkrtjUaqQWQPc
         LT2aL9MG2atiWhZTJ78/TnITb0tIgyBgSG8mZjhtuHBOpZvC8lwV9y6wdpo5pbXiHyPj
         JRyPlom4JKJgW9tbTUGjT9rCTnXKbNqaz5XXdi1fRx1inClu0EdjdfOFCm1zJrClT6cy
         Lgn9Yw5n4jYZfpA6MhsFrNfFJeH+vp4GFUbRgdL7RK9IzNS8SKhtfDC472vWh+vDYodL
         G41Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiQIflkEXECnp/plJHv1A2av12atJVYLwXJNnDL84UhF7KgOO9K2jv500ai3alPcn26VoetwSwynA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzELnF8maTsIT0GUWZVWKmFc55cHX2yD12uou4ApwcEM7CUjb0Q
	7njxg2kQwilVwMxLs4cVvs4YZnKgzxwGXwsfwrTYQxAb0jcCmKA4IjOrMtIg+qsOd69cdWG80mV
	WeeU=
X-Gm-Gg: ASbGncvMQgmKtJPQ4ksJJWGLS+Jsd51HMz4qaLTcQMTBjeBlwtnlzAt4X7BUa8ScO5O
	m5rXKGcda0qP4zs/AVHe0Vveyli3qpcYYcJhFS6Ryi6FPk65lxnGvdXHM524oL8Cp/J8nw4I8t4
	Vfp0CIeOj8WNx/nere3TeOYVH2Tou6jOrwcTrw/oShSgE2NhNY7HTmtjhRMxvqp2tJzALXKjGdo
	o8WUt6bti54bKnabWfnF+uuCBOw3v/6kql1ZsLLri9KNPW7NDfAIliyFN9PilE7Ap5AHZgxDphE
	uaJXCRubyr/hox2wYe+px58pki76mKxKsBLaD9lGCCvRYBYOXjYYNDwbURZNQivEQmDPclVBsoz
	fCV32vwK5otBeYMOnGaNRHk/i7t0qxlK3L4hrp6kNqQAkZf8SRBhdMbCx0U4auQ==
X-Google-Smtp-Source: AGHT+IHAO5MDwpZU57HRArzdPucx3H9Z5tn4XjdZsReMq9yXCVVzqjZEyLMqXld2ptbLs3TJk3vrbA==
X-Received: by 2002:a17:903:238e:b0:235:f51f:c9e4 with SMTP id d9443c01a7336-23df08056bemr209707645ad.12.1752529669120;
        Mon, 14 Jul 2025 14:47:49 -0700 (PDT)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42b1752sm103121125ad.86.2025.07.14.14.47.43
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 14:47:43 -0700 (PDT)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso4335386a91.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 14:47:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnMEQVPFPT2vD0Cunl2Hhh2qVhtqdvPqEHXQ8gwFXhAVvbrop19AKREQLkqV3Hpby/T+NVBJP0pvo=@vger.kernel.org
X-Received: by 2002:a17:90b:2f03:b0:312:e90b:419e with SMTP id
 98e67ed59e1d1-31c50d7b487mr22879682a91.12.1752529663338; Mon, 14 Jul 2025
 14:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708073901.90027-1-me@brighamcampbell.com> <20250708073901.90027-4-me@brighamcampbell.com>
In-Reply-To: <20250708073901.90027-4-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jul 2025 14:47:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJ8yqzyivLTrVCzjtNOH1Y8BUOS_U80es8vJGBt3AdCg@mail.gmail.com>
X-Gm-Features: Ac12FXwFl16Z6-RJd6zYJ2xS_PM42hpyLDaAqwQv40cOctjOMerkyA2E6guYjpo
Message-ID: <CAD=FV=XJ8yqzyivLTrVCzjtNOH1Y8BUOS_U80es8vJGBt3AdCg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm: docs: Update task from drm TODO list
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 8, 2025 at 12:39=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Update TODO item from drm documentation to contain more applicable
> information regarding the removal of deprecated MIPI DSI functions and
> no longer reference functions which have already been removed from the
> kernel.
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  Documentation/gpu/todo.rst | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
