Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205169;
	b=2PRFHNe/h/Aa9BroutQteaAy7HpZ9V1hQsYwm+c6pUL3crVPN5rckUwcF0JfX65HSDeq
	 4WORNZenzpmKYCpimCbZgCFj3So5jbbQKEos9FyF953Y5KNVt5hUPT8fRsiGRE7clu366
	 nMlPC2IwLt+rcSUyzrJIV5+UhCL7RrFiMbs7l9g5+H87/UkrnlQdrz5uuLYzTow16xfmR
	 0AOvhVsuhu+yZsXlJ14QBhu6Z8aNX4Ry8yYRUZIJZ07uvANkQ8uNldnzaBUL9AoefZnxS
	 BbzGOTEA+rexR0x+gaicyhuiMs9RQi5eEVpR4g6bJH9KGeB8taBcIZWYk+/q3Wq15YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R00ordqkFY/Q4J67BElD5gXinfK7jxEiPvEKeWad1ok=;
	b=a+rFfD3adiZ7rgL2GLngoeKOn03K/WKWEVgyrjKTr/DaLGJ5yjDI4cND/jSxLq1uRfW4
	 y1Gex62F1+uWjUCImkJdWsnwpMaU4IF/0aFnSurpVScnbFP4/dRc+tpRMUMmRseNaOtw6
	 8G/IoxXmClQLuu9k/jsXALVK+BfC3EHV80JTIwj08jextuYTpyXS6gBxRB84yygySyOQp
	 /Fcwwn+zoYktpLLKrGv6BTPHazGho+OZIGkbioPezZTb9iDkIryLJh/8gIjbh1IRJs4+q
	 VuaIDGB4+m8xsiXK9v+m03imKXMKlp8R9T1uJdAe1Ery0vV8nnTRsmiaAGc7LhlI9Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fielding.dev;
	spf=pass smtp.mailfrom=fieldingdsp.com;
	dkim=pass header.d=fieldingdsp-com.20260707.gappssmtp.com header.i=@fieldingdsp-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eXbHX832;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89A9606A31C
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 16:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A89A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fielding.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fieldingdsp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fieldingdsp-com.20260707.gappssmtp.com header.i=@fieldingdsp-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eXbHX832
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c46822eefb6so152484966b.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fieldingdsp-com.20260707.gappssmtp.com; s=20260707; t=1793205167; x=1793809967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R00ordqkFY/Q4J67BElD5gXinfK7jxEiPvEKeWad1ok=;
        b=eXbHX832eO7KCEIcf9QIePPynNTj3zpEb16xJdYbSQOpkoowvXm2FC7H6N9IvePrjc
         NYQ2YsaKAWrn2bA552yqC0m4jx9nYIEsJ+kAosssFdnCwTnhd1wrP5purilJVqmg7IW/
         9PyvNGGsC/J8INfibywsqgTj/qEsPfMTfKHOw4dM8efcKWBLZMUAodnHQ54JjxrTf6rN
         cUXimDERsjEyUBueSdi1MiLTD5lh4jvrY5h0wazj9l3ROl/0fZ8OLDTM2Vd6t6/kkAK3
         OMu88H+ojqLazQ53GiyqfkVyj8dVS6lmsTdc9R8SFLBxu3UN0Fq7XJUuj66hC7CQ5WNn
         GpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205167; x=1793809967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R00ordqkFY/Q4J67BElD5gXinfK7jxEiPvEKeWad1ok=;
        b=MfCUfEFqC00EcwBePjubZH5OWDMPDMVWxKV7gLx/vPeQYlUKFePIyCNMg6PkyS05q1
         RkQYeLJkJs26DOSD/7aoSc8t6MESztveAjpwULEl9Yah7LflDh1CihyVYS7yJOXtuzYt
         DHB1NpRtd4Q8Oxc006AgjDeutsgKiXEkGHsLGhy7FP0Kh23ZkoKJGI4KpnjwoYy47S+J
         8wbq9ROZbCu4rNvLZtR1f+A4I9LOPe5C488QK4RpL81hluVDAs+ieZhui+3sE/e+sjCX
         A9E5GZY6F6d5mjbvuIV03ss8LaEkMw3QvL7eVb3pU+R8P48LQz9Z67Q6aB3RSrqhivZu
         InCw==
X-Forwarded-Encrypted: i=1; AKwUvBzNqd5x3CYWVV6Qx7g/AhBy/OYDS0KoasSgqJkl7yaERXr68ZxpfgGp0DoEcVNDId5ZQIiQQzy4Z8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKsQQ0wJtJ0k+f33Ty4vjcflAb1W+0tAAGQrGUwH6k2UuHSX3y
	0QzS/xBxXQKw9FATZm6Uualkm+7+wPSRWdPM9ZAQ9z2A+s8jRdVjDXo6nI4+GRjoohA=
X-Gm-Gg: AYBFou3wXCGf9pPeRTg6Hl3qTEBLpilCYHnxyOYCz+C6vsVunW4/rgbG6HJVdqivVAY
	j7RHDM6gd/v29vu+z+C+HWo/EDRIvhIpxMd43FCzX3a5g7fYz1Zt//3yZng65AMXlKSHWADobYi
	SC2386uKMaXo3hDTV7biNLRlTWFGTu33s+T2lfupa9G6Kb2ffm2MDmvfWHXz7FMDSSsa6KsLluK
	x+h1IynspZgGPQ45+M4zjVxfBiIMyEFa8fWVuiDkY14zTiWOrgSZTj/T2Km8dMFMfpVKybN24/l
	1wkn5Vbjg47cZZHrfap3S6b1HMWLWt/4ceTKaSPOqqoRLHlzQrMfARbnL9ruk1J0BbLkZ6KOPbA
	AI2azkX8j0DSU0p+2B+ju1xcl/jw3ZwMdlkPoVVKgGhyJZygZ0NSQzearldZEBZuZxt1tfND6m6
	yFJ8EbbpSlrYmEZ3+kbcz3o7zGllfdpyr7EkdAifYNdpYDLC9Svjg9pMUg9l4sv9ynJBYZMcu9t
	sZi+5Ng3NRsr/1U6NsjXrNFjlbYmQnNDl5B3skM1djXsLaZutPSGjx0+M2XEGIAAyY2Kv1yao2A
	69yM5v0QaC4H4tP4fJU/7KVQLU5p7ZiSAOH8IObaFosVmc6gJmzhHsIQJ8vh51qIQVTj2AuDrGG
	hHVSCQfVbsya/vrECTLsZQa2JCxob
X-Received: by 2002:a17:907:2d25:b0:c26:19de:9aec with SMTP id a640c23a62f3a-c49bdfd85b2mr258903766b.43.1793205166976;
        Wed, 28 Oct 2026 09:32:46 -0700 (PDT)
Received: from kneiselgnabe.duckdns.org (p5b03fe53.dip0.t-ipconnect.de. [91.3.254.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89cesm637108266b.13.2026.10.28.09.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:32:46 -0700 (PDT)
From: Fabian Renn-Giles <fabian@fielding.dev>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 00/23] ASoC: qcom: AudioReach Active speaker protection for WSA884x
Date: Wed, 28 Oct 2026 17:31:52 +0100
Message-ID: <20261028163152.26892-1-fabian@fielding.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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

Hi Srinivas,

I tried this series on a Lenovo Yoga Slim 7x (X1E80100/Hamoa, 4x
WSA8845, Linux 7.3.0 based tree). I found one bug and have one open
problem.

1. Over-read in audioreach_get_module_priv_data() (oops on topology load)

The function allocates
struct_size(pdata, data, le32_to_cpu(mod_array->size)) and then
memcpy()s from the topology blob. It crashed on the first load of a
topology containing the speaker protection module config blob. The
cause is in the size computation. data[] is __le32, so struct_size()
counts elements while mod_array->size is in bytes. The allocation is
4x too large and the memcpy runs past the topology data. This is what
I used instead:

	size_t len = sizeof(*pdata) + le32_to_cpu(mod_array->size);

	pdata = kzalloc(len, GFP_KERNEL);
	if (!pdata)
		return ERR_PTR(-ENOMEM);

	memcpy(pdata, ((u8 *)private->data + sz), len);
	return pdata;

2. Slim 7x bring-up: V/I feedback never reaches the DSP

DT changes for the Slim 7x:
- The WSA codec list is extended with the VISENSE ports
  <&swr0 10>, <&swr0 11> on the left pair and the mirrored ports on
  swr3. The speaker nodes get #sound-dai-cells = <1>.
- The static port-mapping is <1 2 3 7 10 13> / <4 5 6 7 11 13>. On
  Hamoa the din ports are 10 and 11, versus 12 and 13 on Glymur.
- I cloned the CRD topology and UCM, using 4 speakers, with the
  WSA_CODEC_DMA_TX_0 VI capture at S32_LE/8 kHz.

What works:
- The card probes and the SP/VI controls appear.
- Normal playback through the SP graph runs without errors.

What doesn't:
- Calibration (Operation Mode set to Calibration, then silence
  played) times out waiting for V/I. R0/T0 stay 0.
- I read back the SoundWire master and slave port registers, the WSA
  macro SPKR_PROT TX path enables, and the DSP module config. They
  all looked as intended.
- With the SP graph active, the amp stays gated and playback is
  silent. This matches the calibration never completing.

Question: is there anything Hamoa-specific on the VISENSE path (din
port numbers or channel masks, the macro TX decimator routing,
multi_direction_codecs handling) that I should check? I can run any
debug patches you want on this machine.

Unrelated noise: SoundWire parity errors/clash messages appear in the
logs, but they also show up without the series applied, so I don't
think they relate to it.

Regards,
Fabian
