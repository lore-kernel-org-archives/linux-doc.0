Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276410;
	b=WiODdb6ZYA7ZJBf/4nsdaSyo2t2MuSABZORB5gPxLEXMzB9VGOppg/3EsR6K6u0XZ2C9
	 cAtahxpM5GJDikAlUe3Xh4p668CJhE6WKzCjER8Ob6gQx2POYjoqwbixny5Rb+Y561zaF
	 w2MEMmAS3WbW9bUHopTWhoC00TLBFj86wWw3QVbU/ZEmcK2lRrInVx6ITvuPyJpYwdfUV
	 m3AcYWNZWcYl4e+luTvFsykowXz9JV3b9OnSg40tHPeRysauaZfSIdfCZDS5dBZHkeIv1
	 YHdKN+L9dl9BITmrbwd8IFlsfQopWntzafHsx8aFDyXgEGHGUtp98FhSpxxhmhpGmyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=YBgckZ7YOb7fe4+YR2v1CJm9q/fhedgcNMRGuz/XwV4=;
	b=q63F9AgO5bFOxdXGipCmGPNJVxtCcTcQZfY8ahWSXZzG2GmI5nP8de7m4ycRmKEXZn3A
	 b2ZNRPwfe3EqglwlZpkKNj9a8Gi1yR9S563vUxZKuTpqxqLp/8ApshJb8D78qnddOFfk4
	 6+y9dO3QpghphjNp9wOABSYYQW6friAD3qFYkLFCvfP/3DoZKH8yhoNBvP4Plq1q5OSsw
	 rSHi/3S6pNcEbZyfr4wcRghUqsYrUOOT3gr1cXpsuLiBzqRtxzJGhuLmHxMRXw2jEYOXW
	 6CANBUcu/o6oPiA7a4lNtDsDyIpvikChKFhJ8JMDbP34Hnb5fv7ls/Q4SWGsRe7gJ9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--svv.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hMuXKmgA;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D7D606A325
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 02:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D7D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--svv.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hMuXKmgA
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so3603825eec.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 18:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794276409; x=1794881209; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YBgckZ7YOb7fe4+YR2v1CJm9q/fhedgcNMRGuz/XwV4=;
        b=hMuXKmgAlxvjCv1tdg9wPUFKW6bfJ1nlFYZzhkjcFlWtoeLRoFqZeZFOKKqRBKuqc5
         qDB3U4AgTe5xaslef+rRLwkIGMNIx+uLKDPXYI5rSbymiGejA5zS5hl0gIQIdJjQiD0b
         uJua+RCqYfEsmPQIFbDsW38yTkARoN7EE3eQpBVch1aozOKvdPRGoV21HGCoHd0Y4UAp
         UDI6CgU9Bvc5gxfB4uvbNR+wGQboiwmAaqJ5YgF50hU31rtcCwpgwlp6EehYrDRbJ8fR
         Owhy7v1RpkRLld3XelimfhAn059UoRKE67zgeZMmqffHe0sSLbPTtJ41CXoMJP60Fs/3
         1Nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276409; x=1794881209;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YBgckZ7YOb7fe4+YR2v1CJm9q/fhedgcNMRGuz/XwV4=;
        b=VNpNOYUyGcFqlkPYNKXHNgrx1gk8/GAaFx6vzLWjGT/3K06fuDmglXskT3/FqFSRjg
         zm/vlk7iydU5+vBwh0jlsW0mwzqjFcc122B4cgstnwQLOadSMjeNX62Kgu+vMjHU0Zsv
         /V7xZZWY5VVqndFEB5LUiRQY+adc1aFC73n5h42hUW/bdwK5mI2CldXGm8taSD6UOkql
         pOda6hAX3W1lcXOBROMHJ/zXYZNQzLJ5k1X0NE3z//pNsXPf4EHJTnUNULAj14v3BiNT
         kC/9jGt3hQ20JW9JpBH8f3kK9QaPBrOcLZMD2BrkGJ/OMPmW18sCkkplHxHfx3G2TWgF
         bryA==
X-Forwarded-Encrypted: i=1; AL+hErHcfc4JzYzBMJBgGroFDuQpKX4KWg9clPES3juIym9XYb9fsNzLtFVNLPeDnFXTjdBEC7BANjdh57k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bic7awihYgioHEbn9zHTRQFCFqpd/S8QrVarQ4sGN1KITLJVV
	2U1QbyPaKKe9fNSK73yovLfplRrRLXJ1kW7SWF7a+5tKX8s6/VGZd6G6U3WVe46L3q1QsQ==
X-Received: from dysg19.prod.google.com ([2002:a05:7300:3d13:b0:36d:461b:fa1f])
 (user=svv job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:e9cd:10b0:36e:aa5c:7851
 with SMTP id 5a478bee46e88-3751f6593cbmr1699067eec.27.1794276408525; Mon, 09
 Nov 2026 18:06:48 -0800 (PST)
Date: Mon,  9 Nov 2026 18:06:29 -0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261110020632.4003499-1-svv@google.com>
Subject: [PATCH 0/3] Input: add ABS_TWIST and support it in HID and Wacom
From: Siarhei Vishniakou <svv@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Siarhei Vishniakou <svv@google.com>
Content-Type: text/plain; charset="UTF-8"

Some styli can report rotation along their long ("barrel") axis,
commonly referred to as "twist". While the HID specification defines
this usage as HID_DG_TWIST (0x000d0041) in the Digitizers page, there is
currently no corresponding evdev axis code to expose it to userspace.

Because evdev has no MSC_SCAN equivalent for axes, drivers and OEMs
currently work around this by mapping stylus twist onto unrelated axes
such as ABS_Z or ABS_RZ. As a result, userspace input stacks must
maintain device-specific workarounds to know which axis carries twist.

This series introduces a dedicated ABS_TWIST (0x1d) axis for single-tool
devices such as styli and wires it up in the HID subsystem:

1. Input: Define ABS_TWIST (0x1d) in input-event-codes.h and document it
   in event-codes.rst with resolution in units/radian.
2. HID: Map HID_DG_TWIST (0x000d0041) to ABS_TWIST in hid-input, compute
   its resolution in units/radian, and add KUnit test coverage.
3. HID: wacom: Report pen twist on ABS_TWIST in addition to ABS_Z so
   that userspace can use the standard axis while maintaining backward
   compatibility with existing applications that expect ABS_Z.

Siarhei Vishniakou (3):
  Input: add ABS_TWIST event code
  HID: input: map Digitizers Twist usage to ABS_TWIST
  HID: wacom: report ABS_TWIST alongside ABS_Z for pen twist

 Documentation/input/event-codes.rst    |  6 ++
 drivers/hid/hid-debug.c                |  1 +
 drivers/hid/hid-input-test.c           | 87 ++++++++++++++++++++++++++
 drivers/hid/hid-input.c                |  5 ++
 drivers/hid/wacom_wac.c                | 35 +++++++++--
 include/uapi/linux/input-event-codes.h |  1 +
 6 files changed, 129 insertions(+), 6 deletions(-)

-- 
2.56.0.455.g6c5a503b38-goog

