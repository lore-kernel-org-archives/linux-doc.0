Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4194A188596
	for <linux-doc@vger.kernel.org>; Wed, 16 Apr 2025 16:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819252; cv=none; b=RrKJir+zdKJdbO18ZPs/fZXbulckfTS/FFB+dh0JTjSUAmbhg2YcyWB5adODI3Md+CLmXJRuQ8R9Hnf7Lbb8FZALYr6s5wSOCaIAknZ59i4h/MIhRWOMRLVVfhjQBXKF4PFk4KQshAxIgrRS/eGD3mN0nH1JbIjbOKXjF/fX5Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819252; c=relaxed/simple;
	bh=OQ2LUVURG5ZBoCwWh5loGiUwdSTfHuVc1849YbckkqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qbT2aLmdmDYzv0ZoLgIj3A2b63uzcb2M21l/DIvi/kzOSonTq4FL9oTdxPMNu6iNTkWSwyWIm+wv4Fhy5IuGgo+aT4dzIhHyMHLBpJFsMpERFYTlo3uh/0hxWCErNqTgqa4uawz4k64BUJj8FWztkLm4VF51rJWnqREziep8Vlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ceJY0ajc; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ceJY0ajc"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54acc0cd458so7987546e87.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Apr 2025 09:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744819248; x=1745424048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBPmcg0bFH2XY3Hin8L4B6RZDr/nTgPQCfRGMZTM/dg=;
        b=ceJY0ajcpp4Etwtg/oRJQk7GiAqywh6FqfWax9RM6aOqARUGEnt1SyS4osZjvEebcO
         S3Uc/Vd7j2Ujy9gXs87Qer/GFW0/C7rdE/cLOsVyRIKcDSxwaeV0Ygqvlf2JrMOd59br
         Q9da2Oq5TZXBUk2wENpmLSlwtySz5sEe5k3SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819248; x=1745424048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBPmcg0bFH2XY3Hin8L4B6RZDr/nTgPQCfRGMZTM/dg=;
        b=a3pFyXYOY95VkltVlV/gHAW3Ze8odESmnwZWpemnNRYJeslmu9ZG5PEzax4+J5ES2m
         YeRlmAPnWBHrXcJxRp9oyBgG8ZLM30gm+dKgM5wtfKmNOQ/EOZm2SXXGlTw4gnxoMLqW
         cMt8BZ2TQ1IFTu1pZBXMIWbaGJP710dhOupEPOppiZizE9XzserVSnKYNYhvPPfvo8Z4
         05F15VBq2hsRAUzwbbAx1W5MT1uCJwF2UKTY+NfpCMHyqTxggid/Bw0i4b+exaIK1sdE
         S1ADXGkoEYW2kXkdS/ZXffjZPhSno3BVt9HuWxoq8xrXd7epo8uz4syzB4aF/dOwlAHR
         0i2A==
X-Forwarded-Encrypted: i=1; AJvYcCWlJQq+1AOyqDGoZ4i0k9Zr//dnFpij3eJsGGKAcVYqW14VSX9kCaf1tQ8dUw9tBZWmBBvBEPil+3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbD9/Ci234Eob7YwIxov5jU/bhJW6Zx4rbWNiOeIJP0tGpgY6v
	CAJjA5U4owCuojxkuJdmqiuiskesGydGCtXgdzEwTZfFpkAi2nwJysxbaROkwiOULWF9zW1PjDq
	K1DLjTee03k2v4FfaB58utA1xDhz6LYFgTsHD
X-Gm-Gg: ASbGncsyP3vQiJHG1VzKd0r8YGglvsiSqcTVztMxfdyeJiKSOffcw+yJm91De0Ix+Cx
	11XzAuEQqEjxTYu7mn/q1XLy9xlFonGesaRJ+pklgGveWjD8l/qe6KVJ6nY3sVZW4FjmPozZAJd
	Ep+Ukw76d4VUfsRxLLnDo58oAeosAkOoj5
X-Google-Smtp-Source: AGHT+IFlK7R096/+OAh92R+N0wIujqmp0uU3OFtKyNa2K1gFmEshtOax20fuvbKOa8HxCYGz77KZC4LpcqUinUZDXA8=
X-Received: by 2002:a05:6512:1090:b0:549:912a:d051 with SMTP id
 2adb3069b0e04-54d64798c06mr830233e87.0.1744819248030; Wed, 16 Apr 2025
 09:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415071017.3261009-1-dualli@chromium.org> <20250415071017.3261009-2-dualli@chromium.org>
 <69763528-bb00-44c5-a3ce-8c30530b29ee@schaufler-ca.com>
In-Reply-To: <69763528-bb00-44c5-a3ce-8c30530b29ee@schaufler-ca.com>
From: Li Li <dualli@chromium.org>
Date: Wed, 16 Apr 2025 09:00:36 -0700
X-Gm-Features: ATxdqUEvTcc4Mrcasz-DJMu04qcEN1mqV4hfHibSLmGFJSE6dIDY98ewYmt9cyM
Message-ID: <CANBPYPgfW+3jeTPZmpHfkgr=hX8sRkMLgrEeLFYa6rOPftXeFg@mail.gmail.com>
Subject: Re: [PATCH v17 1/3] lsm, selinux: Add setup_report permission to binder
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	donald.hunter@gmail.com, gregkh@linuxfoundation.org, arve@android.com, 
	tkjos@android.com, maco@android.com, joel@joelfernandes.org, 
	brauner@kernel.org, cmllamas@google.com, surenb@google.com, 
	omosnace@redhat.com, shuah@kernel.org, arnd@arndb.de, masahiroy@kernel.org, 
	bagasdotme@gmail.com, horms@kernel.org, tweek@google.com, paul@paul-moore.com, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	netdev@vger.kernel.org, selinux@vger.kernel.org, hridya@google.com, 
	smoreland@google.com, ynaffit@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Casey! I'll resend this specific patch to linux-security-module l=
ist.

Should I include the other 2 binder patches as well as they are using
this new permission?

On Tue, Apr 15, 2025 at 9:13=E2=80=AFAM Casey Schaufler <casey@schaufler-ca=
.com> wrote:
>
> On 4/15/2025 12:10 AM, Li Li wrote:
> > From: Thi=C3=A9baud Weksteen <tweek@google.com>
> >
> > Introduce a new permission "setup_report" to the "binder" class.
> > This persmission controls the ability to set up the binder generic
> > netlink driver to report certain binder transactions.
> >
> > Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
> > Signed-off-by: Li Li <dualli@google.com>
> > ---
> >  include/linux/lsm_hook_defs.h       |  1 +
> >  include/linux/security.h            |  6 ++++++
> >  security/security.c                 | 13 +++++++++++++
>
> This patch needs to be sent to the linux-security-module list.
>
