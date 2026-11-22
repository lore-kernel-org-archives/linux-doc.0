Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307723;
	b=AZqTG5dwURSS5YBXJ8AmrWRrelhISktCdj3XNu6j2jqox8mmZaY0BHI0YghcaZLqACTO
	 Amec+JZTa5LG++NutGV1QcL8X5ZdM0wRnZJchW/NQnnyn2wLr+rDzQctfrwb1ve3yIX+I
	 YZ4KcVGHFDcjmBPQSMD6/3VhBiFAMUCJPhNZg7lxi0q5uQE7VKPxyM2kBtOMEf4xat6lq
	 R8dKYJPMX+gjfjPcZoyvBQ9Moh9gtj8OieJbE6u5M7hVFTD9QFzBty68x08JLrScxivmn
	 VX33Wp+I2K9RUbhyEKSuaKixWfftEr7W3sQVdB/F7wP1/aYHaa3CYCCNIqtvN9Jm2hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kjaMl1GYSNrUShVsKdQDcYu8vOCY8jN+h3QDwdEh4x0=;
	b=NOcHVRAg9BBMinjyNawm6Dp1eae/9JdzKSgUJi40fBm3zPEg0lBOKl8rxq+sAgjiC3d7
	 iLufgkta+pOQYz0qDlvsaKTe9QRUkMPdzesrqzdpYC1g+ViJTzX52s5j8XT3l1Kyn3SRD
	 eB37gJM3I3lbBC70N4fIO7SFFR7heZWdznseiZo1SxEUF8JGdN5l8+3wLKGhWdJZAN15Z
	 z4e2fcpCTSEpLfLCnhzMBRlAyaDA8p3LIL1xKWt2LYNbt9SGrPtF+QlJjjQ/A2GF6RL9J
	 h2aNC69fkgIirK2rAQSkIwYqLFvw/ZcZU5z1lOwUUx8R7s4u6Dsdrc99i830ezA9Zhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7OdNw8u;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC80606A337
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 00:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC80606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7OdNw8u
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso19406415e9.0
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 16:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795307721; x=1795912521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjaMl1GYSNrUShVsKdQDcYu8vOCY8jN+h3QDwdEh4x0=;
        b=G7OdNw8ubMfnu0UlmljrLYczxmam37Hvlt7nwb3a7fIYbFNVpqqckCTvlyUy1f4gwX
         63fw7LL0vzy3rhl29hr2xbMTePxVpQvdpxLddNixhyBNaxZ45M/43wRuyMv/1gdQgFCy
         ylAMaoojgKS69rcL33985uN2DvVtg3Xsf/hOI+B7tNZyJL3Mq0WlmBWQV2R87SbI0NKo
         jg17r3X9bdBEPbNxBUheGepbPqBX8ql0Kcfa74PbzAVoEBOpxgXSDTdXx2sk/m27assf
         jICviUjUsNVIg8krFyn90l/h5CgnJnRl3QcZOZIZQnzCIEEwuff/PMsKrATRzfZqC/+t
         YtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795307721; x=1795912521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjaMl1GYSNrUShVsKdQDcYu8vOCY8jN+h3QDwdEh4x0=;
        b=Jwf1PYc883dLlmq7vIfKwMoHNCWc7RDOLTP+E6PxwFaMzWdFXucLrOvMIZrKLOjjCc
         yVWLT3aHKHEw+tB5u8naX7Eb5Oegoti/6Fwl+PYC1n/KQN05pbQadgC711Oq5yiwf6X0
         WZzVjhta2/2EO2a1+6U6ERVakVJQVyu3QoJm6Xn+Z0imocgjKtpU7JS+KynC255sOIbc
         A70nWnbbanFqW0zUZrjSPazk9+QIj4wGk+Ico5bY5LUllsquVPVKAuILjvqePvqA2vKj
         kYtnTd3W4FDYPvmo9HYUJ6XUrqJhHZMpbv3zS1QBRX+HzeZzpEpENUGQ8YvH4P4Sb/RB
         OULw==
X-Forwarded-Encrypted: i=1; AL+hErEWGwi7/0hK4ZFlbA7bbG8NsV9qpHyxt4KRdk2Y997d5oNKKBAOtJks090kYmlGcz+mMdqI4Ccd3pE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PGtJMBWQFfA2pqsMojDvm+J1GsJZxqEvDvJRFb8IzfaEjWmEm
	tiaxIke4FsZuUJo87JF5pCBuz6rS+FFJPJSjLMx6ugOgfHbcp0avRTSlYwO2ug==
X-Gm-Gg: AZFdTZcnJEdfEuZzxyHSHzvROr0N9rqgZbJfqktZLgM93jhvwvUNVMKwQO+Mqv5uIjY
	NxDvSBB95ddo2UQaUiOiDRwYoJvCuGahYqyViQGk3EMA3khSYeosOGTMmaRczTVbZf7wmnuMUM7
	w0cOQIJ7m231LvfZfxeicVSFUKC2X+N2Ma9bqk50/aR3WujuUpncp8lnSJyh9+Ig0HLAU4wCAkQ
	CQ4OCNJ6a4L6ntyXL2Z5B4Xt1Qf/G+tzOxE7KIvlq+UO1LxUW1pDezeMvHDkWhWFgQ1ynUt1Gmy
	Vo4u0kvo1q5BUKMo/0rtHXJsQ5vnugc2B4eKr3sPy5XvhgvKbdQ8Pg6aZ1eTSH0eiaB+ZTIuTlD
	w4pFrsPNkzA/6eZVpSoRB9OJHAKZl9IHQ2vEZ/hVfzfvykhEm/atLOWuxF6iEuQeAHoc6XktZeB
	xiLDqS3wfg+xVo70BqjTPs3LnrQa0ob7Xdg1TA15JXG8k7hPOqFAqPsTx/wK7dF2lsq88BwA8DR
	kC3c4PJP+DrF8czHie5j8UTtG3PNsM2Gd0/Ii3BQ9fS9cxfw/3b0OVZlJAdoevgFzmqeAYmMCeK
	YLytRb/RaBLIMtwch5f4KvOKFvAoZOdsKCJW2CTvGn7gmaiaJBLCDQWGYnIAYQ/XfUFnchs4idO
	4KiJTCdz91xMRVf4jxhcqEC/5mfl1VU9Tnx5QrHK14BYfiPOQQ2qvvgVWxTF1es/msCyx96z2P6
	5EQx17uHx7xeVHCwNBBgbm9dIz1olm/GaSpYb9mtMxF+dGm7DlmuQAYiN+hX2M1Eckr8KjO1IRY
	fANrw43MnvaYFa/iA==
X-Received: by 2002:a05:600c:45d4:b0:4bb:6994:abf0 with SMTP id 5b1f17b1804b1-4bb88817d91mr170289725e9.23.1795307721109;
        Sat, 21 Nov 2026 16:35:21 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-2025-a95f-1d53-595d.rev.sfr.net. [2a02:8434:fda5:4201:2025:a95f:1d53:595d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm74017825e9.5.2026.11.21.16.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 16:35:20 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] tools/bootconfig: Preserve tracing settings across export and replay
Date: Sun, 22 Nov 2026 01:34:57 +0100
Message-ID: <cover.1795307698.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hi Masami,

Thanks for reviewing the earlier bootconfig fixes. I found two more cases
where a tracefs export loses a setting when you use it again. The graph
depth is exported under a name the kernel doesn't recognize at boot, and
an all-f CPU mask is left out entirely.

I checked the rendered kernel command line and exercised export and replay
on my Ubuntu machine using a tracefs fixture. The series is based on
bootconfig/core, including the earlier CPU mask quoting fix.

Thanks,
Eduardo

Eduardo Mucelli Rezende Oliveira (2):
  tools/bootconfig: Use the registered global tracing parameter names
  tools/bootconfig: Preserve all-f tracing CPU masks on export

 Documentation/trace/boottime-trace.rst   |  8 ++++----
 tools/bootconfig/scripts/bconf2ftrace.sh | 21 ++++++++++++++++-----
 tools/bootconfig/scripts/ftrace2bconf.sh |  9 ++++-----
 3 files changed, 24 insertions(+), 14 deletions(-)


base-commit: 0ad31c3252d4c626a93ae6251340ef86b18342d0
-- 
2.53.0

