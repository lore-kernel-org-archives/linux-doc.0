Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905592C08D4
	for <linux-doc@vger.kernel.org>; Sat,  2 May 2026 23:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777764782; cv=none; b=Sp8ortKKXbhiij3QToFsEyd4pn5shMBTqRoqeaUp5jOcq6E6h7kqiWGC7buMnmu2gAkmtYu2w+1g8NBPwxEPnjQYwdycfYQxaUHGBAjIQ9yY4kp4UTqga8kumqjAVxkaMVDmG62lrolBcpvA/MM4Jjv/7TMP/J6m35UBGrVotb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777764782; c=relaxed/simple;
	bh=wvDSS11fTDI8gBL2OgEZrMLNVdhDHIyN/5YWU0B98iQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cOLvNKd29NoOR3YWhZLIRJbIaQR691Jvw/XJu0Y51gdC9QFP1wBz3/ziDL0cs1zq4sushp5dZoBYPozKwIZEabyEToVumD1py0qaeCTqOBd+BLHCU6N+cel1DHDNZwPHhOcvSLJqVh1nal7jusQssIIQ2OyTEXel1KqntHkZPIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pIPf97nV; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pIPf97nV"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7dccda31d3eso796776a34.3
        for <linux-doc@vger.kernel.org>; Sat, 02 May 2026 16:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777764779; x=1778369579; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=owoAMoooS4kcgCYZoz5dKMrmmeexoIEYAM5GmWK7oMM=;
        b=pIPf97nVV6zUmT869t8K6ChMQsfUxEAkzX8zEOYiOr4UqWXsXY082WW5Szr4kQuw5N
         rD1C7kwCLnAjari4hABRt8J/kc4Dp16WcpoW8eMMYfdAGGD1m7v9iVPG2HMHDmm+0O3T
         zLl3j6ZMp0HmbrEu7mfO3YLayCUu8Il5x6+xjCU/k8JBxEsyRhZs73YGlMNLeE/hNoVl
         TB1FW+R0ZLUNbYbr2U7k+lBkXHACfnQIEZc3IA1dE4cwEOXKpOXKxspbtjYHWCvA7mhf
         GrOAPUkws6B/VmSuVZ7pTwUWRjJslGJjoe0QCJfp0DohVcnbNVHLa+qLODMOiMYQqZjj
         /rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777764779; x=1778369579;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owoAMoooS4kcgCYZoz5dKMrmmeexoIEYAM5GmWK7oMM=;
        b=tM8i5abtiBA6SmnpG0OhSlk7+RtxUzbMdfoJ07rNyjiFYlQRp86LfFkxi5m0g/oCVB
         /pcojGBA31e1gFmgFqoSQ6fUG29A3d1yBZ4gm4TaSAdFSoWpHkJslObQOJkdRKaLfiHS
         Xx4Q5I371tpHKvIGNX6mqaAhvf8nr0Ub4/VJ4ppz+vBYsyI27iFIMqWgeoJ1+5gz48yv
         tfPY620lCR9ZR8Qo+RzFPTs74Bp7/dxxVgqVmSVs5Q7bvYE06ixe7yvbSItJJXTKL2Ec
         tNrhEYz/dHbke6F+5I54Zx6t7EGiOIzjgCN+KaT7FWlSKI0Vm42IVAGXqUDqPovZa/nK
         Jspw==
X-Gm-Message-State: AOJu0YwceeDfRkcWgASFiIaMO7Vr3rukwh9zQ/KA61u+VyBMPcWLz+Sm
	rTb/0eHcbGbFX8LYi9/4sRaNnxGOtR/gxzAHgp6OzzskmvcmqMMQUupxDp9WKXqc
X-Gm-Gg: AeBDievKvzLzZWxhfJf2uqw0A7eUMyh5TKD6YTTNI/bmIfM4bPiDP4Cs3e5rg+9d0Vm
	1N3IVLk6Rg7nbQRAhHi9oVQxj0e5sT7tibb1Dma9GxQm0Hky944EZjzrS8egtbncIFDTATVdsRW
	lkz/8xOO3noz1SaO6x8ge98n8+S1n5mL5b2JTHEyb2xPzpSINkYDf7iCgTJXr9HaBtoFmGXLnRK
	L4FtQozAF0NrlptK95qtUjWq4CEz/eIlZNtPm/iXBA4L/f3I0cQx8llBqPiIvVtj5Kb4uQrVLAz
	+HUDe7ZscoJ+6G3xL6yZLe/JpDFhf15OcNML21ULH5XLnfNw7Wy5E/YgQdVFazUTS9exAXGqPRL
	zVgFSDl67LBAhVhO1wBThIZgj4Eml0xRl3aA2EKkSex+vU5k0O/b8dZu+Cntj4/+o+g52uAUkDN
	BI+XLn0TRnVJ3MKHOZ39Gy3M50m230oPY+fFTNM4+If5R66EdJzVtxNm+qPVDCOoq1nHXDk3Ez
X-Received: by 2002:a05:6820:16a6:b0:685:d435:1471 with SMTP id 006d021491bc7-696979c86d7mr2221728eaf.10.1777764779351;
        Sat, 02 May 2026 16:32:59 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-69689266bacsm3903680eaf.0.2026.05.02.16.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 16:32:58 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 0/2] 2 dydnbg doc fixes
Date: Sat, 02 May 2026 17:32:54 -0600
Message-Id: <20260502-dyndbg-doc-v1-0-67cc4a93a77e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwMj3ZTKvJSkdN2U/GRd8yRTs9Qkk2TDJMM0JaCGgqLUtMwKsGHRsbW
 1AIU7tO9cAAAA
X-Change-ID: 20260502-dyndbg-doc-7b56eb4c1b1f
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777764777; l=697;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=wvDSS11fTDI8gBL2OgEZrMLNVdhDHIyN/5YWU0B98iQ=;
 b=MArSNNrnRUuVF+RnxKZ9CQ4ImjTL6vyx24xwfJn1AHtOlY0qGAiUnQ/PyLm9vvpVeWNZcunq9
 FNQuUhHkQZSCiyc+o2RRb+gwQ2+rooDZLgZQoDhrZTwRg9UgpBelydy
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

1st swaps \012 for \n to match actual output in dynamic_debug/control

2nd explains that flags input to >dynamic_debug/control is checked
before keyword value pairs, which might not be there.

Both reflect current code behavior.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Jim Cromie (2):
      docs/dyndbg: update examples \012 to \n
      docs/dyndbg: explain flags parse 1st

 Documentation/admin-guide/dynamic-debug-howto.rst | 35 ++++++++++++++---------
 1 file changed, 22 insertions(+), 13 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260502-dyndbg-doc-7b56eb4c1b1f

Best regards,
-- 
Jim Cromie <jim.cromie@gmail.com>

