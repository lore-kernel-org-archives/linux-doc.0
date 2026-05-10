Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C69255F2D
	for <linux-doc@vger.kernel.org>; Sun, 10 May 2026 18:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778436434; cv=pass; b=A9lJTQYntFQEZFKqxoApXpKDITAkCnM+HBZhLqG79qxsvhBJYVIhtoGqYKqTwxiZhe7UnO4mT0tpjQFEiN2gyYqk3IMJ2KG1XR0Sc40n+CyA3sZQIv8tZtOv9kdP/sPf6TWbmYxwTeXTvmifHpbsk+YNYQiCzQ6Q+kERo0A/wSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778436434; c=relaxed/simple;
	bh=B/9PkITJMR854+53j7XQJ2o4B0fxddCNlnNjJN0jwA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hz7SKUEk7SyFgXaotuw0LlwP+30W9ip5zgb4ZpUhUhKAsM7yRWsfctspPvkaEY9BxNKntJuRWYQwldxwlr5MME87Wg6FarRWE1YS4M8o+Fuq+DZHH2FszQTJHYMCtpIz+VV5+5+lviKBvBtkbvdQaYh4MMEClM0HtYc+9bXZi5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b=xd2nxrE2; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b="xd2nxrE2"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a86c1fe573so3828863e87.3
        for <linux-doc@vger.kernel.org>; Sun, 10 May 2026 11:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778436431; cv=none;
        d=google.com; s=arc-20240605;
        b=IYAc7T28k/ph41Xf7qufjjR89R/r1DM3k1l4Iw0cRiJIW1hV8tAsMnQ8wHihmfiL6T
         RGu+MQS6JCDNUvL1uhehv0dsrwAjBkqEZPd6krWdIrBJoOmtQTifNf6bhBNrkmWbBbHU
         FP9bXX0remFQUfrrtE4664a/PJtHK9jtOfZazkR6O76Rk7qo0kfkLmdVZqrJ0aWniZTn
         ncq6Prq+zV5AENYdhYNl3JoOZba1sH6Wt5JYpxl8QdyXBVFDdR4QGjWbU7cRul5Vjgx4
         VDjEOWWASR8AjqyF42ILSBvQEOW/nMGMkZoCf4grcEevIFnSliXV2XRcDeZCyl7q4ITQ
         g+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mPI9RtUtwfMsUB1RLcg9XhbB2p1KI0Jg9PNs9S7CB20=;
        fh=wHl9UKWkp738NARAhKguBUj4pZexdULV7OHG/KEAXws=;
        b=NiPDKLQ7EOQBU6IUzGh3ne1I55qiEXax2heW0tSp2VrA/Uye9Q0YC/Nj0JBYwETpIL
         oVjQxOSITdJuyZB13QWi+r3XS8zhg4npqaEV6Z7yLHemxBNDqLdJIZb9JScCmLRKoU0X
         Pdr/QVesYcnJTMVpVrZV8e3Qojs4RLezL55vTK1Z/zLt6VbNY7vTH1RRx66lLjXqvdgZ
         bLitu7eQtB3BzcShPqCAHOHGz+zF7l9U2rqrJhbj8Him5HGlHZ7BhHdzwdy7oV7mXwDW
         DGNtA3AimkbZbR08ueYpRlPxZMlaUeSPnfIxD502K6IRv6N//X9haSNT3juH6iqwcKCS
         1VKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20251104.gappssmtp.com; s=20251104; t=1778436431; x=1779041231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPI9RtUtwfMsUB1RLcg9XhbB2p1KI0Jg9PNs9S7CB20=;
        b=xd2nxrE2rwAT9XPROHji45Y7YpK9Lj8wqqYVwjTqgaMJz/T1a0pi3r14co3QbcC+DB
         1/4Y3nhJBc0pDjz4bJ5G0wRQXnFdGh+e1UV32hu9+18QbspbZI9ZtapjgRmcIkYmN8/A
         s5i2sZWZaL/7qTGe3cYymFLJtdPu27BfAb9pRJ/kW1s6bvKOSKkPnyd2ENQyI/E2Uxos
         Kb5P+sJVgC8pCMhXtMlV3JppbqSy+KqJa5FFCmFTcYHk9ic8b4HcwLQRQ4JPzTHCVfbx
         i+GCaAWpzUEjVYQU5DwBa3Lb8upX9MEia51MmdOlPKXUUobvN8LcCMrj957XJu6cRCp8
         TXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778436431; x=1779041231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mPI9RtUtwfMsUB1RLcg9XhbB2p1KI0Jg9PNs9S7CB20=;
        b=HhqN8q0P5mxnoSRuYDDBxfkC+vGs1YBToUwWP/JQo2PIjAUsOqDcHAOdIz3zGsiWFo
         YZXYi31GTvYNFrMKuS+sqZyiv0zqtDl2mdKrtbZag18sdj/z0A1Rk9jG7SvCBXK4vZib
         0GEwldttTeM2U5XRAG/SOQooU0Un8jwKBCdt+0d2X+FbFOBdqkCsI1fW5N9Q0t2QYuKQ
         PsQbdRHCcR0/EwhR5jiCnPEmNv5QYC15J8kFvABg0nff9cbMnNp6sG0zZklyAr9f2ea3
         ahUMnWcI9bNh+eFN73+SiiqaLIQQaRwITOU2UVN6K3xxIEXughPSmLbojGpDKNZNXmkx
         Tmsw==
X-Forwarded-Encrypted: i=1; AFNElJ/vQSVXOeSNaaE2+16sb4eFehXRfjQT1vvzlXycJO/xSO6ewqO1Mkq45Hs4q6AuKJ8nHiGB29EkJXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFTWMPH/qOUsFDgSPSEr8bsdmQ5bsayl2ESPaRgKTnMlDBDp6P
	7wlutcagwvZ/n25GcZH2wRT9h3fbRm+hOo64LFzRPECwFxV/NxAw4kUgjxM5NByHhmYIiIjZyiW
	pK6N8NJa70OtOQZI4ntjXYv95uHU1Jt5mmOV35KmEA+VslEnZHN0=
X-Gm-Gg: Acq92OF5G+GJDS/8l9L1qChbCIOipLsFbRF4qGqxSBCWHife75fBAQYkD41KzESH4L7
	fzKPQOUBupHtCtIYe6ymmySL02Ood1bD3ie/bF6ErOx4PdMUxr7vpPUgNfnCV1+uFfaftWuzpQE
	1ce/PWsq8LuBjv8JugRryvKQLBzaOrpTcWf3PR8TaOvqHruIUuy8PMaz64uCOtq/mxcOnazBTQM
	X3eXu/Iunw/SGwvJ27sw9VJrItFu8Y1EZXVQ2A4vJtQi04p3SuHY5n+vhN7fju+rVwmvtyTZxEi
	MSV9YQLfwbUlAwA=
X-Received: by 2002:a05:6512:3e14:b0:5a7:4699:d851 with SMTP id
 2adb3069b0e04-5a8b6c9c530mr1787120e87.7.1778436430400; Sun, 10 May 2026
 11:07:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALCETrVqG+1yErRJjkxvJrf=A+Vu84HTR4Bx1Pcd8G1C0PJcMA@mail.gmail.com>
 <14A441D8-5370-44BE-8732-99BF8107C3FD@getmailspring.com> <0b8bba44-f6bb-4d69-b9d4-5787c276d41a@inspirated.com>
 <20260510163204.GA2279@sol>
In-Reply-To: <20260510163204.GA2279@sol>
From: Andy Lutomirski <luto@amacapital.net>
Date: Sun, 10 May 2026 11:06:57 -0700
X-Gm-Features: AVHnY4Ksn57e9ZSnowz7i8VDuqmEeyTqf3rUkaTOYFnl29-9oyrpMeTvEmcHBgg
Message-ID: <CALCETrVLsFyo71Jk7pZ+VDSR+cX-tu_mD+RdpDe-q1sVw4wisg@mail.gmail.com>
Subject: Re: [PATCH] crypto: af_alg - Document the deprecation of AF_ALG
To: Eric Biggers <ebiggers@kernel.org>
Cc: Kamran Khan <kz@inspirated.com>, Jeff Barnes <jeffbarnes@linux.microsoft.com>, 
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2026 at 9:33=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:

> In any case, any hypothetical security benefit provided by AF_ALG would
> have to be *very high* to outweigh the continuous stream of
> vulnerabilities in it.  I understand that people using AF_ALG might not
> be familiar with that continuous stream of vulnerabilities, but it would
> be worth spending some time researching what has been going on.


It would not be completely crazy to have a simple, straightforward
interface by which user code could ask the kernel to do a
cryptographic operation.  Think:

int compute_keyed_hash(int key_fd, const void *data, size_t len);

where key_fd encodes both the key and the hash type (HMAC-SHA256 or
whatever), and there is a very, very small menu of hashes to choose
from.

But this is not really obviously worth the hassle.  And AF_ALG is
definitely not the right interface.
