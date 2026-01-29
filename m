Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316A519E97B
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769698836; cv=none; b=CIwX9cGq0Ko8iIV0bIzudh+vTICRz3U1ac/ktFO91Ry38fwOSCM5BwSI4F+20G0PoLxEz09eM8XKR4zqfqzrIACqdJ3M6n+HaxZs6bIejTZKT+0tPpxD6GKYmPb2BmC72CR1WzraXIqNZ4Ca66/lKfiY7UEYwtdz67L2WuiiNMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769698836; c=relaxed/simple;
	bh=Lr0gRlWXmJSBfvv/mHBNT2m9wjy59gkDa6uMR53IbXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=idGIAnqGMZi9+ZkldmYgw2wC5zIFQVqeR7tyLO/bmXMURtYvOObpkBwGZg+eHvZFAbL6uwszW36XAfHBpFFwzrPhcrN2imBMrQP5QUNsMcfGXOwBswXqk1rGVXiY3/z9OnqnLQeftHe8jlvMgEku7buRcevZNZusAshjFS3GZCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1dNvkHO; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1dNvkHO"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a07fac8aa1so7410655ad.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769698834; x=1770303634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lr0gRlWXmJSBfvv/mHBNT2m9wjy59gkDa6uMR53IbXk=;
        b=B1dNvkHO0uevgLCKTUotm2DUZzcj7ULm6uUa1kTtA4TPS3PmpqfmuOjOEPOyXHBl3c
         2ovry6WfWwSDJL5JZSDrEU1Np4+/JYUHWJX8bOgdiriN4tjCjJm5mtLHveReKvvVmfax
         5DDODBlsp7mYuqRSNZBLYjfiITizJz7KG/R0uIVrVQ48FxIrCGCT/Y+SXccdsOyyhgOX
         Nm8nBOhZFWhaQGjbuYO+aKaDwcDZ3ribLn/5oBKjGHf5N8fOSJvLuEm0sdpVrN3q5is8
         Fd6kh3Kz9goeABqNSLg7n4ihHxJaypsHiH+uv3eOe4WGFbFvwb3JXh2SnqK09XozUnkr
         5TzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769698834; x=1770303634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lr0gRlWXmJSBfvv/mHBNT2m9wjy59gkDa6uMR53IbXk=;
        b=wjKRdSKAmtNU07+xdLpaPxYK408+aqP/BnkRVOI+TTJSZyenL7otdtNFBSgxlVC4hH
         V5eGU/GKe1NBzpYZiFNzbyTGaTg9MyXLJYoDFfYeJa2ebaiQRVbx7sAJELy/JXA8tU/F
         S/jYwAOCVD1M0O0hauf0DHV6bBHCi8gX5GSSnnO6vzOfTo8LQJBWUDqj20GlkBTmgxnV
         2whVmRab9c7lFJsyv9yzb3JkYtT5q9zr2QUp4mU4j3WWXkXUxsMa7EiOnfaYwFSIKeAL
         wxX4WgoD2Rxk1i7+8FLFjJOT3kWnJ4YxqqUoNCU/v44v6A3irLujRMlcjjeJcfiM568i
         8hQg==
X-Forwarded-Encrypted: i=1; AJvYcCWX2YSkp9Dt3SiBD+ohP3pKV3I3emU6aS1dWHk0e5OnRA2MYxYybRFZndCKu3Kwvs0vWWKAnIJcdFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYFdNxYtGNoqgkqTI8Ra8KQD5bACsF5q0z00ySW75sWnsUIhuW
	XRy+Dwf5uVMzrvUgSujBBZYUfY0e0cjGnpIldAbXEVYogM/LR+FTYMI0
X-Gm-Gg: AZuq6aLSYzUWbYi6FYDWb7B4XhhmWatcCgnJlGbuOXRkLqDQVKy41yZsrpb2ex4paY5
	IioNfjM8qsXvsry7FmaziNAzF7ys7J1vkKfLHXQLhpAo/edIryGSidPwTwtdDmsdid6d+JO8k4r
	9mbHJZdeLPqvFlpZku20LfDVkIvEs5DjWtRhTrBPDtyJXSAHKg37eoeqtTbC0Fxalv/zfpj6Kp1
	qWtb/DsYJsh1m+U3EnousxzoMSngkAsZLMccIQuoPtOJqyZkysRmVrur88TZ4qjRi78AC11/7fu
	dfQYLDU2ivKkXfOO4HsQ2EQT483rxHfQ1NamAVI7M6ReTijEYKKa0xv+tHwjqlEZ4IzLJIgaI+u
	7wbWvlGgiMVJOx2M6xbPvyKT0PHn9tdAkpTBjm0t2WZvALje3hysmXxaMetNGAv8BuslL+UdIu1
	EMukOibbm/QSjuc1kMo5hbkj1gbDZg
X-Received: by 2002:a17:903:2ecf:b0:2a0:d05c:7de3 with SMTP id d9443c01a7336-2a870d5a588mr85878625ad.15.1769698834168;
        Thu, 29 Jan 2026 07:00:34 -0800 (PST)
Received: from fedora ([2401:4900:88b9:4745:b6a7:8b73:65c5:8fa4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b426e3csm56182695ad.44.2026.01.29.07.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 07:00:33 -0800 (PST)
From: harshdaniel66356@gmail.com
To: gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org,
	harshdaniel66356@gmail.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: Add bindings for dim2 compatible strings.
Date: Thu, 29 Jan 2026 20:30:21 +0530
Message-ID: <20260129150021.40817-1-harshdaniel66356@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <2026012906-gristle-junkyard-0c96@gregkh>
References: <2026012906-gristle-junkyard-0c96@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry about that, this was my first time sending an email via git send-email.
