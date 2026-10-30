Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793381947;
	b=G7aJd60eh8hh8cSNMfvMzveo9EefUCCnoiIXhn/ldWzO6mD1IgBcAYBLRYE4/Y+phsqA
	 8ij56Ry8JkPw7DIIH4mrlhcxKXh7PggY2o6Q65stAKwOzFOE9nktoWcPbaagRRqLOCeNC
	 f8pqSZXGcVGzpUnNXT2GYWUtO+AYZPY/yU9sSu8ixf9BUKpC5gEOSUHXhu5LDq6IfJVh0
	 zX5fI9WSXacql7mvzYMoJn/15HgrcgZUym1JMi97Te0eyBTqMUykvN+6egrJKXhIsvmyQ
	 Ouq2H376fcyXNX1nf2p2tNdQv4y6DIZby4trAPHUxtwFmBCXwSz2NGl5KghqKKehx5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=espr7eMUoL4NEp1fFPw2X7cY1hYHDQwWESfnyLsQmNw=;
	b=ugt2vw9oS00Y9n2Ag9gIOUDrlj4xlD4HywbKRfmKl4MRiLJC0sScZMrVzZyhI7c21sAa
	 /xS08Kn5574BfiFqzz1/tIj3ZFQni3u+hUfwZjRHEa69NqZkPUBaF6GdGLA5KXxBE/R/D
	 CyT5epYSbXIVFrEPl9DDXj9Qhe3a26cDKMIZlDzwWRUmX1/yb855nZUQCUmVtkql96w98
	 eWzEjhMvmtqsOJ2ZlOFVMGS2K/pD/pLGhbdKM5Cxdw3GjeM37wdt7d7BDxIlR/SVrdr8L
	 g8XlfyhYxTI3dgTGSjuCF+8zswcE3euxDNtSIx60DIKSYOAeprNWWkZD/AnGigeQ+EQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=phsogC6Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E0D606A31F
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 17:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E0D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=phsogC6Y
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91c75267b0fso10238216d6.3
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 10:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793381946; cv=none;
        d=google.com; s=arc-20260327;
        b=ZDA7OqBTaaAd0XS1saWjweglQW6NSKev7MHHu4FPq+SVv97nwO9CuuC0P6ly6HX0xr
         1C1rBpRxeRtR5G+bv/ZB7A670DCV/to8PTuSG78NvuUkil3ZCww22qO7hu1uMrZFYfKo
         BJnCAzQHtcR+y05sH4RdtiKYmpD68+G6yYV+zQDK1ueqj38H70tBO3g9hj4ywB0RjQtQ
         IRmm6lomlTQhibfA0bm5HP9HO46+fu0IgO4qE5QIXNFdcAJbsDBnDoJwtY78gw3f6mPC
         F+jB14eTQLl0J2v88d+4tY+1P/htbQBYslrS2dCK5O4TCKAtTqPIbUz/NbfUeJUT86FP
         nrZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=espr7eMUoL4NEp1fFPw2X7cY1hYHDQwWESfnyLsQmNw=;
        fh=5d2nqqSlPaZcP5WGKxcmTkzxLbvF+kaYvQ5Dfue4TT0=;
        b=VqqqXPCS3sxs0+cKlHHit6Nw8rvPYtZ6mx18Ucc1Irmeq/MNCzj5ZYsuS8KmffKyCC
         DBnYH3Q16OqgOVreYmXti96C6gVXj7dzCmf6sDbD7SnvK9srI9EsXrsvzVl0it/YQRk8
         +0IDzbvyga12TuR8eSww+KjpBlb6ctAHlB8iJzQhvqsgQ/oBCoDv/HvSgiDsN51+hDH/
         MiPgGQy9OjYLdR68lBvyy39V/JkVv9DKb810OB560nRQ3y33wb6FuFXWxujVpfLX4ITP
         V4ygR5LlA+dRc6PsBMaoW/CW8F4fyB39JydF3cjUkBpkIx2wyMtcerj9ueoZctRA/Zuo
         0Ruw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793381946; x=1793986746; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=espr7eMUoL4NEp1fFPw2X7cY1hYHDQwWESfnyLsQmNw=;
        b=phsogC6Y+qtsb0QGVFGSDDf5T5Kh20EJJXMOsGlfuqX5VlyD6VMPQ8vSmR/mCfXDMo
         2GFmmgqHGJeNJVXfLqFbsvCh324IQWNuBvDyY3Pcci4A5ESkB2Z3hSC8Q/GovLQZtU8k
         Iwd/evxgoGgJvL5OMRp8Or9unuzO0a7dxUCCb1SUwkmIRNALmNb/9AEo3rA8zEPai2hS
         6s703AX4O2RsuiJcwFc0vfd5vPLtYQXa70N6TaP01xJsrNXxTVYKk/fFr3SOLlcEd4s8
         RDzu1j9SEC0hqsaxOtJpkWxdEywO/uUnHQY6XgxhjDO0E+SPt3O/kmthnolh6hc3rYrL
         CNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381946; x=1793986746;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=espr7eMUoL4NEp1fFPw2X7cY1hYHDQwWESfnyLsQmNw=;
        b=iEAnLEWaQkcIHgEZuDTS2i6QatGA1zXSENFIBSe7hBEeSl9ncSz+vbIj9hkWKV3z0+
         wVR9obXGZdLY1SEGon5VuiWQG+mFHJCwgTxlmWePkUzUV0ZAZzUbymrpyLpEIoNF0Fy5
         nNq6h0j3aYz5owM3XXLWPQOUx28MjrgzCnHYrSP/5yGfGn2sMsPpLjHa0FFJdD86FMTN
         nTMFaaKy9BFwh0P/PSqLzjLt5pU0YInaaXeMLs10hx94ivh3vHb6oSbESxOrIdDpLTZi
         rTywZNjywPqIFqBAM/CCA6YYPLh2kxw2XW5phplujce5SSSimc8q99x6Uv6BkaIIX/s/
         +U5w==
X-Forwarded-Encrypted: i=1; AKwUvByRgzin2lAZrdaYAFKw3/8yGDTLK54HfO1sduYevJHjw5kNBdaEKgQwW1s9S0/0aWSAQfL2IIUsQUY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8/9Zu7CQ1CCpmttZaG70apt7vGYCm9QGvv27GNFUZA/Uu/ypS
	40AukN8fFp4tTKkqHVYi3IwksbRyc3GzmUdSRX1Yn78AUDpw7wYAo0nvX1sZHTh7NoRx4hstnfl
	HZN+7zrBODrOxFUNNc4W5hedCm176cuw=
X-Gm-Gg: AYBFou3scqrEGwDFOGixyEoNND4H+xvnzcp5BMzdaerocUVvzUq2vwuVNSvSmUoBMoW
	B0AAwBXLcC+ZKT2N8OI6Fo03QGhViK53O7YTHtaEUGm+h7ZSBJ76qOf5QJzWvL9e5OmjK7x/vOs
	jWa8wXZykzt+YSq2m7vqpHOzxbfOz+v3TqLq33PnqpZHEql8DLuCTbk01RqayJ0nvTc+kmYxn3U
	MRAqX/wQyuT2lf4+HWdnCuw+1/i0eDTDVirF1kW0pPMxhN86ea2xX1V/HSRoEV4nxzV2fe5uE/Z
	vYnfSaOmsm6PENLjK+p2qLg96+b3I2t7QIeDtW1sbTwtD+AOZaSqzLMdMAfTT5WzjQOiwcQHfGb
	lk52aqmo8V10p+nRWc4s42D4XtJvEb8mmEIuv
X-Received: by 2002:a05:620a:1a08:b0:93c:9d56:a860 with SMTP id
 af79cd13be357-944217439e4mr528491585a.19.1793381946045; Fri, 30 Oct 2026
 10:39:06 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1790512964.git.lanzonza@gmail.com> <7ca8fe6cd6b4125813613bd4187ff6cdda72e4b6.1790512964.git.lanzonza@gmail.com>
In-Reply-To: <7ca8fe6cd6b4125813613bd4187ff6cdda72e4b6.1790512964.git.lanzonza@gmail.com>
From: Zac Lanzon <lanzonza@gmail.com>
Date: Fri, 30 Oct 2026 13:38:55 -0400
X-Gm-Features: AclHuK-QAySofGqN-BH0ysfW9wI2BwE9lRTbGJWzIzgQZTntV5tJ3u0NVFiOCeQ
Message-ID: <CAPusjWrmKH4wHK6LY7NFi1=+rzDY0uq5N4dgKC4FuUh_=xGhLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hwmon: (asus_rog_ryujin) Fix pump control source
 on the Ryujin III
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Aleksa Savic <savicaleksa83@gmail.com>, 
	Edward Blair <edward.blair@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

Gentle ping on v2 of this series. Patch 1 fixes the pump control
source on the Ryujin III and is Cc'd to stable. Patch 2 adds
pwm1_enable.

I can rebase onto hwmon-next and resend if that helps.

Thanks,
Zac
