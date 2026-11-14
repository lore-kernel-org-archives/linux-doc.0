Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650466;
	b=cs/8FZgOad3sKiKQPUizmiwKo1JAXjj61MYc9sGXrdJAmB5oS1vlcBq0ZN/25ruMa4cH
	 J8AzB/Khj7ARNGFqgiRAYCjbgrhR+sNbiV5BdfaEUzUnEHUtV4U2aG+suYxkFklYQJw76
	 QCVh6nBjY1MhaOScUSPAVB0GYrd/HOWpkLCbym25lIWsDhM6lqE77+OUZ7/cGyXrpOPIX
	 N3YpDkClOJMILmUQIGwNRzg7oKIZeZ1Frob3KV7vtV4s4F/w1hcQMXYNg1g3w1dOy/1wP
	 ffDGQW+XnNUMhm68xkrgo6KVjhMPmsYsiyWdCV07RMDAHyXSboi9ksuMnBmUKXPXnGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=eC04+x1Aj5L0dZDAOuUn9+6Z9aX/XkxoD9/WXm06rNo=;
	b=GB3J/zKFYonRdXttaS2OccALmQynDaVC/QlVHKXRquJFfTgVlc+XJx+vc6K4nAOrN9zL
	 HBFaxXgbj9QS54OUbK8OBQnfpmjRBF0iZUSz8pWjTTsxWFWvPpOIXeGLKmqd5e82xFOdN
	 dz01hpMIyxO6m8UsOESA1iXckDQXF/ehY47iL+HLiI6exELLlvSIbTbqUOHKCDX6GYtlR
	 EUnBS+QPeXlEe6QWlpIg563hiLcmZIGX03n3eZCk3lnMjKBvZRYZgEAvC4Sw1VKZkCBj/
	 ZOULXGB6Jdb0ZWuUpNirDDTwtpGMsuvL3EiX5dpdvJfYzrykdK9HaI5PMz7zWy0691g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osyx.tech;
	spf=none smtp.mailfrom=osyx.tech;
	dkim=pass header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l8BELnJI;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7832606A335
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 10:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7832606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l8BELnJI
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso632266f8f.1
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 02:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794650464; x=1795255264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eC04+x1Aj5L0dZDAOuUn9+6Z9aX/XkxoD9/WXm06rNo=;
        b=l8BELnJI3pTWl/XiiJbX3dWKO1ce40yOuv4TxMK+VNNJm2H1bwq91bW1m4zLaivmQY
         dwXh8KVHYsxhkFlL4STp2Rp9kx+KNDjQt6HmsciUFgo5GzZ3BGZ6Viyu6f+/rZnVkHz4
         qrGftZRjp8zJ68DPPcLIar6jsw/Rv1cGzPyd2BUOH5aWPMUzh1v3Jdos/oyS3/0a6x4s
         G9bG38Jo30AUexs7BIGS3uaQe3xI8QByUx0jJ5Rv83iFWEcdnGIBzstTTZFMo6XChTFw
         J3piGX4CaQg2c+40DB4lM4qnMdZPAkhuIDshGHpW8Lwe5tjqVM9rCkar3sFmAIOhoc/1
         g9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650464; x=1795255264;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eC04+x1Aj5L0dZDAOuUn9+6Z9aX/XkxoD9/WXm06rNo=;
        b=NDpiSI/ILCGgUzXToGHpOF3kHTE+rkrUJQnbwV/gwwX3f/AgUn0n1PG1y916J734sA
         pkhw3Wj4yKYjOYHnztd1pe27d7mZQevOO5YlvV66ebcjNTIYh58EP6RcQWSbi+AY2bsW
         2zyZaZ4+8LypAlRl2qNMmzSTJJJHP0X/8QuZ+EDLYtpOATmYZ5qEjDdG8XDRAUx7BR4r
         DLKVNLkQOu2KMFqUSUU22XVmd6FJaGIRyfGOO+B+ohLyGs2ndEIBiP8Ua1xah+mPAmAw
         mbnmDPEK8V/qLvwwSv8Qenk0lS/gp1v+BL8q5YPPWrustwziE00iCz07mbNsOXqTcPAb
         Jukw==
X-Forwarded-Encrypted: i=1; AL+hErFo0qeWRN8D1W56Y8LA/FHPXYC10yMebAmmMsvzXNe1MMRmCsVsoRJ1aaC1Qvqpf2XbUp4N/qsaM2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kKkGVWWlayWEWexT3wTj/hg+Z/VWOU3x4E6vPHQtfZki8zv4A
	FTH6sS0TkR2rp2+W9UZmclmc23HYIdYUU/fkbIzRojaKTx6yydpl8mREukWr7rFSxYrG
X-Gm-Gg: AYBFou1choCSyexdG000nziieJJh14Lx5drK1/UfOGlo/jtenIa8SFghM2GFJAADzTh
	jE4LDBl+FPU6tLu/Qr4m1+fF9q4FqrjmH7rShPM9PVhFwEgsp9aJne/9AbHWCt/Hok3Fa8s/nLh
	iDP8Z/1UO4E4PMy6SoFSwrfLUqtK2miA/gGVwokhjCC+uOE12RWAv3careh+6hNpTot8Sd3GnZ7
	nDmmwC2LVaxKEDPXqDnFlwK6b9tnQIm/xQ0cQf4S4DZ2sDfJ21hYkD3x2L3tAVbxSujDD3WI7MV
	I3AzzV4KnU+/FortJyfw6WEYf2II6cFST/S6msgW/7YhZoVh40/2xIixxESaSqVmYZdHUgDNYpi
	uGL77L9Y2/ce4PzkIsfQJPVrPfiJJliVWxaBOKIujti19p2FdnByhrmObE5fn6TMWllPI1cOH3s
	9iPXhERQczitXwm4uUWma4q2+t0Vnw+5mQLEeUtORQLK29xheSzqI4fvl75P+Qx2az135SqHP5+
	+5iiKFggVHn2/TgVcZ6kIIzFe1zJScpYUkbJStmKu4m36bNc6T/2eaWLXsXctGJ1JxieCkhvk2L
	TyVlsnitIAtRUDmjHnjt7j2dwDhnVuUKmA==
X-Received: by 2002:a05:6000:4918:b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-49c723fc793mr10335695f8f.26.1794650464192;
        Sat, 14 Nov 2026 02:01:04 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:a084:d599:46a5:5c31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm16920053f8f.44.2026.11.14.02.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:01:03 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v7 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Sat, 14 Nov 2026 10:00:49 +0000
Message-ID: <ab06a2173b01f4e18dd24c68e03ef846ea933098.1794649714.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794649714.git.jpeixoto@osyx.tech>
References: <cover.1794649714.git.jpeixoto@osyx.tech>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry covering the Bao hypervisor drivers and their
UAPI header.

Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v7:
- No change.
v6:
- No change.
v5:
- No change.
v4:
- Drop the arch/*/include/asm/bao.h and include/linux/bao.h entries (the
  files are gone); use the directory form for drivers/virt/bao/.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..dbea081447e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4712,6 +4712,14 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <jpeixoto@osyx.tech>
+S:	Maintained
+F:	drivers/virt/bao/
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.53.0

