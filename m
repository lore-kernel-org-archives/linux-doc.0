Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CF419E960
	for <linux-doc@vger.kernel.org>; Mon,  2 Sep 2024 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725282106; cv=none; b=NI2Z8Dbsnljkxf89Ej1xolyMlvjX0n1yVyu/oGn7B5aNnJpY5N5YRtIx+cCKPY8sGxft6sxrxXSlyZn5c+oicsf7W5HSAWvM7jqA426R+CeFZd4K3islSnLs+49o5dztyLMD0Y3d0Ms+9+srQJORU0mAAO+WRbOWZpm8Rz81Sdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725282106; c=relaxed/simple;
	bh=OqcJZ/1GMKCCiNdCksBYuf+yCIrGEq2SbmEzRSEKkyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=poanBC5/KrbApzD/hfzM1hHKc7Ufb0E/plmgaNRFNREDeRqv1E+fvJVrNt1YU/kuJRhzDG9euAiSkSw23XsJs+ILur0nq1P+TQZCMM1xMkqqmFY6hXOv1OrrOIJgx+wIs4mFlnyENhBL15ua+MEWjTaS8y5ya9WXXCBPUP+mZy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZvwItzQk; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZvwItzQk"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a86b46c4831so468261466b.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Sep 2024 06:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725282103; x=1725886903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqcJZ/1GMKCCiNdCksBYuf+yCIrGEq2SbmEzRSEKkyk=;
        b=ZvwItzQkAwNedFcs630M+hLkw/tmm/lisIdJNLZDIo4ioaq6NGjbE8qAGHx8oRdjRX
         hOHRN4BDvrfUNdMneVeSCgsjtIqTm1xdMwLzHSWqOxE0LWjKjH5/XSdpRAyxVa6g71Th
         Ho2s40tUMpQrRrWR2fah77keuK+G9oYT0cEtYQ1FbkZhywbzz9zDEpUUaVuagODf1dkE
         rkuZaeS2E7ApquwVR9D0OHk75WvdZzargYA/1MMIMMLjforRf5KMDjAbjrtfnHqJjqIg
         2CphjEHDsm2ml08w8Oeb5AYrdp5Gea7gJOZXsuyqkRFQPvLU2KKbGAQek7iRI2pbfz+/
         iPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725282103; x=1725886903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqcJZ/1GMKCCiNdCksBYuf+yCIrGEq2SbmEzRSEKkyk=;
        b=Q5lp846Lpa/xNYf1Vo6vsWQ4flKqxe4ePiso7WxDBPbVJUbjE9/s2asXFkQwa4ZdHS
         OldSCgvvniXAd6HIPy2YXAZdRIrtR9ap77rdc9sekG4eSRS6MAAs88sr2s0M2P6u3x1I
         lfa8FMxbMzIS33IZnWX5lnStI28477itFr9CsCapYhdEMltHNQGnqtZGhZJopYIpRRSC
         WdJkyLOOefmZaSgOcfe/gOhJXbXilhPCAOtqZcpOKq9M/yVMYEKPNkYdyTnB98fF1g9e
         eFIJJ6ZxMOBVinAfxlIs48KfUnFSILTTQjt7/uts4VinIAJZ735haQYQY8uC4da+BMJD
         YGHw==
X-Forwarded-Encrypted: i=1; AJvYcCUKp+qH+UzBlJ8OL4UpFFYMrRcJR03Y+7i0sBkKSGGrMCWBlht54PZZ6Ek96nFnc9mVxOykf7wBnvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmW6Fzo7/2v95lpDxKGbv9ST0KWwXbD4kPmrILklnnGCvD7YVl
	5mDXaC2yHUSm/nqypsWWhYbE+7WaO0jhvPJ5ObAlVpRGtjT59NkYsHVJjg2cwMPsfpX3TE9HRIq
	5lM08/qFszUNzHkmMIsh9O0ZWsJ9edw+AQpo6
X-Google-Smtp-Source: AGHT+IEqxuDt5F9iLAPqh29duXxwhGXKRe2nes7X9QlYEzjiULot5Kc8klsLZ2ZBF8NXVRMhqG5+6UVEa6rSFv8Zqvo=
X-Received: by 2002:a17:907:701:b0:a80:7193:bd88 with SMTP id
 a640c23a62f3a-a89d879cf05mr456688866b.36.1725282101820; Mon, 02 Sep 2024
 06:01:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240831113223.9627-1-jdamato@fastly.com>
In-Reply-To: <20240831113223.9627-1-jdamato@fastly.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 2 Sep 2024 15:01:28 +0200
Message-ID: <CANn89iK+09DW95LTFwN1tA=_hV7xvA0mY4O4d-LwVbmNkO0y3w@mail.gmail.com>
Subject: Re: [PATCH net] net: napi: Make napi_defer_irqs u32
To: Joe Damato <jdamato@fastly.com>
Cc: netdev@vger.kernel.org, mkarsten@uwaterloo.ca, stable@kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Breno Leitao <leitao@debian.org>, 
	Johannes Berg <johannes.berg@intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 31, 2024 at 1:32=E2=80=AFPM Joe Damato <jdamato@fastly.com> wro=
te:
>
> In commit 6f8b12d661d0 ("net: napi: add hard irqs deferral feature")
> napi_defer_irqs was added to net_device and napi_defer_irqs_count was
> added to napi_struct, both as type int.
>
> This value never goes below zero. Change the type for both from int to
> u32, and add an overflow check to sysfs to limit the value to S32_MAX.
>
> Before this patch:
>
> $ sudo bash -c 'echo 2147483649 > /sys/class/net/eth4/napi_defer_hard_irq=
s'
> $ cat /sys/class/net/eth4/napi_defer_hard_irqs
> -2147483647
>
> After this patch:
>
> $ sudo bash -c 'echo 2147483649 > /sys/class/net/eth4/napi_defer_hard_irq=
s'
> bash: line 0: echo: write error: Numerical result out of range
>
> Fixes: 6f8b12d661d0 ("net: napi: add hard irqs deferral feature")
> Cc: stable@kernel.org
> Cc: Eric Dumazet <edumazet@google.com>
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Joe Damato <jdamato@fastly.com>
> ---

I do not think this deserves a change to stable trees.

Signed or unsigned, what is the issue ?

Do you really need one extra bit ?

/sys/class/net/XXXXX/tx_queue_len has a similar behavior.
