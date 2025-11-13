Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3D9252906
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 10:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763028147; cv=none; b=YYNBzgPbkhCTn4ANl50tj9B0CiXkV5+KfIAO3W+3NolMcE6Hrql/PgpNvCEiBN8iO5tb7/r6131oZjRP0XAZZHN2oGYfVmeNBEOfHHs0OHmWln43pl0ldVGRZtNxnjAyw8DHgT0UfzUsDni858iknSI1Ze8Cfzp4P97Gako9ryk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763028147; c=relaxed/simple;
	bh=347InnF7w0TQGwF3LKDpkxoBP63o1pAQwc45OEGOOng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RL1X+oTS+d7FlPjD0aBj/AKiD7z/nRZcx6rSxuOsnlxKIjhSoZPDJtjnM31mJaaqSAnpPS3ovXDhimQpph259MOJQVE4S/FU/mpBe0CF6w+W8eXgPiwGmNHvXdJVSslCc6j6MROzBojWdmP7YqrbxP05U6XNUz7kt2UNMnNK3t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FFz+VPhT; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FFz+VPhT"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-378cffe5e1aso4688051fa.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 02:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763028144; x=1763632944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=347InnF7w0TQGwF3LKDpkxoBP63o1pAQwc45OEGOOng=;
        b=FFz+VPhTnQolSJSmG4FCu3Xt4fES5kBKLCd+GhIneSTYDKRGfPN8zyn3eUMQLuodD/
         H2z3dbJ9PxXXRjIXTypnTv7fD5q3Rd/ke6LsB+xiLQUaKflb+Wnx1eYs1wITzu/OVP9b
         aiQMqhgD8S012hXS5cNwQrhvYHpCByonyFcXG3j7AOXGG6rN+GampPrA0sRvyyGO/3vz
         zjd8sdAl75JUdv+8J4VnsuXD3OZ/I0yGFVt/xMOhgUO+SwPyJp5Y8RUtnSDToJOGyxYb
         XKLGpelNvpUjvGQhJA54sg7e1sOfozlMiFDTN9BV6FpwmJcpSPfww6fSimPKkmYoJLsd
         p9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763028144; x=1763632944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=347InnF7w0TQGwF3LKDpkxoBP63o1pAQwc45OEGOOng=;
        b=KvVEytq9UQiut19pdstNj/7Kn+PdmVyOhUvB8x64FUHNT4+AEk1kNd77m+HRyrvr30
         aMOf0n1trqk/tHKJ/3ia+89vRg879XCkGwFeKb+p+Mtgm+pMFoc1UWBwh2CbXjDH34wY
         2fbQM6AOoYvmKDSt1laMIsoAapqGsQmVjBOz8zHexNKPhNvDHo3giJNDUxm3d4TIemIC
         Y1fD3J7YzRNJrmwSP1bdFJtD/q57b7ojzeZBrHXAKfzUcfR9xd8hnT2gAAYuHxJw8HDd
         WEI0v6xPOm4uAdCB3jHCuimlArjynrDuLHk9mMgf5aoRZ/7t9Rt+eP8ONPCcLx5yDFAH
         0piQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtsOEXW8eICtiuXKChgNI6103JtC9RZgbKqDjKml10BwgEV1Rp6ZvpdLhlWy2jAsg7St/rF/NPiOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAMQj8S+13rS4bcDji+cBognjIAKgdhuVEKlUPG1gcoe3XubSR
	8YwBxQmpbg3dec/P5MGemY/jvWMRpQwkQWg4TDFgb/dkS3WwRT3Oo0/3X9fHX8kSm+P+nvIcCOO
	X0KPLbUYIw8THjM/c6/1lTnvzgB9Xn17kAuykszRZNw==
X-Gm-Gg: ASbGncuIWySpoT/pHh8wmUtASi/k1Wo2qTKeabBc4DPLFORA43DaXRHX/fwU/zYb03R
	F6dWFQ5R1ArjC439FIZ4/1snzlcaudChSJc8gTiP03N5T/bv7gR6h2ArG96krzi19APJKxDWFHL
	L4e31Yq1zJDk//hLP6svhmr6FaFyTJn+dj514pzqQ4YiChAHPZ5/wXDsnseZCDESxCB+gffVzUY
	PAs+huNQ5e4ezLnesAndO6AQJsvwThsyXG204m/6Iq33WPNxSgzDzVb1onK+KxI/mJpDF40fj7M
	zNmho69X5blKaadGG1lvylfKxRc=
X-Google-Smtp-Source: AGHT+IF80BtPctM9eC4e7ij+kECyiSMuMR8eaI6A5q1UsvTkOe0o1G32eF/kAIX8FZ3UAPGxB2FJF3dPMAqvlpNwJF4=
X-Received: by 2002:a05:651c:4191:b0:378:e055:3150 with SMTP id
 38308e7fff4ca-37b8c2e1512mr16366071fa.5.1763028143794; Thu, 13 Nov 2025
 02:02:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org>
 <20251106-qcom-qce-cmd-descr-v8-1-ecddca23ca26@linaro.org> <xozu7tlourkzuclx7brdgzzwomulrbznmejx5d4lr6dksasctd@zngg5ptmedej>
In-Reply-To: <xozu7tlourkzuclx7brdgzzwomulrbznmejx5d4lr6dksasctd@zngg5ptmedej>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 11:02:11 +0100
X-Gm-Features: AWmQ_bk-LstuhQR3H10ukwySBYZfpE2zb40DoLXgGCclIQAg4lhk-Zsk676Qpb0
Message-ID: <CAMRc=MdC7haZ9fkCNGKoGb-8R5iB0P2UA5+Fap8Svjq-WdE-=w@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dmaengine: Add DMA_PREP_LOCK/DMA_PREP_UNLOCK flags
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 1:30=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Nov 06, 2025 at 12:33:57PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Some DMA engines may be accessed from linux and the TrustZone
> > simultaneously. In order to allow synchronization, add lock and unlock
> > flags for the command descriptor that allow the caller to request the
> > controller to be locked for the duration of the transaction in an
> > implementation-dependent way.
>
> What is the expected behaviour if Linux "locks" the engine and then TZ
> tries to use it before Linux has a chance to unlock it.
>

Are you asking about the actual behavior on Qualcomm platforms or are
you hinting that we should describe the behavior of the TZ in the docs
here? Ideally TZ would use the same synchronization mechanism and not
get in linux' way. On Qualcomm the BAM, once "locked" will not fetch
the next descriptors on pipes other than the current one until
unlocked so effectively DMA will just not complete on other pipes.
These flags here however are more general so I'm not sure if we should
describe any implementation-specific details.

We can say: "The DMA controller will be locked for the duration of the
current transaction and other users of the controller/TrustZone will
not see their transactions complete before it is unlocked"?

Bartosz
