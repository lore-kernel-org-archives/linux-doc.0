Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424523515F7
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 18:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790446128; cv=none; b=rQydc3VNv28vHChFjgPpQl/4I9j5w69gZLsCis1QjjO9IQsi2iTa1Q+81vJzz9j6ryOXf/1Y5Dv5wjo2iPPhLgxC9t9O809Z5WqUxMTCuJZftTaawM/J+N1UQsXSROLY2SPraqtOda1kkRIZfNLRuxyrRapusvPkvwgtMASJ9kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790446128; c=relaxed/simple;
	bh=/1Is6jwITKvcrzTEMMArf5g2GgzfewQ0ZKjCE8wrIA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S64I/q6ybera3r7OF7L7LPg/d3Jjg6qRP6p5uAugNQeVpTJ+X0Da/8s5X/fWsVbtcf1jjTHhaBtzufqQuOVuGOUXJ7cllHJ3emRmyPsnbLte2ylrICq17Ps3K5PKV/gndPyLnLKNHjTku6OxFZd58svEzZJxiWSGTjS85oL0P80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4SqDFTF; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4SqDFTF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so10524805e9.0
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 11:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790446125; x=1791050925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ZgUyaMAO2CVOLqH2JOMYU6c+GcTyIKCAT4dA1Wtw3Y=;
        b=l4SqDFTFeCC7rDXngC4Ek/odtLFihdDpZN5DwDn7eKtdEgUKdRRwg041h60lbUuX/Z
         KM4XF+Q8EUpbYQGNgCv7zSFOjEekrsj8NYtse7Xk/KDLTmH9DLVQQtw8ITot6+60TDym
         l6h7yazNce2DITMEBaynlt/KHr1i9jLaQ4yxuneSKthEgeDWFcKNgiQCKWZYQglO14An
         JMyN85+mQpHQqgTEzXcgeTsgo3la3OOPH+X9T0DT6cTXMJS9fiWoo1NLFGqHcLTwkiyl
         L/ZF8IB81A+uzPDURSXwI4ZgN/uQfky24MdIIUuKpndeEQlTVjgfIXc4svMGQ91jvu3I
         UeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790446125; x=1791050925;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ZgUyaMAO2CVOLqH2JOMYU6c+GcTyIKCAT4dA1Wtw3Y=;
        b=aTbIlTvugUjqoGcXYG+vPK02wq5JIkQrQBpugQhZOzBuDby3GdTqrH8JMK1us3xocF
         OIQjHq3zx5bKKG4vLzFgNnWYLMhAh+YYelf6sp9aGhnGCKW0wp0cEiCNODSFrkCzVyHR
         bx7kpNr3oUBUdto4aUaNVLA1Wv4owjQMLcigvlU+yDzbG8yha5zSFjScaF+7iZBJeav5
         TZrkhnU/h2mnaiqUpet6kGnA0PRdX5D4TAQk1YA1AQUY0z5/6rqL6wRWlRNlGv+A4lh0
         4SxZHxLTbL0XXM699yEdwr5vY8d6FBetnMk3wx4mpCQ6xEaaRK45MiUraD7Afri9S4Rg
         WfVw==
X-Forwarded-Encrypted: i=1; AKwUvBw+ZwLXYmdcYDr6j1cL2dyivrjnt5xqgPz6IKMhj1/KOZi+O0y6ARSKpFM1vSgyFDU5lfJ2o1orTYE=@vger.kernel.org
X-Gm-Message-State: AFuF++ns1ho1p0+QaqWccoCt++x2NpBuEoBzql53tjKyYLvrEdrb6EA3
	v56hUce0+EGufzWHy5TSigGZTNAldTzt2UtObHEiy/2aYUPrSeF9S2KhoSSFG5w=
X-Gm-Gg: AYBFou0gZiph88vDkdnmf8rZxQ5AOilbVJ+tnzPT8icVBOzcOAzecu82OhPr7oqTACi
	n0d3Z3n8/pIPKazgXW5SmlUuH+h8gOqJ3Lt5Qr+zClwpEjh44Zyj0xjwqvYIjAO5wxZLfYjmeC6
	/s1nhL6vIZhxRRGKFPHNQRHNF48U1hoUepeFIre5NkDUG8I/6h6iXQyfjPbTq6x7ZgEkNrJiQPM
	/UM/OZR78CmgN+4ubCtTJTjpDRF88ul+FHqjNd0/7kyLORU9cpMnKVjy8IgrJ8oWMh3kKGrnwIh
	K1OkgREEtXNGvtMEjYZ6uok5VpKZTibHVhWLosHK52phE+LCuI2anx5m6ltNiDDLGnSLAe3PXAN
	oTFY9ABH7E33w3FDAG7RR8CzcN4pJxFKBe5dzYSdNBe/dQncFxvQlb/Dv5g0P2tVg6YwZeuTV6z
	M/lv2NsMjirD09yrrKbqJpCYhdYwAo80LB4X18HcsDwiiUl8P1TSwuetKmnZ17lFU7IBL9LAn8j
	1DOTLKx/UKwskZdKkvZztSawHXbkxWK5UDDVgKZn5OnoXky
X-Received: by 2002:a05:600c:1546:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49fe66f4f59mr157154635e9.23.1790446125211;
        Sat, 26 Sep 2026 11:08:45 -0700 (PDT)
Received: from localhost.localdomain ([31.223.3.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef5fc189sm111337785e9.3.2026.09.26.11.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 11:08:44 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: corbet@lwn.net,
	clemens@ladisch.de,
	tglx@kernel.org
Cc: skhan@linuxfoundation.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-doc@vger.kernel.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH v2 0/2] docs: timers: hpet: Modernize and document API
Date: Sat, 26 Sep 2026 21:08:36 +0300
Message-ID: <20260926180838.8145-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <87o72mg21g.fsf@moria.home.lwn.net>
References: <87o72mg21g.fsf@moria.home.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series addresses the feedback from Jonathan Corbet on the initial 
submission. The work has been split into two separate patches, and the 
line length has been restricted to under 80 columns.

Habil Eren Türker (2):
  docs: timers: hpet: Modernize file references
  docs: timers: hpet: Document userspace API and ioctl commands

 Documentation/timers/hpet.rst | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

-- 
2.47.3

