Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24241F37D3
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 00:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782346775; cv=pass; b=AAJ+WG/K7z2hBf/cBhisqP3TfDQqsgL3/fpLcQ66BNF/MLHYD2Kj4s+O6OpqknBPYygx5he4tx+nN1a3hUzJ+Zv740Q5TCDbfks6onEGjOv5sLN1lmWyp7CBxW5cIleQfF89IUyiuthFoiHtkeWZJ9DKAwvFlpwgaJYSRNbz9Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782346775; c=relaxed/simple;
	bh=dsN6vnyaJBkYRNoTR8AKQC63zHcXTfT03kDeM9s3ZGs=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZeXT/NR9thnsQfN3Jnsev07vqzb+k2eFiCJydwsnuDq91Dr41CoF3GtTzPDEq6AKO2Yohk3gQXYYDzkc9CeanM6hTtMj1hSGrR/1TLabVLa6i6hvOdN2kvg/jl3om+hXknw97jylr1Tr9gsX/4Jm3BWEpqka2s4jQsOBlnohWWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l6O4rAJ7; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l6O4rAJ7"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1397e093f90so4604829c88.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 17:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782346772; cv=none;
        d=google.com; s=arc-20260327;
        b=gUWYFEkT01QwbTTeAiHKUQlC5t1wXDWdD4UPEoGHmfk9WJZmnrZmfjvuqjIap5aOGf
         GeVJXrXxlrGlV4Tm248LHvkG51dUF/lCwc56Bj0CjjRpWdC7aNNTUbiUYlHkO5GQDtdF
         tojo86OWPs/PABuwdOtw3ZnRFoeo2oM4s5PrSYQWF4xjxqb36H1YLES5RyHCQPc3YP2K
         +HCM5hfPcfUjEFP2UFY8a4Yx5bDm0haYfLFby5Ef2sPzhSvPNGf1ROiflOmNHUWM7INc
         Af/N7j6In5ofq4MT8KhpxE3t/BJuFAWrX6Sp0CLFb4IzNtvnHxNR1274lSJ9fKSWpCpd
         4R9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=dsN6vnyaJBkYRNoTR8AKQC63zHcXTfT03kDeM9s3ZGs=;
        fh=VR88BDva03PQWDuxlSPcj9E8gvlxIhd24K+pt5s3OJk=;
        b=atRuVJ/4U9Vr/ED/cEnscjd+FKs3PUM1q+bGuHBG+OyZTXqmfGIP94jelAgETFUB9X
         xfJ0jJvtW/5u0EsGQnZlYbARXMRZ2QBiCtG5ZEMJFOXBGDdD6nE1I3gXnLZLv931YAHo
         3IQBW46URew8ExGavhfw2z6TfXut5hDU57pWXuXJlFvLdWZYuJQESRFYFkDsKFzUV3k5
         a9pdsVQ8NgytxTOAroI/zJD7zGNEUR5Kb4I8zkNjGsi4iFVIRuENLqkdkrVP8ZyO5yTT
         3FQZnKEidk3Av2XeeuO6Y4kCkfby0P7kTujZb4sY0uxTkyXvpIv53wKtzX39P6Z25E15
         gYBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782346772; x=1782951572; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dsN6vnyaJBkYRNoTR8AKQC63zHcXTfT03kDeM9s3ZGs=;
        b=l6O4rAJ7BuSElLvSVCjIBLBDcAro2phzO2UoQrwN6+H320mWttnof0i0/lcdgnC9VF
         c9y5WMcG61fE+olfR6gSw8h/vck5HyRGv9OPpvaKvk4dYSiidvvra5Rw9W4ei3WZz5cG
         UDcca5AyuQDRs00QKgdFarXvgscmMWiwFpV2z3nzvCLhch/PKdQuVbStjrT36He7sJ9P
         GhEfxTfvYFKtGxEsKC5xmX7Uv8xQVPMpOur4cPG36WuKyLxOA+L0ckKRLWa8UjYesS6B
         aVZHb21d4C76/LlYbQQRhBVZFjX4vQ965Jjr84Kc0tAN2qbTazomJ5RHU9u9L8RNh6sT
         pxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782346772; x=1782951572;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsN6vnyaJBkYRNoTR8AKQC63zHcXTfT03kDeM9s3ZGs=;
        b=PpAtCVfSV7OKAvFkX5Zvoc/YxUUHa2ALyxc9d88pkvqOGtaaNMLsA7Se45QdfXKda5
         EeLw5rGOb18HTBNF7jqRmrw/OxXLQD0nuFWC6XU/ozZEg4Zk6GMhRNsC8zSEDoyJyW4e
         g/n0LhvDnkRKPYCXxPO+o8Rq9r65EySBHm8ObQ+NaaRTL7edtTkGk9mESc/D+m+LB2/Y
         o+B1FP8jGPjDG9Wd35FEU6pIXlJzeyNq+TYv5YqmCHXA31MtSipwn32cThP6rLxsJ/RJ
         w58hQkqCxeZX4te6cuhjyksyhYtoQCA77Vn651Hp//RWrbT+xkhGiHCqWVaUQrgdaqWs
         IMhg==
X-Forwarded-Encrypted: i=1; AFNElJ8qcbfCC/1ZnXRYzhfLOCo1F7wVr+JUMXn3umXYCOVs3RqrOFfjhzjWn9nkDpxYFRlXT5dKCsKxWuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzOwvspaZk0KZUsakz9SzdYmMLE2BmTpSUzmW4frq5h1dpVtXa
	nEc4xmjMoUzrv1o7JvfPd8A8XBP5vVAip2sUkjxZ1sXDwkQXI1+Eqh3GBleOwHQ+POLVJY/V6Gn
	Sn1BlFyA+csoUOHSFFWkjrg9SdhEZU7H1BislJsau
X-Gm-Gg: AfdE7cmDbPygK5VeSntT8PKZvQEEFB6+8z5eXZaA40n74saAQqntCS9xyWPSaHnao2Q
	L8SrnEmFT5BLDcAu7tnFhZlzRsX4vOP0K/gLd3JJQmU9AT/slP6++KPixuL4FPdiSHZkRvh/wMZ
	3IRUElFeWaIAcoRKUzUiT0nlxU9K/+jgve1o4rdvyVXN/XbBhaRlR/qzQG0UhpnWC3WDo+Qdv+P
	VMz8TIK9LSEGcZ0ThirL6mpIh7GiSn67WP4BLPlCnaqc8Xsjx4ML6fYaIY+43BaZqg8zMwb2qXn
	kL12YP/KLbSNZ9ysi+JMpswIfx80cyYbk2CoxjzG2nIT1JIan/JfGBGmLRM=
X-Received: by 2002:a05:7022:fd05:b0:12a:b39a:339f with SMTP id
 a92af1059eb24-139dbab1be2mr235748c88.21.1782346771178; Wed, 24 Jun 2026
 17:19:31 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:19:29 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 17:19:29 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <a6373206-60b6-454c-9aa9-9d52f9d84de3@amd.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <a6373206-60b6-454c-9aa9-9d52f9d84de3@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 17:19:29 -0700
X-Gm-Features: AVVi8CeipeAcfAxYa6j2yQPCcdB9pyHrAKYmhFznoyz3FS_QiklRPL3N5ubFoHk
Message-ID: <CAEvNRgFUru5GEM7g6Z7nuaqQK2iFmW3w2dPYEKPuehkdGvP2yg@mail.gmail.com>
Subject: Re: [PATCH v8 00/46] guest_memfd: In-place conversion support
To: "Garg, Shivank" <shivankg@amd.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"Garg, Shivank" <shivankg@amd.com> writes:

>
> [...snip...]
>
>
> Hi,
>
> Thanks for this series.
>
> [...snip...]
>
>
> Tested-by: Shivank Garg <shivankg@amd.com>

Thanks for testing!

>
> Best regards,
> Shivank
