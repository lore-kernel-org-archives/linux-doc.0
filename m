Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDA63BE644
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 06:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334129; cv=none; b=DZO8UpcgO68TXTZNQ+vVaiA0lc/xwB0JgMwZhwM/U6K0x5SJei+6erwllODFSfng3mGDxWIgjUni1ik8bJIbpm1chCPvvWiDWEag/6o5/HlayoQAW96HeEmy/Aw2OQgEB7nGxaypHNLK4TX4Mnii4j5al6t5bEumL/PXtz1rtOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334129; c=relaxed/simple;
	bh=yu3nC6vhpzZez3hZu5WSDBz9l+V7URi8BT2ABBFXuP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ta80LFJujHsuHLq+h5gGUB4WlFwTQfGvBG0FEasj4zdFUUGWavJ53ga5g15Z8rKfJi4P1GTNtZRkqn3hLk2uNYoQpHaTlc+HTLSp4cu/gR6jWRfksOJU9dLftQhYhFjWeb3RJ0yQDEoW7iVZlXy9tZ0imjvCcCjXadLX7tWq5RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMcMgJdl; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMcMgJdl"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b4fd681c2so712462f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 23:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774334125; x=1774938925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=PMcMgJdl9+8nEGQiWKxf5k+f+ICevnvHpmyNIIebnq1FtFkE/eKPmDJO32bvzB/Ne2
         wLtCDuYLT8RX+PC5LskQqp6Y+SD2O2ZMU5PJhOCWTdTFrxD2437tSkYxsmY1ut9+vD42
         Sw/oZT00uEJ9Kju8mKIohmNb9xlYPjhOF9BvPBFV355YRteNnqNsmizeOOoHkR1h4yyU
         ARky9VX4+fkk+1Y8Ym9qTYtdLcQIC3Sd4XYoRLL0XfCfIEhlmkT1JQpL/sK2ngw0mzri
         hgehwSzc6SjzT3VLET+jNAvqPw2FIawqcbfQEL8YFIZo+WIZdrhFnkAmTKuhj1+n9SSn
         A1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334125; x=1774938925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=b8uxut7N9CNrdbIEQRABD2hsItibt+MdpwTbfJEtCZkDhPzYvOGNeBku2L/PbxkOmP
         2fMe8St+/AIfHnuRHq6nKzvEAt1z01y/JYCFWXHfx9XHAEcS5U1rGQ4Ek4sTbPGCzvn6
         Eh7MStEI0XJCSLZVUdkWVJs8xYlk0LRyzizyRXP2oAkW7Z+qpTs67p9csMg402M7LYl/
         is+4b4CDKERJftgC49w4lg4EcCXikBoSiNcWqY9kwgK6VKadNhvj9j8D9SebSvnkMAkR
         HuG1VpUXaYoeG7LSIngfyfSORwG1qzVjhqxvAEa+1c+X0SJJVlhvXrlUhBXSSjJaoJ/M
         ciBA==
X-Forwarded-Encrypted: i=1; AJvYcCW9SM9utOwK3V1uSPZDmHmEPbkFoI1Vi88vNjlTNGBG+NDpUg7papHrHuwWQ3vPie867Ha+jA6LG6A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz08GOVtCwf2ZwkMmhJVBiTwk3V057vN2kvLUF9P0mvgGMCM6x
	UL4sYDaahDvapPiZ84TAAth31an8B7mTVPaY6E8AwUBziHJ9b+NKQcJ+
X-Gm-Gg: ATEYQzxSdm8yBSl4TkGx/eY4566BOIkawC6N+5sG8s1ch++bQurnEVFg4lMwKqTYl+o
	NQvmCkNIR8J0+5Kt+afu7tVh5OoY9kB6ODnMxyTHJ1z6JnOIKHHGGXv0pBZ3Cb6u7soDup+CVvs
	oXWGf+hLkO7umNpV47g0aKSEdFwkUzZIQnjKeIq2YnDb69pWGIAssKTNN6Nes1dF757jViv5jdi
	HBJY6JbAnm6wYdCDFkh4gDG3oB0LNOtcvP1ytBNcXG4aqp3HAJlrqoRUFyBH0lQRFeWAVwSZOqK
	vJuyU90bsyIeMwTXvzVbMZhME1QkqzbcyOITKPxIJTx8+tsjntdHZEABLbAzQLNvH2e/mWdYcAx
	N22pJyAcnHp6yUqfvgDZzZBia9m4qdZNNMwwo0050K3CSKd3MCVr/wA2NxiOC/qxwFV0j9JzysH
	VmIukdBigs3pZP+f+z2M8=
X-Received: by 2002:a05:6000:1aca:b0:439:be78:e1e9 with SMTP id ffacd0b85a97d-43b6423fabamr24225594f8f.14.1774334124571;
        Mon, 23 Mar 2026 23:35:24 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43b6470380asm34457509f8f.24.2026.03.23.23.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 23:35:23 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: ruanjinjie@huawei.com
Cc: devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	x86@kernel.org
Subject: Re: [PATCH v9 0/5] arm64/riscv: Add support for crashkernel CMA reservation
Date: Tue, 24 Mar 2026 09:35:18 +0300
Message-ID: <20260324063519.3258161-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323072745.2481719-1-ruanjinjie@huawei.com>
References: <20260323072745.2481719-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please, remove me from CC list in future versions of this patchset

-- 
Askar Safin
