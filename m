Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D8F3043AD
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 08:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761120398; cv=none; b=SbklDoz1jltagW1KNe2b7+z3PBYCf4rCcUAj0BsSjkVGpBgINiBRSEIUuzjjElsn9tGE7H+7uvzgaogApx+UB3W21QwAK8v7nxKjVK3Cp5XdY1f6fyi8fyCNHHzlO0abEY4FpdSQjg1ieH5a2U8tDBVp4w0nI9OF3UKcINtCAp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761120398; c=relaxed/simple;
	bh=eyBdO2wWOgqsPzs2lpBJ9/L31r8e4dCSgvgCYmxIx6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QF+eOX2Te49NTbhe+bUrxh15xCcrcw9zz0TBaOpYtLc0We1fbTwgyZMMzbtK6XysROmX3TQb2h77OuMx1irwc0Q+V1gINak2RkyVgELGfpMr/8min4OlvPdc6siiFMTdfFEgWY6fSSIFThBTeoH8p33iZFcNEBThl+KNRZ2jTTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUx/AVC/; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUx/AVC/"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63e0cec110eso2195724a12.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 01:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761120394; x=1761725194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toHlnWQqNYbfD0u6quHogsDi3+miz5wiSuRT4/A88gI=;
        b=aUx/AVC/VZbpE2oN97dtsPHXthi3yMi5uzy00pyB+I/2aKpB1pOF2pRPdY6cZntp6p
         +DxMKa9u/iHSxDOYlybze4ivOTbEBXwIlPobhtH9vR+ofclCSVUnFdLZ2x75oKao2T6F
         BzGLltxDdG1BTWxSKuNX4gqbmqd/hSjjIIFVs0n0Ch4mlkoUiC6dBoLKKuDIBPDKTFUi
         kFk5uj7UUBrRa5xQZqggiEu3sdLoHgwuGvH/67ISB2+jrRmwVgOB6jqYyuXpupwhrpaf
         63/jcsA3jGWujqwOZrdyACWvjfRvauXk4GbFXeQNuFeYqpEhKr8/+iUckaeissAGe+rY
         jSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761120394; x=1761725194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=toHlnWQqNYbfD0u6quHogsDi3+miz5wiSuRT4/A88gI=;
        b=M/0FlyJoTxe7uzLfczBmk+T/Sbye+3h6EtsSwPSAPwZbU/+YOfrYShNSHZzIUOF7ua
         8pvz0sPCBMs564SMvaDyLBFTtkGpkn/KyLunxLHugmRGjfdY77Vx96g3kWjmzsKMD9gf
         RKdvsfLNfzzEpQKDTgmHsuOp8CPsjjgu66YM1RYWW89K+w4JoqN+dIM5nGKAoazcwxSq
         IcllOClNZzLzvwzXo4whG0msZ3gmuxjxVPxNgBlqJlNgbDhhh43vpphM8ZHCSZRxhj4q
         xIui+rwJf02sjU8C6tAWERpAGNuYppmMCnbxfqEE8XEBGUWJGmMcXT6i7InOph9l+e6B
         X+0A==
X-Forwarded-Encrypted: i=1; AJvYcCUjcLihe6GcxxchIltPx0p0/OjSZaxqgg27e2zqmyVYXP7lu3BH9jEsH+U3CnSt6WxYnWHcS4PYG/I=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv7XjMeP8y1uJ3RtHccs440s+dgF8+HeVqvLGedFc6SBYoidP0
	IBxaaDfuyZyD8gLNKAfp5EY4ZZh+3qQfIZG7A8WDWMz6YKYp9l7mxcI1
X-Gm-Gg: ASbGnctnzwGC9+Hy20Wd30FmKaqXpIdiiYoabZejkumiSKmLxLS+BVTqvta2gIturE+
	LPOWa78n7K70bSuSB9C+gITJtuOvUOkpBXjKZhRlVB0pW8BjQdIHQZqOSblDDKajnsgczy4KQ4j
	Vlr3M/QzJUqN6x/hpdWQcwD2mH+1QP+ewCmyXEUersT3dTU7EV9/845MPFGSsOyT71TPb1zFmVM
	5lfcsSs6WbiNzv9PVJYlFs9UwZzjmz8807dSapbjTaBD2AntN69KOv/eknpqqNh84qUoikwPHlB
	wMcBb2U+bqfW8dRyffBNhkCXF4dJMKt2SAW+QqaI5kGPZGLMexnPzWNdmFi6pCN+bKHdNPzCmeG
	dTurHs0fh9QgjOgIOZ90rjXfS4sWrOTcwcDLnyDFneoV3buXYYPPqj/QL7q7VpZ9OWGEX8Tgrag
	Zs
X-Google-Smtp-Source: AGHT+IFKMamBOdEkXZztW4+a96FX3cVQPwKK7mU8xvsOl5ZRh1X2aHXQdNoBVmqwPChAhbEjv7M9Xg==
X-Received: by 2002:a05:6402:2791:b0:63e:23c0:c33e with SMTP id 4fb4d7f45d1cf-63e23c0c43amr1116868a12.27.1761120394218;
        Wed, 22 Oct 2025 01:06:34 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-63c4945ef49sm11192106a12.29.2025.10.22.01.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 01:06:33 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: bagasdotme@gmail.com
Cc: akpm@linux-foundation.org,
	andy.shevchenko@gmail.com,
	arnd@arndb.de,
	axboe@kernel.dk,
	bp@alien8.de,
	brauner@kernel.org,
	christophe.leroy@csgroup.eu,
	cyphar@cyphar.com,
	ddiss@suse.de,
	dyoung@redhat.com,
	email2tema@gmail.com,
	graf@amazon.com,
	gregkh@linuxfoundation.org,
	hca@linux.ibm.com,
	hch@lst.de,
	hsiangkao@linux.alibaba.com,
	initramfs@vger.kernel.org,
	jack@suse.cz,
	jrtc27@jrtc27.com,
	julian.stecklina@cyberus-technology.de,
	kees@kernel.org,
	krzk@kernel.org,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mcgrof@kernel.org,
	monstr@monstr.eu,
	mzxreary@0pointer.de,
	nschichan@freebox.fr,
	patches@lists.linux.dev,
	rob@landley.net,
	safinaskar@gmail.com,
	thomas.weissschuh@linutronix.de,
	thorsten.blum@linux.dev,
	torvalds@linux-foundation.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH v3 2/3] initrd: remove deprecated code path (linuxrc)
Date: Wed, 22 Oct 2025 11:06:25 +0300
Message-ID: <20251022080626.24446-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aPg-YF2pcyI-HusN@archie.me>
References: <aPg-YF2pcyI-HusN@archie.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bagas Sanjaya <bagasdotme@gmail.com>:
> Do you mean that initrd support will be removed in LTS kernel release of 2026?

I meant September 2026. But okay, if there is v4, then I will change this to
"after LTS release in the end of 2026".

-- 
Askar Safin
