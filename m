Received: from mail-qv2-f7.google.com (mail-qv2-f7.google.com [74.125.230.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB5135DA65
	for <linux-doc@vger.kernel.org>; Sat, 19 Sep 2026 22:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789858621; cv=pass; b=s7PQwJpGBUpHvbrtmFEvsWgCKLBJOKK/5Dr0trl+NrBxvEltdxtvLbv3zO309rAJSzl481G2LqiT88HEQ8OjCFESn35bzNa0q9hkJ/45Rlz3Cz4cCquIm6uwKSorMpNhg6KYGA97+WvJHShkpSRxayJVXSOcfxVZeUrYlGHFOls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789858621; c=relaxed/simple;
	bh=jd+AFs1UozMzUYo/4ng/l7WLWjUZGS/WRbp1bu41oew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qfCrhBGhQGjrwZ6GMOQ3IXS0HgD/kOf93OGSuSLnVeUuD35Zm/oYYvM3D0nuz26AxNuTFH4/25O86pQzc37Q/hjpFzm0Z5b+IleQGkrBu/qngrmNWjeX+MBIWIYOByTMcbshEN1VScY2sEWKCWeay4KqVLdjWO4a4MHP6eQam/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6tpTM9h; arc=pass smtp.client-ip=74.125.230.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6tpTM9h"
Received: by mail-qv2-f7.google.com with SMTP id 6a1803df08f44-90ccffc2654so18178226d6.1
        for <linux-doc@vger.kernel.org>; Sat, 19 Sep 2026 15:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789858619; cv=none;
        d=google.com; s=arc-20260327;
        b=WZlJmO4pLFYiV2VxfLx7O9PyzDV/DMGPO0T3ctUwFp1R/P5daeBfS5ooxzvZBIJjSg
         +WCJUxDVd65L3I66LkSyvQjGJPbogzlfXzsBwwWEmlBQ6S9jq91lQHuoDF1co37mLaNU
         Ame2Y5nH3jnshwGzlOBC1NhEWud4Wx1hUZENVfXXsZcv1GBwtRYGe9EypeJhCWYg6wq3
         Z4IObqlR3QAH937U5hGCOI9nMv9HKU6ak4jFjPCJA/XLewkFKb+misLRa2BxULCDtCG/
         b53Mm+g8NrRzaxLAuF4LV0qJacVEuqfMx8eOAPM9OF+yMoY8WDNiYqyDC9zSNhDf0m7f
         9PSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jd+AFs1UozMzUYo/4ng/l7WLWjUZGS/WRbp1bu41oew=;
        fh=EJD9i+u4OH5UAP9de6P+g8c1GrwXG1vzDTcLTl7GDCk=;
        b=dISPTJiDsg64Yz6haFjn5rB9TRjX/fJZuC2FCpTG5JCBL1LxIWijpDWJQaM2u4KW3y
         2YBOLhigcZQHgD4ntxQBDnDMt2jemqZlJTSfhDlrDZgWucXhfov2Wz0RmMno6xNFly6j
         i2rsCw2JQDwgnUH+ZzNMP4J+E80GI6q5jUNllm23ompswsZ2cHCmXrOPSZxvgdDhDTIv
         /QCeCLwHRXbb6KU0ffKR4HQtMp6zKF2AGFnZCNFyQ2GQ9YDgk2Iza0yZFvvV9KkC3/eR
         hfvQMbPU4dYqO5du2CjUxtxa/eDTJR/Dx9/vY/VuvohW++IYnB2P/CBn3yahSQrnCVkd
         wTDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789858619; x=1790463419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jd+AFs1UozMzUYo/4ng/l7WLWjUZGS/WRbp1bu41oew=;
        b=j6tpTM9hr10a2RPAGTMtAcM4/SNR8y3DjbHafkmdQqQlu1A3EnOnV65QhwwfL7iGxZ
         74KN6GhrbnBXSVJ8bR+UKeJW9+unZ7ma/ug81g968yyGtFU2DcxX3LaoEcwjnVMAGbwu
         b5TFTsc80Q9vbHeAqGwu2Urar+nRNuOobpJyipO2nqMEBR5hCqK4Sk5fQrIiy1dKMihv
         3nMcJzDs23HdKXUgqFr43bkJEFGyFYuZZI7VJAJb0HGmSazQL5ZVfzjhic3/hJQMbsvZ
         02J7qhTqD1mA7ZQfQ0qPEM9+iWJ/Ev1Rc789BaH+ey/ea4e1zv63RDbRgmtOjVCr1fkV
         qWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789858619; x=1790463419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jd+AFs1UozMzUYo/4ng/l7WLWjUZGS/WRbp1bu41oew=;
        b=Ua27XVf+rSW1Ip1hdLHD7jtJ+m4Y1dAY7/dufPIfE3C9urbf96g+ejFxjUnS8wAYUf
         sp5KdV8/BVLfo2dXzBYS12GxdxysDzKeIk8VGEM8AFpzdEWVqvWA14luGi6TQqBd9DMa
         DC71fRyRQVD9rYLQUniV73q40VoCnduXcpfo0//1ua67DsiMKC/6j5oNiAEfavhW+UwS
         uhQYsV4tFCi3n2IyWs68EKKa3BE4pIFNqmHrlHwzdi4umCpG17Aqw84GPhwQltlibWUZ
         vJO1EAe28Dt8pGCmcGlvftGYK3ngfIkH2V5fEHr9neSe/P6fp3Y/qQrnj0O+4HL3u35h
         gnYw==
X-Forwarded-Encrypted: i=1; AKwUvBxo8n83BqUC1xwFvlWjupAsU34FOs+Uuk/U2QrzPXxqmo0OhOK8WmjvTH4vM5GRaOPyiXI3+tbwXQ8=@vger.kernel.org
X-Gm-Message-State: AFuF++k4qQrdbm85DlteEOlY/DUjqWAj9mvTGiMU3RHgaoErM9OrhvsD
	KJiPGwXdm9gRUUf7or9kMiDjvuXz0RFt1ZIthZni2KX83D8KCpabbB7+1O7Bx/ZAcqu6iEiG3uy
	j85jyirOXH0PDNNGc3nCctGzc+UJ2yWDFxC8j09Q=
X-Gm-Gg: AYBFou3kn2pLmNjQtpEsA+MGDwBJu/MqmI+m87YDroCLKNUdDn6WGTd0MemvaJUL4q+
	Bi8g7nmUXtnBR844gaqpgZpY3mWk/ArgveYGG3DysBBGGOLBOSXHq7mnl+Fvs/n8YYD3Ru6+2Sc
	uTlZvt6mj2FcLdBDDiqQioq9y791fa7nnEocJxNMj0/Cf+4b5VuQ9FXeW9vBdz9UzLgaaPBNgNq
	Dn1jVSnCuGm+snOHH/s7lpOd/h++anBHALc0+6eCT00x2orku7OkzIGI+ohU+615u8W1+3mYPtp
	QAzYp6Z04xKigp68SAA8cP+RyivnBEZcPo1k1ERQNLC/vIXNeRGGcgynOs9BDMrX48UMvqSseXZ
	lvPhRGNeZdPipNHDGOc1X0sY9v4a3UXOyv5yEjs+k
X-Received: by 2002:ad4:5748:0:b0:912:517b:40fa with SMTP id
 6a1803df08f44-912a801bee5mr35579356d6.44.1789858618635; Sat, 19 Sep 2026
 15:56:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919083655.586922-1-enelsonmoore@gmail.com> <CAD++jLmuuLXpWsiZAFEA-QWZsB_6qcaM3PomhtKhHFHbzse5iw@mail.gmail.com>
In-Reply-To: <CAD++jLmuuLXpWsiZAFEA-QWZsB_6qcaM3PomhtKhHFHbzse5iw@mail.gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 19 Sep 2026 15:56:48 -0700
X-Gm-Features: AcwNN1UGTDJgGcyXU7D2JaYejEQlWEe1KXFmg-_RTnPu_ebNdg98jhIE48FePPQ
Message-ID: <CADkSEUigNMbUi88zOCcLkTNduYk_z-k5bushv3nUAL7vGdCdEQ@mail.gmail.com>
Subject: Re: [PATCH] Input: gpio_mouse - remove driver that has never been
 used in the kernel
To: Linus Walleij <linusw@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andres Salomon <dilinger@queued.net>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-input@vger.kernel.org, 
	Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Linus,

On Sat, Sep 19, 2026 at 5:12=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
> Why though? It is fully modernized and probably has a value
> for people like "makers" who just want to connect an oldschool
> mouse to their random Raspberry Pi.

You're right. The driver is so small, too.

> I think it's better if we focus on removing code that is just
> using platform devices and hacks and is hopeless
> to maintain. For example the OLPC...

That's a good idea. I've started working on a patch to remove OLPC
support - at least 6500 lines of code and I'm not even done yet!

Ethan
