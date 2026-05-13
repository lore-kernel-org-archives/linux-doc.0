Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261DD3A9DB3
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 18:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697368; cv=none; b=KUqyHy5P3FHd/WLsTE53yYYVRHA6YHZjfpBurFO9+mwmahQYyNcBUmAoMzKckPVve1f316ROXDDd90/JxnhQ09tanNcUaA99NyMvU7MGBp6Yhab+FpNcl+/LCavAE8/OZjAnZv0/QG329nIuot7jpwapisRPsK0INQwhf1PQdGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697368; c=relaxed/simple;
	bh=+TqM+PtcKsHz4Xzb0T/t9rjYOVVf8Wg55mJJ72MLd6A=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Subject:
	 References:In-Reply-To; b=koGTdTXP0tZZH9H0R8XjNNYW2HLrMTo76WrpTXWsB7j7+Mn36t+lT2gLbK6KI/Y48l3SYMhXpsPeLOsNtz5ggW+bXpyiNg6iKX9ZvRxe7swPbK6/I0s7otfOAor9CEDbHV+XE338kf9gHq4XQBNRFHHhFtSxhzuzhRvHhdu5v44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ZIKMEq8x; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ZIKMEq8x"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-90eb7a63a30so131908885a.2
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 11:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778697365; x=1779302165; darn=vger.kernel.org;
        h=in-reply-to:references:subject:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xmWhw8+BzycLbCZdUGo17yGhh7wc4olKhqN+RMzekS4=;
        b=ZIKMEq8xkGrjNG30QC3AIMbJd4ZWWAHLxvfJ94Q6RCyNGZd9fwLroog1punB40QvFw
         h8KizRwT7DCSOqhahlu5AoaV+rubVpQRLjun/HFcvoTThml4QjLWlRQoJ5hnpDsmTHE/
         Gv5QJwFxNbvZpBjI46IdVB9Aao7868mlGoIKkjM5khsE8oQ6T9Ln5Zg9TYWPUXmtcW8V
         vdYwMl3mbr/4A3Zr2aXuX6gpQOzHHZ/+i0IgjYz+Y0zCB3fwyhxIT0i2WmCRsL6dOeH9
         /9fDED+mzZLL5XvzHn6CW3wb7jj7pt1a8irMpLgDj7cT9O0VSwV1DbsmhhA6TU4UJ0CJ
         EMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697365; x=1779302165;
        h=in-reply-to:references:subject:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmWhw8+BzycLbCZdUGo17yGhh7wc4olKhqN+RMzekS4=;
        b=Sr6T50D5x0DgClmF+as8z5oSQVP8Ea9ItncdXegBaIJUkybLD9KpwOAg4ABGqvesx0
         LwtVRXIOTqIQCQOghmE9qGW6a1U5U9nyxchKWq7rra+rE1tG47DXQ65kyo2IMY0VVVfZ
         /7Ua29FAZjqYsuBQMtJvV9UIn07u4A/INl7W2bOKSUUxEBb20kUBBMjMCTEX3zYPPMjC
         bCiDHcz+NhxrO0DexfITdhqfLaDadD6bklNqGktioJxt7HgrlB5c1wheLsUh6URtbRm8
         vS+dvQmkn3H/vVCeXV9vekDGDZikyYEmA7hAE6iQ91tE29UTHK4QLHqWt1HpvrB30lrJ
         uldw==
X-Forwarded-Encrypted: i=1; AFNElJ+BWOxyuou1qxqajisopDwamh6Hobzq02mhisRbt8NyQzRHNS7o/ks52+ddnw9vrCRm1Fp2z9uijnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOvfHyCONwPeL0DtiwktW6pI+CI0qhlp2dqi4v8M6Vhw9wJTF9
	o2t8osp5/rv9tgHmE5CgsLBvzaZjD9YVhu+Q+Uvq0s4GuiKmxF42EDYCgddsqsbV+g==
X-Gm-Gg: Acq92OF29l2O3V06vJRAVgedokcy4y1WRzfojdZ8/6UTfwdcjMKDpzCng2vqtVECFHt
	50zynrfg/eJ/zNGDFbsojJpkzmye3Huz0va3ByT0eb+kj6h8jC2pCrdVbA+8kXtehA50hOgnXzn
	N02I4MRlBdvoUX26MhJ0XRm79N2i/eaOOkNHl2Vr72f4wNaF309NYH1E4XvtqKfSit2S5AZLKeV
	APaAFz7s4zeIvWk7ezfovYOr6TOyUevCAvmJiZMFCxhQb+dcP5FWduOFWKy2zJwqGzwGMmUNwko
	StUAQ9p37VIWhsQelq16wc6i2Nqm0Z3R0sEaSSczrltBCTu/BIcORZkdi5qLnKQjqiBapNioBqi
	bVnRG6B52wqapXD2fFVB7p/JKXxIU9usCsRp6LJ+fL+5q4MFjKQvQy0wcMSlgUvrrAFLaq51VP4
	czxv+Wa4YTwO2hAENeb6hkvDYawpXCu9nE+PzaHyfYwjRM2i3UYY5vq5ll6+/344X6omPi
X-Received: by 2002:a05:620a:290d:b0:90b:9dca:2187 with SMTP id af79cd13be357-90fad385651mr655950285a.38.1778697364951;
        Wed, 13 May 2026 11:36:04 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bcf3732dsm28874785a.33.2026.05.13.11.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:36:03 -0700 (PDT)
Date: Wed, 13 May 2026 14:36:02 -0400
Message-ID: <64548a3cec806e2080ce4515777b4a39@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260512_1604/pstg-lib:20260513_1343/pstg-pwork:20260512_1604
From: Paul Moore <paul@paul-moore.com>
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, "Blaise Boscaccy" <bboscaccy@linux.microsoft.com>, "Jonathan Corbet" <corbet@lwn.net>, "" , "James Morris" <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, "Andrew Morton" <akpm@linux-foundation.org>, James.Bottomley@HansenPartnership.com, dhowells@redhat.com, "Fan Wu" <wufan@kernel.org>, "Ryan Foster" <foster.ryan.r@gmail.com>, "Randy Dunlap" <rdunlap@infradead.org>, linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, "Song Liu" <song@kernel.org>
Subject: Re: [PATCH v7 2/10] crypto: pkcs7: add ability to extract signed  attributes by OID
References: <20260507191416.2984054-3-bboscaccy@linux.microsoft.com>
In-Reply-To: <20260507191416.2984054-3-bboscaccy@linux.microsoft.com>

On May  7, 2026 Blaise Boscaccy <bboscaccy@linux.microsoft.com> wrote:
> 
> Signers may add any information they like in signed attributes and
> sometimes this information turns out to be relevant to specific
> signing cases, so add an api pkcs7_get_authattr() to extract the value
> of an authenticated attribute by specific OID.  The current
> implementation is designed for the single signer use case and simply
> terminates the search when it finds the relevant OID.
> 
> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
> Signed-off-by: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
> ---
>  crypto/asymmetric_keys/Makefile       |  4 +-
>  crypto/asymmetric_keys/pkcs7_aa.asn1  | 18 ++++++
>  crypto/asymmetric_keys/pkcs7_parser.c | 81 +++++++++++++++++++++++++++
>  include/crypto/pkcs7.h                |  4 ++
>  4 files changed, 106 insertions(+), 1 deletion(-)
>  create mode 100644 crypto/asymmetric_keys/pkcs7_aa.asn1

Merged into lsm/dev, thanks.

--
paul-moore.com
