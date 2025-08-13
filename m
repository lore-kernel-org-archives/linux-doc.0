Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ECE19F424
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 18:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755109484; cv=none; b=SFYLJAChaH/0S2/P/TgHnf1bhXOVLBQvdCGvsJLgjYu+aEuKkZcRDc2ddOJSNTqWpNyOhcG3+eAi5YqL5o3E4isGM3PaFXest83EDmz0eqWX/cBmjzUIE0V7jkzfrDJPQ00Py2zq5UIBnzgkeD4lCwaHBi7ZlHNA87//gU9Hrk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755109484; c=relaxed/simple;
	bh=WSElgLPdc06rADzbVIRWp6BMTdAE29ykCLN9NzSyDVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eXbk7+PLTZcqXTZg9OwrK53IkFCcYIxLgGJA1cbNn8PeoPN0JOaPJ5OYu62FQgU59YxGHEvGsAYIUVIm88v57CcpO7doen/DP/zdSiLvmsMgpsfLyMhnRynREUcMaTHsgyzb9wGmwx4l0/2v/5w5yaIcYKZeXObhdXWwpcneDdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQ0Dxj3O; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQ0Dxj3O"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e2eb9ae80so218226b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 11:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755109481; x=1755714281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSElgLPdc06rADzbVIRWp6BMTdAE29ykCLN9NzSyDVI=;
        b=cQ0Dxj3OYVcuzlXIRBDAEiT/OLOTlmAPsqkBQe1g6+EPT4D0TPKLhGQdEfv3U+NdyM
         7JQiujRSZz0ABEgbRaZjBco1PSmO08Sn2YuTu2jR/ovgaubEQD/66Av791hlhBu/4ykN
         XkVKADs9n4WlMZ0eig2+v2ew4nnqprg5Z6+dydAf91uxExUwp5yDN05kZ+MgfzTBkWoy
         Q87zRnwYKXjZG81yQ266ExNsNMa9DgQJ4TAZKjyC78nMgHPRMEOWbmWrJhuYJyDvISZk
         c89s8dzlsU3rgkaTddM10PrDXKn+9hD7i9ZfWng2ECSGYnY54ktW/g+2RBLb+7RfxEJd
         awVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755109481; x=1755714281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSElgLPdc06rADzbVIRWp6BMTdAE29ykCLN9NzSyDVI=;
        b=Se3wpq5YN7VzUUs88cJdbAEbY9O60V7BAe3qBN+aGF9YO0TaFaZ/3iHnH2Eq9nsBJR
         DrwdVuxbraHzWSEDLeh6HijaZajFyhRa1GLYz52/ueaJn/BL+FzUXGiZQvCGYLVMNo+j
         sr9Dev70ICpa1lrSI2A9rDGHh76B+wxXU9i9XK4k4wayOB14wdbQlRAC7TZ8OXElXGbF
         CBgMV+rEYecrJgVMi2Hpp7tmYgdSQT1ig0V/I5GxkdZ3wv8mQRiJsW4d5KkXi/BeKEHV
         ybR7fRrWwOfeHAQk/V8po1ZbdI2RTGHoQm27t5GrK6HJE7T3s/a0jr9CgWKxFrW6wMgC
         wo8g==
X-Forwarded-Encrypted: i=1; AJvYcCUAVm8pcfeMfLiPg/p6k9kuHUrsYyh2fqqN13t7sRY94Ls8sqLNa6vYXsfgwtsvQt7snNHLNnaFMeM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj2GZ2EaWpCC/DhqNbk0TOjDoEuWmzuocB74DjK7Fb00dmz8G7
	woeSNIiA3Tl89KaejVjBei3Jw3+2znP9HN3leXwCAnJFeNStO/t0U5qz
X-Gm-Gg: ASbGncsglIdBaFkxjED25F5dLsX6yeOCa1N1M5Vr7ENhdj5xXMTP9liopN18RblV+tS
	bET1EnDdostpKYHVmoTCwG7cMUGyNlQ3CpxD8h+e4JMJsvGZDShpIhLM8RC0ruqFReRPpAQEs3S
	cdkJ2jVKhgxnrAUcgcbY3yvBwtkRIj8bw1KX0IMVamX0sRYyWHNtNy84MQxWc3F29zxTlxu9Oqz
	VZrG9Ws9HiewMa/xneWrJMP8aVqz2U2hKk0uhpoXrCXXj000xxLlXsexRzXsufDwnwNtYsArWVV
	0FOB2QHO+3hEal/rUSa84cS0EXgeeSgYwg4XhoT1S85DC6+8IojcqsaYYZto7XlEV/M93GtR2iS
	pWURsgOCp1uu6F4lvLi8WSa4PgFA=
X-Google-Smtp-Source: AGHT+IHNn8cM24C2wvCi/hf6+sq5m38hsN5v8/L3Ik19O+AqVou0LCoGzMMaD/LKrQHUHWi0mTx1hg==
X-Received: by 2002:a05:6a20:2446:b0:23d:ae11:e1e1 with SMTP id adf61e73a8af0-240a8a83ed2mr6253991637.12.1755109481144;
        Wed, 13 Aug 2025 11:24:41 -0700 (PDT)
Received: from lkmp.. ([49.43.242.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e2591b169sm1947859b3a.91.2025.08.13.11.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 11:24:40 -0700 (PDT)
From: rakuram <rakuram.e96@gmail.com>
To: rdunlap@infradead.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	rakuram.e96@gmail.com,
	skhan@linuxfoundation.org,
	ukleinek@kernel.org
Subject: Re: [PATCH] Documentation/kernel_hacking: Fix minor typo in hacking.rst
Date: Wed, 13 Aug 2025 23:54:33 +0530
Message-ID: <20250813182434.7189-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <970be4df-e010-4ba2-b2e9-c2c24b8742ef@infradead.org>
References: <970be4df-e010-4ba2-b2e9-c2c24b8742ef@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the clarification, and I apologise for the oversight in my submission.
Could you please suggest the best way to check whether a similar patch has already been attempted before sending one?

Thanks,
Rakuram
