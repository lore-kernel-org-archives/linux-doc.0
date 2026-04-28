Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AC145BD7A
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 18:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777399607; cv=none; b=YZT/mX0Se1a6Cf4A9rRQVKcpYdgNU7XEbYpROc+d20rEhdExsNdqUSb+GX10p7qcLOOXTYEgMhBFo6LBLFa7YkUI7XqB89w/UM5RHbv183umhnQ9SdfM2kOsl77Bv3SGGZoJ0ib8ctBDxhComfDDE4qnwY94Ul3S3z0N63+rskc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777399607; c=relaxed/simple;
	bh=yqjIjtfKgVcLUYBAkjRAo0Q4mwh0fZg0tEEipx5Dfi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQtRS0HcIArfyEQ6HtznBzGbGVgjr0QIWbuGd7ilEwkKjr9MCs+XYXL65mBd5eBG86+blkgzd/MFyKwIuYJErgZ0CwE6ZbYZz2g9W59ANTgFFR3beK0MZOLGCPtEGQredpH8qXKs+j12VKp6HIVFobs1I3+peFpQdByfroBNcw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVsyUazC; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVsyUazC"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so100959625e9.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 11:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777399603; x=1778004403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yqjIjtfKgVcLUYBAkjRAo0Q4mwh0fZg0tEEipx5Dfi0=;
        b=mVsyUazCkUa+mD+UNyTbb5pBWokKIT9NSdS9Rfh592apXYqnod3e6NosRSLp5I3I3F
         Pd63tvd8u1pyHNpckS4El/PbgtjWE8wXr6XjgeYoCkvvFfdqB5q4eEfSpIqbyFP1zIt8
         /YLF097A4o68V1LOhD3KnAu5E1klszfD5dTl3cZJFsFiAFSqK3lxuk5DzE0R9hzTzsyg
         UDLsZYbMx+X0d/THmic2/+diCNjqjl5NrTaXreogoEHQWJFDKVOlBckdAzn64qvseHQI
         RdDRjn3Fms9bLCjykD4Rua/I5GWxHuy28rUKfDdZxHD6f4KZzjZ9uasai5meqM9K4qU5
         UVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777399603; x=1778004403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqjIjtfKgVcLUYBAkjRAo0Q4mwh0fZg0tEEipx5Dfi0=;
        b=q52qWRRDjzoRmwKqhT/z+gHsD9OfnH0tHgPDgYs0IVWUIcAZMb9H8wFiGLZiyiVQvu
         LGqfbLS+br+JbaZEULFtMGVXtYlu8HOdnUy7dBCoaDDmaYuVpDNr13/j3oFLaDGE1bPE
         F1ZMMyWGHff+HcFRcSV0aQqbiLLPd4vjpprGv262MlejtOOHk/dTDnEj+kY4ZUbEt3uZ
         4M5IveFcSZ4sq3qJBNnt1nNL0DacrEbbp6SI8hqU/Xl3g0F8UPUDkfGAnAd6xySxw+0p
         z+p/akxmUnD6nzTY0gIQjmKoc1Cc8eTC7rhppbDquYL689FyMz5gQSV3OcLA78CU31UO
         YQ0w==
X-Forwarded-Encrypted: i=1; AFNElJ80uMwuCEVCx6HwcvvJTBLKfqQh6UZM/g4gwENK6u/7YRswEX3cx5WqMTFHOxXmqfpjD1NGpEYdp9o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9eG602GBBIxmDVvTHuIfz2tBuc7x6NMvCAyXe24skTp6CDFXg
	yXEwRNdZB1Wlgj6Q4uwFDF2hD9MWnFGE72yCZ3mwS9vpy1wYpWT7VDpc
X-Gm-Gg: AeBDietehpEcc2jNIaS04Nf9+6gHtgHKYhfodztpu+YbWgexZz/xwHuEBJF2Q7ok8mE
	M3cCKv3TIyVBeFBYIH4kUvYl8yIS9Hlz0fy2wDQ1Z9V3EKRD2dV3zW9pxXkdKLy3koNWY4Cx3Rq
	kU2o4dPeLE/O9C/VWgLciWO/XmU/gynuA03wW18T2AbSzOlPnZEiIq1ZPyo3jdV0BAn3p7HPlOr
	j/kAQV03jT5ccGz8f4vO+vsE7GImvPw1mIhyP8IcZvHx79IOnJpkqY1XnXuKEmReriRI8ulqc0k
	3KAufvjgQpG4C3Fmk0bO2SwHHVGEUtW1NiriR5koklVRBrUFMQoUCkk0RAKMAS5GWejN3x8gDMS
	vzvOh5+HEEYVSGVFA/t6oWC/ej89cXZwaFlUqjQ1z1lR45agH6sUm9+TWXotWxzMtU0wmgJOhB6
	yFr3R+abUruhYlS2mHgEH3TqEdIdz2dlSCYntYiAUjPc/fjneOiVEpuCgJ6bRinuTIrsLbZQ==
X-Received: by 2002:a05:600c:859a:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-48a7b5125f3mr9228125e9.5.1777399603012;
        Tue, 28 Apr 2026 11:06:43 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b8cf0fesm3192395e9.5.2026.04.28.11.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 11:06:42 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <b5918621-08d2-4ad6-850f-dda18a1e774d@gmail.com>
Date: Tue, 28 Apr 2026 19:06:40 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
To: Jani Nikula <jani.nikula@linux.intel.com>, akpm@linux-foundation.org,
 ljs@kernel.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, masahiroy@kernel.org,
 nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-3-julianbraha@gmail.com>
 <dcb7439832f0bb35598fba653d922b5f6a4d0058@intel.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <dcb7439832f0bb35598fba653d922b5f6a4d0058@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, 28 Apr 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> Oh, I'd really like a check on this part from kconfig-language.rst:
>
> i.e. warn on selecting visible symbols or symbols with
> dependencies.

Hi Jani,

This is very doable in the general case of unconditional
visibility/non-visibility. Handling the more complex case of conditional
prompts will require finishing the SMT model, coming later.

I'll add this check, hopefully for kconfirm v0.8 / RFC 2 :)

Thanks for the inspiration, and let me know if you have any other ideas,
too.

- Julian Braha
