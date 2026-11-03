Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793716314;
	b=xokVdk1iZbOYJFaUbAsy34L9vnCSmhUX/6uFqX+JGgqJomUi3LdhMnZ1JuJHfHBN8Bm3
	 XLeJAw6k1pvjZ5gYmWygsfCF7ReLv83QEsRNSUWTpE51EF1KRSuNfMzWHgdTo+fqew0N8
	 nnhJrM2EzYMA+nYtzJQqAvylx73rPBLXWRt81n82qhRDFReL7NJRiHxJXfN1QMIxgTFl8
	 XVQD+3PhI4xQw4ceHkMHpByR4mvRSW2Ubi63Eu6PNfb7Y65tE8vrgpI17IXIepvJk6YUV
	 d7GZsWsCDnhTR0aGjfHgrtVT79NgvPh1H0SharsafoAjG1ii/jm0kk2OBYFQ/CfVBAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uPcJxcmf6mw0vhz7Wz+mTsgVJ6ZmoPE2VbUnpxW6RIM=;
	b=xaAUEsfrgokS0flVxSBTms/skFnDCPS2owfsUizHukYot7GCteccsN/mYtpgqEixIsPd
	 Bsfh/vrOtD3X0S6PGyLdSN78RtMbZDZK0IsNQdr4i0nuosdabFHnEXN6wMTyk/DILAdqX
	 Frf+nzAz6pqHgBhsUZkrlq3O2DFbW4/5upW7IuBT9s5aLsZaiYyuhFh3c9TNJyeQeMpVB
	 Wu4sxzWp+LAA+XGLj/jm4a9N1ol54K2TwUcrgul0L0yoEoVqfs4Zpi5mZtmiqfwt18DqW
	 b1VJVSlxvKElJgt0mm0vgi2JHXOWpMqtb3wjPEZsE9ncMaREmEWIB2KSJot53TajYzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Smap8oM2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B668F606EE93
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 14:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B668F606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Smap8oM2
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7ce77f98658so1087311137.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 06:31:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793716313; cv=none;
        d=google.com; s=arc-20260327;
        b=R4SnaG6KC1pxR4tC6unBL9+thauzW8X0DJ/YlKqnKFn7tgiC7fNM887S8axMv+0CKH
         wt4ZuLBiJk+kZMmqIsn6jb2br6HNODX3K6NI/KfQA/t4i9RjrNNSWu7cMYgUb1llpSLx
         qRZcn2h117t7VA8ojFHQCSGc0Qj6rwNOQT3uq7+Xbj2cFxtulZlpX1ptl4dy4+XpYib1
         g62U0xITub0cPR5ZPhShj8AIFfG8R7VEehxdtiG90Bro186aABz4qbRBO2cqr0Tdk64Y
         a1DY7UBukJS/M54nDjivT/wLGL9v0ydc4Sd0nEpD4kO7x4pRV1bM7ADEUVLy6udzHWM3
         Mwqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uPcJxcmf6mw0vhz7Wz+mTsgVJ6ZmoPE2VbUnpxW6RIM=;
        fh=2ckgvA2N+w3eOGXCWMqWWgZI2MBX72nFg7mymLb1R+g=;
        b=A+boxj0HM6QNPuTlgE/y1197aV0KXW0Fh363Y0d8PXCA0Wz0oRrFEgyx4jSmwImIQD
         i5cZEZQwFA9bPsD9+Luh0oyry2GPcnupk7X2zVCAMzhpZ8Ugk/TKH/MRi3JemAkAOOTH
         rH87XZnrJMzYpbG6c9kosnL9hUIqLashWMB/ihnx4fB7rcXlIaLmGouxsT7Zjma1Yb3S
         5aho1DtgPTWJZ2eT+4XOeMBh9vuaF+w1QTdKhphDXj/EE7h9OlNULLKk5+qwBE+l6gQl
         yPxiwFlFJexACnLXtpN2+fyiqov7VyKt8LiYPfY/jxBTXVA4gkvGCnJ69heJh9T+McKR
         JKzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716313; x=1794321113; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPcJxcmf6mw0vhz7Wz+mTsgVJ6ZmoPE2VbUnpxW6RIM=;
        b=Smap8oM2rjkTf+PYKTVPK2ndHEELHMqi0tjCUI7riN3MY48HWBq4D/TdHkTRGNcaec
         GyHm10XgVNZwwrVPvboT/hDR+bWUe7CjR7ns+sDPd00oIbJ2bI9xld+L/ok9/0vDzk0H
         AexPapi00ZZpvL9tohtVIJvcNwyJK25eb8gLP4RwrUtxEH/SqeXg+P+SaioEGYKqZTy5
         AtUOhygCwyPst4C2310sKGT87lvjNf/Q5m0c28RlpRyK5gLNDq8mirv1Vv5tqt7aqfAI
         12pHtThiefiNdvxI2d7cqsewhDd3y6cAsbTIgPB4SbzZtR64mtTf3wsznFMClB80RCUD
         a0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716313; x=1794321113;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uPcJxcmf6mw0vhz7Wz+mTsgVJ6ZmoPE2VbUnpxW6RIM=;
        b=bqFNE6hUjFzHgplqfOfpAQPi0vdddDe1XceygbNNCMHCqQdJZSBo0Wjmh2j8R43bs2
         ISF8627xSEbg+oQmY5qytN+Tv10HsI5JfHMGUPbwA9CBGqV5c1ok2uQHAOubpI7MmmH0
         K48MS7g+ftpMSPNNK7Bqy6tMHexntAJNgvct/lP9m5bV/fLInwPf31VqI56rnEEU4MHE
         pzitKYbga3n/+rIh2mBVCGLj2ajOUYY5zzzlZNpRf2zMoboKu1+474eJHpBPcWbdTPzB
         1BB96d/gydDPKdnkk5dVGNN1NcCDf4mklXllCLAs7FkS0nKOpP7Hv7tWHbG1IK/v5F/Q
         uqag==
X-Forwarded-Encrypted: i=1; AKwUvBwLAXA1y31L5w3bMNi07+O3/8E3+EBn/bD+tD+hJGAiChrgozblPGxhVHLLEjDWpDXnKNvti8rOJeM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jDkmTcRm/kWRRWR/kkhxwtHU7tQtPO5yXPZLXbVNBDMc0CTfe
	8ILwActOBClezhq5THcB4XhDXRAV3ooHbKv2oiYqWzpoC3KSDZ9pgPEjd90LasJPbMVvjE/B14n
	IOWJwpGF4dWsZJLEFJ6Pr6RiZa4OrJTI=
X-Gm-Gg: AYBFou02SlNBqRLWPxTxAma5w2v2x8iZnJxTo2HpqutVgfAW7eULcz1Vy/wyBT7ny2F
	4j/wYE7qM9WKFfiWp9was0dAtZcY3sY7rjX3yKDbogMGrbma5RBQbwDQaPHmoWU79rtbSo6xPIA
	FdI5u+zkniD5OnCy2OZov7SJrPZqpQsuBTtKtg79TO8P9XGC70N9agHtZPH10n+XFOJ8ZeOzzxN
	fGA3W+HAfDMfXX9CJMintG63rdI31QOkEAC5LgmqQLzpoDviXyAdo/BZPY9GTx5cHJidN/v5fUc
	HF/uMwqT+ffUeELBF7P61s6Fe0QW8h6RzZSKrvnbtWOSFY5F3+uFVwiR4Eub8h2DMxvU6v6VssX
	3gaQATUBtKWxSKkWVcorllJ+fle8KOQSH5XTJUVky2X2nz4sEVuOkpPfavCwbwyZj5n2+142Tgg
	mR/aTswaBV1N1Kcu14KbdjOHG57nOR6cXkk8IwYfSFfO69dZtRrsO4dNJIdtY1WqLCXMNupa+0y
	9Eiks0dEt8t1C6HvxZlcHk=
X-Received: by 2002:a05:6102:fa0:b0:7cc:118e:7bfe with SMTP id
 ada2fe7eead31-7d072626940mr4818312137.19.1793716311133; Tue, 03 Nov 2026
 06:31:51 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028033127.82193-1-kmehltretter@gmail.com>
 <20261028033127.82193-13-kmehltretter@gmail.com> <CAMAsx6e0fF5mwfruaK7e=uHehVfjMP=Cy7jB_Z_e9aXTk-yZPQ@mail.gmail.com>
 <20261103092458.2e5f6f6f@gandalf.local.home>
In-Reply-To: <20261103092458.2e5f6f6f@gandalf.local.home>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 11:31:39 -0300
X-Gm-Features: AclHuK-_rxqavuwe2tcDwhaMYrtMJgJquiSsapHbqp3XF--B-b4Urs6Hv6vh7Rs
Message-ID: <CAMAsx6cc6NFi-iHU9QLptfpoCY+0QP2V+CkpwvPL8Uxx_EK1PQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 12/13] Documentation: entry: Describe the
 pre-counted hardirq lifecycle
To: rostedt@goodmis.org
Cc: kmehltretter@gmail.com, peterz@infradead.org, tglx@kernel.org, 
	bigeasy@linutronix.de, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 11:24:58 -0300 Steven Rostedt <rostedt@goodmis.org> wrote:

> On Mon, 2 Nov 2026 23:39:28 -0300
> Daniel Pereira <danielmaraboo@gmail.com> wrote:
>
> > Signed-off-by is missing. Is this an oversight? See
> > Documentation/process/submitting-patches.rst.
> >
> > Also, "Assisted-by: LLM" was removed from the docs by 1e035297ffda.
> > Maybe describe the tool use in the changelog instead, see
> > Documentation/process/generated-content.rst?
>
> It's not a requirement anymore but there's nothing saying you can't have it.
>
> I personally prefer the tag (even the old one where it said what LLM was used).

Hi Steve,

Thanks for clarifying.

My main concern is the missing Signed-off-by line, which this patch needs
before it can be considered.

Karl, could you please add it in the next version?

Thanks,
Daniel
