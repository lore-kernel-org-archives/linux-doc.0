Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FE32071E9
	for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 19:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729280796; cv=none; b=pYoPIhUaamnCrT9kMMUaYU0QAoZpaoujNNRA/mRcsWQc5hDsDQN64sXaW5pO+0mQzCDedLCLA7+9mZnFAQDXGjKINSIU3gPArUDpYwNtb55tLvOuS6w+zt9RQ4teTJxLw3AcrY9viR/AR+qxaXhTC5jN28wbhpvlSAJxR3pb5L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729280796; c=relaxed/simple;
	bh=gRKbZykbQnfZIa2mN+Qk0kjeMCLWWLiYlGss8XAlG4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cCiNQ7T9co5VV3ZIB0bqTd1hsTdwoxjrVB2t8G9pPh877TYAM8huXuC5PMDvDB0hNluWABF2VOjWf61Jk1f3Tcr0hJ3zZwCP0pjGkdnh/U+9i83s3x+sZzJY+qRlkdMzfJvlRaYlFNRCQG32MJua8ogQZf+89jgCYLBGsK9xgv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lBqlPoB9; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lBqlPoB9"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539e4b7409fso2502014e87.0
        for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 12:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729280791; x=1729885591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8ipiDWj3Ck20WdXHaYfDWf33qFxj+sWnjP/LUx2c50=;
        b=lBqlPoB9n9a+fq3rLpZCop2AmbKMiQfS79QNqmHPaxwhsIVyDkrsNvgnLhGe06XhAB
         bkxeKjZX2CWDnCb2BxlDUbkS3mBz22sYj1o9lj4wlZiRhwxlfC961izMUeqPsSxH+Nfa
         McM/jXc2lgz46ey1tlpTaH2m9thxKgpMuXQjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729280791; x=1729885591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8ipiDWj3Ck20WdXHaYfDWf33qFxj+sWnjP/LUx2c50=;
        b=SRTIDx5CsumaI+qb/qgqryGRzxKTql89jQzqkHgO9f1WLX8itHKFc34Plt9OO7EuNw
         +oV4h/UqENpiehPkAVkLXp6Nj+FDJk6CxqG4Gqrtd2shpsHPNjcZihmyNPtd7IN4jzGU
         zaWigYAwTUZQFHzvoiQYh/9ZN8/97XWf9K8Os9/qS+751O1Dn4fN3Da61sXVrFcLhoay
         AL//n4bjmvw/9MXgQ7EAGRXiBaoZlyE9rrAx6F1yDi8kTv1o0hQxEJNokDivavNqAImt
         gPj6qT+fGKIPMYI0N74o3/m4Vt8lEfwUbB0kGaQcyHka+7aLoaqlZNY9VLCMhWHcojrC
         ZhzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5gbjfVa9NhZxSkX84BQQhGkAmCeRnSdG+i7GWQCUrXcgm4pZ6U62TZVD5ELjthxW6GjG9jlq7xbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxaAokmKJqzO89+ObJYgS1Ysj4E32c6m46LP/fiemzO5/KNZ3H
	SF/HaIFDRt7nUL927YPx0eDPeBWXSW60eJEAwS/ISdDSkNAObtZ8b9oAmPciF4+BbTF5Or6tnTM
	nfuDh
X-Google-Smtp-Source: AGHT+IEwO8aFlH90U6ODrbTy7X25oEvqku3PTrt00QKNo4G4cM91JnqPxs0TXALRU0bdwoYUaD0e/w==
X-Received: by 2002:a05:6512:3e1e:b0:539:e3a2:3a25 with SMTP id 2adb3069b0e04-53a158625d8mr1187466e87.18.1729280790240;
        Fri, 18 Oct 2024 12:46:30 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151f0afdsm302227e87.133.2024.10.18.12.46.29
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 12:46:29 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e8586b53so2960212e87.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 12:46:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNn2YZ7fea7Fo6NWsI8/uMsShkBYp+HyfkaYMxIPpFqpEm+yrkLvW3CArldWdD9m8Y5c/123VjcQI=@vger.kernel.org
X-Received: by 2002:a05:6512:e91:b0:53a:c15:96a5 with SMTP id
 2adb3069b0e04-53a15b98db4mr1223870e87.27.1729280788792; Fri, 18 Oct 2024
 12:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018163136.GA795979@lichtman.org> <20241018175540.GA796909@lichtman.org>
In-Reply-To: <20241018175540.GA796909@lichtman.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Oct 2024 12:46:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UwNAkam8HFhdPLRCXHf05LUXdJF++d-pvpFrCLtOypPQ@mail.gmail.com>
Message-ID: <CAD=FV=UwNAkam8HFhdPLRCXHf05LUXdJF++d-pvpFrCLtOypPQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: English fixes in kgdb/kdb article
To: Nir Lichtman <nir@lichtman.org>
Cc: jason.wessel@windriver.com, daniel.thompson@linaro.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 18, 2024 at 10:55=E2=80=AFAM Nir Lichtman <nir@lichtman.org> wr=
ote:
>
> @@ -201,7 +201,7 @@ Using loadable module or built-in
>  Configure kgdboc at runtime with sysfs
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> -At run time you can enable or disable kgdboc by echoing a parameters
> +At run time you can enable or disable kgdboc by writing parameters
>  into sysfs. Here are two examples:

In response to v1, Matthew wanted you to change "the sysfs" into
"sysfs". In the above it's no longer "the sysfs" but it's not part of
your patch (no "-" of the old line with the "the" and "+" of the new
line without the "the". Huh? This causes the patch to fail to apply.

Other than that, this all looks fine to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
