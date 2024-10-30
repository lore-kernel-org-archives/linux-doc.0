Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B901BD9DC
	for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 22:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730326174; cv=none; b=Jp6bw8JyQIVlWD6k8PUSB2TaJLRBYU/uwjRonyJohcKrbSSlxDrMQIT/hk7PnkYyDhU4yWBfBq4ihR/2eluAlKN4jGij4z73cOpMguB1BRjqS4e0tR3IX587nD4g8aNzNfgl25xHXfm6IY/6Z4YrZgsQlppPahao7m/ueoCcfX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730326174; c=relaxed/simple;
	bh=Ltt+XpbOguZtHhRaLk0cqD3UhmeBc7tolLZVy38OA/M=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3WF3YAoHe6mk0sw22MZKS8Urb2U2ehPYtOTtMNWh0cK08TEJOSHjn0hipho3sIAQPWCrbP4Pttg2yB0oZUtT+yMQw+SYyRCqApG1bnzzQP6+mwuq29uTws8aAGclUvoCrHUfyFo7obeCXaD2Xr9/Xi3FnQhYFSCzOGsdL3cyg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=1FOUuXsc; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="1FOUuXsc"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c96b2a10e1so482638a12.2
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 15:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1730326169; x=1730930969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6+DBVSPzDCfzgckI9Hf2ncvKjBb1Zed+3V8RCmYtGgI=;
        b=1FOUuXscxDTDgW32c6HAh0EAyBSgIEcdvMPpthkd6dM8Ow0CueGZ84VtxryvpU+UNz
         VyttD6wJiEfuHxj+wF5G+AlTzQ0JRP41plQyr/GezTMYKhSlWVTNLCiPGsZ2P5FkpcqV
         AuAv+9IJDDNiLe55NezH+8oc6qBuTSc3VVOdscLgfkv+XY5utTSJkPpbKTvCWFW3PPK1
         rFtWT83QB8QlH0kOuEhRdgZBN5+wsmylOv+NWWUlbk8TGuzUaviEyMr2UQkYEXLolWfj
         spqZDHtW+YWMnTh/K7M/u6yjB14RANLyoyh1eJ5/bqXG0EQm6GE9TLMeHU7vt1OsXgKc
         01cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730326169; x=1730930969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+DBVSPzDCfzgckI9Hf2ncvKjBb1Zed+3V8RCmYtGgI=;
        b=fGr+vtGhi4UBKRz5u5uuZjB6pSOl3Qcj2HZo+RN+vZooR/hBr1m7fdjB8Q4nHwB7X3
         l1bAsCvrSgDcR7HQbnCGm4oTGDphLBWfQr4P+loie4IQ1rxxOQCYlazaoOPjHTJPBSpb
         NocbE3riVAuUDGxtPB6ijUXg1dImZCcalO18SaSFEI2g+etfFMFaGDXcjFJjNVAANmUx
         12mVL2Ol+L69mcv4/isCxiHce/5+WSo4pZdZ1oLxVCnohwwk/FSnpIKBvjpKMRTWGWdH
         k0YUdX34RcyRlfbjHj9/mfKPPyqhzJYeHIt11oIYcH17RiPwFJ9tNqRdYnRVreQOVOaa
         oHwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqj/2ddVaUdats2QG4eVcgZgH9KRhsuKOaMg9HLneSbfZxzTwoO6LuU50IlLJmY+lmXFJnzEgR0QU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8uwBjMsxM72Y7RBkWTYnvTCH9NRgcDeb1DjxmVLuni9r99Xjl
	XIvWc4oJD+BKEyJQupxDOVnlHduV8vedzvYOpeS69McnSESTWLmKxSHEPvB3RLl1OUNPg6wTOlk
	jWaeFT+LZ5Qmm9FcjQFjObll0sNn6TXug3E9CahOdsmlVUVw4iVEN5318ScgCsHfKgXXGm/Sn4h
	666U1D025xJPLnEhhx41RS3u8=
X-Google-Smtp-Source: AGHT+IFNLkuBk0iSxb8AnXq6Mo/o2HQPCizOUnh7XgQgMnbveMrAhTQAkzEgMArbjMWP4Pvn4l3BNw==
X-Received: by 2002:a17:907:3f9d:b0:a9a:1160:993 with SMTP id a640c23a62f3a-a9de5c91c9dmr1827906666b.8.1730326169278;
        Wed, 30 Oct 2024 15:09:29 -0700 (PDT)
Received: from admins-Air ([2a02:810d:aec0:2a54:78f0:a911:7b11:40a4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56698e06sm2683366b.225.2024.10.30.15.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 15:09:28 -0700 (PDT)
Date: Wed, 30 Oct 2024 23:09:25 +0100
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: rdunlap@infradead.org, pavel@ucw.cz, lee@kernel.org, corbet@lwn.net,
	linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] Documentation:leds: Add leds-st1202.rst
Message-ID: <ZyKulcUCW3kk1AYX@admins-Air>
References: <Zx0BKtXo55D_pCGk@admins-Air>
 <0ae13ad4-342a-48ca-bd7a-8f15f6d99504@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ae13ad4-342a-48ca-bd7a-8f15f6d99504@infradead.org>

Hi Randy,
Thanks for the review. Addressed all comments.

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
---

Changes in v2: Implement review comments

 Documentation/leds/leds-st1202.rst | 36 ++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/leds/leds-st1202.rst

diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
new file mode 100644
index 000000000000..72286a512c69
--- /dev/null
+++ b/Documentation/leds/leds-st1202.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================
+Kernel driver for STMicroelectronics LED1202
+============================================
+
+/sys/class/leds/<led>/hw_pattern
+--------------------------------
+
+Specify a hardware pattern for the ST1202 LED. The LED
+controller implements 12 low-side current generators
+with independent dimming control. Internal volatile memory
+allows the user to store up to 8 different patterns.
+Each pattern is a particular output configuration in terms
+of PWM duty-cycle and duration (ms).
+
+To be compatible with the hardware pattern
+format, maximum 8 tuples of brightness (PWM) and duration must
+be written to hw_pattern.
+
+- Min pattern duration: 22 ms
+- Max pattern duration: 5660 ms
+
+The format of the hardware pattern values should be:
+"brightness duration brightness duration ..."
+
+/sys/class/leds/<led>/repeat
+----------------------------
+
+Specify a pattern repeat number, which is common for all channels.
+Default is 1; negative numbers and 0 are invalid.
+
+This file will always return the originally written repeat number.
+
+When the 255 value is written to it, all patterns will repeat
+indefinitely.
-- 
2.39.3 (Apple Git-145)


