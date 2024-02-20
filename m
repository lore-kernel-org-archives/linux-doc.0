Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2254692E4
	for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 12:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708431703; cv=none; b=ij0cZvI+zsx8HUvQGWDMIinkR7tPmuUokAkIyD3JGkU3wdA7saWV6dIHcPKaJfyGmEZwV5g/mBlhaMuVyEbUuI+LaWpJWzjFUnrM/ZcbI1U4EN3mwsy/mTbJEKEBRzb5W720dYH3jxwi2pdawqQDdGiAJHkz5UReI33BOza+lI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708431703; c=relaxed/simple;
	bh=j5bs0/iOOUF9Cuyj4rG6IASjedmK5NxyUi/nRDfE1RY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IF4rU1bBYtCCmzTRUpGqVSPXXCUUF4XggFeFmxAHLJgrGGj0mxi+OMlPcunoJc8XmZeawQGJzlLxp6UeUjNfCKME9lHhWxnsIXH2B/TCLs5+s8Y7B3hXSMDZIirbZgp4Xm0KPrEKo1GOToyVzgs1IanMC52wMF/ZtTEPfjqOrow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Ny2YcrX+; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Ny2YcrX+"
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 331373F125
	for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 12:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1708431699;
	bh=j5bs0/iOOUF9Cuyj4rG6IASjedmK5NxyUi/nRDfE1RY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Ny2YcrX+W4tLiIFEWxJLl0FpXluI5xS8M0VMtB9GVvvqybeABImyx7OcDtIIYccJx
	 mLMPc+s3GOTIfiV7Tc01JpuxKDWqA/izBH2kXK+qh5DzeGUYEh/Q5T4SeGUaTWGYt3
	 5KZAxeSfbfVk3XI8tcZJmbB+HQgaZ4sK7Fk2Jrwxw9lnk8aX8NnIE2ATBx8T4dBA11
	 ud37ZcG2F+LL19H1kwDqbPaNwHw6LwAX2zcN0z9uMJxACNCedT01G6eoNh/+lWnskr
	 xIlWOkbWxGv+7/n6ns0sOzeyfx30oAIh9EEuyIktO0lO4pthXwZuLFbaE/LTryxWKb
	 f5B4SuA4ufYgA==
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-5cf555b2a53so4819845a12.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 04:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708431697; x=1709036497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5bs0/iOOUF9Cuyj4rG6IASjedmK5NxyUi/nRDfE1RY=;
        b=GKIlbZ9Ie9VzFhNOpOt7mvLmYvu4TFU4pap2BQpqRAP6G2yjbcxp1EFtKRpXnDTmjn
         Z6/pENPaaFGhUqa6hZ3gKwit3SUCUr8bR9Ibbi6SU48yULWRolV48h1LkQKoirRXjN82
         rR2TT7awGnNDVYjFp/D9Wwte4gEu/x2fbHUgNyu29j4FQw6cEGlrf38Gb06UMzqzjlZj
         0bHLIZ/QN/CUJCShvSHuXvQM30qq588Zx9JaGPDleBmgXg/MN5sd6B1DW5+UyYGz0T/2
         nejzkFGfwLx1ykr/5wrLScoStkZjt4R0nwbiCkmkNPKwrzTopgKw8mqLw/m2tAfS6MDb
         GXHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsJVR2NJ233mkhv5vB8/olq/l4BDtU+Hzvyiy3pzj7kUiAlANivME44cxri03OonnAZGgC4vA+TWVFR0ApQoGevRWd+lcEskz7
X-Gm-Message-State: AOJu0YzW3cxXcEe8uEMkiYhmvvpbZU2k/pf/iPr/8W+RVb5YmW1REF73
	KU6DVQvWsldq5ZKqNxAjP17G6ohSfUQkxLTCiiwes4SlUw8ukFIFYJnb/W8/dO0VtmruPr+8zQC
	U9p8JEWoqFsUSxMWjEOYyYY0AJv5l+9P5jryX+gtM89THjGYN6q+PtTVAxQKsN47evQHkP0jagA
	==
X-Received: by 2002:a17:90a:8304:b0:298:a422:937d with SMTP id h4-20020a17090a830400b00298a422937dmr18416929pjn.24.1708431697140;
        Tue, 20 Feb 2024 04:21:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLAtc7xJSsu2a2w8NbFlepqwlXit+secKB0bdFRp/jrwC17jdRwv1LfM6a++aLJcUbSYE/Iw==
X-Received: by 2002:a17:90a:8304:b0:298:a422:937d with SMTP id h4-20020a17090a830400b00298a422937dmr18416908pjn.24.1708431696769;
        Tue, 20 Feb 2024 04:21:36 -0800 (PST)
Received: from fenrir.. ([179.108.23.66])
        by smtp.gmail.com with ESMTPSA id y7-20020a17090a644700b0029942d11f3bsm7012559pjm.3.2024.02.20.04.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 04:21:36 -0800 (PST)
From: Lincoln Wallace <lincoln.wallace@canonical.com>
To: brgl@bgdev.pl
Cc: corbet@lwn.net,
	lincoln.wallace@canonical.com,
	linus.walleij@linaro.org,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: gpio: Add a note on the deprecated GPIO Testing Driver
Date: Tue, 20 Feb 2024 09:21:32 -0300
Message-Id: <20240220122132.16991-1-lincoln.wallace@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <CAMRc=MdoUuOLTYHu99+c_AVhnDZ5LkKHkYJ0D681fcJV_aW2Ng@mail.gmail.com>
References: <CAMRc=MdoUuOLTYHu99+c_AVhnDZ5LkKHkYJ0D681fcJV_aW2Ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lincoln

