Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2405F2BEC2D
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 12:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754915969; cv=none; b=aI0f5YIcaUs74i93OQhHNnQa+V/p9tygG0YhsuNeei6USlUP4W7kT6+/72J3zBR8T7dKysZVhMw7LRP3Az7Pw1CYUHYDzcNQW7BqaO8IQKqWmWhZQf2qBtPX8CrvaO+9doOmEQ2aSj53BR1+YN63AhltJ+MdW3JHjyPs8/Wtytg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754915969; c=relaxed/simple;
	bh=A41fqgtIjAZRB0vyfZcgxc2R/n4fgDe6+4XRFoL3NIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ay2Fg6CwlTaVf7hgxzZ0UrneCyV2UWYCQXwc8+OVMsS3pCvqvW9amhkPQJ3dSALg8Rs1vKapxBCRTFeoAABgtlvWJ53zqx+rzgHAY8cjh+wvdrRdV17vkzxiWdNZy6jNQQNrBjiX7nZcmyrvFfahipO88hMRvthdyWsFUeemUT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ds4CrVtG; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ds4CrVtG"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-31f314fe0aaso4964791a91.0
        for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 05:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754915967; x=1755520767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEY5FxbOE+M4/K3IySmpfVK+6dW9L7BlBilzoXEskLg=;
        b=Ds4CrVtGepNnnAGxfnWIQiZTQwTPXv9J9xp/vnNEQtNja+TUJV+TMtf/lY/aFbDCjH
         OV26FjlZ45Qi8OgP0IzT/A5+9mXWaZ1NiYU6brlhXQoC0DSOHyTJQrqO51lrd+UeJ9lc
         pu3rmKxURU0RrNjJs0u0jwjdIkmQzhhpdd1D9EoXVb2bjxF01HaIPaZ5e4AZ8DDrs740
         zJL8l79JUxdF+KurzrL5Kz207WsnImJhjE1QmM0sJjz3Lq85XalSx3JbXkl2kCosZJYA
         ijf2bG789saOcCO0SU58xgzsUDvuejHjNU9cvoV+32kwVSxoCfXMt8iSdsYdtKe4R+r7
         vNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754915967; x=1755520767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEY5FxbOE+M4/K3IySmpfVK+6dW9L7BlBilzoXEskLg=;
        b=cGT+pZWYJSix+yYu/mQFPgJpzEiTp4MUU6B1/H0qLZNCMdiclgzB0w3k9IX+rLm6fR
         DYXOtBbFl4RDoi2sJUdefKBC0QL/DHD6s7OnAS3h01xB5kQMEa5lg3c/KLD8rw1r9TLg
         KWIuIRHF6uvURz01suFJjmhHDS+B4EVvXDQjVctJ7vUW/QPPgXSgJqt2759JFDFPuemY
         IZAcWhpvo/hfJijtn1RL8W6qRr2S/igQ5gzdjGQ88gJjGCiUko3lCpZk/abJqMUaqZ49
         WwD0DiBrYqYVXy6d70RbVVw9mK4rwwa9qabSgAzpziJ51663t2fi9bOn03yptM8dBiVP
         9Btg==
X-Forwarded-Encrypted: i=1; AJvYcCWiizsn6O7pFIHwmaYpmZZtoueYNisQ+7MSVjtCsqxpWkXvezQqBl9PYYrTKn1bbFcBAn0x1zCDzbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC3tUxphsU6olYlsWL/bBVleRHLrJfeg2KkSwHKb6+2ReFuQDj
	aT8Hn9CQjXbEu6Evpl98gnlPxJuWfXzYTgMehXy+ftT0ASPkre0zMT918VfvCSnAK/iX
X-Gm-Gg: ASbGnctX0c5IJfvtSMjg20iXS9/Ae7TMbVDbol0vWi9oTNJpcjvTUUWzZjNnJ7YFbIU
	upOJJSI0kwSf6/mOpqDRQ8qK+QyWMQIXDA+IpfVhrT4LYKiVEuB/ldoYE2qENHqztEwn90ERD8r
	N2molN/P5u981hrbUZWM2aQ6i0tg3kgVDIwYdeIOX5qWNffs9Af5PAfvG6XHAnOGZqPtCygazI+
	qKs54FkMFn8dThPMc52qIu3EBDZtnKNwc+50/a3alVGHE49CXigH7B+hp6oNQRU2aJfeFl42GLw
	+ybUWJszH8pAmgCpajIO9yqe4vFM+2SDwv8N2IUwjC891hR3lfkfS9C02bcWdCiYmJr8Hkm/sNM
	LpSYDUbh7+fCMiv/LDKXFMmWjX4nmg2CpmUAD1+3E
X-Google-Smtp-Source: AGHT+IExAfPXU4xzuqrRd70RkdM+E5Qyc7I2Njf0p3QW5BHfgEb4HaxS7l54URe8AVQT/ccKRO4+7A==
X-Received: by 2002:a17:90b:3c0f:b0:31f:1db2:69b1 with SMTP id 98e67ed59e1d1-32183b3f161mr22898050a91.18.1754915967004;
        Mon, 11 Aug 2025 05:39:27 -0700 (PDT)
Received: from kerneldocs.. ([157.51.80.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3216128ac08sm14731699a91.30.2025.08.11.05.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:39:26 -0700 (PDT)
From: Nikil Paul S <snikilpaul@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	snikilpaul@gmail.com
Subject: [PATCH 2/2] docs: rcu: Update dead OLS link in RTFP.txt
Date: Mon, 11 Aug 2025 12:38:37 +0000
Message-ID: <20250811123837.4378-3-snikilpaul@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811123837.4378-1-snikilpaul@gmail.com>
References: <20250811123837.4378-1-snikilpaul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nikil <snikilpaul@gmail.com>

Replace a dead link to the OLS 2001 Proceedings with a working
version hosted on kernel.org.
Signed-off-by: Nikil Paul S <snikilpaul@gmail.com>
---
 Documentation/RCU/RTFP.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/RCU/RTFP.txt b/Documentation/RCU/RTFP.txt
index db8f16b392aa..87b1c97c3ec3 100644
--- a/Documentation/RCU/RTFP.txt
+++ b/Documentation/RCU/RTFP.txt
@@ -641,7 +641,7 @@ Orran Krieger and Rusty Russell and Dipankar Sarma and Maneesh Soni"
 ,Month="July"
 ,Year="2001"
 ,note="Available:
-\url{http://www.linuxsymposium.org/2001/abstracts/readcopy.php}
+\url{https://www.kernel.org/doc/ols/2001/read-copy.pdf}
 \url{http://www.rdrop.com/users/paulmck/RCU/rclock_OLS.2001.05.01c.pdf}
 [Viewed June 23, 2004]"
 ,annotation={
-- 
2.43.0

