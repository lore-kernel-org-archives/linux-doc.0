Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7959D23393E
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 17:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616620; cv=pass; b=F9Rgbo8aC5J8Ex4ur0frKj/u5pR/RTO3WrejCWpPnOX4NDlCVh8LhelFmNgugpTxubbhHyW6mTvNGdepMdzI23AFVfrgFJq9t0u9w+RGJmXYd3T6QHzUcBIOcYbrDLzdWm9bTVjbuDjaEGwOkzWUaIY8A2ll+vRYAZ3mKteGHZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616620; c=relaxed/simple;
	bh=YewI3WK0FI+k+A8vApRuZn3wTz1R19tXNTxrVUVVf90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmsxPFDACmWhT4dPgGfsalfK648Z4vSNPFl9ul3lWOfkTCQ0VvlV7ar9aFqiOXRVUkSn1bXB7kKsGHBUpk8J09k/8VFhxtHTqRDTVHz71zF+WAMZM8eZXLLsaADgnmoErvx1/B3oW7f39+QQ7vz4Sa/TNuUPHWYD/WjeDAam7+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l3iLdhWm; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l3iLdhWm"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-667bae10ba3so1567d50.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 10:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783616616; cv=none;
        d=google.com; s=arc-20260327;
        b=ViI4knEnjrVbT2iuu2Z7vhN9OAkHYQctNUk2Fetb4Od2NbkaDP+TQ71CaQDee2+gNx
         TnNvzuzAxkt0BM3eF5csRGvI8TW3N8+j3svgxASTYuyP76eSjvhMbQy16M/RE6sKy+9Y
         w3ecX9YLdxvpJLP0K3Vy00WDwAxRITzjUo7qW2fYSzS9wCAyESBlpsP1E1gErvfzS+Ce
         04d1hvMTL6/i0yygKMbhDwd0gLQiG8EjVdhAZ98y0EQSOJE5iIAfM0/KAMhhaP/8OKor
         xOApq+Tyik2i3ZfHl2nsOOD9wef4m5SQmMTeKPBaZfxpxhEn5COgJw2ZkPOiGY7GxbGs
         TyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yR14oOjUi6OI2bUfX4NS8nwAQpf3oK/jBWo0jGsJb5s=;
        fh=pTOI5XLu0VV1DDwhzmqun9c1qRC1ZANo2DpFY4OaFhw=;
        b=SKeRLRkuUOdiFXkU8K08jYrNYgDRO9feF67aUcQYQlEK/B4/q9NBCdZumPLn05ED0f
         VWD7lVL5q4umXMgVebut4ymoory3iIKPuX5Oqz5/PglL4gHlVyrNv5MfadSKcVWiuPQD
         EuRxpreBwPOWGMIVl8PrZgHc/2V2QzZ7XjhjTeQz+dMq2Wr6leU1ToEkIlTe6PQrwJBQ
         tbyadK9CPJyNK79LyVS5KBZkLVv7rgY9aVYTO8H6kbx0aSAkMPcnWL1HxLtTNOEbzSin
         Nc2Bx/QIvYhjPq/0nOmsbgVvAVaoFsUq5wPYrQhbETwMAXGCdRuSRbOK1R0YEvXkUP8M
         +U6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783616616; x=1784221416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yR14oOjUi6OI2bUfX4NS8nwAQpf3oK/jBWo0jGsJb5s=;
        b=l3iLdhWm4Lr6dqmAXx3obxcvhPOTqgHUIv8dY1C7gxY+yRtL8Vp5yTkiHFol8CtjUQ
         28Az9pmVs530WZFTRWqEykBpSZX7/fmz6n/7z3GbEl//Gra+5f8kvCieYpThdRx0u3+E
         lYi2DiqPDKNfyKV0lC6z72YlC2UUObjea40RmRXh8NjEIVgLBbDEJaov7fccpa2Dzb6k
         5zIZMdJMsp/UOCbfTPUwKEVWIz4cjyV3Mr8mlqh18Ou1O5Le5ubZuFPHq76RXE6FX0W3
         gdEvzB2+RCWeJcgPeDAS3yVihAgSZQNo0AwaTVSRgIWMsjVRwsKhfrnuWB+Hyp+CUAJZ
         6QjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616616; x=1784221416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yR14oOjUi6OI2bUfX4NS8nwAQpf3oK/jBWo0jGsJb5s=;
        b=D1WUFDE3x+IC8F0g1tlv/P8On8Y0duwu8TpzBoBmTv+nppsb2XKdSeCjAyvuQJsuEz
         EH9gqghPuEhZ5tyG1etJs3xUuz2ScWyLSF0XAyzDpcDMQBfZw5d/wdJXlx5z3nQFSZlM
         jT/6437MnXGA9xu6MFf5gSj7UJY21qB/Nu0q2cZq1pkSOhJiIe0CRxDtCuqhCKTFFFTW
         D4y7PGCrUpvGoOOekXIdxsiTCxGXpYxRKuMl1yTnt7+CIlK4nqINkTsW73FkXTy1Wy7Q
         cTD0oGqe2zzJ2FTG7Kjp9fy7UJBY+jFUpuJo4mRf/Cb0bqxyvA28UUYy17G8L8PuWl3C
         Tu2w==
X-Forwarded-Encrypted: i=1; AHgh+RpMyBwNNn4xRHjcbveiSO4mw7SztiUe4OdVzNLoRatxwPOjahMrp3hPuOoWc7ru3oR3dj9nn1u351o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzng074SEtcUIOY2JuAK7ZC7JDEcXJdZqcae7PPrJ3RCyPZ0Rfo
	vWuupyg3GkbGK+Yo609Xm0Aa8QvY/fPudaIKQqiPaWa6ocXkgeTzbx9mA+BmO2SoCteZAbvWFel
	/5LOTMqLUwb83Hibt2pRVc5dVOnyQqsVL3oHtl+1/IA==
X-Gm-Gg: AfdE7clZfZROyLUdGWUAfx05FcS9XPgbi91Y+56S2Whev2mBcxJafOyD6Sh8016JmU2
	vJUPqgeNVedxNYl+nMwXvfClzGHEg6abhEsCa9DztCevqNnw+KSr36wKWdZ0DUhhsGvC4lL1g84
	+Q79q1swxZHN2DSIHXTOw6wlMuoqj44/8K1voglpllxYZIoCytps10Kr+/s8Usof2xDqU98wExf
	KThX4zW6Y7Pj9oQ/Gtz0V7dgyvtnwpvIy12I22cYvkppp6+ZH1YX1upVkiFr/eB+do2vb9JMwpk
	Q4c79r1qsrYR9TqY4f4PNRWRewFMoKuHBMvF88g47yNnapQGftNyBGHZnlJj0QgG9VGDFF48pRE
	WKVvsLdMenYkaCLqF16NKmmCegxPqpJbdrsy21HuHPwdiNplKGs9q3/nhWBETNExVSKLjUq3dLY
	L0IooScArfBmNgqCl8PWmROQCE5IIxstC3cw9gWdft3bzMuTTSwFJt/vVlZwi/ArPWVLPZW30Vt
	oI+BdujrkkuGTUgj5rOFqHSLMpbLn8TvnjzmdCizbDKs7n2Sua0PQdsbigY+5pHq2qEWaYsnbx/
	rciDqFix49i/zb8nh+/ed7TH25vHfGJY8QyK3VR7JYH1Lu/G7v4w5ogoN1O68OGpWd1AbXiw
X-Received: by 2002:a53:5a08:0:b0:667:8b91:2439 with SMTP id
 956f58d0204a3-6679f26f7a1mr4147877d50.104.1783616616104; Thu, 09 Jul 2026
 10:03:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701091226.7SWW4TrT@linutronix.de>
In-Reply-To: <20260701091226.7SWW4TrT@linutronix.de>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Thu, 9 Jul 2026 20:03:00 +0300
X-Gm-Features: AVVi8CeGWVzdbJXgI7g1MhHGlIvtNbOsamz5SlMClo5-ZNqp3TXp_jMt7pChNFA
Message-ID: <CAC_iWjKEcK8Z2TGCAVNU+pHLO2QvKKTmA01d-EqhE6exaTKcsQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Extend the real-time hardware bits with
 some firmware bits
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "jenswi@kernel.org" <jenswi@kernel.org>
Cc: linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	Ard Biesheuvel <ardb@kernel.org>, Clark Williams <clrkwllms@kernel.org>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

++Cc Jens  on his kernel.org email

On Wed, 1 Jul 2026 at 12:12, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> I have been reviewing how OP=E2=80=91TEE is implemented and how secure=E2=
=80=91world
> invocations behave. The goal was to determine whether an OP=E2=80=91TEE c=
all can
> delay the Linux side and introduce latency depending on the time spent
> in the secure world.
>
> Similar latency effects are already known for EFI runtime services, but
> this was not documented. To mitigate the impact, EFI runtime invocations
> can be restricted to specific CPUs so that real=E2=80=91time workloads on=
 other
> CPUs remain unaffected. This mechanism, however, is only described in
> the commit that introduced it.
>
> This change adds a firmware section that documents these behaviours
> explicitly. It highlights cases where firmware can delay the kernel,
> information that may be unfamiliar to some users and surprising-or
> concerning-to others.
>
> Assisted-by: Microsoft-Copilot
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>
> I would appreciate an ACK from the OP-TEE camp that I got my little
> research right.
>
>  Documentation/core-api/real-time/hardware.rst | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>
> diff --git a/Documentation/core-api/real-time/hardware.rst b/Documentatio=
n/core-api/real-time/hardware.rst
> index 19f9bb3786e03..fb113848c2f70 100644
> --- a/Documentation/core-api/real-time/hardware.rst
> +++ b/Documentation/core-api/real-time/hardware.rst
> @@ -130,3 +130,95 @@ https://github.com/Linutronix/RTC-Testbench.
>  The goal of this project is to validate real-time network communication.=
 It can
>  be thought of as a "cyclictest" for networking and also serves as a star=
ting
>  point for application development.
> +
> +Firmware
> +--------
> +
> +The firmware often plays a significant role in system operation because =
it can
> +perform tasks that the kernel cannot directly access, and in some cases =
it can
> +even preempt or intercept the kernel.
> +
> +A common example of firmware assisting the kernel is when it provides a =
generic
> +interface to a resource. Instead of accessing an RTC chip through an I2C=
 host
> +controller, the kernel may query the firmware for the current time, and =
the
> +firmware then accesses the RTC behind the scenes.
> +
> +Firmware can also intercept kernel execution by providing services that
> +temporarily take control of the system. One example is memory scrubbing,=
 where
> +the firmware periodically pauses the kernel, reads back portions of syst=
em
> +memory, and then returns control. During this time, the kernel is effect=
ively
> +interrupted.
> +In contrast, some systems provide hardware=E2=80=91based memory scrubbin=
g, which
> +operates independently of firmware or software. See
> +Documentation/edac/scrub.rst for details.
> +
> +If the kernel is intercepted for longer periods then these periods can b=
e made
> +visible with the hardware latency detector. See
> +Documentation/trace/hwlat_detector.rst.
> +
> +The kernel can also be intercepted in response to specific events, such =
as
> +overheating. In this case, the firmware may throttle the CPU or shut it =
down
> +immediately to prevent hardware damage.
> +
> +Unless the firmware is well documented, it should be thoroughly tested t=
o
> +uncover any unexpected behaviour.
> +
> +EFI
> +~~~~
> +
> +EFI provides runtime services that act as a communication interface betw=
een the
> +firmware and the operating system. One such service is reading and writi=
ng EFI
> +variables, which are used, for example, to determine the boot source.
> +
> +Invoking a runtime service may require the architecture to disable kerne=
l
> +preemption or interrupts during the call. This means the duration of a s=
ervice
> +invocation directly affects the system=E2=80=99s observable latency. The=
re is also
> +nothing that prevents a service call from disabling interrupts internall=
y while
> +it runs.
> +
> +For these reasons, EFI runtime services are disabled by default on a PRE=
EMPT_RT
> +kernel. They can still be enabled at boot time or via a Kconfig option i=
f
> +required.
> +The native EFI runtime service implementation (where both the EFI servic=
e and
> +the kernel are either 32=E2=80=91bit or 64=E2=80=91bit executables) uses=
 a wrapper mechanism
> +that invokes the service through a dedicated workqueue. This workqueue i=
s named
> +efi_runtime, and it can be restricted to a housekeeping CPU using the
> +``/sys/devices/virtual/workqueue/efi_runtime/cpumask`` sysfs file. Assig=
ning it
> +to a housekeeping CPU ensures that potentially long service invocations =
do not
> +impact the real=E2=80=91time workload which is restricted to other CPUs.
> +
> +It must also be verified that the runtime services behave as expected. S=
ome
> +implementations on the x86 architecture pause all other CPUs while one C=
PU
> +performs the service call. In such cases, the interruption affects all C=
PUs,
> +and restricting the workqueue to a single CPU provides no benefit.
> +
> +OP-TEE (ARM)
> +~~~~~~~~~~~~
> +
> +OP=E2=80=91TEE uses a global serialization mechanism (the "big lock"), e=
nsuring that on
> +each core only one OP=E2=80=91TEE thread executes secure=E2=80=91world c=
ode at a time.
> +
> +Execution flows from the normal world (Linux) into the secure world (OP=
=E2=80=91TEE)
> +through the secure monitor at EL3. Linux and OP=E2=80=91TEE cannot disab=
le or mask each
> +other=E2=80=99s interrupts because both run at EL1 in different security=
 states.
> +
> +Architecturally, the secure monitor can mask or reroute normal=E2=80=91w=
orld interrupts
> +before entering the secure world. In a correct OP=E2=80=91TEE/ TF=E2=80=
=91A implementation, it
> +does not do this for the duration of secure calls. Normal=E2=80=91world =
interrupts
> +remain deliverable, and a normal=E2=80=91world IRQ will preempt OP=E2=80=
=91TEE via EL3 and
> +return control to Linux.
> +
> +Secure=E2=80=91world interrupts (FIQs) are possible if the SoC routes a =
device's
> +interrupt as secure. Such a secure FIQ will preempt Linux immediately, t=
rap
> +into EL3, and transfer control to OP=E2=80=91TEE's secure interrupt hand=
ler. Linux
> +cannot mask or preempt this. Secure FIQ handlers must therefore be extre=
mely
> +short to avoid introducing noticeable latency.
> +
> +The transition from normal world -> secure monitor -> OP=E2=80=91TEE and=
 back introduces
> +additional latency due to world switching and context save/ restore. Thi=
s
> +overhead is typically a few microseconds and usually remains in the nois=
e
> +floor.
> +
> +If the secure monitor masks normal=E2=80=91world interrupts during OP=E2=
=80=91TEE invocations,
> +or if OP=E2=80=91TEE uses long=E2=80=91running secure FIQ handlers, then=
 OP=E2=80=91TEE can introduce
> +measurable latency spikes.
> --
> 2.53.0
>
