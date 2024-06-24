Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C750137C2E
	for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 11:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228449; cv=none; b=VU18sfJ/pQmEH/A4qvqldJ48Q9sBBRsWA9RNI8lzWJHyXgEKjrLVAMUuxG6lkJmDxI+55YrbVOpZVmLty6JFIRrdES5ZxqkiXbpltb140mBwB9QKT+nGZuLuQQgxnUp/O8CddIA+s3Muezcu73Kfxx8g1pRt0b3xpKDDRKinI90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228449; c=relaxed/simple;
	bh=+ErZu25pzqLlx0hslTTrxNR30qs/NYpfkUirTISVxhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=js9sXn10sQbtfC4Q+LSFu4aCrEvdGEhZRnRr71z2uFyl76xlKm54kEvYcOlU07GJNzLlOu4YTuIMEP4K10axZRiJuzGEJFaJ2Ze5kL8zArW4lptNTBLuAIagkLorKRFrh/HKRsQMu35XiyoefDE0OXPY/NykhYge6pr3xMDKDtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=CYviNRgQ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="CYviNRgQ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42108856c33so30559715e9.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 04:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codasip.com; s=google; t=1719228446; x=1719833246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ErZu25pzqLlx0hslTTrxNR30qs/NYpfkUirTISVxhg=;
        b=CYviNRgQUPqG3rMhItsHTnYaFcPZEWlj/17p7dj58a+jOCOQn1BjBukKfO5uvCXtXw
         WsCBWl/PvXadxEEepMcXI3sStSNIzIX/vkZ2pW+0+ikOO+q9H8/XTnFnNQQgfA6BBLH6
         /GAfH3C5sILvnf/eSMjwCgcmDmBTm69KfPlAdRedQlMnwhwsR4XFNH/Q48ga8HE9c0s1
         F/z6VmAsFrCLzOp+Btep996naTpl4ML96ZCHRUs199psO4WCC3Ydu7u6qyzdzklVujZ6
         VTIVgY/G+wr+FRbxYgnQjSR7KGfLQcS7SbWwv5HIxHkqMX7kH+0DIkJSo8pyby3daxd0
         5lHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228446; x=1719833246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ErZu25pzqLlx0hslTTrxNR30qs/NYpfkUirTISVxhg=;
        b=MqjEV+EbqMqfpKzyhyUGcK5qmHEZD9v3NV0dwRmHB1J3qRk9Uj5VSLIseaXQWKr08C
         dpHYaXQETtq+AWWGOzcghVVno7ZLZIh0m/d1swT7wQ0ISmqCKzuqLzIby/kH+k4exe+b
         J228ij9lxrOy1J2U83aV/6HwDnnBuyXl9531ZnLT/GXtjL2ne8de+NAwmxGh0X6bcfWL
         2ji1U/lWuDvPc2qJNQONTsJBHZJ6wZGOnkWQrieuLu1DPHViQwaxjLqZ+a5s73B4ZScg
         5dkm8xFO+9aehzCTyVY8pp26CE/ztBOLwHSrzf80wmNXeX+g2psTZPRpSSaiGL6Mx7j/
         po7A==
X-Forwarded-Encrypted: i=1; AJvYcCVjUTr5BxKAvDQEMrslMrPBbGtWocNl7pto5e8Ww8Xz1PiAKQjJTL3slVwI44JfOwB2guWWZKC0Co+DqLe7dz9LmcE4zuuoDNxV
X-Gm-Message-State: AOJu0YzdNl9UT+D7OhaIbPi2JAPmjoXnIRrBqrJaaB1fEf9OodNIYQ/A
	EmPN6j8Hx9Yqcn0K/eoO2aLDEqUovHIbTu/Jll/7i9cA6rg5ecO1t00pEzV7nAOL9nra7REkuzh
	oCTw=
X-Google-Smtp-Source: AGHT+IFWP5JEehjY69pBjz0WQ3anDW4CngvKUSqHMOwZQlqaLIx6z5C6tmyfHa/ydbDvB++TnaXu9Q==
X-Received: by 2002:a05:6000:110d:b0:363:d234:c790 with SMTP id ffacd0b85a97d-366e332e1eemr4408123f8f.29.1719228445715;
        Mon, 24 Jun 2024 04:27:25 -0700 (PDT)
Received: from nb152.localdomain ([167.98.108.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248191c65asm130149825e9.40.2024.06.24.04.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 04:27:25 -0700 (PDT)
From: Stuart Menefy <stuart.menefy@codasip.com>
To: alexghiti@rivosinc.com
Cc: aou@eecs.berkeley.edu,
	bjorn@kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	Stuart Menefy <stuart.menefy@codasip.com>
Subject: [PATCH] riscv: Extend sv39 linear mapping max size to 128G
Date: Mon, 24 Jun 2024 12:27:07 +0100
Message-ID: <20240624112707.2183752-1-stuart.menefy@codasip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240514133614.87813-1-alexghiti@rivosinc.com>
References: <20240514133614.87813-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alexandre Ghiti <alexghiti@rivosinc.com> writes:
> This harmonizes all virtual addressing modes which can now all map
> (PGDIR_SIZE * PTRS_PER_PGD) / 4 of physical memory.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Tested-by: Stuart Menefy <stuart.menefy@codasip.com>

