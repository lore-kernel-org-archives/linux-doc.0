Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CE3352C4F
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 03:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783654425; cv=pass; b=vGt2ljGFGujM5ASNwlPvSPRCubcYIsww/gtSeTNtwY0LyRosJHvWgNQJ+fjc0H2OlqG6SmaG2aSZvs5oYRaGwT/2J9avNxllzM+s0SY6tKQ4j9w8zN/O0HgxhAPGbx4tQ3+/RvNI03pCPnRBYY3827dhuopI4TuBJZrf1z2jwfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783654425; c=relaxed/simple;
	bh=7AF8MvrHg1SOY061DM3pmobhSmgDsEH6yfBsDgTLZWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hN811RpTG+v71HcpE0XuMxeFmab9WOCn7FDl7mDto73Dl4irKjsmBgkf8/j25XgGcNDq+vytANpWgwXgP8iShWGJIb6d0mAvYB3UmBxjO7QP44LdPOr6ju3aKaN0x9zA397DVJ5DIKOjgTvZ86IhKgIBk7M6vMKQ5XeQrdPePCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dW7YNB7V; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dW7YNB7V"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb5829fd5so405742e87.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 20:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783654422; cv=none;
        d=google.com; s=arc-20260327;
        b=BQDJV2AirBP/kSjEXh4Y+VSq3TDTHrTh0cp4qILgty9//60erzLCJv3UmMV7tqkEkn
         3UKP1oWyNIBVVCaXQRf5jZw7/m+udF6lMX04O25I9rTd/ghlGRKn+aSIIWpKGtE7dKX8
         q1mM0Ko8rKCrK/gR741yIOEERwSa8IYUCa5FXYTuc3t+pM4atN4HMLY9kpCTHHX/TUxy
         Hreq+av/b4HsRD0KKxuqkSlV0kcQp6lxSAanZxvIQX6QEEmVjJSaLbVEIrRx+05B0SA7
         yfC027yVmiferObHL09KmlA2NgkRzv30z4/RsqNgZijnObVb55rwEcdtdQFIkOyRMNye
         iENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vcKE/1zZV4FR8Gq7PnI9d2/vs9rDhLuQyTr8HFgxCkk=;
        fh=j52u3F2gmIMHwPDCQNTz+BqPlP/YtBiNWQaGOzUoC5E=;
        b=kr5OsQqjPPRHWFdI4/OwpojYe6hMNyTIChqyrkfI5YmRo3TplMS/bQKFn8MNKY/y5Q
         6ek0uIK22wRhE54XEunWajgamZUrziY9VWcU5g0HE6tjVVpE8m5eY3Lyg0BOhV0FTfPh
         tQM0nqdxTC7IPJmscxzyaBnr4t2jpQdSlhmADuC4BzNdJVbFod3X15pe0Yf9feAMQGWZ
         7daUe70aS9IDhJ0gBd00O1cNdaMxX2IRx3RkkhXQQkPc1jijPNCYOAgXJB7jyusuaNVY
         W6iOl3FKQbc00+cv0YwN/81EYiMnKvVgn3Lu3RR0ElIFwS4V1/XuMjKgTtk5Bj0xd/1U
         uW2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783654422; x=1784259222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vcKE/1zZV4FR8Gq7PnI9d2/vs9rDhLuQyTr8HFgxCkk=;
        b=dW7YNB7VPCeDIY+UnhxZrxyfiMb/Hb1T8x/I/imgyJ9aYS1vsM1JRU3mCBZKx/q8fJ
         BYEsHXi2LObewVmuHBMPbF62p2mO3EMxO4yHN8bG94zexEsP1fDKnrGCo6e93nzFSxYQ
         +/v5HJXPPCJ6Saxy1h1Z1U9XTD5G5rNoUYt7FsfksPzF6kUaDYaTqsG0XUCDxC/lFuNC
         EAq7ZPvfekPeoBHdFiNZJ2uc+iOCl4EVWfYdhVn/m62oJXXo0WON0Ch4ba/GIYrqVJQm
         fyXbht7b2ZyeWCACM8dt+/Gcy1ody4QwJpfK2PZvdNhbLzP1HkPzPRElck1uX5N7flBU
         /Gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783654422; x=1784259222;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcKE/1zZV4FR8Gq7PnI9d2/vs9rDhLuQyTr8HFgxCkk=;
        b=Dkx+O3jOVQaCefKEkLLvca3k36FGM2W4di3gS29GvipORSWhMB8E6ATLB/u0MD2pyg
         ppP6sxuGpK5kRcRPCJyriTCVXr7EJHYVoKxtLblMZ6qxnJRHlzMy8HgQd9hNzXjLjKix
         1p1KVWa4lnvvM/hTys89ttYISOStKhrClwgUq7WBlHaMAgorE9Rbx9uN66/CfbNOWxXR
         iZ7jGABAvJQYX+rfzzmmHda77x4MG5uri+OiYUWGwMRsr7/Le0rx2vFeOPMQ9FVCo1dt
         DZ6LW5N+av431kjXYePTYjGBaoc+64zIBkFvTPAb0XjwgopXlIbhaY0WwiGxgosAhB+a
         Virw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8UfO6Pc0XKRW8W5Wjai8kn06RHFhQh8UT3lOL2paMZlvT5TRf0kMb/pn8X2qKsYnannWs9uyNp2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYD3oegv+10V+WWf2tP4OsIkLmmSzCRktczAxBuXJpTBAwuQsE
	m2dZDCAJyCQzPDib/kXtEWu6BJgAUav8oXDtdtMspPhKLy8yTC+hJUNN3y5Hm30ppN53cWrGUZH
	kWxwfbM6De7+KSKF4ZHXKKnawU4rQrFU=
X-Gm-Gg: AfdE7ckFtlUNmLkg29JSSwwEz4A9ZTK8hG2b1T4DDhL8pKDrF0cEltqXXXB+KZPHXfa
	rQm0ZSbSR7rRfHzQWI1eoTe/VgqYcPB7Qfs2hteycGzWWF+mGRO/KSycgHdY/9f6NzQ5CpKs5jq
	4P7bzSRG2u3S+aVA9u+KY71FJ1rSbtSb9Obt61TvfdTTI5zDxn9QvXEaxStC72W6QNLFoZaxFAw
	sZLfFJyyn9YKo3LX/qeWGFw762PEJiyNmbnL20iEj94rmgsXBABP1JljcvZ4Yc3OnQmkg==
X-Received: by 2002:a05:6512:3ba9:b0:5b0:1a3a:6680 with SMTP id
 2adb3069b0e04-5b01a3a68b7mr899560e87.30.1783654422023; Thu, 09 Jul 2026
 20:33:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709021504.465792-1-vishnuocv@gmail.com> <178360436568.12613.9417666621877155453.b4-ty@b4>
In-Reply-To: <178360436568.12613.9417666621877155453.b4-ty@b4>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Fri, 10 Jul 2026 12:33:04 +0900
X-Gm-Features: AVVi8CcSE-_ebN-X9wxVOTscT2uv2ixCpRputYr5Fbze1Zb57IGn9QootVXXpXk
Message-ID: <CABxCQKtC5KnTRHdz7KwABRBJKVeRNXv8w__uYh9Qh1dDeoTOCw@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: thinkpad_acpi: Add USB-C Security (USCS) support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, derekjohn.clark@gmail.com, 
	hansg@kernel.org, platform-driver-x86@vger.kernel.org, 
	mark.pearson@lenovo.com, linux-acpi@vger.kernel.org, 
	linux-doc@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	vsankar@lenovo.com, Mark Pearson <mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 10:39=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 09 Jul 2026 11:15:04 +0900, Vishnu Sankar wrote:
>
> > Newer ThinkPad systems expose a USB-C Security (Restricted Mode) featur=
e.
> > When active, USB-C data connections are disabled while power delivery i=
s
> > preserved. This is useful for kiosk and physically-secured deployments.
> >
> > Hardware interface:
> >
> > The HKEY device exposes a read-only ACPI method USCS():
> >
> > [...]
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>
Thank you for accepting this.
Understood.
> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.
>
Got it.
> The list of commits applied:
> [1/1] platform/x86: thinkpad_acpi: Add USB-C Security (USCS) support
>       commit: 740f324f8f036607d59c05ab2b2fc22231c9641d
>
> --
>  i.
>


--=20

Regards,

      Vishnu Sankar
