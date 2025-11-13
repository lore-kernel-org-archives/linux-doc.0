Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACD42F39A4
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 15:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763049016; cv=none; b=M8rqvOG5WEaOjc2PUcrBweFjUEpDK8n+GLz2eouBeyEOAemESjoqkw6cOrwOKZ9kNKfW4pgtMHkcuyZh7VJdpeZC9lvDYm2AIHATI3mEhDuHYGaZA32Mwc3A9tDEQFoOzi4TMYVOjOJR6Q5ZT8h1pkbHxLblmlis4IQiyK6IkXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763049016; c=relaxed/simple;
	bh=e/g/kq3Nck5IXBvV/fLusQI7HpTR9rDijWMYcL4091c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lj3LG+YbHgx+R89PvCJ7raTSVEBT08MnzcbqkvLcEn8h8yOg0X8oy0ep41ecIBmIopl9NfJAkCHgTXmfvPLh+06i996OapFb9GysvXENEJCLWL2Id0PivVZULZ0KyYFhKZPU63N45DREKk0DWPfQ6IXi/9jpGpUHTM5AVVE9yj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHqyo7Gs; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHqyo7Gs"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-640d0895d7cso1269678d50.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 07:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763049014; x=1763653814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/g/kq3Nck5IXBvV/fLusQI7HpTR9rDijWMYcL4091c=;
        b=cHqyo7GsIet4qSG1YJc5H3nAx2hIpvcSkpH5AN0Gqlps/BV8J/gqOphbP/P9OtIJ3c
         i2kPdGcuFGqZSDLzIvPwJWOWsWd4qsrScJfVDA1QhphR6NMQTqDVDngL7UEIFLLxUXUo
         MY68MjoWzT7N/hJLEZ5YU7/fEH4BMXNDNMtE84maxGLBHKqb9uuPDAnbOjoGmpP0scXe
         SCBUzQJew0NTDeqjXU3qxPybGwTHoiLNzXmaq1cEo1hXDI2MTIxF4qfiu07qRrwOvmng
         bbYhlVd6Zo5LpDokhu9y6S8mlISt9QwvEWnfgrb6Pzd65sfC8qEzQOJXtwFB8D4eDAQu
         +hVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763049014; x=1763653814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e/g/kq3Nck5IXBvV/fLusQI7HpTR9rDijWMYcL4091c=;
        b=P71kaYgYUFBODHY2Gb+ObMUoF9oPeIq9ruQVAIbksD/4bnJvruK9fKMuePTFUL6K4z
         ZhfK1KV/18GovRDjRGGoFG/ykw82vmIyVVpDDrYZ1EO8lncyGZ88I8j5r5BKGQ8R5Yv3
         62VJJ4rV7gREhT+htb9E0HZhGmjsaJOWi6pOf/YoDYUhA7RiKSRGbLVyS0K37uIyzxL4
         xVFw5J3D2BBdjVaCFWSxQ+fy4OjykHy1JJqUlmfsEAheQrYtNzXmkGleCFDAPIHn4DJq
         pMvi/wRAIa6/EifkKYbsofOO6c/q+ykkuhYUqSGx43NWEmLBllUg0FPwvC4V0b241j/4
         9Mqg==
X-Forwarded-Encrypted: i=1; AJvYcCUGBS1BuJE8m5wdy1oYLhOXrwkNXzpo16RmyPKk5iL0AUkt0IsfPjyqJygZ46W0Kod+xxreAzcAig8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJPYiwSczqLSdd4N6HB/CKr/9XQAERsRhXKKNpJYE5uNPIbJy8
	ZDlFDtUvKhwyZEhYA9h1MHkWzZRQBWWYddeZB5DuO7MJEufTxb9libuNHBKQ7ORURRHSDHtohnW
	5FeMGXTMZ5dOyBmb1fhqEHFzN42XQqgfZuM3kgg7KXA==
X-Gm-Gg: ASbGnctRU99hCOH1kicJluHchTPJcWdxZofdWCuknD2KBwGL3MG0ciCRRpEDDhT3dRf
	DOLczXwZP7vBEyAApd1YUHIlYVG0G4WgX+dEStzR+T1f5giCMwuPYLwQHT6sHBRIjuPHTtb8THh
	9/gPmDYKBVKpEKBmdp7Kln8t7KVq31yGQQfd1VvBEP4F/kOTNu7x40sslJS1DW/MUDxeJCAxeoL
	nlk0ulSM7k9k5S9fCKiySs7nqNTigo+NpWMj2FvTuE0DjOxsI1zzFYB0w8=
X-Google-Smtp-Source: AGHT+IFi/zAEELJO/3R6qd0HvfeGGUdpF5ODZ4t8i7CJBYr5kTmxU/6O9AhNBZ73mSgo0D9Lwg3QIDKxLq24WpPdgWE=
X-Received: by 2002:a05:690e:144b:b0:636:2079:1879 with SMTP id
 956f58d0204a3-6410d093881mr2996819d50.10.1763049013913; Thu, 13 Nov 2025
 07:50:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAN2Y7hwttMyUn0qsEcSBbrQ1h+aSzNpHMhgAxEbqJZn4vf5hBw@mail.gmail.com>
 <aROfRBGmglPgcPVf@slm.duckdns.org> <CAN2Y7hwUmdFMM=mwYq7gsBpbSEBq6n0nXzmES4_=p3fDV=S+Ag@mail.gmail.com>
 <aRSvxyoWiqzcBj-N@slm.duckdns.org>
In-Reply-To: <aRSvxyoWiqzcBj-N@slm.duckdns.org>
From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Thu, 13 Nov 2025 23:50:02 +0800
X-Gm-Features: AWmQ_bkGWycCd9UO7WUF3m5FJ-u_FWqqL07EMSClAsd8MtirMTCKJwM2ofzKbj4
Message-ID: <CAJhGHyApLt6AAHUPrYuKUeKiX9de59fou=aPYL5B2QcEmACjAA@mail.gmail.com>
Subject: Re: [PATCH] workqueue: add workqueue.mayday_initial_timeout
To: Tejun Heo <tj@kernel.org>
Cc: ying chen <yc1082463@gmail.com>, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, laoar.shao@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello.

On Thu, Nov 13, 2025 at 12:03=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:

>
>
> Ah, I see what you mean. The slurping is to avoid potentially O(N^2)
> scanning but that probably the wrong trade-off to make here. I think the
> right solution is making it break out after finding the first matching wo=
rk
> item and loop outside so that it processes work item one by one.
>

I'm implementing it. A positional dummy work item is added to mark the
position for the next scan after processing the previous one.

I=E2=80=99ll send it soon.

Still, I suggest that the workqueue user eliminate any dependencies among
the work items when using a rescuer. If the memory pressure is not relieved
and no normal workers come to help, it simply won=E2=80=99t work.


thanks
Lai
