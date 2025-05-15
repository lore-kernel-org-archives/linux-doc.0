Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952CD289E35
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 08:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299204; cv=none; b=nsSj/jvYXhG9wYT4TMPGn/qJlR4SK7rLJ/4V1yBT9+EHpnAxb/CkHtY+wShcZqNs/Jn5GcuveTZ6x74wc/S0wDF/rg/KWR5FU0VRvowIgOON7y5soB1eINv2DRlHSG4YX/cfndWp3xQx2irIkZZlTcU3fC//cPy9iUvMh9OP8i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299204; c=relaxed/simple;
	bh=lIfNCPP66O5sWacTogM/feH6CoiW9xHNdDEGcTAOa1g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f+r4HJta0kq8K0ayF1jBzE0yq4zm0FF9BUdQ+yQgUMn1wHaCd4f+DopX0u5fBHOypPiqKLaxLuAB7zFmW8OzgZCh4DSoG48bQIl6LVZXdOEmbflMnQHsXZfQhvVnCfpF9Im+ZM9eVLUTjljyb6kn3NVgC/yARkFGV5oftj7lpYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=JIbYk9p2; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="JIbYk9p2"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af908bb32fdso525198a12.1
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1747299201; x=1747904001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOVoQnwWT25lQttWoZH7JoBjuOJGRtQg1frpngi8VzY=;
        b=JIbYk9p23k25N0ts46ZfByaxfR0wUe8eftbnQ8WcAraUkc5xwLHLFqGjjEukAywz6N
         xSR1QlxoxfR27yuHr2SMsufGmo4iLnqENPkJKf0yWc6eUI7Ip51A+C8pXOwOTTsMWTcA
         2m21uEEzRYwdxC0NsLOM2H6iSYtdMdDzNxlQI2FLcuBTS9IyA/b2O+4ZzbywUS0ZM+Go
         M1ln70M26ZUX26+5VM+EUUV4+kf13mIc9ImYLFzoIxZSZuYL8fXnC0Fnomg92SCdwsy3
         wIfQATH+vKhLNKmwIZ4b5TPob6Rp6xCh/kSfn2VeVPMTyC70Eyl7YnXo+D0KjFRIaBor
         /I0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299201; x=1747904001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOVoQnwWT25lQttWoZH7JoBjuOJGRtQg1frpngi8VzY=;
        b=Ql79/R9/s3e82M2CkpDSGtZZzGXssk9r8aUwkwPAO8rv1L+nqIHwmGFa2LrpBlTQd8
         bli0MpL887T86toRW9c6qyxB/3Ylf1arq1RXh3OvFLmlUxGeYzF5D58dtb7d+ykrBCHX
         VWlXRlD5WQO8w/bTWzRNMqhWzMvrjq6vPqfY+DaIi7p4jMsRZ2BuOTyqyDCJT3S8jn3K
         oO21BToqhlcImAHI86xYjwzouoXjUSpEq1xoNgzf7y7RYgIuhbbwnG3L5OayjMNLJdVZ
         wULKHipqSPSN6wafiOxNv+CxaA8ktNuc/Q0G6XgBGnZr24kth9rzkUlmVdzFtyoJvai7
         SbLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+hjaTdiftJhX/+YRRs4l+2w6P0oJXJa43/0lvWlydySq+dpN9+Q4MzKoqKIFeuz6tHL03ILoOzW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjLGZj16kpoJU1/8mpWoTs8Cbgg03QZ4WGoJmPaqEzYg5gsnW+
	z025++AGvTyV7LHDd1ABVir4My4uxfJS0BlK9jgEx1F+3L0/QYDxk+YPtR/47/M=
X-Gm-Gg: ASbGncubUlkPxXzZHRoEuexDh4J60M+H7oHQUAzM083dHs69GsL7AMzxAtITf1p/1Pi
	/ID3XQ47nJJGBwiSm/1LzsHq8xHt5ylsaFqKsCiRUr6PzJDTr8UVQiSUecweEZj5adroXuXqFZp
	DWD13DoiaQvitWmL52gQAeQOaZnJrFI6vQ61DJVmbdZgf5Q1pGIduG60N8LhXLkeNiocCuZ5vb+
	HURtVTBWSyr5ykjzn0tURATBBW7fIRiIrJS09peSxgqJeaohwtoVcDs4TVfpfV4OjRJu4Y9EXV/
	P7ThMabOqifc4nnL+QBO+qE9EiFtG11p6fAdmb+rd4+28ZLLbuAnJjPjuBS9PbBBdBArdF/9NWT
	0OC4MwW427jrHG/v03FIQryAGPVCjjG8O
X-Google-Smtp-Source: AGHT+IENsPZ/AMQVPFzwdzV24c1hYE73gMI1F84hexuGBFYoNLNqWR0VXSlco8GETzsjYyrN3LMd4Q==
X-Received: by 2002:a17:903:1252:b0:21f:2e:4e4e with SMTP id d9443c01a7336-231b3970b19mr36155395ad.5.1747299200653;
        Thu, 15 May 2025 01:53:20 -0700 (PDT)
Received: from localhost.localdomain (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7742f3csm111237665ad.99.2025.05.15.01.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:53:20 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: chiang.brian@inventec.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	corbet@lwn.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@roeck-us.net,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH v7 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Thu, 15 May 2025 16:45:40 +0800
Message-Id: <20250515084540.1558914-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515083706.1554823-1-chiang.brian@inventec.com>
References: <20250515083706.1554823-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 15/05/2025 08:37 GMT, Chiang Brian wrote:
> 
> On 14/03/2025 07:11, Chiang Brian wrote:
> > 
> > On 14/03/2025 04:28, Chiang Brian wrote:
> > > Add undocumented tps53685 into compatible in dt-bindings
> > > 
> > > Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> > >  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> > > index fadbd3c041c8..c98d69facb48 100644
> > > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > > @@ -380,6 +380,8 @@ properties:
> > >            - ti,tps53676
> > >              # TI Dual channel DCAP+ multiphase controller TPS53679
> > >            - ti,tps53679
> > > +            # TI Dual channel DCAP+ multiphase controller TPS53685 with AMD-SVI3
> > > +          - ti,tps53685
> >
> > There is no user of such compatible, so how can it be undocumented?
> 
> The following link is the patch which I would like to add support tps53685,
> and I think it is the user of the compatible:
> https://lore.kernel.org/lkml/20250314033040.3190642-1-chiang.brian@inventec.com/

Sorry for the wrong post, and please ignore it.
Thank you.

Best Regards,
Brian Chiang
