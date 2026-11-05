Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837362;
	b=ZvPX+EycCGqGJTKQ1vGXhYj37wT4emSdlQYGVZomNGksnQgL2Cje63PwW6bxVkszqCdq
	 jT6WQ+pUeVzRv2vJZNnIgY5zQ8L6t3mPpa6vwEa2q+9aYEN7cXV0nhlTw3ELDc3qL9F/q
	 IIhpZ57ze8Wd2obNhXZx6/SOOt2Qphuxsk/qyNIFwGgq6hfbrZDFx3NBi3NK+KnjcNtQi
	 fPsJwwShsrNbfK3/1XJJWgmtxQEX2qurBVCJJo2dsaeRuLDrTpVkfhPQ35fJ100/3nwaL
	 v0rSZ+wjIDPvm8ZT1lrw6AMZHFtMsJrapOhUp/WrDeo0rTxtaqJGfWHFadFZUb3/amw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vIwsFQ9mq4AE+G3auhIPcX8ZrPg+4PCX1f2mZBFZYXw=;
	b=Y4CETmRNIyPjWw6/fndfqXFC1VWqAvmAJ5ZNfO8dpQ2jmzwjdCmphdh1gFY2yL3m/Wdv
	 x7rPYluE5yxODibCzLSZ2m8itMTscH03DvGdknwzMEfsdsHutgcztpJVJbY1RuuC/F/RL
	 ydmTR6H+U6UiRsxa1OnsDCEuF+81drJvDO5BEv7TU4RXrTAAunUCs+Orb14E14lwfl1F3
	 cg1hCeg3VV9dc1aTRcUWKmQ/9k+cuiNx1p1yZrqcpfbOACmzLV22hikZTfG8d9HULW1tI
	 uCg8OrEAAY42kCQk/odxGFCw/AhXw331I1uxuSacIEQlP81CTixUE2lmLtCLlA5mxHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZNLgfPbH;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DF7606A32F
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 00:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58DF7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZNLgfPbH
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0afe09854so183372a91.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 16:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837362; x=1794442162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIwsFQ9mq4AE+G3auhIPcX8ZrPg+4PCX1f2mZBFZYXw=;
        b=ZNLgfPbH7vUmYfIeS9V0roTfzAAefwyXv0a+VKA/+NezG3VMXCTqt/w41TWm2V7ye2
         v6JhDIsU5BB+OD9P4libjsoLfnr85WDlefj9L2sBhcdXrNPZUWiWIDjWC/HcBYLjdBum
         sIOW+6+eZaq6bPwydSTBRK40gesxjKFo3fcBjIQCRmBPutlP/EftFTdPspj6OzXG6Cx8
         w/MoRgtDoV6JppMpu/WqrXJcg599Xuf19Ip1da7/cLHXvX6Gr6i8ti5xH62iveYJHzGC
         WSbAZeTIIEFYMSMyLHx3JAb9RONTjCR+vHXfVrLQXyz+8pQowrKLDmn8Mv6n0J3ldINb
         rXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837362; x=1794442162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIwsFQ9mq4AE+G3auhIPcX8ZrPg+4PCX1f2mZBFZYXw=;
        b=HMCBM6BIu+YmUjhkcn+Y8QH0+lnbxUOgDnENdauNHsX14WHSaAyHxDSr9mSHS0nu6n
         hU158WIEymoMwoOegEHamIJXDw9plKN/eZewkyAWmm/oiUl4W0V4Ox2YDoJcv4k00Plp
         svqo4Bza/I5Llx4eSAfOzE2OqYdmT8RiY+aKz7ReOTQ5Q1LulhDfMbkmTMK1LJSg+C1m
         jMiZrrXfKDWctmOJCfT9J1ahc7qZg2Y1fktA6V/1zuUARcXwYg676Ndj+TNoNvYa/lUO
         ApOICXTcxVRM3DVs8A1hs8ymhU/BvOSgng2T6hrv+A1QvtXUKKb1PSGfayN3yLq9F1mY
         c+hw==
X-Forwarded-Encrypted: i=1; AKwUvBxA2JncgbXTUhE4d67GgUaIrbIStii+vyBzqn393j9tBbLUsg39zYwNcFOkvfPAPnvRBZfnCG7PSKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z99S8nR1ELg99nn3Ra2RCcFUsPr4QLUWalUJeXg2TQ3a3a0cCLV
	cSq4EDJGbGOrTJ0HhBMyMnjZdf561z5byeZHsHwzLPVcaeIN8NXrnxCRwtBDfQ==
X-Gm-Gg: AYBFou3P0zWXLd/DFVssze03fdCv8m+SL74YPc//iJ4lhtQOHdRsFx0HaUTNnLlx8NN
	EUzfscmVk9G6KuuC9hIUP6qLKEQDKrHjqhs5kFLDZDYG9RpZXolV8z8M1dzODxLbXEQcXMjV2Fq
	GzV4dxwidJXOXhc5Ki7Kh+ohRKdA7qUOBwSoTL3sK0sQvThN+d35JxmAzUxexSMLtaQEIr1qqJv
	yKraVyyj7GRJdCXZgOPpItIxVL2rlpF/yqxemBefbrmWcyaX+lv2kUfkxT/gXKGPkDGHrTZTjVE
	ibhBvzOd+kEnWbwcvguz78C25Cp1bHlBdHD2LDK2IIuLp1j0sM8G5OqbRSZDg3s7sC3WxINz1un
	4hjQHukG+V8OvRfdN7NrTppEExlcRxTmQvxeRktkrXWUHb87IDi1quz+75z2L+mIc0kb8cvFBNe
	ddCKPj0cIBRa5sh9lgaor+pVWIn4k/+5JeaqQ6fFmgkJPrGYxGjyap7T2WL6T/H7KWi/eQwEa2y
	uOrsb8J2OOzeX3S/rz+r5p/AEOmPE7unpgd5P9vW8nwqYyyqW5eptdjAcWWoV5oyTaAmAC0Z//+
	a9uQ6zVYBsDunQJLVA4sJUGBpbpQt7vR0Z+/JCKJFGlkiKB9knJm95CQO+P7+hf+sVEZpy3HMPP
	rWlCjEs8y5rk3AMvl+vBs5zN0lYRAHRzgmW6WYVgEPzFYJbo=
X-Received: by 2002:a17:90b:2e07:b0:3b0:9e2c:9b5f with SMTP id 98e67ed59e1d1-3b09e2c9e85mr2639557a91.2.1793837361622;
        Wed, 04 Nov 2026 16:09:21 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:09:20 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v15 00/12] ALSA: virtio: staged capture recovery and PCM ACK handoff
Date: Thu,  5 Nov 2026 09:09:03 +0900
Message-ID: <20261105000915.15177-1-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Takashi,

This twelve-patch series replaces v14 and is based on
a4311e9447bbb219044db38897f95be112f46a8a.

The follow-up closes a PCM ACK race after the core clears stop_operating and
before sync_stop finishes. If a substream is already stopped with a transfer
XRUN latched, playback and both capture ACK paths now return -EBADFD before
they can re-enter the XRUN path and re-arm stop_operating. A transfer XRUN on
an active stream keeps the existing -EPIPE behavior. A capture tail remains
available during DRAINING when no transfer XRUN is latched.

I reproduced the race in playback and capture. In each baseline run, the ACK
returned -EPIPE, changed the PCM state to XRUN, and re-armed stop_operating.
The candidate returned -EBADFD and kept the stream PREPARED with
stop_operating clear. The capture comparisons cover a synthetic stage-04
fixture and the real virtio-snd module at stage 12. A separate instrumented
stage-12 QEMU run placed playback ACK in the core sync_stop handoff window;
its production playback ACK functions match the candidate source byte for
byte. The tests also checked the clean DRAINING tail and the latched-XRUN
case.

All twelve cumulative stages built on 7.3.0-rc7-virtio-next-kasan. The six
ACK/XRUN race comparisons and three ops regression runs completed with exit
status zero. KASAN and lockdep reported no diagnostics. KCSAN was not enabled.
The stage-04 fixture logs include ignored notices for five module parameters;
these are recorded separately from kernel diagnostics. No physical-device
capture or suspend test was performed.

The harness leaves behavior_passed unset, so the reported behavior is derived
from the guest serial markers. The attached evidence records source, build,
image, module, fixture, and serial-log hashes.

Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
