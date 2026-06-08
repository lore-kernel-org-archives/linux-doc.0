Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB87D33C198
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 23:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780961277; cv=pass; b=SP14IpWWtdt5Qom9T8erK3f1CW0Ny9MJO2TDAfCDCOSVxW3sUpsxOJ2jJNUVJRhMe1mC6BECEk0+U1x7O5AveyaMTYDcORR4ROxnBKqC6i/5EV5gujAsBvL5YkshkM+0d16XAG39TQQ6lcrdTa79JLUUEn0ga7visbSxhyJraBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780961277; c=relaxed/simple;
	bh=37N48hBsVSHlJ1BfuHRgKHdqsWk9adNv1YLls6cyK4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jtKnXVDXmvClmClgnFeYRMUi3E6DwoDRbCpf5jtYAo8gATpHS62klqKQB5SmUnu1U/3EiUkFbTIgtuC7qc+M0NsMZkJng1OokIUvQz35iqzYY+6ej53HZKXdiwg73xCg7eNOfl0uDdrEjX26c+mI9gjXq3ZAGBJKYAvZ8SOrZK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mH3TM8Zk; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mH3TM8Zk"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304c520fe9aso7946780eec.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 16:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780961276; cv=none;
        d=google.com; s=arc-20240605;
        b=E8vt33U/7owJZHrcHVKmuC37DxbyGdF33M2qW0S9nEhSDOl7pXgeQVLO5/Fo+yqVx+
         Cp7wcSHLFC8fMUQ/T0vGFLQmcucUz7mBfWH35dBU+kPwiPwv4hF4m5wctYiR8SqNEHil
         4Bs+Aos8MR3HfSlvmcmVy6aeaRimwd/1tk4rMsy5VL9cgAublftr/2qJrt6gPr3/heCN
         DrwOqc3VPENAyhyvt+niEN/U4jPN/meGRj2cE563UGxPtHSA8jAuin7JzQD4WXOmKm01
         6Y8ZCjVCoNa06A1783WMJ+Sg//2Va3iB1iLo+SBmf5fv1ksY9Qt0ZSiEegnOGtlMMSvq
         gXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=37N48hBsVSHlJ1BfuHRgKHdqsWk9adNv1YLls6cyK4s=;
        fh=lq0udiev0QZ/61G8fOA5N6rin6Jw2trVotHIGaZlDrA=;
        b=MslSkdpXyrNIdcB+Znzsgr5v9z6q8x5wW0CeFxiP2TPDs6nYKrfC3+wNIM8Hu5bOBi
         NAITrxpbppS28IgAp+xdZi+/DIMg5IFjWi8ehdniFRom7NSAW7WXklutSCtGjVJob03e
         9khzGm6piWt4sOrvNmRiqtkjafov8bVbn6Kry+v17OvAS1EFx5q7B60hIrkGr0OYrU2V
         LI+xamO+ukHvNWF/3qNcam9c2NRmBn34zTeY9t61KVWr2sWZe8s2xRMef3LD3zyxs7Ns
         bnk2en1kb0Og2jcq+rywWtc9hz9wg+bF3VR08mqwFkw4ZOTqeogvSYNm6Pq5d71kt2GD
         uneg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780961276; x=1781566076; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=37N48hBsVSHlJ1BfuHRgKHdqsWk9adNv1YLls6cyK4s=;
        b=mH3TM8ZkMa/LQbgaaTu514J4l+waCs5Pf/HRs6/kDuXY8YnLVbj9e90lils/q4jQft
         kkyfeVsYFm7irERhwYMZTaRTntl2ZuvXAPuzlKM2wzg97+L3cq+GbarrJEqN8ve+j3QQ
         g4y7dOleOG5PMiwiLjYAysOX3Ayf7UXRzgZ5EKhkiuhNW+C29Q3mpwztY1upe/YZxXSG
         TQocvT9Zi2Vzh+e/OR8GDYzmE9INcE2XJdoqxc3lull4hJRfLREAvosMhGkWxjg/oVkC
         v7yacluTzddbUvoaE4njq/pnkBWncAySttoyPB4MKi+3njNhgOig8b37NI/u4tMJtTNh
         82wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780961276; x=1781566076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37N48hBsVSHlJ1BfuHRgKHdqsWk9adNv1YLls6cyK4s=;
        b=QTonu9SV52Y79LqOTPvXSbM3Svea3n73jwzdTzjA9kFCRFukDvg766P8d7Q7Hdg6M+
         QeDGG84Tj9OEUGJ/R1Ey/2Yw1wFaKZUYw4dgsyj6KNijhBibPoyt6zvi/T+DhZeceMEA
         YTQBsmYJ0C6txDhVhDmlKWz9p0bvH/eLRQSZ+p3u1DcuIfNrVcAqw3ZU+27+Af1MygyP
         XjVrx4U+gq6URLRu/W1ztmY5Ev01jRti7KOLS6V1oQu5hIPTgHqFimm39dmRm2CnjDQs
         pjrW3Zw08DmCL1J87Bmhzu2w3crIUZtZ/Fzm+YB1Utye6nq6HMtgWA+TGsmIqfTHR0GX
         ZC8w==
X-Forwarded-Encrypted: i=1; AFNElJ+O5gr1hd8uVPA6wrKst+JLIISWg8glovDqEgAO1ah3g6uF5SOKckp5hL3syyBxk4GetEKemf2ysrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHspGaVju3Ut9FDgpRBc8RqzEhIfCnsN2pA7wLibXwKcNxRWMS
	ADvwFTjo96Fg0mKHG22R/XJ6iff84WD+UIw71fqHQ1WTZcAv68LOs3RrLaRx0xUvoRTXHCPuMnX
	mLC2C6ylZ1whbSk3Y7jP2hNfZasHdNrs=
X-Gm-Gg: Acq92OHmup7DMps051RZ4/y6nida7c9QE5RdhKZhZPSgtHHZ5qDe1mcMQVqfimDVO0y
	NF2Ynk6GO8sLRVH64Wge6lNMm9sPFhtzG6d7M8tJcdALlOGj+GhUjeOlNq9BbDTxHyUX1ofp174
	P8quHB4Ov8TkQ2bBiQ0os6YsBN25sX9kPo6Mga2pSwAE4xt+MfwPXYOrrpcaIBb9+5Oy5K8ks8E
	KmCwgAaSRcllDsvL0ltN45NWY0N7L/FuNPe/XMxUYo9o2Mc5yNJ3ZtgCzCSRUZh07/cW/AwDHjJ
	ERWYCTIFKQTqGSm+W9RL/X9Co4gHN2LMNvzkHdLzQIDNX43wmVQ5hqbck+xzsIjd+iednyaOW9x
	T1bsgiA==
X-Received: by 2002:a05:7300:fd14:b0:2f1:6252:f8fe with SMTP id
 5a478bee46e88-3077b357c3amr9913759eec.3.1780961275699; Mon, 08 Jun 2026
 16:27:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607234343.22109-1-kimjinseob88@gmail.com> <20260608-catnap-thinness-e25c9b8983c3@spud>
In-Reply-To: <20260608-catnap-thinness-e25c9b8983c3@spud>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Tue, 9 Jun 2026 08:27:44 +0900
X-Gm-Features: AVVi8Ce0REUbYLB0vBxw1K6HuQCVLf-o9NEPZkSMeMK0OsqgRRaqFSEyfQexrfE
Message-ID: <CALMSewLUvaYuag-8j2v=YoJQ=y9SZySrScZv51F8Ot7bdtXhdQ@mail.gmail.com>
Subject: Re: [PATCH RFC v4 0/6] iio: add Open Sensor Fusion IIO driver
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Other than the fact that new revisions must not be sent as a diff on top
> of a prior revision, please stop sending new versions without actually
> replying to my v1 comments.

You are right, sorry for the noise.

I made a process mistake here. I prepared v4 on top of the previously sent
series instead of preparing it as a full standalone replacement series from
the proper base. I will not ask you to review v4 in that form, and I will
prepare the next revision as a full series from a clean base.

I also should have answered your protocol versioning questions directly before
sending another revision.

> What does "v0" mean here? Is the data format not complete yet?
> Are versions of the protocol likely to be backwards compatible?
> Will the device identify what version of the protocol it implements?

The current OSF wire header starts with a fixed 4-byte magic, "OSF0", at a
fixed offset. The same header also carries explicit protocol_major and
protocol_minor fields at fixed offsets.

For the currently supported firmware and driver, protocol_major is 0. The "0"
in "OSF0" is intended to denote the current major wire-format revision, not
the Linux driver identity.

The binding is intended for devices implementing this discoverable OSF header
layout. The driver currently supports protocol major version 0. Minor version
changes are intended to be backward compatible. Incompatible wire-format
changes require a new protocol_major value.

If a future major revision cannot be discovered using the same fixed header
layout, or is not compatible with this binding, it should use a new compatible
string.

I will spell this out in the binding commit message and documentation in the
next revision.

Jinseob
