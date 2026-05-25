Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F556235C01
	for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 18:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779732061; cv=pass; b=edjNt+Z+3OpxFV+fb1Fbg6jfyL7Yggmg5JhIFAclMHo0EwtYYyg9FLP5mbLLAunC7QL13Fq2H4sjjXTaFw9BEZwer/f5Yg1oobN9jtSGcBNA9gp2V1RZHpRk7dJPToOM1CVb9XayGRlAlrxrnZsKiWwYvZsuMUPkQcIYZmML4qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779732061; c=relaxed/simple;
	bh=ztWDrzYWDuLPAShDNQSj6NTSRJZLB3a5zUnawvigtZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGKMVxZdZWRC2FWIa70mfXyMgvZSFH83xDIBEhpgzrdgtTKjv1/5clRlEH8hEAMUWoPYUZIyVERdGddmJwJXVw/XtHzrroTNU2dK57R7iNGvz5l4ZKJWo8KQoPUxXaib/qfySJK+qW8dJpjUfIxLC5xNEMUN1KDmRj2rahpMsCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dpb/lfzr; arc=pass smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dpb/lfzr"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4856128f670so2110934b6e.0
        for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 11:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779732059; cv=none;
        d=google.com; s=arc-20240605;
        b=P7hMA3JDCtJyHodmeU+uxbnrIqc2eiYOmPo+KI9uP/l+v8qbZcVN2CrKnBjSkLjT/G
         QHMGgq2KsY+OOGaprsTLe8ACh4CIeB5SQkFCE7WHOfCcEX3nvoSzaGry8gGwSMjaLQnX
         ThaK4qyErwQ8xO3sVHHLWtNTCAIR5xEp96auQduCOayVClJnLr4VgdozB8BJn2QO6tym
         tontsOpPvJZ0awbcS9PZNZQpcDB9AhJeXM46NT2z+hmoMRTwDVo0WzOyR59DzW8XMXfn
         NgOK4bIaxnUvxfi+F2ylTrqaP4tmPQxWGv4ivS0wT7vxcIHmkIk4Q3kMFKgDNCWcS1YN
         QT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W20iH+Kk8aoONfJ6qFfQRSl7tdxJkdl2vaFKEEG+2WU=;
        fh=CvAoNJxu24rG0D2SJaE2994iI9FE2xtVN6/18KyIvjo=;
        b=WlIqYP9sWjCxc3zbymFibAtHycXgM2g/yZ4Yxl1PB5W133JqH2ka0hGgc43ss7CEwC
         NRxxL5SyUcHbUnUTLQxgnTdHII7zmBOhBx2U1LEWLLqx3vbmZ5Ih3rIJU32bntpH6FsT
         w1n/8CngwgVvTmh5K+x393BRuH63sQZ9INhENniG5t7+kzEMw/GhBBZDC/1+FmArDakT
         9SmZMghI+pV5C3Vd/3KN5jN+w6vXFVATxPSyZVpWLGHSB8/i4/nIxzPbU/MLluIDQguc
         sULDhKykiv4xu8Pc2ppVqgADxjmFOgVkpd0cbaBheoxmNZ0YZ9Rs8EwPiWCwq+rARhVa
         TDiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779732059; x=1780336859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W20iH+Kk8aoONfJ6qFfQRSl7tdxJkdl2vaFKEEG+2WU=;
        b=Dpb/lfzrNXmb+qxHu331zQCwMCPCePBoSkgzMaDjb8jL5W3NvUsBVNRVvvqEVl1B96
         o/TpK9x9gm+CbKXqIsQwAViwkt7947z5RzQjPwwdtaZTIa8/0nyJ3oeT0AIXwRJnStg2
         YDBrTLRbM+SXspHwRf7fj4GO5SEuj3nzLq66Ahhnb15MpcIYbH98y3EkzWE0HlsNEKmu
         kD5XbiOPXlAGHEGRHThXyXwps9/rrdz/bGkWwhHrPbIHdHnDe7jXT941v5sh+CL+RPL8
         eLhEJbyqnbnvd2QgDC1KALetXs42K2hAMe7BYHA+hYHhB4uiKFmSRDrw7jbwz3FPFxzL
         gcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779732059; x=1780336859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W20iH+Kk8aoONfJ6qFfQRSl7tdxJkdl2vaFKEEG+2WU=;
        b=pEMFoLNxB+iNhD3HDYJNb1sSJH3+FZAACNrxLDzlIJCPOZB8xo4von/Lanc0yu+YtR
         sdDthN8m0eBngL51sUJRt7cqak3rf6d6onDnW7LPVnjCOKwVLilIO+IlYqTlkiWPyV9m
         HeY+e6l72mAuAnhoB2BKf6Z2mmqt3A+G+ggpRPSXpI+M4ViKRK03COq3KcitHKXhlKfI
         rzTLvF+3pmPwTsG9rN3tqfsFcChYjlYCDax9lTlvV7C79Fb9R5WkcXh7377/ut4GBQF/
         qE/zxJTD1wNs0WyUNc/sCVgNC5YY14PuEBP7OqhJC28V7TC16wR2BWLcvM5uTiXHxLt1
         osAw==
X-Gm-Message-State: AOJu0YxZw1U6M7UnxTA+dQlRYxClNHRRZNbJCXuzMOekfu/e1f9i2U29
	LBALAYk9MTdUCYZfI1j9/6D3HsQvubDUQ6jWqA2Lq/j9Dvi3GrpVicLEo6eSlxjCfd0BA5U+6to
	FprKrSkLqziGqIzTGfet1ZDPFa1a9G/6oKaVT
X-Gm-Gg: Acq92OGdE2cSTJJ/xfGc0jeALwVOvhgfjakNsb2b6mcF5wrJqs1rmnJQKHPq2QISLqA
	cjky7c3iFaEKTz0S2i+cxi+42gxgtEFFHQz96uG0JyJfD9He7oUEuRJ1Ngu5T8OlOC3nzMzVr1G
	GEq7+U9IKWMXvy/+oHhSDsf8mKRR18DOR4pU3ifXNMu5uVT9yOVkw7+H9vHZcLkYqLogM5GZJvl
	XPnkutheTE0HTXZW4pk0x7b4KpQnrBjJrwE4VxxfwgykyknM381F3UD46I4Rsi/EeU7ZznDh0R8
	/LcnvV6eYCKQsLvyT8HmuDTQI7Hv1s4Vfynd47BiLMPR6L37jOny3pY+gEXSj6ps+LFiyOmQsw=
	=
X-Received: by 2002:a05:6808:10c2:b0:46a:7ab9:c339 with SMTP id
 5614622812f47-48549eae27fmr10157476b6e.14.1779732059059; Mon, 25 May 2026
 11:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519163434.1045462-1-danielmaraboo@gmail.com>
 <CAMAsx6fBZTSvtNcWKKQvWTXZAvh9W3GuA5ZES0RdY6gLwH8n0A@mail.gmail.com> <8733zg2zlp.fsf@trenco.lwn.net>
In-Reply-To: <8733zg2zlp.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 25 May 2026 15:00:48 -0300
X-Gm-Features: AVHnY4L6trxViAIpsVee0eLJn4qKPAQ_J9ZEOQjVVSnUN8Da7UZjyxTUIe5J8ZQ
Message-ID: <CAMAsx6d1K2CS=PtiVPruhfqvr6A4=iq1u0091HUrHppzd=gbFw@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: Translate process/kernel-docs.rst into Portuguese
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2026 at 7:48=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
>
> Five days is a bit quick to be sending pings.  You must have seen by now
> that I always get there in the end :)
>
> jon

Hi Jon,

Ok, I'll be waiting then.

Thanks,

Daniel Pereira
