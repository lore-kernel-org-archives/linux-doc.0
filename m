Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1BA3C1403
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 12:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179860; cv=pass; b=R15tCxnsu+ezRapcn2nA6xWhLdBIborr4tD8Zi265VMK6zmDp/c8NDfdvkpMoc6qfnHdqzITaQeszyvKqPxZ6AOUelaovTotbXiBMrIG1HxZk8pqhT4WXWev4uDJFdQTeTCK7a8/Us4zdcOyO+3R6wXQ4b5+6MM4t4PFm1RbvNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179860; c=relaxed/simple;
	bh=4TkzY0PNIukGzQU/HvHTJpI4EhpchSo6Xivc/3Xy1nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P012bJzIW5aSIykzGkiEiwvG6t69hskBbnqRz8bYwboTNpo3It7Ji+7hUSYIT3FMgjx2hU5cskWv0qqIckkyE76pvwGnRv5Bdu2JMs039AgqSRWlbwyUUXTbFVar+Viy8Iy1MvRqZlNfnbBqTQT5TVQ/M0ezc/IGJKOn3SlsifU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fALxXGwq; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fALxXGwq"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-52fa6005224so25494161cf.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 05:37:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788179858; cv=none;
        d=google.com; s=arc-20260327;
        b=SUrsy20d8/avb47sqQ3b39y2tuk89eGWuzrBm5eGLU3mNumBh+rN3wND5m8b7CufM2
         zgiAp4hAD6KFCYwIOWen8kp4JwZPkhEwMspEnEIf1FJrUFbyVpCl/iC/81GWrfKZUnNc
         ZIYE1z8WMDipOba5/YtixDHqgqmLESWBTGVOFPmB61230R4yb0K2ydE1BeAEUz9HYByY
         ZebQUZBJ3Ee8G377dfbRFc6LK2AYQiJEaY9LcGBLiowKLqmvyYfFPuimnfWh7vxj406n
         XzVzuHMHAS1XOwomlRDn51nscb9FrvywWT2zUq/RFFee0LFYtylAC1FWn92GqDhEXe+x
         ws+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vTAJybLgasuL9SWtgUU3Pc8kAU+RKh+ET+sJRnphEoc=;
        fh=yfTjzC3pA4kDng+Wn8fwi7f7/DxdaEvIBYVIkQgqY3s=;
        b=dfwuVLtdaEHgR8OlRNzVQKdIhqYsg+hJEB6C6/VwaIeISWsFRLs61AzTnxuv5Gk7Jh
         7kqLW3JIIbMKSmw31XtWCH7q3PHeH17I8glkqISIFVY/Ts3vxFotQ+mVsfxhLg/YKQkE
         VgwsHjIwABB8/CSRKeKyJw/IlE1x3AfLyCBPsJN63Bfdz+b25HWuOMLJWLcoYqZixL4h
         f2RanpB77hxhhTC2UoIh552P+gxo4HdV3YT6YUSugGQs/gskkVBn+FU0UkU6gVq3aEoE
         tGZtSVnpy+QZvUfDlUU4JKP3ggy5HALyPoIYAGFa+gBbWU4AZdnHe6sYRr1GJAMlLv6C
         0p7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788179858; x=1788784658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vTAJybLgasuL9SWtgUU3Pc8kAU+RKh+ET+sJRnphEoc=;
        b=fALxXGwqXgZ41CIATWYACFvfJgfI58WbEK+n87qODl8PshriI7wWq94ady3W7ne/oH
         uCOXEz0jAlYACi5OlsEymZpu9FP5Er/8my1px8vKt3Zws1suT6+QV8oluRFLzXb2ZMco
         isvidiRgTQOi2z7YFsMNBi1akVVffoe7ZHvwvwSuuRI5GTT5v+sb+tKMnbDpIWVfL1Bd
         k4if3nhPAAidoYPO1AlfPvC1QR2q/qjwZk8BAlaI4wlN1s5V/iQboGKdSYWZDWMyNvXb
         6wZhaAOXTmxEk86d41oi7Pqgo2x0bMo+Ku4QxHzVYRLWJgfjpP4P6riHw3qV5FiAnlh3
         ymvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179858; x=1788784658;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTAJybLgasuL9SWtgUU3Pc8kAU+RKh+ET+sJRnphEoc=;
        b=dLKj8Q8eiWGYFLsynrmvYQuaL4f/RSJurxun+IacneaF1noqH7kvcmapcLxaxxGgdo
         jbU1+Cdevpjd8Rwcz5/T5mH8h8BxoMlUQ+n5pxmKK9waY38Q0xQ75d+Y62WQTogK51zL
         PdEJk4zrnpe+40nQGzkCWLX57t9BGaArnA66XYFsgSAicX03A0OtRHeBjINWQAzbHDal
         VvX/MaxNwYqOiTRzi4jqowgt8OWtShJZMFAGBRYj8a0R5bhGTKE0hM+AFLJWyqTRBA8+
         E4rcUpPz+5kvs0YEyccIh9OVNCZKB6yvrCBp5SKzGVBxtZQMB4BqnuLsJq5DVHxTipgH
         /OAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFn28WpKupja0M7+GB3Vh9nrb/9+CvNmFKUZhjlXGhsHIEwh5G8+aE7wigwK1OJbcMfDu31KJf+bE=@vger.kernel.org
X-Gm-Message-State: AFuF++nIJfEj0ScyJFAnZBZd1XARF1r9wEPlm4fRDOB+ADmlTb9oqXpO
	J/KxUML1dEKuZwnWT9NR9/gGic4duXRuCgezky/fI855/cu6hdjbOysyS18QYRCyV6QfaTwg2Oy
	+/o5M+6oPFWcwDVFgmWDRR9BsDn28xWCCevQFrdA=
X-Gm-Gg: AR+sD13K25t3vib0tG1gFrjoccQMUN1pXWpwRPUm/UR+A4C7UBcUZ1zIGFWSXtDLU6Y
	dv004Nz9hBvu/RhYOfa6W5VF5nMrpCLTSyRfmRRYUGvUSGmRhbWh0Jj1c6e+8EaK5FEI1U4wW3o
	Gn54vZ7yZ6ASbCwhjEDArX4Ae2/JH4vZse8+g6OyViPkngd/fY6UPRrkOEkaQrBBWxK6Z/MX2yK
	Q6Z03JKVNh1jKu8TxTHzrgP1JUL3tcETNWNxdp1Md9PoqAtKkBJoxnShhXV1hDBnMBIuClaNsWA
	CKSr9nGeWXx6SuLAxH4B7V5hHjAl3SNZNqY/B15or6dSSzW2nHHHIask/e6ETWL8wnfWfOEMR8E
	RLs6Uz3CYIHq4w7oRc+xxbfFsVtdwK/CDF/39+vP555DHFRl4vYIZGeeg1Q==
X-Received: by 2002:ac8:5746:0:b0:52f:ae65:8996 with SMTP id
 d75a77b69052e-52fb9429e44mr282624691cf.13.1788179857700; Mon, 31 Aug 2026
 05:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830205912.478358-1-lucasadramalho@gmail.com>
In-Reply-To: <20260830205912.478358-1-lucasadramalho@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 31 Aug 2026 09:37:26 -0300
X-Gm-Features: AcwNN1U-qSLrMr-Ev-gB9jr0rby74fRwVIe5XEvQygjeB9LJ1rqblXpk4mafRWQ
Message-ID: <CAMAsx6d458V3ByxwgP54mPvC6VZO2O8kBFjUiq-55r3UnhpKWQ@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate volatile-considered-harmful.rst
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 30 de ago. de 2026 =C3=A0s 18:00, Lucas Adryell Ramalho
<lucasadramalho@gmail.com> escreveu:
>
> Translate volatile-considered-harmful.rst into Brazilian Portuguese and
> add it to the pt_BR process documentation index.
>
> Assisted-by: ChatGPT:GPT-5.5
> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
> ---
>  .../translations/pt_BR/process/index.rst      |   1 +
>  .../process/volatile-considered-harmful.rst   | 130 ++++++++++++++++++
>  2 files changed, 131 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/volatile-con=
sidered-harmful.rst
>

Hi Lucas,

    I have reviewed the entire translation and it looks perfect. The techni=
cal
  terminology was very well adapted to Portuguese and the original meaning =
is
  fully preserved.

    I also ran checkpatch.pl and make htmldocs, and everything compiled smo=
othly
  without any errors. Excellent work!

    Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
