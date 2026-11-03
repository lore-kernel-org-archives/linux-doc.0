Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793673466;
	b=3s+EJj5sITnzWZdj+Xnba9MLbu0M1zj3QZLJWt6w61/Q+JflbesAPAsrPRY/NgHXNcSV
	 m+wC0gRKhWtYPdGcnmhp74HPxzrL4VCEIiqbwSjCQ4eN+RhyTe4nZEYyopr/5O+KSXSRD
	 OVg6o7PnNriF1zPoC2r88sTB/46RZKn0OKH8D6zZJrVWyz3YEhcljXQbEnumN1sfQnclF
	 8Bu7YQju8M0L5gld4feN9LToj5w7Zkqjzrw4njk9RGcp/xaxsUNzRsaK+zoxxY+hZhAwq
	 ZSefG609mZgHEB+3XR0RjkvRD9BTl+qjyY4uorSMXY11UZ04+Hnh1tgxRxQMMBGSSIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=aEZiUdHtVe6n866bPKhnP+/zTxBd9R2ODjgeXi2Z0Tk=;
	b=vh63+BG/fKZyMWnA8GGCYtjDFNL2Fc9H1JmowJij77Y42j3dMFtvQpGfDHyq6d8oMXos
	 trot8SLULBu+UJADhjIikVizPIaCEyfxtA+QakLA8WaarDLf50TPzkDGebOGOP28OyiRw
	 XPu4te+qUA1KjPjniNBzftzzOMdwUeDoUeLki/jgEJBJ2d8e9+DrnYTG2/+i5ksGksysh
	 dlNonCfXpN8H461apNDsmPxNVY80HIxrKMB3htfyG4MmJHKSJNLU50iu10HM3OmYGYjCL
	 MZwlcONf1E67MjkeE+GY1NONXuvBBvvZ5t1fh67+la1iENrEZpXpMbWvHraVsg3S8yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LCtrHkQk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F96D606A327
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 02:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F96D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LCtrHkQk
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-535179e995bso44198511cf.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 18:37:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793673465; cv=none;
        d=google.com; s=arc-20260327;
        b=WmbVZljRaFT3P7zSYLe8CbILR/cnbzUvyHKm4Tu5eMpe54emM+GjfiZZth9EvFUHmf
         Uahs+hvHi7Dcl1N8RZZ2ftFuWRD4TsAC5IVPajsMdzl7wANBPD4SJAoKMLI2OSvsoDd7
         WE+2dwqH5KhdBsZLVBY5QXwP/9ColyxOeh4qO2MK+MZ9roADVD+4edE3LuOzraOpOeMf
         b9cZzuUCQFX4ho17rK2ij3MldhmmgB4FK/6rM8QgcgXhb+mNpZikOxKEXG92ptZPsead
         YYaS0hgzYc7T4Ptpuwg1GSR3FGwrM8k9YHF0AgkxhiGTxvahRsAvw+WdWKBWwL3b4vti
         +kLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aEZiUdHtVe6n866bPKhnP+/zTxBd9R2ODjgeXi2Z0Tk=;
        fh=xPZJGy6fO4EHgfroEzdMOC8TYCeqk1Rlg1Xxi5eCmUQ=;
        b=BayDz2KoR0kLuPkff/MyS3S9JBJ5unbUoGO1ZgP7Qxnymkf0Z7JEq4dbjJUYQ1zz4X
         YE+E9XInISTHdPjx+AYa+j1H1PTQY4Ca6lkLJCHfgbUctpEFD+qrGzYvSsxRypgxYly2
         +aJ9hTJBcD8IGXpnVyS72fejYJJ3Eg+F1VCFzdXm+q+h/2KpIIKfDrWTpKP3Cdm5fS+2
         SBJzydxE3yj2cS6Bqc3Zj73ePgnvNcXSascpfkmx/0ZFAwJDYeq31MgT0MEYV94TnzJV
         5kohXAuMxiTgc7U3A0lexSM41wANSlWCRKY+KQTZeI8pbcRmOxLEu/tiGFmKA3CbkVNX
         SCRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793673465; x=1794278265; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEZiUdHtVe6n866bPKhnP+/zTxBd9R2ODjgeXi2Z0Tk=;
        b=LCtrHkQkks1Vc9cShisAjTrT1zXR6O1/JU2MG8G6pnGN/yPwb+XvlQRQiRBwZ9sd2T
         8+v9RZTK8VR4nxCdjRI8QiDPCpy23JOPdjE9EqctaKL3g4DA86sdxjHQ+QS+VI+H27tD
         Sj0Sq2KQtunKPPtGa+NHup2tIOfq5bLQRfPba2o9aoRgbbR03inxQmP5oIFYVz5VPLt9
         n6FAtnnnIzWSkNsLDnOdAWwFPLFnGWpYaK6ejZwfVmvbqqt6gA4AQHahrXvg6hhPVyJz
         iSaugX4vZ3NfTz9+SPDq16DDQ1uwDr8Pkj7iULljNJjQ9suBqYK4x+AfFzCDC725RwZ4
         J8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673465; x=1794278265;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aEZiUdHtVe6n866bPKhnP+/zTxBd9R2ODjgeXi2Z0Tk=;
        b=KGaCL2I1S6FV4E9s6Aw8OHg0J6Q5neRde2C8qnvoKlEZQFRRFqrK9QeL7WoVBYi4G8
         xPkel5bc1ZSrGA2U9swDwaydohwPmqtln2wy13nocH2icrfjD+8g5HLcKTa/R9422H0W
         pGoxXq8DAEmpX1lqOWQHt3eWtJV5fTYf17SioQ7EqEvE+A8ixJzy8oYL9t67LxIHH7Q1
         P0xQABEBnmBPzYKi+8lvZwrhfhm47dVPAk7qrdas6nH1ltHsS/xvXRVAyx6b7XRHlpj7
         KpmnqnAwjkqxCAeIjU83qdqNIy0sIZO12Hlq+YRTPWKZlmwj+l/XFkBFwpccly+EhJOG
         +FKg==
X-Forwarded-Encrypted: i=1; AKwUvBw1ANM6jQGWRS5Teh5lKdyEEEq0GbtuB+8Ed21veglTGLTYjt7unO3QbZAuc206VhAAs2WQVrX3VRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iy6EZEgHdH8PuPKdbYQsYhQHg+BK9QKszS45Azs5Cu7gROlMM
	StbUiKAK+PsGZz8JJ3hQjayFFqed1CM2iXOwGCbS/BrJHIEzKBadngml04I3bk3s4+z0FX9wjBC
	ghoOPZO88zxrwLQS17CndUK3pmdlVsag=
X-Gm-Gg: AYBFou2vs0HZt3BjbslSgPM7CaekgKJNVgfAWwYinVivy3QGeUoiLC/zOKg4vqWLHaX
	E2pQneMfFcy67D/Hz2uYpUD4PIp+nd0DrnGoJIJYfPRgJ/PvJQcZZ67QSeG3A7b1g3NbR0Bd2UP
	WzPT+hLl2VzL9jwCO4Wqqe7znMoTTMfIfP0hZJX0totAY5RkVXgaOW/8bVFlDDhCiIgn3jGoCVM
	dPpnoTMIcANuJhouEsVnSQsoBu0EpIBmr9SbsyLcfJUh3kbXT8qcsAhv5Owztnj2q34ORcA/7BI
	BKJgt8Uq/vkxilVhp8GHH2pMcnSK6IqEK1DDsrrvBeieJhOqqDWLKRulQNuQq81C1ULvlzK2vMq
	jZ/exI3FX/mpLfNP8czrm0yACxXjZAjZNe8tZoO+T3pvvmS37kPlusvH+lruKxbTVsvetwkdTlq
	QwRQp5QlC8xiTbhPxWLFxT60o9HqcfkhDAuoQh870OpSZn4wf+GpoaqSjPPU8irbxLBLyJGYzOl
	+pRYLTCdHX0l/tbi2Nn4kvs5YnWuPEPDpN8XXsyWQ7JnrU=
X-Received: by 2002:a05:622a:1b09:b0:533:a8fe:e430 with SMTP id
 d75a77b69052e-542b6593777mr202082331cf.14.1793673465209; Mon, 02 Nov 2026
 18:37:45 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102150757.93058-1-sj@kernel.org> <20261102150757.93058-9-sj@kernel.org>
In-Reply-To: <20261102150757.93058-9-sj@kernel.org>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 2 Nov 2026 23:37:34 -0300
X-Gm-Features: AclHuK-Jg7-xraD80qWPaNaA0iIrhVFnMpsq1hNuG58d2LObr6cS1Stfw00xqhY
Message-ID: <CAMAsx6epLXuUjaV3J0=SWAuLvajr4h58DTM9gL+LMmaCyjcxUg@mail.gmail.com>
Subject: Re: [PATCH 8/9] Docs/admin-guide/mm/damon/lru_sort: fix grammar and stlye
To: manuelebnerli@mailbox.org, sj@kernel.org
Cc: corbet@lwn.net, rdunlap@infradead.org, skhan@linuxfoundation.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Hi Manuel,

> Docs/admin-guide/mm/damon/lru_sort: fix grammar and stlye

 "stlye" -> "style"?

> Fix tenses. Split long sentences thereby imporove readability.

"imporove" -> "improve"

> +suitable to be used as a trustworthy access pattern source. These situations
> +including reclamation target page selection under sudden memory pressure.

Shouldn't this be "These situations include"? As written it is a
sentence fragment.

Thanks,
Daniel
