Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C3D2DC34D
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 17:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759513203; cv=none; b=n/xTkI5ED2F/JqibOESG/he5HkBfqWvN2Chl8wyNmce6xBtFLRcUSQLkezicW3lhIsRBCiDpt2bqEUJGy5XPaqP8PiDHUB8H96uwTQIHwDmO0IaW+lHRZN9DgydSsbIFBcVthRJy+RMji2y6Qq5BvDp2V7/mIhU+jjXYtHfJrx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759513203; c=relaxed/simple;
	bh=MNsJwzWoBFNGIPNp9zuEOLvCY9eIgUfAuWeZoycIM+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rQMER8O5GLbZoVvMIXdP74Vu6XkIArNhWWOoaAQQdL3F3yC4FKyeMM/krGVuqwiPB1CIab16Rki+EWTCrvLDGcVMcREBmWGoQFYGZ+RkKDqQwN0hoqfUusQ3ZSgirjAirs3nam/ebBdyIPe/zQVP/JIrxJrN3+gJaUyp7rbVmVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lU0irur5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lU0irur5"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-269639879c3so22515965ad.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 10:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759513202; x=1760118002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C9k4xvKVCB2PiIDViG3AgdtqSvFkeUkq+FpVkkyBOY=;
        b=lU0irur5JaQgavbwFaytZVRjXU19VZvBa1QRtE/mj4CX864aA4R/p6FB4/Csoahr6Q
         Kwd8wxlnxaDMs3CdZ2bvZGjbCqRTcS8AgcKwFEKDzJMeL0Fef5paEtPqK6apnHCEjkwT
         SEftg9d3K5Yrp5fXJg/9v/oBt9CdaHiJalR3Z8kCycdw46buPe4jO7CRLt2EWGTZx8q2
         YCyZ1ImwcO/2IMw3h1sIGvtOahsW1pYLocEpUl1bOhsnItbQW1fE75rq4o21PF5Uvc2X
         GdwDai1AUSt48Ew3a11YPvEQFyY1YdLQaoJGqYlgz83v9O8JwfCmmEpADrQyz1GbdHqs
         DPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759513202; x=1760118002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0C9k4xvKVCB2PiIDViG3AgdtqSvFkeUkq+FpVkkyBOY=;
        b=NWJ9JGTD+UH7NSv9X5rxmhA44/8JWw7tFpChCXqv6vlO73ZxiaSsPE2latmj7VC2EL
         XGYD4KWg91B/ABP27/V+TQ7cJ1XNtpOld/NEKd30VAzAxu9OEFEyGMS8mSNolIzTx/xZ
         VYVfiGj4rGwFhpVW083Ktf+NSOexs9LmaUXkQrMNRYKnOz23Wy+yCb/sDUKObOd85HtE
         v3wv+AcxuYnZv3c4t7YwnVSz0WIwUO/Id0Sf183w7lGoXN4+oAlNMPB748p22YNMTivB
         T+2tz5lM0tseeceXh8BCDwU0cAQOJT/X8+Eh+p5uNizvGibdh1GjZ8euLMcC7XDyb+sr
         J+ng==
X-Forwarded-Encrypted: i=1; AJvYcCXeZybMR+CChBPojSuZRyWhXq/E23HQjCdzlDf1KrHLx8XgtM3Uho4Q0LYoWcro3z9spfrBmJdBk90=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXBJMciQ9XiAQooRSGcuUr20rxIZhAcw1hQMLzpM9qdE/KGFVB
	4QQ0HzlbdDwUyNEZetrCyPfUk5ola+gYNzjUg1Jh7V3IGJcjiQ3i4MqR
X-Gm-Gg: ASbGncsL8xNRiS7ENUu6Va1XdgxcTuBigvl948LciohN6XD3i4OExG1oZhC/TgCIHYP
	+x7vOOT838mxhWU03w4QFRmRWpNn5I/gadoWdBz5TaShLp6/qUA12RFWsC7T/mEW8lHHFZkaSW7
	tb4FcKSOvGkBufu67W9X5KrpgV0c74x5ciONX1R3CYqAP+fhaUxxgvfxduT7x3Ny16Bgp8e78j4
	HHrl7vHdECO7AEHspFBZhvTm7Cwd8kEYBlzuwQHwiM/L3vmbYkfSDwJ2/NkcTtQSLPbbL/9Ye+c
	wFdzvVALrTRlvWSqbxHZuq+C69OnI4tzmPjdpfs+xWv5k2TsilMd28XlbWIbt1Xc4MgrZi+drGs
	DJVTpbRkng27XufAgV/9CPOTEjFD9bCi74sfJrEqchWvGnWd8EmOpAD41uUVnzSSh2w==
X-Google-Smtp-Source: AGHT+IEu0QHNMiTMz+jkJAI/HHluAhQfPRVspjKoNVy8iLjTYJPba/8/tyVedWu6dgRBe5gPMr0YDg==
X-Received: by 2002:a17:902:d484:b0:269:8404:9a6b with SMTP id d9443c01a7336-28e9a6e4d0bmr47120545ad.57.1759513201655;
        Fri, 03 Oct 2025 10:40:01 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261edsm56267635ad.34.2025.10.03.10.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 10:40:01 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: corbet@lwn.net,
	zhanjie9@hisilicon.com,
	rafael.j.wysocki@intel.com,
	superm1@kernel.org,
	2023002089@link.tyut.edu.cn,
	qyousef@layalina.io
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: [PATCH v2 2/2] docs/zh_TW: Fix malformed table
Date: Fri,  3 Oct 2025 23:06:00 +0530
Message-ID: <20251003173926.10048-3-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003173926.10048-1-krishnagopi487@gmail.com>
References: <20251003162626.6737-3-krishnagopi487@gmail.com>
 <20251003173926.10048-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Running "make htmldocs" generate the following build error
in zh_TW/cpu-freq/cpu-drivers.rst:

Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst:109: ERROR: Malformed table.

Fix the table formatting to resolve the error.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changelog:
- Adding missing TOs to the relevant maintainers.

 Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
index 5435c3928d4b..7f751a7add56 100644
--- a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
+++ b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
@@ -112,7 +112,7 @@ CPUfreq核心層註冊一個cpufreq_driver結構體。
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cpuinfo.transition_latency | CPU在兩個頻率之間切換所需的時間，以  |
-|                                   | 納秒爲單位                    |
+|                                   | 納秒爲單位                           |
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cur                        | 該CPU當前的工作頻率(如適用)          |
-- 
2.43.0

