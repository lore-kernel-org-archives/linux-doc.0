Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715339;
	b=Pdz5ql2QrHhVG+XELRZZOs5LnoxudFDcWDFZbzewo+b+Or/qbXQnFwZFUleT2cCVxDwA
	 WpcmL1UZi7BEwCllGN6nGD33TZKeUMwe1tWCUQr11P7xvGUNABjgk48eZ4TBhZ5gRN9IN
	 9hcHVW7FbMoLOQv1ZkhuS0lU5EqNMhSVygue0bYnJkcWYEGBFrOUcH29ZYkcxzwiuZh0t
	 b76L3E+5hjFd5uB2OlXvSegD0BRMSIeIVAkf9Zs9+affFwaDjy2uPcIYH39kTzS0NXX2Y
	 /TixYMBgL4i8qb4Pd/zRGxE/nYC5nHjyU/gXjyvKHUcFTk7o+EIv7OWSBPzc5SD3TkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yDWpNrUsXpotQ6nNGJk4nYnh93lFCeEGbbdd70BhOpc=;
	b=hs8rz6wKb1cWreabyVIzmWgU+/1z7dJmneA+KUV4/ooRAZfGdXnZyOv/yhVSgzoEgycR
	 B6inUGdURHhKWV3jdPBpnggL/M/MLQHmdWfRJop02gHJBop+qArNYO9mbWJJRF3rzkMcc
	 jQDxacIe0V7FZcNKe51y3FD4/0b6jSeToXE1pRa4tpqzWXLY3iqb7slJ5DQ7yfmGHd0Db
	 +In57dQuZe8poHnIM/Barajr7ZPNYg/63YsS95t+5gxsZjc5JEm6ieJ0WLYcj1K5Gb8Rv
	 pLorONoRtOX+h/fY5SKJjnc4x5pH7Y4BkCYz0nnuy7IHbB9AOI9Ki/XObM4VFOWsi+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hUOlkfG5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06983606A327
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 14:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06983606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hUOlkfG5
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be47aa555cso3879107e87.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 06:15:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793715337; cv=none;
        d=google.com; s=arc-20260327;
        b=O844ymWSmfkEfzQR7kAjIxSH/01DcoirGD/pANbNz/CMF0TcrrfVDIWUygPYTjJU5k
         TlkdQMqOBCsPfT0ZqDK1nTCx1+AkvXzIDmatsmVSLpRs1K0+xzQScu4tQxJvC0bKK1S9
         TFProDV3o5cuU3h6jz280FalQs4E+qNk6Yo1AxT8vUgWTs6VR30P8TI6gwFvRMsXVYjT
         i6FBTFFnBcfnegkljRfTK+Vt7SNlaFZUnhnxFs7qCLL0FVmZdChy4QnvNtFJqeRZq68I
         SZc7GS9xIfSnHgS+I9gX5KUzzIe85hnI7eMyuHwoBLwTTWDaKZaaXLoYqvOb5ME/7fXb
         7JSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yDWpNrUsXpotQ6nNGJk4nYnh93lFCeEGbbdd70BhOpc=;
        fh=sIl1U1Ab4ZoMuIcxV+q+aR6ziPZORqcZeSk4KYlTUk0=;
        b=S2VbFSqxIB86seF7w0w/wKY7MnST4HXRF7+tU2qFJlIcobH+4D84yQ/w5MX+1XbaWR
         GnIkYL13pbgRb9ejdO9kKvESdy0SZY3cMfrWECtod6RdzvDqQiIYohZoB4G2zG9zzXf6
         af+9a4TYpLYa1fZvA91VR97Ltjh+Ayj32NM6mOLCnfisbMJHN4ydNvgcp4Va6pCRwfTT
         e0KcxC69GFWfi756zT0nYar7s7IrcylcE0QJc0uJIiwZus4H3rtrEk15zEkSeIJG8fZo
         la/47T0B3QAat20A0JmQcj2lKt7VlKU0ASGPK9x/VjmlImXIEfbVMpfOJX186/TvULS0
         SGDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793715337; x=1794320137; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDWpNrUsXpotQ6nNGJk4nYnh93lFCeEGbbdd70BhOpc=;
        b=hUOlkfG5WAMcs1RconWNpTny3UWvGBRJKYPQV6YB0NHk2a6fzbaDGT2sr2+zJg4h29
         JVJ5K+cjpwamivKJIic/018tnkPjWwOVO8qxkzxZuT6FCpmYyIEprc64vIwx9FwxRBZM
         ciBMVX3FB5b9syVFwH3aADqvk4k/+I0WLahTZkG51GFYrbPYy32g+7ked9ewIZkBJsAc
         m6EQu6mOii+Ulm/shipEvCO0e27F00Jgpvix3FlBFTxBs85FG90sWB4014WevUtKKTvo
         Qiypq3AVWk+DshEj6fYkakDsw+Y7a3jB9hLiYHue8PSw/uuIS9LVcILHghTxFym8HSDE
         6VBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715337; x=1794320137;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yDWpNrUsXpotQ6nNGJk4nYnh93lFCeEGbbdd70BhOpc=;
        b=BCP+5vuLnQ84hUi30jdOmjs2aPEw1RSroailFRBuuCjNk544GgnDTEW90XORSEQucn
         KBsJ/zOC+MhnsDUCsO8QYJlYQ/1Uz538Uem2tUPZiFXpf9iehn9gQNM8T5jaS/8YihIU
         GVzb3GU2bXmVsMtTECfirsPUc0kBPfFT3vy5b5Ax6dPzbFpnuYHz0JM53DeSwAxR6hcD
         /2GZVahjN8al80LplvMbF5lcwJPJ0U+2/+AfMF5FqhU4hgvhiJSHZsOI84pKZzcBoMOB
         iuo4FumCvm1Yq+GS2EZEuDWUDD56pjShBjcLZeKJ9BcZV2nrXFojTbAnfQq8d+/FuWUj
         0aSw==
X-Forwarded-Encrypted: i=1; AKwUvBwfYvVYsfc871myD7I772Y15+u6E5C73L2hTohLyIhXfgM8IWNG2B5kvOrPRgyiV8AlhIOchTz6AbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PJ7i1I8jHnrOiEQvIGjXKd1ZTjen2cEYuWu6sG3s9ck3Qh08p
	ryEQ1KLcLC2uNOJDocSmMp38XknqT2kzzKlMhBKWBItzRgLxNadAC9p8TFjWO5Y5C72n0IqKMfa
	8aeZ2RRGVeRNFpeMKF5zayPzt36HeLj1sbA4hgeJFKPDQ
X-Gm-Gg: AYBFou05x+QuOXto/U0t+rBVuPQvF+ju7+L7QErXVQqQ5PBStB70EChTE/ZCMoyi+Ji
	C4JD1q4+ffG4Nygc2kibLzHj9HscpjcZ+s+GJ2PuCa8EetjBfqvSWuH/vGMsWhds5/+tLuLXaGq
	lfHrF4A96L+VpXxITsDloi/J6baF6oiiR5JsOefOTaseWoOHt145HvMGrDMkWVvVQYqmKTpxeFm
	CBSO4xGWE1VI13tXTh/ZMzwqPXZ8R9YAQNifbmGa5AETFX8F7HooruPbYw7Klz6MfzV8hG2npqJ
	hPH07SikPWRTI4MY4nzDCACX3EChlVpFPbuTWF2XxzIG9Zy52sMiogipo4CF/j4nP7uQH9tNAvk
	8gIntDCMUc4sL1xlOkhqNabmV0QmzlKyUBiS9/F/UkW88nZsFbzVXmkEjQHrUbBMUgR7KEnS7NO
	W/tMgxd++jUTwleYetoV3H0kBCss0Rc5uJQNmFVcp3Le/YmgFVvQ+/kXslRjnWYr+jFmMjXWPCZ
	fxh+QN6L69y1DH9NQ6yL2o=
X-Received: by 2002:a05:6512:6689:10b0:5bf:db9e:7520 with SMTP id
 2adb3069b0e04-5bfdb9e7553mr2538316e87.25.1793715336819; Tue, 03 Nov 2026
 06:15:36 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it> <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>
In-Reply-To: <20261102-remoteproc_virtio_map-v2-8-26b300e01c62@valla.it>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 11:15:23 -0300
X-Gm-Features: AclHuK8cFyqPPDbhURLrOci--cGby4Nti8tUDUPWT8TrjwRXBOSlhnxIc9j5uBc
Message-ID: <CAMAsx6dogk20pTtpGaD_Ci2fam01UuUEe3KXDTH7UVjwRBRqnw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 08/11] Documentation: remoteproc: expand virtio
 support section
To: francesco@valla.it
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 01, 2026 08:28 PM, Francesco Valla <francesco@valla.it> wrote:
>
Hi Francesco,

I only have a few language nits:

> +supplied by the remote processor should be marked as dynamically allocable,

"allocable" -> "allocatable".

> +try to allocate it using dma_alloc_coherent(), which will resort to allocate it

"resort to" takes a gerund: "which will resort to allocating it".

> +either from the first ``restricted-dma-pool`` region associated to the virtio

"associated to" -> "associated with". The same wording appears several
times in the patch (e.g. "associated to the virtio device's parent"), so
please fix all of them.

Thanks,
Daniel
