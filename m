Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BF9248F72
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 04:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778041489; cv=pass; b=QFT+lAO9nfsJeGo+Bo36QxNpVuca/IYIuiVrnnBBScTk2C9JQx7H3ltqlFpbU/drchgcBveykr6s86VkJi4xx3QoC2ofzchM4U+zKx8j3nHhjvEV0iooAYWbfl/X7J2WUUq1DIJ2I/cNnscb2mQ5sUcHHHm119i7owJk0cMAPww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778041489; c=relaxed/simple;
	bh=g5owKb1Ma8FV3PMZ/IPm/mfmcAADknef5x+8hJdV8Mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYE0aF/0dMsL4j2fI82YvNW27IaD+PDui/0ixMK9wiTNBIWP4BywZp7MEluDXGLnQUeuxkhH3NVQwbQhXD/E+3V4Ajg5BtgNsnX52SP6c7oZqMTH7NHhvVu7GiHq/37bCizdAoWJBmmtFfVHrk0kv3UydaGvRGePeWUWe610Ww4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qyQ00oYl; arc=pass smtp.client-ip=209.85.219.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qyQ00oYl"
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-8acb856a674so7525726d6.0
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 21:24:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778041487; cv=none;
        d=google.com; s=arc-20240605;
        b=WJjbZJAvemhXtPCZfENMTm7FY6iCNDfKylCbgG1WC7tAOzBls6Dsz2s9FnyDkrv6uf
         aAdt35XcMiKTWtRqBla675CMN2rQFe5dNrfTlfuQLTOPWEGI8z8qQ249cxezrKWzK0Wq
         mAeE0yAzOyPTLlLPRdOfsyIXHVprEj0Ud9wzelw++D2wtL2p2r4UvPdrA94t2R44dZa3
         f5nXQGpy01mlD/RA4KBfHptT7bGsLHCfnJ5o9XLqAbDMvdIkI+E1VKOz07wk628w0ski
         4jYF+FwyWijQ00PsNA1kAHGW8manx40ot4s/ehgvTmcBkXYf41cNN/4w4y2NKNHAmU86
         qyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g5owKb1Ma8FV3PMZ/IPm/mfmcAADknef5x+8hJdV8Mc=;
        fh=/ZATJmnoCCYESfcu9nG3ici8Ip0Nb+aoWXjaVgdbcsk=;
        b=Z8k0m2uF4pDt6EUOhzCYcH0CmwOORoLsikgYjpct5vyzMFf/wwv9dbxlyvSig9yZcT
         6b6e1e3QQP4MH0UduY/EkkGjaYHYxVIHRLVHdv11XDt4B5Q12BN8Uosv74BD5P2mH/dj
         ubEACT1gYtu0DM2oLcI0PQ6NziOJgXDxYEGQ5cd/sgfk6JCfhBLkaciJr4zhnuH1c0QH
         5bUoF0JoZ6WwR74Tq4XPKSJLklpgDVvMBkPgIpvvc5c8DeR3RNXtJ7Tp9ej9RiETBFLN
         hAXtajmni1Sqt0F9ppDSBGEjFOHsuTA+sJx866u/FeVc8/KrKcQY3myRFEXy7+1DjCPl
         ZhNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778041487; x=1778646287; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5owKb1Ma8FV3PMZ/IPm/mfmcAADknef5x+8hJdV8Mc=;
        b=qyQ00oYlF/tarZ0VnjUDC6kGsR+bAMWntUNHjFFMxyCnYRCkdysG1TSJRG5NzATLbD
         Ttg6P4ETQc+k82EMsEPrSqUe5voMYYoISHQTAruYjD0dzb1uetNmVOqiBgsbzXRbDBKI
         25nfX/FjgSp3QpEJqMpx9O9tat0onErIOt8V7OP/z9n+j7/CRj2H+Jxac6T641LSbw6T
         oE3aGVRvQdqqk0TedHJo5aC+drqfX0BtL62PAOh7X6hx70XFEJHOJOxbOVn14EgwkVig
         axIct34kf1H6dKgdCJ7RnYKO4aUUNpejFP87vryu+p7adCUcd41Ix3dOLKAVwS9tODU+
         GkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778041487; x=1778646287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g5owKb1Ma8FV3PMZ/IPm/mfmcAADknef5x+8hJdV8Mc=;
        b=NN1qcm8meljUZxO4SXC8bfFfFoHZmM4G0a0z9ty1gG8EMoR2aUGMZBHnqUyWtmOpdT
         CCkObxWHoWqBaf5Dx9Jy1SwdABNWMqgj6BIN39ww+R+3Gq2e2qG/X+gGxB5wPeXtJ7xN
         r38CbvmFdKDbF2WUppiAO/uety9H+i3w7Edl3kHFpRQQ9GVZbgo3cycmk6HPRZADJf7q
         9q4XC7iCTIzNi01H/ZJGYCgERLZDDARNXjE3TQ/jc0iZOyu9be0DhNUAKACEcJFiczoO
         cUYRXA8ejdJrjgTDiFGvzsPhFK77A30iam24tfiMSZYqMqGng1oOuqYtthIa0SQ85fUR
         w9pA==
X-Forwarded-Encrypted: i=1; AFNElJ+zNCIWOHXIRa8pvXTKcISqJCrKu0/DjezV59K8RvaX9E916uyG6GTbWOLo8xD7dhAe5V/GxXqW7gg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoh5UWpDMGK9RSGwRJosCuMKqYakek/2HuItYPKAv68+iaHEsK
	92Ra5o0b9DL9DGSCjPb36hWKCHwz5jUyvYN7ZAtl+CHp/zlnlqQTz21tjD0/u1wmYdbA5Hfhk7h
	FhYg/JT8r+HO5RkCTVOjlxrr2GteBFScPFhw7
X-Gm-Gg: AeBDieshB6mgw34XLsXaLAyp1/xTMQWlbQ5HEvcnYctsk+o6c4PZ77msCvCbIGqjW/4
	8w6Lul3nIA7Pw1+TwNpAo8dGw1YMiXyoHd6au3ab8SWXtjW6sl/BlaIQC92IeA/TbKNDDybYQNM
	lrPzmcW9Jqpl2vVLzfiPD6h3WDRZB65j0gwNq5PB8zwiuGX2yx+uNiDdnMe9kb29vujmTZGFQBr
	W2R+SsI0kCol3CevwHhTl0mHXKOLI6ND5E63tzgUKqg0RvUNggDFunt24UrpcmXsxCsPz+NZYyk
	r1i0TSzQRuNqrPeZxRsVSMRYz64l7CZ6dA/Jm73O6MF2PN0cmba9JZOfmC9EwIJiFBd377yXgFH
	DT5o=
X-Received: by 2002:a05:6214:3291:b0:8ba:d36a:8b0c with SMTP id
 6a1803df08f44-8bc308e090cmr24572786d6.12.1778041486857; Tue, 05 May 2026
 21:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428014806.35400-1-enelsonmoore@gmail.com>
In-Reply-To: <20260428014806.35400-1-enelsonmoore@gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Tue, 5 May 2026 21:24:34 -0700
X-Gm-Features: AVHnY4K0xmgCGjRo3w976y_MhSGXuEJ16XPO6VJddjjCwxbz95nkP8oBBPUwhss
Message-ID: <CADkSEUij01xaqNeFxHX3PRsFCWK7-m2eGH2Knt2T349QOzrQDA@mail.gmail.com>
Subject: Re: [PATCH] watchdog: remove driver for integrated WDT of ZFx86
 486-based SoC
To: Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, linux-doc@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 6:48=E2=80=AFPM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:
> The machzwd driver supports the integrated watchdog of the ZF Micro
> ZFx86 SoC, which contains a 486-compatible core [1]. Since 486
> support was removed in commit 8b793a92d862 ("x86/cpu: Remove
> M486/M486SX/ELAN support"), the driver is no longer useful, Remove it.

Hi, Guenter,

Would you be willing to merge this patch? Unlike the other drivers
whose removal I proposed, this one can't be used at all now that 486
support is gone from the kernel - no other hardware contains this WDT.

Ethan
