Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1037C3890FB
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 10:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772620145; cv=none; b=l0WFmmc4yzybSWiBJ1NkOP/W3XIyal/HopQ2nue2kUCoyKVg2mOH4pyHbNJhEVYDAxwZlzVxnMIGB4OBFXU050c1ydcg4H56wgC5wsFcOxw9CB4CB+1TA8YnEYj+MwakxQLf3ztGbC7BrIjxdBHWH5sHj+Ln2MwPkmz1nsBtAEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772620145; c=relaxed/simple;
	bh=/LgUGSZMGY8uEem49KViRfs+8g+RfbwUJHSe6ipt2Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hbHeoUiz0/tn1iF33x2ZNFzNETDgYwiT/JKW2X5QyVGwEQCd0Cf5TSIbHszun+7beI+oJD4E7d41kiVq3a1zJIfAPoSPHZmpzdMESxgW4xBjIe2DFgB7THzf22/uuoR5rEWUv40dm9pKHej0f6iS78yqkLbMKLTOCIt0CzO1w64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhowHUW1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhowHUW1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so2681459f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 02:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772620142; x=1773224942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LgUGSZMGY8uEem49KViRfs+8g+RfbwUJHSe6ipt2Z0=;
        b=RhowHUW1rIRm7ZZ3sKor7KYqtRu81LZOc32xiRWptlwT0+nFWJ6Ls15+NwGD4CvTYV
         dUDH/FE6qXrQqLF8KO9TUM4T3z44utqGqgR0ocLNf981EWQHoAn+nldoQlKxr72Dx+SI
         UQKRUiWFaVVMW1AoYtu4j3+SF0JDR+lhLWEB03xjB5mqHnReziPTk9IHpJ1ucW0aj15G
         N5l/FGWiO+H7MR/ZQ93p+GkjZRdUF96SZ6kf8pUM36pqA6a7dutuY8RSd1zEXemu9U+A
         cLVk1/S6RytzfrPxJrmXELdG9Fb2dskBgUwJJriD8AHf87s2VJ/IezL9yXmmKgqmTbM+
         sRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772620142; x=1773224942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/LgUGSZMGY8uEem49KViRfs+8g+RfbwUJHSe6ipt2Z0=;
        b=HJ1iJyTQMFkzjqpxIT4SfViHrjx78/hBMd6i+fuvRx/fwUlZ9OZirC/LCiWGzngUM/
         2idUIQJVtkqgrdzk9rM6qTjkY6e6EUGUS/2leY0xgaov1rXb80jp6nSPfQKLN2OHef7n
         kGYBSdpRJIQEcbV9oF7QUPblXNnQfCC7hxC4R3kDa/j1Mn0a9DchOFo+4o9kJJXBPFxT
         /R/dPphiEv75NoqTn0QKpdwP58jrGhURQzqZj/gYWCAOu7BumwzeXeMvAn8GYpqA+2HJ
         IrB1C/24nxtblIMkGIWFqGWH+wGuyRxV2eYAIVCqx7d4Gnd2DQ2z97ZyJZfsUt0JzNaT
         dj8A==
X-Forwarded-Encrypted: i=1; AJvYcCUooGuRmSZNS+iW0MTUW/5jo8MlzGjDelHzb0CdaCBf/u9aR0zvQPe1I41swCJccJfjpcPGWtWxAdo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj7EJixA6Y1RjCPxDiRZKAa9cGLZ6+U7ieHv5Bqm+XydN8jz2Z
	7rY5boExvzc+DhtpOIDOz0Un3enSFdZW2IVlS5hKBk/2zhc/5v8X1eu+
X-Gm-Gg: ATEYQzzYqQKXPtd8ZwdZQuSPTE5qGVFPPWZ5QGhfJqzKuB0dKa9iy8hVRfN/JL8mmqq
	S6rMDdWZEPLq3dxEQvbp2tMTZKELnee2Dc1VvEfcA1SjziPObKZznQ/kYzKtZEp65BkKOB/jcCE
	e8gUosxODOWWxVJRrjvrKAzuoDYDlHzbUhmE8aY1hnZFNcNufLMHl5+oGvooDMUW1IqFt1/6JrO
	t0wU3FQKOa7zDUCT5cs2EFdzpkjNPz0YwtUJo8KFVoDZVZ7fjPyWeVR3S5+BP5MDQoJaNbiw05K
	HfI7ZUpXsnoSUj4CvEkOvcz+nM93l/DJr38nFwrVJocG+8oAvaneNhGY6ePasG/z00R6MLCmVaY
	VkWY0QR915b3S4hBh5cTaYqtEqmR399hBCCNE0tjiph8qtPtTYvVy3vbkPjpZYxGIvc1u2W+MV/
	voeZUAsCa0lnDJ1+6RsagVt1zN2yyNGkvPv+WObIjpI/kU61kwlsDH2W2+67Iee/R7HIHjhbWlF
	ZdQ
X-Received: by 2002:a05:6000:2891:b0:439:b3d2:3766 with SMTP id ffacd0b85a97d-439c7fae450mr2692590f8f.19.1772620142349;
        Wed, 04 Mar 2026 02:29:02 -0800 (PST)
Received: from laptom.homenet.telecomitalia.it ([193.205.82.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c6129017sm5824734f8f.31.2026.03.04.02.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:29:01 -0800 (PST)
From: Tommaso Cucinotta <tommaso.cucinotta@gmail.com>
X-Google-Original-From: Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
	linux-api@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] sched/deadline: document new sched_getattr() feature for retrieving current parameters for DEADLINE tasks
Date: Wed,  4 Mar 2026 11:28:15 +0100
Message-ID: <20260304102843.1373905-1-tommaso.cucinotta@santannapisa.it>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260303104215.1324243-1-tommaso.cucinotta@santannapisa.it>
References: <20260303104215.1324243-1-tommaso.cucinotta@santannapisa.it>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Compared to the initially submitted documentation patch, this
version addresses the issue highlighted by Juri of the wrong wrapping
of the commit message, and the one found by the chatbot of the wrong
use of quotes around the flags parameter. I'm also adding "v2" in
the subject line, as requested by Randy.
