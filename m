Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2748D3128CA
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 03:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768878122; cv=none; b=N3VO3ASjRoIEhuhOaKsRoEc9QiN4LauU0Qjk2SAGTuWSJ24aw6ZhVLPdOAx+u3gvDO7uSF7mkbHM0Im1PqrmN+MPYHahEhjYBndMvwGYPm0gZXTXO4s9qpdoYTnhkMaoB4q+qG7JfYd9tadHe0dN02gT59jzJs4glDgt/lowZXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768878122; c=relaxed/simple;
	bh=n5A0OXSyk7lo7f3jHURyz0bX/5X3lYhpTO7Z9MO/Uec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mHDRVeQzMRFunmkxKXtLPoDvUMvULVMDWniILtj+437u5C59nb9FSYC86EyeSaHRs/vS456jX2xHPmdnRvZTLAm692A/B3InGu4rB3l6mq/+1SxdF/MK4/+6hbnigMqxWPlAxJSI2YxjduErIDnz0Om5RDvU/lwnPeL2qVDhPIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0uhJfhT; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0uhJfhT"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50143fe869fso56571461cf.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 19:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768878120; x=1769482920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2Ldiltg0ilm3GITC1FlZ3jygue5ViLbnCHXlSmV/Sg=;
        b=e0uhJfhTa5uUrXSyLB8i/s/OLCoSgSk3NTVkTqcf1idVgMAJX9Se8JbJgrD75uteQw
         +y5msopTv3HUJpUsow1z81JT7f5Fd8L4RpbY3JjxWd6yNfWxwhXIC7Iyz+fl8xS6ismy
         JCzGy/WAnhkL1IZvDEYmMtUeF6tVTWpep5/nbcXawD/CYqwkuh9gAHOR8a3VqYw5ADTb
         L9CFYU96ZGAcTFgefhlGHwKBD0u0Je/Yk4zxd3qV3LkraeicQ1m8KAbUqJvs70rU+bw9
         yFxW05XHexNHPqWDXrWMWI9U2vtgMdQW8EiUT4Y0shsLZLp0cmlRTq4tRa+qdMFErX4h
         sevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768878120; x=1769482920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i2Ldiltg0ilm3GITC1FlZ3jygue5ViLbnCHXlSmV/Sg=;
        b=AzYj3n2AFuEPic5UIEEXPuDRvPWeZZ2RLYYrF8YX8NHIv0EK3D5UCAoYvgCNEWE/xW
         DJcRUjCP6xhuXyNsHyEFgruAknGrNaQudoIYqurKfvo1LlA7BtVo8iWSbB/wAC5Ks0Mq
         z49cJk+bxIV6z2+qzbLz+gCXqxvbXzpj6rQ5rZjs6heiLxdxP+gsied0VOwqg2xUjuGU
         XOP3Asks835ztHBdqpHo6rbF7/Z5p9cwyX5SJ/UaNyicYzzFwmyN7qxDGJ46K1Itk+R8
         LpBTjYHTgh90DvPqrF4nZxRpXcsDz2SrhNlKAQP7E8ZBPHT1p/C02IsC0vg2idCNIn0c
         zM5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9uaDqevveIbm69HiryCwGntUxcW2lU/Ggeo0qI9GTdAQtVcQWh+Wdg4yQPOs0/FCd7EjAUSIwmYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKyeFRa7avpcEMIedYUvsAx0HN0Ump9zkBbsEu66h6paEngfOw
	niv463azCtwjIfMoZihYBwBWUgvp11qf6nkxyAMK7d3B6F6zivOR9VWnALSmMi6U
X-Gm-Gg: AY/fxX6qgE/tolE1O4Q07JE52Z5smEEqJjfFFXiERab8UCH2xu7Hh1b1GfqHeoY4UXd
	Y9HCcqGUuP0Kybzk/pcjrK9rs2oqZ49QYyZbo7x2Giak7F4zOfUjL/vc5cTxrHl0k9GVS2XcmwH
	TiG71A4tyabrF3tmIzD/GGv4PGQci7+escNC1tP5WUH5PNbeLLvc2pgorCyBJrs88Bc38jkLQwy
	C2uOayIp5EGOO2Ka5HnNx5vRiKq1wbJqeuBHvltrm3aIlC/ZEHsujkxDbH5iC5KDW7MzOpxwn0E
	XQrFk2Wo7OI96VPh8bPnF/BWFjIXU9RJZj0ZPPfv+v/VSnHmCUAiZOR7/88n1laflHZq8272RMg
	vykkM3Nv8nQD4hjvJedvqYfUISblCG8htEOgfqcAXMLU6wZWSEZk8NnYxRPVZzFZH64Ege1HN8G
	+/ASvUNkGNeQ==
X-Received: by 2002:a05:7022:6288:b0:11b:7824:5c97 with SMTP id a92af1059eb24-1244a769feemr12788374c88.40.1768871785704;
        Mon, 19 Jan 2026 17:16:25 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6fba43c3dsm747540eec.0.2026.01.19.17.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:16:25 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guodong Xu <guodong@riscstar.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	spacemit@lists.linux.dev
Subject: Re: (subset) [PATCH v2 0/4] riscv: dts: Add "b" ISA extension to existing devicetrees
Date: Tue, 20 Jan 2026 09:16:14 +0800
Message-ID: <176887176536.427065.4468747981087466363.b4-ty@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 15 Jan 2026 07:18:56 +0800, Guodong Xu wrote:
> The RISC-V "b" (Bit-manipulation) extension was ratified in April 2024,
> much later than its component extensions zba/zbb/zbs (June 2021). Recent
> updates to the device tree bindings [2] enforce that when all three
> component extensions are present, "b" must also be specified. Related
> discussion can also be found in [1].
> 
> Patch 1 clarifies the ISA spec version for canonical ordering in uabi.rst.
> It is a trivial update, but can help readers reference the correct
> document version. Acked-by Paul Walmsley in v1.
> 
> [...]

Applied to dt/riscv, thanks!

[3/4] riscv: dts: sophgo: sg2044: Add "b" ISA extension
      https://github.com/sophgo/linux/commit/f16ae81b80ca4e721f4c4ed1f28390115f7721eb

Thanks,
Inochi

