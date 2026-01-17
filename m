Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF76241663
	for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 23:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768692760; cv=none; b=Ugai+I6hdE0vd2wJuQsu92o6tj/DlQ9lkXndj56BfY0pZyV/hL/9iOyN9jW7N8M9LjTI5gaSxjl6cFZ/gYsKnB9SaImxNgKqDZ2gX7xZqpgTpzJ7hPEIQEGn9DL7k5osJAITKDImtl+/QAr/DHw/lqmcwvqFoVr/opUsnSDi5Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768692760; c=relaxed/simple;
	bh=KsgIAfP+W70BPJlRGYfbmCnGPSyOyXncu2CNcuP6E8E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a2ty2i2iYy/PgvLG2jLWSDtCJ6nf8LXBhpdivqFgrDqDuN3qclZqSiC7vT6dt2q1+cGetbR93jVvGVzRUcYsDOhQDvn4/KYanQBqYW9wF024v7fZr/P1OElaA59I92+hDg0GgIxGHix7Ps0ps9I6rocaoKkOI1uabo36iZwOXQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ago0No+V; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ago0No+V"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-45c733ccc32so2028453b6e.0
        for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 15:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768692758; x=1769297558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YJi2c02eGE0Lx/gRXI7yV1B+E+TXhOaeYVBCRIQYM7U=;
        b=ago0No+VV5tcYrW2GfjWshjMK2/fswo9PRRsRJSfLkmuHyTCog/jTTE+kCWGznB/4b
         8Y9ovwZE005YOOrBSjgysXGdWrGWaNg9Qrr5JILVpHuolyMF+a7DBFyutvm+0fchvlln
         DEP/rVMMZBP/8PceVZqZzU8pKOGA104DU1JgcIVzbyU896q9lPsHjkNHGreK2AzZYUnj
         JOJtm5HH88Gc8sYYlqjwP4Iec9/R7l27MCkghm/G5AB8C1hM3PKBef51sEjPGwFjl4/l
         McEBZIIKsx9JrYrH1ekYlPQJEJ8dXbt+mFcmiyLnC1YyBIr0t/YUDhE3qqIXW7aOoQZu
         8EtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768692758; x=1769297558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJi2c02eGE0Lx/gRXI7yV1B+E+TXhOaeYVBCRIQYM7U=;
        b=BdMxKZzQjUwR1fciLbRu6RTzhxN1f1QmMLFudPLZ0kbcuh84Xk5p6JaiulZd8/JGQH
         wgFqJmFHKag3vo+RSKTvY9ISX49VkqrN5HfForb4he4G9mfuSVgVPMVLt16MZAus5zZW
         k+DHpLyO2ptcn9G6miCBbLtaLLpt6F/LKavxEY7eGjhlCzwA1iRYQyIsCqwhmYdI+/q0
         zhoqmkWh6inJY/YorvbmOgvoEz6llm2iN3aN7CgLs6paPLLueIvwHYEQm/Esjsr6BKAX
         1UP3ix3f7aX9cPWwchVQEkff5reUvOuztoyH2VsoGCyVJn89wmjomGUSv5cZ5AChBV4p
         XHCA==
X-Forwarded-Encrypted: i=1; AJvYcCVTtvPOlG+acDn7UwanCicRhFIAvgxRWzOpy5TvQKE+aP7SVUJy26eu+4C8+igMsLTTBeF26XYAruA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTcY+z0sNFA++/CIgVY6YzRlansRPmCZ6gl+C6k74UvOv16oNy
	KBKH5q7QARxAz5CIwfCErFIn0Y4Pty/6jgW5hIuY1ZxRY1UOawaCocaP
X-Gm-Gg: AY/fxX4xPgFBTs8XDkDHFOO4SJQEBBpQO+4MTUqDRzFUEivuxGb/ix+dWPSKcMzE+ji
	hyoezzDGN98ZeSPAXnroi70cCeMmCWVNn9VBik3Vw1gFLw8ZsGPJsDRz4G708Wh652nxizIs31z
	BU79IFPU96onaTVBF9LqXvOwAUXHW6JdkwWzwrGOQJKU7+CXlWrZ9CzEKzXVqpPH5klj6YUjwJD
	eSpufnGYOk+gBX+W1jSJ9BR/y/LjhTU6iQFJ4otJnwsNjNNQ6VkYaq8W7DjzJv/PnMKsM+dSe41
	syqeW1wWZBoPKk7YD7AfdiHFLEkJzRMSZtjGhzKIJU/SKHUZbJ7p+1oVA56eNQuKDrbcvvHpJr5
	zpCpmL2IRAF/g/cvhKbF9GnMYuuOrZrScIGF87dMcZNGfrQhoseYuCbhonB52MA4g8Gv2XwPhI1
	IDWKncVZESZhz6F+DG7+WAGIs1sewcuPd1ozoUzqFT
X-Received: by 2002:a05:6808:3088:b0:43b:8cf4:9284 with SMTP id 5614622812f47-45c9bf84db1mr3555134b6e.14.1768692757671;
        Sat, 17 Jan 2026 15:32:37 -0800 (PST)
Received: from localhost.localdomain ([50.24.139.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9e0086a4sm3424232b6e.12.2026.01.17.15.32.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 17 Jan 2026 15:32:36 -0800 (PST)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	pjw@kernel.org
Cc: Andy Chiu <andybnac@gmail.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vincent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com
Subject: [PATCH v2 0/1] update riscv prctl for discovering V extension
Date: Sat, 17 Jan 2026 17:32:26 -0600
Message-Id: <20260117233228.36088-1-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This version of the patch fixes an htmldocs build fail and some formatting
issues, and it has some sentences rewritten for an easier read. The
patch is based on current riscv fixes and the hash is included at the
bottom.

Link to v1: https://lore.kernel.org/all/20260107000609.63892-1-andybnac@gmail.com/

Andy Chiu (1):
  Documentation: riscv: update Vector discovery for userspace

 Documentation/arch/riscv/vector.rst | 51 +++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 10 deletions(-)


base-commit: b0d7f5f0c9f05f1b6d4ee7110f15bef9c11f9df0
-- 
2.39.3 (Apple Git-145)

