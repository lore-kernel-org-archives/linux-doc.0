Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F9F203708
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 18:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729016969; cv=none; b=VVqsm1olw9Tcqoos3x+H0YlkdAyaoHhNzTL6+YjZP0shH94QDQLTsAh94QCjQyFuReCqxxmthGeDlWaFy9NZkBLGKsFxeVyVIL1Ty9o7q6TucnhII7QVxnOnkOwKpDjoniTktzolzSp6kdYLdUbAtGK8twjHyfMRkDbn4Fayx8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729016969; c=relaxed/simple;
	bh=SgSSB0A79/lXmp7e1L5p5kJysoGd8jXJgdaDGKjEpII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=WIsBSatAiubgjX4Mk/nYjrLWzM/uSVgRQrbmnZnscmif+2D3waV7BGyrfwj5kYz3KZatjGLwxK4G1b99W76e2YKfyIeyO1RFygu2Vu4XGivEvbb4A6OSvXgmgo0JOIVYJUYY9Wf+jRtlkAW7oGo8EUcpwfnyKcqGwovBgmNygNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0mEMS0OG; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0mEMS0OG"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a3b3f4b599so1357795ab.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 11:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729016967; x=1729621767; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gsx3rVKk6EHdFPE0feA0DgeAupvx9NOXATe162zYTy8=;
        b=0mEMS0OGEJjVEpQdYodTeE0q/DGZjI/0qDwuExi7qB4+TCeqLnQjVJw7RdiTxuopoY
         dWsnN+ZM4WbQroVwzN93seyawcOJJd4Rm4eOXc2f0G7CkrhFnYJyD36TJ0c1LYHmIyeX
         BOKU2RyWQr82yyPciPKyy2CvvNcIC4o595Mh9NbZhoBaJCfrIRIdod++BUpgt2P0o4DG
         cuS4FeI7vbjV3BzZoKZWzqQwzZRCgGNBhgnBmFd8hP1o8X/rpe8KbcYt6M5phuhL0Is5
         zsjnl6iTVRXrJHGUigRssPD8b0FuHICQnTmUBXKbVq4FWCaa3JKdUT/FsAkCFepO58AW
         INrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729016967; x=1729621767;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gsx3rVKk6EHdFPE0feA0DgeAupvx9NOXATe162zYTy8=;
        b=wiun32wAJCJjOuxPdodUu5UmIciPYEZBfR8aUHz1zJueZHYNcLstbb+f/D0khTGTiV
         lRF2ieJgp9NjllArYS1JuBL+3hXypcsXoZjWtFayw9yW1/8XU0dCyQoNDj/TnfXQPj6U
         qDijuvsnbOQtaa4YgpbyFk3fXOzvlmMtfY5tqUqX9uyaHUvnsFf40ZdUQ1WJ25/p9Z+t
         pOxfcLegy82Gj5XYogKtRrTTm2Ub75s04dNobwsjdT5f4iiasUYXgYG82bW4OeuJrweV
         swDdIopuykXfo1aQcM1A7L08RcHJfLaK4w6cuQQHSUiVCGTfyGIpLePGzc4LAhjazO4a
         69Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUO+uV2lHy2XG9VdZ6XzlnGguzKCBzKI+qwXL8Lo5Sr2pLJfWYERzA6qCNnBqzQdbIPmTR7MzPlPMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuBOo9NNO0CQxxH9E19WLpFIUYEbWQYE4iziSgQH3fehRW5Gye
	1aC8GhsPOlkjgA0ifdUm7qH5O4Zts56uRpoJ3Eir1t1hoUs+YKHKj38FyPmm0LUEvaBez1RX+cJ
	Iw+CtJjvXJkvQDsV7aNZNe6JpYP9tHQ4gZBQFBrrMzylqmKd7dSTN3sA=
X-Google-Smtp-Source: AGHT+IHYZhCaFHMFZvkhdJXYDWIOjpmUHlhAQ02PJI3HGXk+yjx/FbcIgWVnP920/c5Dg1cimfTpl0cFaJ6Ky3iSPoY=
X-Received: by 2002:a05:6e02:550:b0:3a0:a75d:8659 with SMTP id
 e9e14a558f8ab-3a3ddffd5acmr185295ab.29.1729016966751; Tue, 15 Oct 2024
 11:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015182745.1012684-1-irogers@google.com>
In-Reply-To: <20241015182745.1012684-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Oct 2024 11:29:12 -0700
Message-ID: <CAP-5=fXanbFKK=mYZJc+prjyO8wZhrdquELWG4URYksuSaVtEQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm: Fix separator for drm-pdev
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 11:27=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> The PCI slot address for drm-pdev should be a colon not a period. On a
> i915 GPU I see:
> ```
> drm-pdev:       0000:00:02.0
> ```
>
> Signed-off-by: Ian Rogers <irogers@google.com>

Possibly:
Fixes: 055634e4b62f ("drm/i915: Expose client engine utilisation via fdinfo=
")

Thanks,
Ian

> ---
>  Documentation/gpu/drm-usage-stats.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/dr=
m-usage-stats.rst
> index a80f95ca1b2f..f56ca58312fc 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -56,7 +56,7 @@ Optional fully standardised keys
>  Identification
>  ^^^^^^^^^^^^^^
>
> -- drm-pdev: <aaaa:bb.cc.d>
> +- drm-pdev: <aaaa:bb:cc.d>
>
>  For PCI devices this should contain the PCI slot address of the device i=
n
>  question.
> --
> 2.47.0.rc1.288.g06298d1525-goog
>
