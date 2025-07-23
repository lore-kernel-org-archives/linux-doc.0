Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752C12E6108
	for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 15:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753283431; cv=none; b=K8fNlu1KXybbUnZKDPNPfVty+n50XOmL/gwewF2BKeyAuuXi/OydxX5742CxqSOdBqAhqmNlie9m3X4NiVoV6Maif6BYcg4GLerxPAkiQhf5BljpLWJVkXa8DYCLQoiz9QeiW/DOM2FPDs6+/bE/SYlaJTpYoVNxI8ODwukOpxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753283431; c=relaxed/simple;
	bh=s9X3Rf4iKvd8tihzYDWl7G2SYC11kejhiYfJ2FtSKJ4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=WyC1VY+h4fvIEPZAG0aEvXtANhp8HBy4mL2isjh8PXq6/WRGV2wbSEeWEq0wuK2xShsno+5mNDZxHs4N8bl3WO8WTj9+pR4em8/lO7SDegFGoMcJ8mkYWusaf8kmS6WWLn6lR3YlYLFqt2+/c4gy0JgkURPHplHnVA8Xoc27yYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=IWkwUuPr; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="IWkwUuPr"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-748d982e97cso49239b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753283429; x=1753888229; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuChy1LULay+ShDL03IJdTFrOKC/jWx8pEhX699NilY=;
        b=IWkwUuPrIpKXTGqhnVt3lRl+2UlmxYF/OhDKZZRRNJE45l3GBqGD0sS+MNVh1YZwHu
         ToNbcTx7YZCG0PGJJ4cjLXQol6PKWBQtHgtKLfW59f2SHVDv68B50kJHitqg1Vly+9wa
         v7i/xQCFE5sM0fNGH6h0jhpgj8DrlV+OMCiwGR4Bfte5SKBj0fihLMQJaUzqpwP9H7Np
         3IZaAYS7t/pQ/dEqIKi2RHSmXltWmBFqs+YiCYrJuFS6FNtZuiiEzOcGaZwT8DzpkI6p
         FYP+E+TNQqDFR+Kah0xH+48yypHXcl9owut7qUN1DhOC0kV1+dR4Ehphqdn6kmnFxWJ4
         JFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753283429; x=1753888229;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UuChy1LULay+ShDL03IJdTFrOKC/jWx8pEhX699NilY=;
        b=owv61gI+N/QxchswDaHBrk9WVBIB1zSz1ZZ3TlOhCHlUgTvIL9Pv8+zDUa/N8/b3K1
         6xWYY8PLuYspygvJXFLC1No/TxZLCQriWuiCXqm0mslr0JHZpLdiVAhBv+bYktPl24p8
         AaDaB2Vkwu4pYvFAUO9jUOIkQ2/hWgyXeRMrPi3VHaRLxtUqznj1b871OvgirKPw1AJn
         DXlGFH/zRRPcPMUgxwP8U2wBLiOsVRklqdpmLjDam+4qmlXVcloHiOe7250ElBpSaoXx
         j5cMsp82RhuA5P5cFablGOWnZk5WKJy7ppUjNyhsWnUFDnPN47NHgYNJw3+7D2oYAdmC
         mtJw==
X-Forwarded-Encrypted: i=1; AJvYcCVwY9HbEFuh2SeYRn5/GYdh9YxxFSjrC4444AhhV96r0V74x+v1fhE79HEU4PJ2CXRQIox70m1LUwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDdmTsYO2oEbcz8ywuLhZDZqjervn2NaouyMhtg2rvjyuaBfAh
	MlL83MaKTMMFLVrkpkjzV8KTcHaAV8u+cWVUJf1vrF8l/tsw0MyIBdbbfLfUa1p2nM4=
X-Gm-Gg: ASbGnctqm8DHOL5g9rKECtmffCjXJTVOVWzhs6foV01+MbKy14GBz9HEifU3cheAdSL
	qp7c8Xl0nKEb52ZrvlqeVIaxa4oC6j93v1R4IkqwLhbAEvGKXaZrNSlLgLxeLZ+gcZx8923pjo+
	avV0SlFmmvVo+NMsCc40xRMdtrZfM6xq/ggt07Xo0uglZcOu96E0rfWgwAiZvRg3WyJiW49dqav
	uPQcbveJdV7uBzRIwjctLXGz1BLjVj26fbKiXL8c1F8M8sY75fDTUy7ht7V/hclJc67YUGQBjjo
	MgcQBsVDPs0NhWNsnhToOglk6cxlKAWp731KsxYPUkMyAlknRBGA55LsYxOsOLliwMHrKGaL6PQ
	eqyWWZvoY8FX3GszMIg2zt4Hdh4pfMg==
X-Google-Smtp-Source: AGHT+IE+co2aDTbuxqywk9VXXdq95Qx32EuhMNzguqNw2C4YBMnkv2fPJd5DUodgNwdXPUs40Wvm1w==
X-Received: by 2002:a05:6a00:a1c:b0:748:eedb:902a with SMTP id d2e1a72fcca58-760353f328fmr4564271b3a.17.1753283429448;
        Wed, 23 Jul 2025 08:10:29 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb1569absm9971551b3a.68.2025.07.23.08.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 08:10:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 09:10:26 -0600
Message-Id: <DBJJ3QS0PN8E.3VW8UD9HEQAA6@brighamcampbell.com>
To: "Doug Anderson" <dianders@chromium.org>
Cc: <tejasvipin76@gmail.com>, <diogo.ivo@tecnico.ulisboa.pt>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jianhua Lu"
 <lujianhua000@gmail.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Jessica Zhang" <jessica.zhang@oss.qualcomm.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/4] drm: Create mipi_dsi_dual* macros
From: "Brigham Campbell" <me@brighamcampbell.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250722015313.561966-1-me@brighamcampbell.com>
 <20250722015313.561966-2-me@brighamcampbell.com>
 <CAD=FV=XGO5y0F40oaOANW-r-q5qZPFYRwO7aQHi3R6Ag-aeMag@mail.gmail.com>
In-Reply-To: <CAD=FV=XGO5y0F40oaOANW-r-q5qZPFYRwO7aQHi3R6Ag-aeMag@mail.gmail.com>

On Tue Jul 22, 2025 at 10:20 AM MDT, Doug Anderson wrote:
> On Mon, Jul 21, 2025 at 6:53=E2=80=AFPM Brigham Campbell <me@brighamcampb=
ell.com> wrote:
> add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-8754 (-8754)
> Function                                     old     new   delta
> elish_csot_init_sequence.d                   758     379    -379
> elish_boe_init_sequence.d                    846     423    -423
> elish_csot_init_sequence                    9136    5380   -3756
> elish_boe_init_sequence                    10192    5996   -4196
> Total: Before=3D33880, After=3D25126, chg -25.84%
>
> So the new way of defining mipi_dsi_dual_dcs_write_seq_multi() did
> indeed give a pretty sweet space savings! :-)

Interesting! With as much as I've heard about compiler optimizations,
I'm kind of surprised that the compiler didn't do a better job before
redefining mipi_dsi_dual_dcs_write_seq_multi(). It's nice to know what
to expect when the rubber hits the proverbial road.

> This patch looks good to me now. Thanks for putting up with all my
> requests. I know this is a lot bigger than you thought it would be
> when you posted your first patch, but I appreciate you sticking with
> it!
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> My plan would be to give this series another week on the list. If
> there is no additional feedback then I'll plan to land it.

Thanks, Doug. I appreciate your patient suggestions. Waiting another
week for any additional comments or suggestions sounds good to me!
Thanks for letting me know.

Brigham
