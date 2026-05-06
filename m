Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C59E26ED45
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 04:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.196
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778043539; cv=pass; b=lAYjopToAdDKnpqv4D9aOix9wwizOhxTctChnFzV0h2TgcH/Q+VFoGozIPyqATOBAeue0/Sc8mQVIb20o8YFcW+m0sj6qJs7ydAGXzO8hBiIRPX8H8jjRmYQpLgDHQYwc3S+1YpuHMGcTZIbILZLXDj3RveP00Iv4ATiOy9j9VA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778043539; c=relaxed/simple;
	bh=b1BbcLLXm5jwT/2UaCnWGJGlW5EMRKxSPsM2zIavL/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMSBpSBguIKiHkczqRJiWKAIRD8Zb1/+nMvJ1faikCbLJM7KTCU9xc4l0T16stHcdS1/Qkes1BzDvpzG5nuqkaTLWkaNaJwNy06kAhWIai+GUq/pW1KIuxw8wNV57s6u5Vr+Jbi1aUUgBKFS8hUDNL153q+yNhrX6k8f0Dt4Qeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/CwXw5+; arc=pass smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/CwXw5+"
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8f0579401c4so780675885a.3
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 21:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778043537; cv=none;
        d=google.com; s=arc-20240605;
        b=Zygmv1J5VwCl3duKnBRSXFi03KDddJPGobZckfGqhZsRylpW8D9frSbyCMKdXQI2Ir
         yRKzHW6oKsuhXJpBkpU+2wrzT9beeAWF8PuUZ6W65Y0fUSU/MvtFJ0cWMG+cDRenloC+
         Ho8aQZLN9My2ROHqljl+E3FPd6shtZGx0zv1a7gtNLY/PzQX8yv1F3o5CaGmFQMiRqzM
         9qvjHW+cisoWRFjuKaKU8EkZWg9b2h0QwhdL23vcgSeivp9y7gP9JED4hPyRtgAIe1eb
         UfUs7Bvmx/TKyTyBRKIVMECKm2i46R0+byAp2CojDqi7MEHbeD6k/VSIhvRy3x5IAVdu
         O3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b1BbcLLXm5jwT/2UaCnWGJGlW5EMRKxSPsM2zIavL/Q=;
        fh=RrsMfrh5VLSQsrTL6YMENVmt+2PFe2PBAF5h2znoE7k=;
        b=ZaafyZG26amUTGiRKZRSmuge7JSSXL2TgpnHmDCLZV45YZKfBlR3pDS+wPQVCF4mG6
         WzZt3Fb5FTD2hx4BgT0ukLdESLW+T5sBbkr7hOkQ0LYHHjlEpzmxcUb5IxY+BLL/5GXA
         bO48xtJC4I/5UyGDPTTZOpn9sPojXDU6Hj+8x6VjF9sJ6u+W8GjI6UaRRbEumsgeocqC
         +cbKywzwMB6ZAYpaJl/supBM0m/e4R46dCuQ1fZ1WhUF4yMDB+x76TrX1OP00fGCjLG/
         2bhN6pfguyObGsiFDymk83srvAWn1j6llTnReTgGdcc79Pt4Cr8iaNMJn7MF9Rq4oDCy
         KbYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778043537; x=1778648337; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1BbcLLXm5jwT/2UaCnWGJGlW5EMRKxSPsM2zIavL/Q=;
        b=S/CwXw5+9JMDA/1WyrKiYpmZb5BvVWHUikiL9NdlaZT8er/Xg61WWbM6kg8tQ9cZMj
         /2h+arLKVFReqGSTZb0OKkkRZW/jXVBbe6dKrKm55LVAVy5oxOnCIVYoVxDCFJf3P4MU
         1gsCBXd6PO6VEdXKWWDJ1oMj9XxsqahFy/NpnLSKXtfy6h8S252wNdgRxoLdmQ4+eYG4
         mP+QPQ0DKeIJoHxOMYjwQB67HbCqQATlq3UiWH9PITJ1lOn5k5UnbzfAL9Eq+tsWjP05
         1tsbxEmPFfDcL1xFlrzffNT0A+jkzFhHevYjt0ziaZL9mNd3oRhNZDzIi9rw2PNKGxf/
         K1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778043537; x=1778648337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b1BbcLLXm5jwT/2UaCnWGJGlW5EMRKxSPsM2zIavL/Q=;
        b=glpHN0ZNWxw2VnASg9aiorAtjxAKJXsK9ukqwP1kvz8uktOv+IrAAGLtJ8IsZN8SKk
         mTEW2MNFgYO3kxDKnxVbjTY2W9fViVN7S19V0uZctBiAYNH8nCkT4IeY/iz3/Rqlhw+u
         WFD+1F9aYgdDG6bGCtLKazqMJaR8Vl/FvgIAA7Di09RcRX5CJy7SJno/zayyjVEi/iEy
         ZSZs4pOn7273SGbVhlqw3RUIa26ZCiTqeH04ItWqAGFz4gHfWAYtXrJ4zW12+IzMGJit
         LRihBSJLVbi+aYZuKdVyMs048m6/yvQ4Kf4fFw7cFe74mIH6mr/6qpctxylqDRNFDpDy
         rBkw==
X-Forwarded-Encrypted: i=1; AFNElJ8I/H8r1eFYqFoVme1HFr/ByShzu9yFg85yskHkZhmCTIgvpMvu7YLgDtHk2O9RDBce/UjlO4pPa3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZHk6S8C4p6bBXDBRnrLq5HAUArZDYMM8pfDyqOa/+WADKVZPV
	aWWexw01wcyvr6ISgaPa/+33oHqAKPWsOmFJNfDEINXE+Ax7tYJFHi9K8zmXE7pDEYi03p5FXDJ
	vHcwaL2mQhQYCnzry2TRh1bM/OqjkUFv/6AYK
X-Gm-Gg: AeBDiesxFT09od1OG4H1HtHLW07LxTzLMIyqG2JGowLiL9roPUpX+sMnvLjbvM7XvfU
	EoUQdH1zhyTHkVTWaEIQRrPngELD9miYwAVkOnIO1kJ8H8qsPZ8jEEGc81j5EaxXB7hgO0iI3pI
	igLFoEJCG7my3OCHVPvMAM78IDvvrubnXOHP5ug2dA7k3ugQ+hXfaUyUMU14Jnj7OuDuyQIsrQd
	3cbrylJpyRbeGtft51CHPoZeNv3KRh/j+IuCoCdZv3sk3tNDekO8/SaFC3UYG9RRyCbJj+Zli5f
	/N5LAEivDe4dFv/baKaNLNrDTWR24AGcZwVOafSy3ZUipbKaIahZirxae0Kd8Sqxi0qzFCO5K2Z
	IijY=
X-Received: by 2002:a05:620a:280e:b0:8f0:10b0:9e4a with SMTP id
 af79cd13be357-904d6fcc196mr291861185a.57.1778043537373; Tue, 05 May 2026
 21:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428014806.35400-1-enelsonmoore@gmail.com>
 <CADkSEUij01xaqNeFxHX3PRsFCWK7-m2eGH2Knt2T349QOzrQDA@mail.gmail.com> <81a90b2d-8dc3-4466-92d6-936679e210d5@roeck-us.net>
In-Reply-To: <81a90b2d-8dc3-4466-92d6-936679e210d5@roeck-us.net>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Tue, 5 May 2026 21:58:45 -0700
X-Gm-Features: AVHnY4LBvePXvl3QJpoL7mQcwuHEx0Qh7nNp_v0LV_n6v7vLjZrVBYqOF632V8c
Message-ID: <CADkSEUgGuyEt_GD5yPaQSAR-6f3Vr6FF1fjatkXcA3V9MOB=sQ@mail.gmail.com>
Subject: Re: [PATCH] watchdog: remove driver for integrated WDT of ZFx86
 486-based SoC
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 9:53=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
> Already done.

Excellent. Thank you!

Ethan
