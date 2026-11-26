Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795661295;
	b=hd9mg/I7pykqUzlPbIgFSoyiIdmSSPOB63H6t0v41KjIkA/Qudk8jM+tyw2CCBvKFiyN
	 ZHbQX0vD+PsirYmLM+OJXtGiwlRLzrf/MVvfq79gyAhFvBZtTZsp6+1ZiKYDEfSU42cn2
	 IR0zSOmLOK5v3EQMC1F395uIhX63mdbNGwd0CMNfUVN4ukb4LmEkOGfg5aRkm+1R9K8/U
	 JeQ+PKxZ7TYT4V9KX0/mLi1BGmjp0ueXhXnhEILVPfhY6lfwSGhlwAqOuD1O1nULSXKDv
	 ExnZla3v7MHqbzPg85imIqYNfMROvX3FrTQnEXSXPG/EXW/SmtHEVxhX0S4pzgXuRpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sSFnpqUuUbjElix+JO0v+jouPkVBxE7R6M/+d3k0EDM=;
	b=Rp8+PJvDv/Ked4SkyM0bf5lghSOL3StSBFutaJ908+B/t4GUxp6mVJ+XHpODPIFfksFw
	 yjEsvoK8MLlpvF5Bbguefiy72gONHrpbJPvbsordEk6w3IQm3Y2/DISLeCzO5Uv/Dz9E8
	 S8BsXvCSMWEW2Uj47D+2h2hAaHlDMSXhiTp4LvKhq41U4BZriH+m8iGzMnLxgQEEmGuCt
	 paoMFcBm5ZBlflTCeCkGq24kYa6YXQXZD4JkGWUVK86QKYR1TPP7jTq3s4SC2swHzaOXx
	 o9Cm2FGQ+3ptcte7QNG7Mq9QIPC+BPlGXBmyefrkMXBEsRwlNefVM5QdctZiizY1KSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RZStdTq0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02282606A326
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 02:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02282606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RZStdTq0
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so4088081e87.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 18:48:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795661293; cv=none;
        d=google.com; s=arc-20260327;
        b=ABXrqI4U+loWrMpoHA2HomChJ21nSb1XCTEfqErcmpdXX5NBB0Vxvyc8xG/iJzzKy7
         uAy/wA0TpNmnG26UMlMT0HZIZZb9tdF8lpsxF/uJdIYA67Oljfnh3eVQL4uW6dCCDlFD
         PAHHVSdVo/QUxsUGvBJg8IzkkmoQH1fLF2J2YywH3k7BZLsgSc0XqSkWYtwL5cvRVobM
         rpMIagkHrYezfeLKPsG2T4RsBR1CLXVa9eja5Dq3MxWr32JLjcrN3K+7AeFW06wE1f8j
         KxwgM85jFNxhKP8Mq//MBbO60UjZp5faibphTwymr3xuBoKQSvpJyBsk/UlvQgrGkUQn
         2voA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sSFnpqUuUbjElix+JO0v+jouPkVBxE7R6M/+d3k0EDM=;
        fh=eXiRMeKC9TPeZT2vps4mnCHSFtiknJ77TIiPSSwztX0=;
        b=hZrAU76yN0JsvUDQaJ/S2WiPpL3w/nuJfhBrJJmB0XSBjhyBT1Ul0cvGz6CVpSNhx/
         lIA2vO23dnFHKrU6pY+bEBGmPiuR1cXtvxoEbGQXPxr9gE5f53EXNEKYhrF15Ron183r
         7cd2rS39xQWrxGKas1VxnxFpiRkbdMA/0cDxkHevWcYAD1cwjDLN/VnFes8V+uBH4TlP
         mVPW4vfbj9wMzx9pB2JHWwMh/U9Wj8fEeRsVmlzPfR7ClWx60/6nhlmpWIJPnd00J5yf
         3krFNqB0eHthjjYk+hmT+yH9NDHueOgTSUSsBLUwxDBcoscOsV52g4utFGVXplPxsgmD
         GzYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795661293; x=1796266093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sSFnpqUuUbjElix+JO0v+jouPkVBxE7R6M/+d3k0EDM=;
        b=RZStdTq0/KWhsgaLcWelVgO0rfVN/AIjokPuIYlr09nEwdBHkcFLaFMsdzW7BkHetL
         TrDKVN/cTWJzYk71S7A4+NNtvQoP3fTbfFmvM43PDObmq4e8Xxy6WIJoZkDTK9IIUsIf
         w9JLTG4dof3j4mgJPFctiDJ9T5scHcr4koVZskvs/v6f09ECohStwaZv5MEUwEfP5mnI
         /g3RIu/7a5HYSdLBr9PIQGqSigyBJzfghlOrA1HmzbfehPa0QtlpFJqYU2GgRzZVInO7
         xWFhVUeHQIvyS65EnUyqjeGxAoPMutTqJB8oRMUqZUKtwIB2fYuQluYoAPZrjP7DCQHn
         fVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661293; x=1796266093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSFnpqUuUbjElix+JO0v+jouPkVBxE7R6M/+d3k0EDM=;
        b=B7GcPhzmnRaSzq++w/kKFKTmaBB7K37ub/h1jskoYGbJdk5Je1fz6jbWFoLBFbat6e
         Sge+M7CVbKJmMauX6OZpK8wrBYmvTf7w9JbyTZbU+ejJ967YEWxJkGLLQRjCJ6TJXBsh
         bDtq6QLedr6KTYCJriFGWL01CEneyeTVGp0N8AM14OJ8c18I6aWzTy0NV4HrO7xBYASf
         /cGiHcOZWEi1fPbv/8gnvixKFObRq2No1eY9t+z30FQbeOdugJ/rlvc4oLfHx1/1w62/
         eJ+AxA3N34B1Wo/WHNpEJ+zJRVU4l0SIF3oAJ9f5zAafDJh84lDKE9c/TyiHpz0WQonA
         gjXg==
X-Forwarded-Encrypted: i=1; AL+hErF13QVEQ8c9ROxrRFgJYV50+vOvTLcSuujMn6bgATGbY4y+3H3NeR6+Ri7NgYINz0KSI8uD1vL+XbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BUAsTE02xsSE96cTCB200elxXTdnU6hDgStGU6QY3oDGIvfkf
	b6uI5IFmo/AlPLYvgN5fPalx1xkCHb/Yh9KVLv8RCsbbd5L6ttv28fFXtlNA+z9nuY/o7owVVVl
	bkhT+BJzvP/3tKpBFoUhmvY8PSvwIO71MlKUUsjhm
X-Gm-Gg: AZFdTZfy/yg9XfGeoOh9w5lmIE+uMvs0jpH2ccbaHf44go4uF2+jEdUtfP9EHVLS3ln
	zk8XPueEhgQ7aGGBZzP7MNpXMCfmv7VspPYFk4Sl+lsCyfHxyTZ8XYl6RAmoEEFzm3j5YszalIK
	mxX9Yk8OzVElzQpqfs3vg2wuv2MBg8wClsmy+m62AVnnVP+NJycCm7c1zLHEuOruC/WBkhU8stz
	24VpLRLYX8cmetBloYhb7eV53vvwFg/ahe9QW5beVvVpSwR90LgAN6xsQohLAaY0z6CeM3vZqMh
	i56rHa+B3awpxP+kLTQtpDfxFu2rWgxu4sGz0k79xKipNbwvAzi2bObcBXP3FFIqKuKpaS1GOrq
	JhRaKVGTnLHn9pBR9cd2u4oWMyfCE4PC32sJG7JuHLZJ3lE+DywrVi3vv5b6PedBmhFk=
X-Received: by 2002:a05:6512:3d14:b0:5bf:d54c:c189 with SMTP id
 2adb3069b0e04-5c1bc660a0dmr6174968e87.5.1795661292818; Wed, 25 Nov 2026
 18:48:12 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110020632.4003499-1-svv@google.com> <20261110020632.4003499-4-svv@google.com>
 <CANRwn3S63O+WRTGhpcNR__ybSuYUb2uEJavUY3b9Uaa_vEhWXQ@mail.gmail.com> <CANRwn3QjnmnhJP2y7tihZWrvgkdT9PG+qGaNbEW=x=mgUP4OHg@mail.gmail.com>
In-Reply-To: <CANRwn3QjnmnhJP2y7tihZWrvgkdT9PG+qGaNbEW=x=mgUP4OHg@mail.gmail.com>
From: Siarhei Vishniakou <svv@google.com>
Date: Wed, 25 Nov 2026 18:47:56 -0800
X-Gm-Features: Aa3M54rOxoiOvBSclEq7_xDi6e9FQMltiQKQ215JTx5OlREUy9W3b-zaJJ0tzEE
Message-ID: <CAKF84v0trQ5gpW9ceGmjGF-_Sh7vgitoeoqxRNZ-+xScnYU4MQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] HID: wacom: report ABS_TWIST alongside ABS_Z for pen twist
To: Jason Gerecke <killertofu@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 24 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 11:3=
9, Jason Gerecke <killertofu@gmail.com>:
>
> On Fri, Nov 13, 2026 at 3:29=E2=80=AFPM Jason Gerecke <killertofu@gmail.c=
om> wrote:
> >
> > On Mon, Nov 9, 2026 at 6:21=E2=80=AFPM Siarhei Vishniakou <svv@google.c=
om> wrote:
> > >
> > > Historically, Wacom tablets reported stylus barrel rotation (twist)
> > > via ABS_Z because a dedicated evdev axis did not exist. Now that we
> > > have this axis, report pen twist on ABS_TWIST in addition to ABS_Z.
> > >
> > > Keep reporting ABS_Z to maintain backward compatibility for existing
> > > applications that support Wacom devices.
> > >
> > > Signed-off-by: Siarhei Vishniakou <svv@google.com>
> > > ---
>
> Still waiting for the requested inline comments, but in the meantime
> I've been able to test and verify that the code works as expected:

Thanks Jason for the feedback and for testing this!
I just uploaded a v2 where I had to rework the rotation logic - this
way, reporting "0" would mean that the device is aligned with "North"
direction.

Could you please re-review the patch? Some of the code had to change
significantly.
