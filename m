Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A604B2BE642
	for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 07:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771657454; cv=none; b=cO3Lvp3wvYvYaOses05ktZSTNEDGs9B5QdsgLWn25M1OuIleko8sn2wpUfamX0MCUUm2B7L4dOebN8+Y6EOO08g7WPmdsPH1+cVqV9VFbF5n1oMxqpZuPJ4sOGP0PrbgW4voj4vlF0y5Y/kFDlUW//IPpHK8A8KnEXJIm8X8300=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771657454; c=relaxed/simple;
	bh=13CRBHcD6KBHtEqtfL3tA27y+BHqeVSJrLp6MxN/284=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZIn0MXST+f/BNLOyvVviXGP/nQgV2t51eYjDHTkLXyNtYSHVRMOzj1j6ZzjNiwaD5wKRBFOt22LexhjajnSzCFVdBcUva1Po/i4GBR5DKZEa5SasPt4IoIZWiZgpPqElXhQg/soKjBfR6sTxiNct5/ZlYWjosi6eBFIwl5ljHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aY9cLGU3; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aY9cLGU3"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a79ded11a2so18383245ad.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 23:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771657452; x=1772262252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13CRBHcD6KBHtEqtfL3tA27y+BHqeVSJrLp6MxN/284=;
        b=aY9cLGU3nHecSem/fGp49Toc0yYCy34ikk0pEA4knY16l/nZFJdhqPzc3gRz5T/BO4
         wlRqoBVswVxzP3KVxtlmhl+jEJ6NeU91wEPGldotZbD9xrMTsh3new3qKOrJ4GxV0Svj
         QcueFNnRCC+q5jL4GM1NKAeHTzRqMdhq3SNJn/0TCtscryCO3Mwo+9dh4afw7p1FW2sz
         oWhOAccF9R/dpkNl2QZsLVSvnUsYDhfQS6Hj2qJaGrUqXERg7Js6E68EuS4xgCvtCxP7
         VBZmFeVygedAgYO3yOd2qtdtaMnMkgf6LQ4NJ2/fBSMupuhgVMSYwP58y/kiUZUazf9r
         N9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771657452; x=1772262252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=13CRBHcD6KBHtEqtfL3tA27y+BHqeVSJrLp6MxN/284=;
        b=L0qby4FyBBvt1ATlDYYqYv1amWtuSlvWMHv6AT3HQLU+rBP9T0luCAQ50Xc12Bd/pq
         ynfs4QhQDP0ubc6DfryAPOEejmIUSwjiH8PiWt+EHvwxANBcflH1wCsgtXVdm7XySOrT
         ftvVfCI4yP6ciSgRmnHVhClCWIlEEeJba3st8nCAxQhejeKcCeaEbNbwvgkAvmeJ/2uW
         g6HOw1w8EDqPxanzBxmHgjcb8TWeSmBVdtmJBruZbTv7yazD+yeBpsGtdxa9HGiuPwIM
         FzXIlQ3j29k4A3qXu+dwPdITMizmF9vvVOb2eYL6n5/xULwltP5s19kLpxsRMmMpUGFy
         bpqw==
X-Forwarded-Encrypted: i=1; AJvYcCVGd24SB8eeQfEs3kyu9nzPfoSSjSm1kk/EevJ/W0WTpTTo4SMql1geL8TZbWVPnVU7Phvoi0MDZAs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa8r9meDGXSBsVh6GW+nCRHV1xs/LD+KLQKEySP1mWREtO/5aQ
	Q5NRxewDPDB4HVO7YRA+5YIUqh6NjoWUL6KDrzjBGGuw/OieRYDlmoBD
X-Gm-Gg: AZuq6aLcZ/Wn3/4DjgQmQ7KZ3j8qidJnXZK16WK8gUv4a3xIvnSQ1Q9Wl3456kOtP4K
	3c/Bw7j5MCx21Hw3qg3VslA+alm4RZba+mVZQxm22YMwAvbTlhyhiuvGbKlxZ6z4yz6cg8FGrbB
	X4isHzpL5Rn2U9svD2XGIZk67AfAH+Pr5SMJC9DmYWQSQe5y0q5PVLID5sbhBtI/ti1GbX5YlkN
	UqtlXgTmnk8cpB7u65pQIjebZ3pE0uZDHjLv1wQFwvKHqmfq9QqiXL+jVX1azyDqGyzUeXhJISp
	srH5gkxQhd1g17TGug0zNm777nwTx+2UrHFHl7rym48tDiAjMchKOFvQryfuZHcMJnrUevYFSWX
	Qb7Z71D1qjDpewx8Qapos/5NOQRJiNPur7pu+vzzO44ioy+Y0s1JJIgDxFJEXXNEtliAM+0wjMw
	PgF3GQzaxY/mA=
X-Received: by 2002:a17:903:124d:b0:2a3:c667:e0a0 with SMTP id d9443c01a7336-2ad744edc09mr22461975ad.29.1771657451841;
        Fri, 20 Feb 2026 23:04:11 -0800 (PST)
Received: from donbot ([50.38.105.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5dba7sm13929255ad.26.2026.02.20.23.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 23:04:11 -0800 (PST)
From: Jens Almer <bagawk@gmail.com>
To: ian.ray@gehealthcare.com
Cc: bence98@sch.bme.hu,
	conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	skhan@linuxfoundation.org,
	tomaz@mono.si,
	Jens Almer <bagawk@gmail.com>
Subject: Re: [PATCH V2 0/3] hwmon: INA234
Date: Fri, 20 Feb 2026 23:02:07 -0800
Message-ID: <20260221070206.1962499-2-bagawk@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260219130127.87901-1-ian.ray@gehealthcare.com>
References: <20260219130127.87901-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on a Mono Gateway Development Kit. All sensors reported and the values were in line with a patch created by Tomaz Zaman against the NXP 6.12 fork.

Tested-by: Jens Almer <bagawk@gmail.com>
