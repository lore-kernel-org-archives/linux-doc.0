Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9F844CF34
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 16:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782750488; cv=pass; b=AE7tn1mMkwCgAZCuyE9VC9iTkrtpPOsOMRBnnSEg6D2FmgzbOn4wrykoMVUejy38HQIUo7548L1+1vhtSwV4pmifMrXsG7S2rOH9zZEYnK53v6b+RHdV4il4jBLEvRWVO13U+hnXjtm3E7HKVRCLEtrIVPLkkZ++tDktShhfyGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782750488; c=relaxed/simple;
	bh=f3Ydu9U2B8nV7R2Vpyp8/5o/pxh5j8YUPxzD36rae+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/ISddCv/dEYYuRnhyDq0KFQH88XycZea5FznMMvRfGzNA7PsblEoYTiYavL7PftiO+PXIHhPOcYQ+x2WoQdKjID3fMQ8g7e8Qm+FH3wxoSxibGbdiyX16AtXOi2gNl7hqOUzudpIUQbCg8ysgzAk9h2H35HmblKIB8x8lME3Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCvhyoe5; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCvhyoe5"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8dd21386a9aso37661816d6.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 09:28:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782750485; cv=none;
        d=google.com; s=arc-20260327;
        b=qS/Jy6M6QNWqNmEPZ+SPsGGrfx/Ft6yKAPpEKEQvZVRVM2r/K/y5DiHAfMqCbC8Z04
         DNYPLvD4WgnsjAc/WPSODFsJmF+rKb9orn5onEVNA55peNQVbOMzMfcUq2E23vv7xPbw
         qi41z59Tqg8QITcz0H3/5TIoFNGbbL+4ecp6kvsGiJOfuNJntQf7gyqlpep6sNY4BGQc
         rGKeDSWpa4mlyqsAfBVMR8Ac0NipCYkeRIxsX8tvLLmixUUnTalFx8wctnEbTgug5+9g
         pdzEuQ0H7BQYf9Yyd0J86sfpBCJlaW4+XHvIk5v+iPGCNmaA9aBXUpfHd3CdpfGANsRl
         dxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f3Ydu9U2B8nV7R2Vpyp8/5o/pxh5j8YUPxzD36rae+Y=;
        fh=CvAoNJxu24rG0D2SJaE2994iI9FE2xtVN6/18KyIvjo=;
        b=bACVnxxAIdC2T/otiPX4M7Zb1gTJ8HQAshz4G53OrYq2r2z/1tMZ2kcaH4sOVBIu0g
         KAWCKEj5BHn4zXTyzhG6GSj3eBUDIo3boXB4dZ27tH7FxZyyfH8SzxnV9s4/UkzBKThZ
         GrnxGIHXY812c+9DF1yNGGwPg/aCIuCDa+AgiDhiyxhEQWdp0m1mDxqlVW4z+uEjKsgg
         hDE2vDD+ExtWqvVo1e5tWr/VCB3lCTqJIOJIDUDAdrJ051Y/qqwL5eA6PFVsStIS7hf3
         9GPGoD4b4UTToQ8TmN3acsnOljkwWIlaLjJBV/GiaNjtdZljAbtdFp5Mm6CUTxpHVXDj
         WWGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782750485; x=1783355285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3Ydu9U2B8nV7R2Vpyp8/5o/pxh5j8YUPxzD36rae+Y=;
        b=rCvhyoe5k8swqElpYqg6YQZR91IDA+t6cFzIGmWt5nztGXRfjKDoopCT5BubvEhT84
         OqCwQHpnqvEP3+rjJK4kDoUMg/W3JtkyFo2gdvm1G55aGoylawXI5tO1Wr4QK5AXMRL3
         TEG+sDLa2R6Jm3PtZbGojDDTkhT8F3fEEiK39UnglvpVQryKxY2foqQoKuo9FnEem6M0
         fRcchj3fr5+NkwqcbKydqFd+bkzaua1rgvdZJSeX2pH4TK0gJyDcC+4lZ7GKCnWjRIiR
         8eKrz4jmajnDl7xSnWzE70VNuhs7YuBGywfiSgTsv91WDFMp9QnwqQT3kQ9U9O9pvgu/
         CHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782750485; x=1783355285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f3Ydu9U2B8nV7R2Vpyp8/5o/pxh5j8YUPxzD36rae+Y=;
        b=RFjtMQxHccRUdU7GrbxmiPVGYfH3HvBHKbbni3M631Ti5CzoLaLWi8blaGwYYHndVI
         DtRfw/6GZBmfHI79sA2pyG7fy8mkoUnJx6QxoqFTXh+qYCbhfiPaYVCTV+RV/Vnt8AS1
         vI1sabc6a0wOuVJ4+Oba84lsKlUWMPBIycynrrsQhGOi+xVG+e+5I9sgTbAItdPxnb8v
         cylhLVntnuwdE3C5utqPv7T5nTw0hkYFrir5VaspiWHCf6llMxWll+KkFCAeeGkPiS5Y
         rUYsyW/mhO94I72Iv/hqeyhpOrLofRN2pymlelfSDxueY8jkeQJ663L1RHzLC3l5KyHS
         VdcQ==
X-Gm-Message-State: AOJu0YzEinLFJsYAXen2S2TcW62e2pkeLl3U7rYHeUjCPQJctKbcd2nH
	3OxCUIOJ5b9EQ8yrXWkePhE8Xial6ZpOZeE8vWVFETku65c9TcEiNsBntuyyhJODIjAldYvLQn5
	pko8qnZwuGc0Emj+uczOl0ZNt0jajces=
X-Gm-Gg: AfdE7ckAkx2XrD3kN+4Ld+A735bQduBYylWMkIiyna5mAbnRVbBcJs6cliw3DYlsRai
	70wBzJweXSCqIY6nTCctIbtcc08fwFsNOehbonLWLUy3L22XEPfpRVML4p23/gQgCgNDD61sQ0u
	znkJmmxRGPtNJ8njse/ABTaW+vlIavUODquurV+iYt/EI6ToPbqeYoGe11osvHfbO9UYpjAfrh8
	3q4bt1wN4gHpBvo7A64x7dsuyKu0+jyTsCqpi5tRIngyWsEOCEfQig61FiVuKtB5bYBeIE+ScT+
	/r+UHXPGYW2gjzv5CbRX7eQXlBeeQGYq+HwGWQ7snk0wYHaswPWO9Y4j/RW9BQOL9VnB6fQeD+x
	ODjZrvJu7
X-Received: by 2002:a0c:e086:0:b0:8ef:3f4a:51f3 with SMTP id
 6a1803df08f44-8f1b8b7ceb3mr316356d6.12.1782750484653; Mon, 29 Jun 2026
 09:28:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614235044.42810-1-danielmaraboo@gmail.com>
In-Reply-To: <20260614235044.42810-1-danielmaraboo@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 29 Jun 2026 13:27:53 -0300
X-Gm-Features: AVVi8CfNe0qjOrtWnM-uYnNY45a7sLOQMYEGzEIz0yspYWXKFM97vgBTiVWB25c
Message-ID: <CAMAsx6fOBdRKzf8S7Wf3k5+y7K3jrP4-kszC35iuXX5L_FaUiQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] docs: pt_BR: Translate coding and posting guidelines
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 14 de jun. de 2026 =C3=A0s 20:51, Daniel Pereira
<danielmaraboo@gmail.com> escreveu:
>
> This patch series translates chapters 4 and 5 of the kernel development
> process documentation ("4.Coding.rst" and "5.Posting.rst") into
> Brazilian Portuguese (pt_BR).
>

Hi Jonathan,

I hope you=E2=80=99re having a good week. I am just following up on the pt_=
BR
translation patch series I sent a couple of weeks ago. Please let me
know if you have any feedback or if there is anything I should adjust.


Best regards,

Daniel
