Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8D933FE1E
	for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 15:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761664673; cv=none; b=WUiphC9/4H3RnBLElTbdvccVbHDeNC0/3T32kmmqDyLc5oGvML1cvfR/hVjonqwdAK8mQbXtdRgpMupyfdtSi1M9OOtED13nT06678WpD9DltdpGcnWIPgBTfhN+GdEKqLcS9yCNXm9m5Py1iFmrvlsmXynGaKnwCPIF9Ltd4Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761664673; c=relaxed/simple;
	bh=MMaMHTb4Ah2CCrUzmnNSZ0wgi0JyjgLlM6vbEvp2sbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUilgGnKYmCr6O9qZOkjZftJDJ+Y5Fgms9+38RWjZxotMfgd295lhfktitTwHcRpR67bbYrgfkp1xAXWs4YSewi3Lhg/uZqAc98x/7l3ttJ5lqHSj9RPAH6Yn2ZatUby42bxz8N+HPM2IUQL0/6WAgXAngbYq1XdA5AJIZo5HhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=YCSOK9tt; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="YCSOK9tt"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29292eca5dbso80717135ad.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761664671; x=1762269471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMaMHTb4Ah2CCrUzmnNSZ0wgi0JyjgLlM6vbEvp2sbk=;
        b=YCSOK9ttSSGanTt51EsKsqwqq8wteU+FncXeGl3p7zWom7oOtmLbMB4jwLwccPuYHU
         luuCrzTrwXIyaa+yC/oPFsoebtAWun3X9LuEWw1AXx5aBWH3sF6Xr8UDCYzK/r7T8HsC
         HyC2cCrsbGkvSeuekO6ztDd5klOuk/KQ8cwWR0rJlqEqBENaMguPCYqwRbPGtEnPP6lE
         FtqeFBvD4lBseIn7LhpOYgnO6H8zKgsn31u4QpgjoAqr7QgQr5SpfcUjo5/rhc01mdp6
         Xj1CIuTtWajxV1h8C0IXLdBicXs5jsEC6cVLhaMDrtoEnow9+ziEW8QFQxRYptx9gXTc
         mCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761664671; x=1762269471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMaMHTb4Ah2CCrUzmnNSZ0wgi0JyjgLlM6vbEvp2sbk=;
        b=X2b92gWdsejFIA7Hmh83A7FrqePd2HXx5Qc+0qWlkCdZxSFNxJ0cW/wdOhBDB6/ekW
         QiuWcgkT6wPOjdUJKblew5NSAS4J3rKIR4RT3bX06dIRLn0IHnGjEhELVootXL+R8Mut
         kKMAWEvJKwBEGu4TYEAs48KcuOMPgh/W0ecxUaUBPIQskx0ysUll+MoZVvcw+5EzCZsh
         x3dUe8ABN61Ji+yEfuGkMROxVgxCcWil0VdWP49IkFacaPnvCcnVTEsGDqldYtjAIJcC
         /SgEVy5Po/i2n4hhSmQG7GPJIfPNqs7Pu2NeCt4mJIEDeZzvtTLbz4jZEb/rVoUHZdVc
         5oJg==
X-Forwarded-Encrypted: i=1; AJvYcCX31mhnJGzfITTreAtcvBNWbgqIVUg4e7h69lL6H1KYHA0b0C+LdFuViMh2TuNN9PQY+vg+OMF45UA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBnYYFKETIe4RkzNTE+Ecn1EzAOc3KMaKJzpEhF9QYLo6DA5nc
	Ga+QJItMeQ/kPkgCiUmsdcyPHxiY4Ttqb93hRuUg6PN0Telyyf2lUQJK0tWP2yEnsQs=
X-Gm-Gg: ASbGnctkPkTtu6303Cou/D/sP9DobWJ0wPYq3y/cMVQAI+Crw8QESCtk0lR5DzPOhFL
	ric2oBvBCg2XBm88yaf+WaY5Uj2bLoCrq946b9eetSwWGUfz54iPVzM+gxw1RoEI8xdEpW/bFu5
	BiQud5a84dmPpw7+zKi7Kn+M4u7b8+cA6hneQ9zAMC1maemdlf0sgy7d+g+n9Fkr7IikRKA43SD
	AyKoSGqEfDojE1ADUPRDQh+FTP+B3YlQK/ito2vNpg1RIpt41OE9BfZcWICxa/2BmpudHbcM/7W
	OF1F9JNuMVXPjIDZ8rq/GzlbIUjGgSYoVMNg024nqrpyEpYIzy+xtdQt25nIxiau0BhUolG3SqQ
	4McGBN1S+4vVUVkYo3g6TCPzIjptr0djGtm49Sfy3W0oeto+pncac0YA+HmGsfWnUzV56Mj3N06
	Qt99xJ5nZ6O9D2+0H9cw==
X-Google-Smtp-Source: AGHT+IH2TaPyS4w0bOjLoYbINLXI1oqC6DBGXJhehW0z/yn2CnV6ID73kQc6DVG+AgvO4fXzT9O+Eg==
X-Received: by 2002:a17:902:db11:b0:272:dee1:c133 with SMTP id d9443c01a7336-294cb39de3bmr44858755ad.22.1761664671204;
        Tue, 28 Oct 2025 08:17:51 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:647b:c9a6:1750:9275])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e42afdsm118620375ad.99.2025.10.28.08.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:17:50 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: robh@kernel.org
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	skhan@linuxfoundation.org
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add support for ST TSC1641 power monitor
Date: Tue, 28 Oct 2025 08:17:47 -0700
Message-ID: <20251028151747.663000-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027191425.GA1403533-robh@kernel.org>
References: <20251027191425.GA1403533-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Understood. The bit in question controls the alert pin polarity on the device side,
independent of whether the pin is used as interrupt or not. I'll drop the property
for now and revisit if there's a board that actually uses an inverter or needs to
program the bit explicitly.

Thanks, Igor
