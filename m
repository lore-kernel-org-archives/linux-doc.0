Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729B02367D5
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 07:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759994289; cv=none; b=ohYuC+BNVa+aqITkN0JV/H5N3N4jVh2vPgMvoxJyB+EyYGUJYaGEJHMmCR+hw6mLwDowth2xbeWlONZPdlKarZnSawAfijWcUD2Vi9nCPfSjPMtr/IsDLxbS7P0+pL2PSNRO9EuH2XZqPyWrL5eJz4S2vpXG8dol3aNNQwvMQPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759994289; c=relaxed/simple;
	bh=l0XjO1LRI4uEkXnlwicCc54O7kgNZYHrpfgu1H+Q6z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssl1JbcOz30ikzsPVx8pw6HNw6zyOfQVvBZbEusXqLB/jyUp/GnOqUPDhaS1CYFQ67oYA/+iA5pJy2D9Y98JsxAVqwdgJrw/8tIXZY1HGbo/8XYxc4YuTzuSgEED4Hz5jV7nFDM6+J+GljkapzmjVla8hpr1Rcdl3lfyHBmtgXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZzCF1Oc; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZzCF1Oc"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-636d5cefab2so688232d50.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 00:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759994287; x=1760599087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWMjgmVWGYB/ktxqURYjHTxYJNRdD4XWmL+oG3oW2AY=;
        b=QZzCF1Oc8IkCvPZLtxJ334wm40kxoQx/njuNkNWGxN0fgubgH9cC5BZ1DQiIIwmBn6
         yQRY2rvO/UzrAZvEe1WqYP0CgI7cFD/muR/Oj/3wXbP+jk5S5pkL0qOKHkJyjaECjZxt
         9KrJxJiswPv4lH2HmmeLTTFFgka74k3SkMMD1lk7cvbF1tmUOMiN0u5Yz+JWorlmxdyN
         aeK8gPRgGfseFyIvHNxiav9UBL+TzTVOd7vQkWmSDfgvE5FP1FEPrl4wOEEX9oMJp0TT
         EwUQLLo6GMD+yTstVzz3b9oI5jbnE9kEqwlr2U6ouTlLji6OBfeHkUBiI6Q5W9icImQ/
         3tFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759994287; x=1760599087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWMjgmVWGYB/ktxqURYjHTxYJNRdD4XWmL+oG3oW2AY=;
        b=DX9fyyukHhyCSQF8LwBRb7jAqD94PmxXYPosrPRW7V2I2ctXFinSsaen7U58EmYJe+
         BFmVmdaYorIY14yl9tJpTkB2rd1iZjCYQea72hEscXrJWr3L4W9y5OdTnXKku1foIdRf
         PnJ0F6VKNQdhL9A8hAK9KNrkiJWPtqbNIXK51KrKkDH4xUI844jyJkkRJA3txF2gaxux
         WhoUYS0KkpqQo5U0rQ8IwuPSY1eqnrMJIlViblLYKA9qUB/z/5MKoVV23TUQG9jdN7B1
         hAU2fY16sPpCkiwjnRtWucf7X+lM9+il+3iUsavomHW/fqUu97qwYou6FDCc5uenq0ra
         lEZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpfAFwWzz86WRbWv4dosPnNBBJtflxrHsIPSUuclV/DGg1UzASRFfM4MdRsDPLmLvBFhh2E0geD68=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc/+NwB85AXAcPValdIZv4oRKbHOurTUXug5xutNYH8luoHZkq
	eUn3kdIPoYVFvTeg1zA4xmDSyeln7zJyhrvkpOUzI+wic8r1u2q3LsyJsP0ZlQlnOgrkKfoPq8p
	q0d8aOl/fB2kGvyZG1EwaGCfyz5pEm+E=
X-Gm-Gg: ASbGncs+b1ctGIrNfxNJNIvxJE92mJaRxRVtLD6YqYntHFatgPaHVmsi/riyKRcKyxU
	GHiPbnOrCQmUn1zm/lH0WcuZzDE8Ju9/Wh4nhMR/x3b8ujm/+jch3x1Va+s0HWdK3KSOPZhnCbD
	j2JP1vZhh6t7Q1tdjYN8E9T4bDR1CBL70QZ3vLGT95OCDFhpewj+k+OZgzL6bno8ZwbkgE6orvx
	N+NMyfKRNAnxxGbN1EObCNuw/7UYQ==
X-Google-Smtp-Source: AGHT+IEMPH48N3GSuwCjKzVOMOzHl1MAl1J5Smsbn+2oKCoqUAAt8XvDaV0BPh1/dqDU/ac4NYG7hKrwiOcGph5xBJA=
X-Received: by 2002:a53:b702:0:b0:636:d691:891c with SMTP id
 956f58d0204a3-63ccb940b87mr4683440d50.53.1759994287231; Thu, 09 Oct 2025
 00:18:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1759988849.git.focksor@gmail.com>
In-Reply-To: <cover.1759988849.git.focksor@gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Thu, 9 Oct 2025 15:17:41 +0800
X-Gm-Features: AS18NWBKXaPqnallh0PohHHV41HShX1g9UVlu25s1Tqjf_1cAuEzwAgqUKtKXUI
Message-ID: <CAD-N9QX8GZ4KGvdRGjptx7e8Bsa+rJtHjLQzPRNfYDPjVFOscw@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] docs/zh_CN: Add trace debugging Chinese translation
To: Frank Cen <focksor@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 2:04=E2=80=AFPM Frank Cen <focksor@gmail.com> wrote:
>
> fix RST title underline characters for proper formatting
>
> Frank Cen (1):
>   docs/zh_CN: Add trace debugging Chinese translation

When you have only one patch, you should directly submit this patch
other than the cover letter + this patch.

>
>  .../translations/zh_CN/trace/debugging.rst    | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/trace/debugging.rst
>
> --
> 2.43.0
>
>
