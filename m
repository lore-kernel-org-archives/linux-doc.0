Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23DC3B3C06
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417289; cv=pass; b=IzwhFyUIRRlUJFI60C4TvaaMMH2DNWnxu7vow+5fm0l6sZ2ngS4jVVvE+hMP89Xef1At9yfttcjbZmFj/zFnXDObuqK9yGfRMCjlXdU6lSwk0L6Z/S/M1bcIixqPqBA1YvW5zWwwgGwuBPillzwWbUoEUOAT9oGIeBMdgL6ytiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417289; c=relaxed/simple;
	bh=87e/h89XFWKggR0lxBj+t5UvHrpbeUPa7F52O2ZMUZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekHNjm+C0lHQoB0IXpSgwAXc3sB2/HosTUqpPef3qo3Q2dltZoWVJx1LNJW/xSMxm242mIHUlgmPNtoCKaCQZ+nhIxgd98wBPRKInd5QkDf2INT8vv1hI39o3QtyAQTeQ9kgwtrmeMUA8cRT4VT47OK0x3Z7bHn0JasB1ke2gvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4vfOfdn; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4vfOfdn"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-662d984bedeso457007d50.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 02:41:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783417287; cv=none;
        d=google.com; s=arc-20260327;
        b=P8ITmkUfLvvsbgUk6pS5rFaPkBhS18xj/xzXZyDz3p0wG/aC+Z937Tu8rS4nOeBj6i
         De8pkJgRnVUrFqAUfwbd1L7uWe5Wh4IcjeMPY9kMjMMNOW3lmq8PuTxlcQnASBZA6aYt
         Qs55SEfQI6BHfxkQuliXauVromK/F4Tt3Jmhd1P+5y6sAIUI+VtaPhX1xbsjCJRslnKo
         X6h0PQjdB3ALB+VkL+uIJtgtMh54dLrkHcNxLR6gzCXsqBSG53pK0o8i+pFVrXYgneZL
         NrbGguTvUo8QuPzM3BB1e6TCevfqCqrBtyg2Dy0qLk+Io1/GC9Wa/7Hhd3MBrmWdh71c
         BsgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=87e/h89XFWKggR0lxBj+t5UvHrpbeUPa7F52O2ZMUZQ=;
        fh=KaUMGt0R9BzoNDSIS7C7QoyyaHYnLuwUx9zB16LeNJg=;
        b=qJUqbXrkXUfy2ClIIK13J0EGh4irSRXw09DdjDVtRzPi8WJZM9Q/epJq8x1F9Lze1o
         670krv1pKeJcCBmdFGj4+wPXoK98BaGRYRsCkeaCfazvwWr/AIRnuMEqGDZbHBPgd75f
         qZU3Q5k2kNJ0JREAaNpt5PF+FP/CFPkfP422oW7jR1VS+NKz+f5hl9+yT0ZQeFDJgEt2
         33N8+wHNfqT0NhTuO+fiNq54n1Jp/DtSLYbfyJx73gVKdj6USi8AziVbHUd2hahTlt6m
         JRe1yd4OJcmYbbaEBVOwVO9SzdLHPnsWViV0TjmdFZNv1xWyvEiNiwSXK8LmryVmeYla
         NzEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783417287; x=1784022087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87e/h89XFWKggR0lxBj+t5UvHrpbeUPa7F52O2ZMUZQ=;
        b=o4vfOfdnmi76okdjEzaCV5BGA02EPgme5TTEYmRYhFcx4bZtG6gd71pAyfUeIumTFh
         7T3D8LCqTnx2LVq+nTQSplqKF0VfmQPdsJB+1dUpDJ09r9mcxzbcdbrVWuTgHDcSMX2Z
         mvmctAZEfl8JN487HYcZVEUHnbe96rdRdVv0RatasjqOj35Qt3psLV+e3qwZCwxReuyY
         I2Y1wyd3Oe/Jq6Fyvg/9/MX4R5PSYejffvxbClHXOUQVCvVAmCXmHrcDyezstUP1OCzv
         yVPjW7oEsuCjZuno3psTsHHuOoyWMG4EvKDqjkeuVSP3Md5uSzwTPLREgewbInC0YsNq
         2V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783417287; x=1784022087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87e/h89XFWKggR0lxBj+t5UvHrpbeUPa7F52O2ZMUZQ=;
        b=Kty3HbzWoMVbQIoQoWl3Vtqp8fjEyxfRzlnpTNCOsqdlbFPno4T2yrGw5Egh4oM6i0
         gWY+5VYsRNtTloL40jxv/h15AIQkZ88UZMNbeD8jqSG6u07wfatNSomCEZXmIr0GOGRt
         4oIH+mZ9BQOVYJXs/1NhEdT2FAd5HKoED0i1is0L2lXaB9BpqkIWoHwL1XrwLXshDD0W
         XMCZZrE3nj5xB/UAj19Vwd4R7bmnXg5P+LHo+fasyKGuLUzen5S0QUmnD1tuWfutZSL7
         PaSy4biUzGf4jm/x1FNPWnKvoZXA4aQWNJTF9dlUfjwhzblqGFD1/yu5Sf6G/xR7gtXh
         KJpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpmomat4E1clu/C64E+lTStw0qOpnigPbX7o0wkKOdlPZ1QX/XgjaSXnkwgdPh3N2iBGipQjezoSqE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2SaUyaLBp8Q7kY6f9W2ArCJoGWmfqBBeHp9cfazbnPt8J026h
	UklrTRe6gqF5vWFPm3Wwz7scfx159MxRwY/s8v8hf16al/5zOqVyPW+OL8bigTcc4PNQSE8Kbkb
	wLq5V3PY/1CdjPLf+/Gkkrdd59Z/1iuc=
X-Gm-Gg: AfdE7cni7PdhgiLBT5a3Y2/o+8g+2m7TPXCOL4SD0iDlXspNJeJhKYJfBDfI7hecWgf
	Py9HCqTHmhah6p5DkakYEYVdMMqQLgPWmEPQukBE6DmresDb0RXr4E6KipPq0P2+Hokn5V+ZRGp
	WAzIuMJtdGj4OUMeQjwpXWZGou8Hry7eigNiy7Ndf6OdsXsskEAVdoxcfvxHU4MPmMehHuJOzP+
	DHlSMp8/X1jlAqSbFQc/eX4leQkZn8TuZsLRwi/wToVneOVeNFBiSYG//q9Jgt8UEa7twGgFylj
	CN5AYCKHMI8wufeP5IfbxUm3teJEScW773iUdOzIU7l1iK7u2q1WpJ7FjpDpPQ==
X-Received: by 2002:a05:690c:39c:b0:80c:c005:d5c9 with SMTP id
 00721157ae682-817234985e5mr118007977b3.6.1783417286753; Tue, 07 Jul 2026
 02:41:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625092819.1870049-1-doehyunbaek@gmail.com> <aj0fldJZ2dl0gas1@google.com>
In-Reply-To: <aj0fldJZ2dl0gas1@google.com>
From: Doehyun Baek <doehyunbaek@gmail.com>
Date: Tue, 7 Jul 2026 11:40:51 +0200
X-Gm-Features: AVVi8CcX8F9yn2jXEiqxeuKLaqtSPdgGtZoWXu4_H0L9weWneH6SGJykhOYOKrI
Message-ID: <CAN-j9UrCAkNgzj+xG8bRaOnducE16_O909Msi3EFVZjEJf9oAw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: landlock: Document fs.resolve_unix audit blocker
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-security-module@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Micka=C3=ABl,

Gentle ping on this documentation fix.

G=C3=BCnther reviewed it:

Reviewed-by: G=C3=BCnther Noack <gnoack@google.com>

The patch still applies cleanly. Could this be picked up via the
Landlock tree?

Thanks,
Doehyun
