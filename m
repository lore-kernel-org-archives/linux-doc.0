Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046FF344D9C
	for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 22:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769639605; cv=none; b=PduGqfQqby7GD8PoBPoyUiyuwr/U9q59wii2dhOwBScStROMeAIhlsa3yjcPwGr4IZd7zHyQEOMW3htv9+CIpG2qIbcN98dqOiSFC8THpM1fhkJl6p0CGmlQJ4tLkjqn7gayIKYXa2pkYL3e8xVi+7LnQX8raPLp7yTkegfNjOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769639605; c=relaxed/simple;
	bh=/tBnQTjEep2ws12SiZlf0MTyXA2SNfUMQKmSH5r54mQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=baSTNf4mSUokOiIBFIxKg3PH6bMSyDxOd8dQ7zE3OHSvOMiDdTjK+3vMb11bBWj/VDQegByv69jnDdoxvgGu0M44mpYx9FUHbqJwkzo0A8NeBX8V7d1gmK+7dnMaTL4cspDP4j0Obb6bNSSrkRwFbMuNXBMKj1RHRR9FiKDQgec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjOcwbZ3; arc=none smtp.client-ip=209.85.219.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjOcwbZ3"
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-89469143ebcso2900486d6.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 14:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769639603; x=1770244403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Twb2Mn6eFSbnhF2U8WEvYnbtdTbNFMWzq+PnSQfsHzM=;
        b=DjOcwbZ35dEqtdcnY2MIvRdP1i9OAzh6+Z1ZJwQ3XhNaOp/Ffg5JRiTxZNN+NhAhjj
         KEjaPm2XYakS7uGazCodEtZ4xqNmhMFXZBeQ3Cs/JcXmjBGGU7sBOevn+2Fe8tQf+6ZR
         xnCpyf2UUxNh1yM+8dhGzTg8NllaU56nfC7WQu3o+rlbS8uodl6EuwTySI64B/5O55ML
         j2euDpqriIjufIbjB21N/Zun7tCDWHpPG+ncllnnoegS4/gIGkyLFt9mNkZFBtIjqrH0
         b+z2hwuAcombqyeH8NIbAKUVB8Q+Igr28VGWzlRchoLImoI9Co86q7UouwaS8eZCHYij
         2yOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769639603; x=1770244403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Twb2Mn6eFSbnhF2U8WEvYnbtdTbNFMWzq+PnSQfsHzM=;
        b=rhb3fneB4jFEq3XANjafLg6KTg4cb3vzwJBbjk+VJd5umcM8QxEwkcKMSwSTIkM67T
         aWksvv/9oaIOfAr1NFZBG/J5+ndsBE/yIB8SMiGfzQ8H3uvTQuwCft58QTZmAia94CYA
         VBiUH3zpZl1uuxLYdw0AQuQ/QN3ZmyywRIeH/4s1pvC82q9Dw48l87Au8jX/sD4Ic+Bq
         kc2nGxhGu1lkMgDPfvLyRo1nzCx8q+K9Bocs90rWGUTsfHijIbzJD6+E93aJbhBZWSvS
         BPQ48g++288d4qun0uDH2Hc6duo9YWmAYk2A2Lz8byIQHSopdPw3vdcng75z2aMu3WY9
         wEvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7EBMCIYCrDGnkC7DCKw3jZ5YmycBHHUfyiQ+31uE8uOwudCkKPEZpa4tzJBAPug6Uy2e101V/aos=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL9X1Rg+4oQSCY+3RBgWtzdjprNo0PjrGM58XjQUxD7pJCja01
	Wn3UNiYX50nHWAnIF+ryxUf8ytWlJMZkrzPFX9nnXdacNJUxlT9DPBMz
X-Gm-Gg: AZuq6aKBCGcoGO+IG3mNNH2JKyA+BhKgWAi7uaPlo9C4iN+fna5LTZvip6q3g4Ocf4W
	z4lc52GGn8qfkyenznYKjAQqtrrwQr06DGgmo3gZ+pvMuEsdm3ydsG8CA3HRf6duQEaQw8ROmQt
	T0oCaxkIOPx0Oe7m/0Z1AWhnApVuGz7mr3dhTEbdCjr+YJphINc3mC2+ZfqtSnVZhPw9m9ixA2A
	EzHjZJuQ2N4cqMx2+sr7viVBkoOElPh+7mH296E1yVR0id7uCOurNmyvWRkHQX0iK7sS9wTgt8T
	4TkgLPLOk7AMHswATW7qoDgdq6MCKCG55rOImDpBKfZgpXznQ1UHygU9oEOcfS9+K/9w3CgZclw
	18fkLy9qqE4TVJYfVqa+JUQnQpFBjmPnmwEe+RuRANfn8NO02L4BZ3Uf0MCusJNPT9UbB+FhDFw
	cATJ/PEWpeElg6DF7zRLPcX8r3m/EYJ+Y=
X-Received: by 2002:a05:6214:2a8b:b0:88f:ca79:844a with SMTP id 6a1803df08f44-894cc910231mr107230816d6.48.1769639602822;
        Wed, 28 Jan 2026 14:33:22 -0800 (PST)
Received: from [127.0.0.1] ([154.7.78.65])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-8c711b95e4esm304528085a.15.2026.01.28.14.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 14:33:22 -0800 (PST)
From: Patrick Little <plittle@gmail.com>
Date: Wed, 28 Jan 2026 16:33:12 -0600
Subject: [PATCH 2/2] Documentation: Fix bug in example code snippet
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-documentation-fix-grammar-v1-2-39238dc471f9@gmail.com>
References: <20260128-documentation-fix-grammar-v1-0-39238dc471f9@gmail.com>
In-Reply-To: <20260128-documentation-fix-grammar-v1-0-39238dc471f9@gmail.com>
To: Joseph Kogut <joseph.kogut@gmail.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Patrick Little <plittle@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104; i=plittle@gmail.com;
 h=from:subject:message-id; bh=/tBnQTjEep2ws12SiZlf0MTyXA2SNfUMQKmSH5r54mQ=;
 b=owGbwMvMwCW2/Ptzn70V3ucZT6slMWRW9a3bV+92Sdl4Zklt+tuss3xGD3W8vQ5f/BoSfL65z
 vZt+m2RjlIWBjEuBlkxRZadbmKFWc7Tc2d6rZ4EM4eVCWQIAxenAEwk9w4jw0mBK7lfOjqbVW3V
 532VO9Au1sed1fOjh181cKad/NWt8gz/403qhaeZn/pw+fa+7Njl99sTP+r2fHl0PHud8UTehTN
 MeAE=
X-Developer-Key: i=plittle@gmail.com; a=openpgp;
 fpr=B94616716A43976D994AAB92A7F7E74CBD784BCF

A semicolon was mistakenly placed at the end of 'if' statements.
If example is copied as-is, it would lead to the subsequent return
being executed unconditionally, which is incorrect, and the rest of the
function would never be reached.

Signed-off-by: Patrick Little <plittle@gmail.com>
---
 Documentation/power/energy-model.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/power/energy-model.rst b/Documentation/power/energy-model.rst
index 65133187f2ad..0d4644d72767 100644
--- a/Documentation/power/energy-model.rst
+++ b/Documentation/power/energy-model.rst
@@ -308,12 +308,12 @@ EM framework::
   05
   06		/* Use the 'foo' protocol to ceil the frequency */
   07		freq = foo_get_freq_ceil(dev, *KHz);
-  08		if (freq < 0);
+  08		if (freq < 0)
   09			return freq;
   10
   11		/* Estimate the power cost for the dev at the relevant freq. */
   12		power = foo_estimate_power(dev, freq);
-  13		if (power < 0);
+  13		if (power < 0)
   14			return power;
   15
   16		/* Return the values to the EM framework */

-- 
2.51.0

