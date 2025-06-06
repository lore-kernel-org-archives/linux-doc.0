Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8098C1BF58
	for <linux-doc@vger.kernel.org>; Fri,  6 Jun 2025 00:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749171430; cv=none; b=WMCpq80IKWH/LTBSyPTEMLBIqFKNZEn1aqO2cQZIxN1dvzigu+A4tg7Ge/ONGNy390H5VIncxsIwQbdEn2BfKMmONr482CkE7MYpWRDMVhvv689TPeUtz9V8yMs5nCInRDCTXaMgVq3F7SX1W/mnBWqJ8jQWj65Mr2x0jmmIhe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749171430; c=relaxed/simple;
	bh=m5T8g0nmQrJTZRqP7yt1FSXvLMLZxW9u+5g137cUiBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rcosd4vUZbTO0gO/pfQ5hQYnXLxgeKUBNFr3rAk85+LUE9Z5ja3J8dsakp5s1MBYd+2VPdcCmbnUloMVlm/1qHHdT1e6C4/TxFzRO2wQt0MGZHpDDtc7iAjRq7pMLFa1P56oDFtypkfFV/J6tLgFPbROlJyPY085EszNjU993Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDidl0nF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDidl0nF"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so1250009f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Jun 2025 17:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749171427; x=1749776227; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v26VGh5pLp5TJAz9vowIjncEfYsSo7jrGp7rF1knLqE=;
        b=JDidl0nFBMpuFSSKGQIVyVOMsZ6YKKK0+0o615ogSGF7VQ05Qaku7Wq290XdSNBLwU
         K5z1yQUDTJsj2TbzUulOP3dj4mEBrMNZsfPETFg1SN+G79YbKDwgMHF4SSwP51hXCfOJ
         Jw0U3ZxvGSNUnwPfYqUaHY/Mw+6MlynbMnLrexDWTspjzQDQe5n3wcf8NUg/FLfbjCHu
         0JwMj+S6pdi1z5k/AmNSHbHms59AF4Jcp+UQOHXmCoXTnePck43+zrQutkHheQvuQcs9
         QrusF8bTcOri1cOTf0QwmlZZ+ly5jBEJ+tKFmfG03NyY6TeA2OMjfLhSAEfLzouoNuNN
         oTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749171427; x=1749776227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v26VGh5pLp5TJAz9vowIjncEfYsSo7jrGp7rF1knLqE=;
        b=LQq2N/tCLRodIE1AvsainbrT7dYjpmOJn1sTBINIpNv0BMi3qDVOt01YbN0OSVC2uz
         apmqplfLOh7IQQAUyNuEHWniBdyZ42D4w4IxF3MNKd5UInxIRVh9kWTr7nwjoAMFI+mL
         93iFLSCP1Bl1Mkq0oYFvpxdDR0jyxZo2K4oulotUgtUMnYDQ3Gvfwu3bzBvZ0QhtSGNl
         UJ2Ja2jldBGexh1na/vRVTSOGPL4eRSQp75H76hSNFvRjnuJw5pyW2maQPyrt/o0B8EZ
         UbDhdMQDhjmEh1Ewf9aMjZVBpOUcVSSJ0MR3gqu0x13nRWiQxKkXhkXrcM7dmyKOFkcM
         Sq3A==
X-Forwarded-Encrypted: i=1; AJvYcCUFF6aNjtShmkGNPm9bDAzQJvOPV4tre0IZ/Yir7DhWSNPceVd22ZnUsxHFOvVd5fRSmCRBgDDK6rs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZeg1kjbRYC4ew7GQ3sZksofGsf+qorVF0e9mBALXJHslZKYf7
	+vGTfRJDt/74y3FMpIqZKTW1+HpBsau86x7hxbD0g9pu0yWYVm2/dKiYfHvYLWcZfXi5f0dwbOV
	dNkedg592HOYMsbGb0PMsoJqlkJECjrPfiA==
X-Gm-Gg: ASbGncu5RAUfroF7Vsspiy8+4zS+B6hNGU3fvzppnzTg9NkNxVLBf97lDzgXVbk5Vj0
	iO0/zevFCjYy4jBBJa7IJm0kC5cm+0O/WLbdINOOLRQAxpWDBNkSDtbsAXVlsLIfVqvI3yuNbFl
	63ev0BeewwkeCpbZPp/IInWp7cZANsRc1gw11rocjNrSO3wRUHWOXltqn+H6p39+O3RUlLGK9j
X-Google-Smtp-Source: AGHT+IG/MZ/jw1e5Em4XL7RZEldm2oplq1LSXlfuaqPF06rhXKshntp/OrXlsx24CP3YfvwmbC47LFcgA+vqOxq4iaE=
X-Received: by 2002:a05:6000:178f:b0:3a5:2694:d75f with SMTP id
 ffacd0b85a97d-3a531ce73bbmr1063101f8f.52.1749171426681; Thu, 05 Jun 2025
 17:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605230726.181272-1-eslam.medhat1993@gmail.com>
In-Reply-To: <20250605230726.181272-1-eslam.medhat1993@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 5 Jun 2025 17:56:55 -0700
X-Gm-Features: AX0GCFunAB1GVjEoZswRJI9g9yFAQFYXxeGM2Fz22oZ-Z77mD9Xg0PkbnWXTnr4
Message-ID: <CAADnVQKW0n8pGKUzUdNgNtjK09XKe+g=cpihdBzFawuy8ZkFPQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Fix spelling mistake.
To: Eslam Khafagy <eslam.medhat1993@gmail.com>
Cc: David Vernet <void@manifault.com>, Alexei Starovoitov <ast@kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 4:07=E2=80=AFPM Eslam Khafagy <eslam.medhat1993@gmai=
l.com> wrote:
>
> Fix typo "desination =3D> destination"
> in file
> Documentation/bpf/standardization/instruction-set.rst
>
> Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
> ---
>  Documentation/bpf/standardization/instruction-set.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Please resend with [PATCH bpf-next] subject and cc bpf@vger.

pw-bot: cr
