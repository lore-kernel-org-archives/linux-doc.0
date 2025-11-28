Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6771327C01
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 12:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764331905; cv=none; b=t4e/fh2OcLP6mFjyVkUBZXP4TooSBMVCVTX52R7+BC/gDD6SaFcMunvOOuULej8UyYsXqSmiXfsa5Uhhm77NYvZCIdkFiuEL2X1UXg10gbVK0OeNWFrB4BBAsKpK13ZAKDAI8Q5kCLXtl7UXMoIuAwopemtSVwCAleJ0UXmno3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764331905; c=relaxed/simple;
	bh=3FW2c0xkEaAdUlSJBkucIUI20nlOnek/5STA9IOZ09g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzrXK4VZbS3NBMrEhklGTmZBf8ibOmvOIF/Sqouzdy5Hed6KpvBHATxlE4H5jjJwcUfwlYjtpwtXqQKv+FXzLfGphjZV3QUDwlA2e7eBHEDSDdVRKEYBomP3l9p/M5a8i7XT20UG4abICf2bytZMcx9836gTv+rVy5ovh/D59GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q7OU1tLA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q7OU1tLA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB78C2BCB3
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 12:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764331904;
	bh=3FW2c0xkEaAdUlSJBkucIUI20nlOnek/5STA9IOZ09g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q7OU1tLAY92DZt2exafBgDIn8E7uV0G4gL/8NXn7zXtJboAz+93WG51GyhhL0G8Uh
	 qpd/X1HcOCmuQkcxml7VAGWCSll35VHL3Vhr+p8/9iI8uWvngXoX+jd8uGknlE+/q6
	 YmtH51vDgAKxVp0XS0dHF+j98V3qYplFKPxCMJtw09KfAT7dA1j7Zel9RQFZVbCO8S
	 Oma9u/de88G/DcQjWl1xen6830+Jd06UEO02xGl7UtdDK+x6HTeioNvg7c0L7b9xEy
	 QBTEMQmhg54WmJbrIIXY6TY3ZEWCPJXqkBPmLMW1dzYOWRbNVmtdnlOLAqTDxz19uf
	 HYgrtH+apSUmQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-591c98ebe90so2539048e87.3
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 04:11:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXIB7/lfYyNertcP8SlqFjYBiYi0nouUEk2DZLtbRtssLH4jyOI8UjUPt/RoEbkYqyB6awgFaNXD/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNfRA+Iul8lBrWAllQviSv9ss+ryMigFMxmw4ickSYfKSW7sv5
	WbIx+PQW3FitziGgqqDqbU2Og/b10HlOIyTAOINvj57F4To9eQZ0zDQk7uL0RNab6OECj4ZOh2q
	BHcS19gnAicw3rAw6ucqI3wWzt4GoXy8m+ORxeHAdRA==
X-Google-Smtp-Source: AGHT+IFccEJqPf9GsVz7Ow8O/OUAsp3ckoijCPZ13KjRL7MhqqIzGrI9RfOPL3/bH3zHx3X5oE0rddi7qROkHTi0PRQ=
X-Received: by 2002:a05:6512:33d4:b0:57a:7c9a:e826 with SMTP id
 2adb3069b0e04-596a3e9fe30mr9367079e87.4.1764331903056; Fri, 28 Nov 2025
 04:11:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
 <20251128-qcom-qce-cmd-descr-v9-11-9a5f72b89722@linaro.org> <afde1841-f809-4eb2-a024-6965539fcb94@oss.qualcomm.com>
In-Reply-To: <afde1841-f809-4eb2-a024-6965539fcb94@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 28 Nov 2025 13:11:30 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mefy=6XDzA2bqe6g_AZS3bbdNEKoq4Z9hV8VwSq5mYBSw@mail.gmail.com>
X-Gm-Features: AWmQ_bk5XhGbnR_8N9trznxcsVBgdT9UGm7CPw1PznDVP6sEw0lzXqWlPIaBWPM
Message-ID: <CAMRc=Mefy=6XDzA2bqe6g_AZS3bbdNEKoq4Z9hV8VwSq5mYBSw@mail.gmail.com>
Subject: Re: [PATCH v9 11/11] crypto: qce - Switch to using BAM DMA for crypto I/O
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 1:08=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/28/25 12:44 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > With everything else in place, we can now switch to actually using the
> > BAM DMA for register I/O with DMA engine locking.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> [...]
>
> > @@ -25,7 +26,7 @@ static inline u32 qce_read(struct qce_device *qce, u3=
2 offset)
> >
> >  static inline void qce_write(struct qce_device *qce, u32 offset, u32 v=
al)
> >  {
> > -     writel(val, qce->base + offset);
> > +     qce_write_dma(qce, offset, val);
> >  }
>
> qce_write() seems no longer useful now
>

I prefer to leave it like this if there are no strong objections. It
reduces the size of the final patch and also - if for any reason in
the future - we need to go back to supporting both DMA and CPU, we
could handle it here.

Bart
