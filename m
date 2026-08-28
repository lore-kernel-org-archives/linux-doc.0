Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1787C3BB68B
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 21:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787953207; cv=none; b=gT0raAMTe5Z+CF4cOoSWyEWM4ySixaLBIuNI69y++tsnGiTiz2gI1i8uQDwrI1prZUzEwXqkB7zxxSxOC/wpt9vWsDyM2eIEj4cLILaMx0Q1cJw31cFrH3Lsm6ZS3Q/QWpNai1wO3KImKfmbxbFfZI5NtvnTt2rogEkEL/jSL8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787953207; c=relaxed/simple;
	bh=L1CZ4hC5eYja2pTSLPNFsmaZ74+4e8ET9A/ihm5k1iU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G9z9ANm1Nd0yREmtaHwT5MJKsa7Y1WTI+qJBUIxf7T+c6dvj1RvaRiYxS+c3EcRv9FpCYDPb0Iz4d7FDl1Zi9QusCeyZ7gHCv2QaNTCYVBV0rhRYwr52/vAywA+NPcoAVm1AoRg1nc2cZAXZalcB/uWd4scftdpdz/t8/nw05e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZeczasF; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZeczasF"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482dd6ee390so1249260f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 14:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787953204; x=1788558004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L1CZ4hC5eYja2pTSLPNFsmaZ74+4e8ET9A/ihm5k1iU=;
        b=QZeczasFla9Z9HlxReKUWZynKIBpk8VxtPMY8aLLbb2hboprATrH3F8u8FNB8zDhI9
         PhS+6Zwgf5x6mhfoqGu+JLg7HJA+yy24jctsDHL5VGoy8xGc+8fgGoMr4JaCCQMEkZsn
         LxEiCp4465Rqi1TUk/SpOrIFweGZpH2OU3gYNU310ltZhpD36qtbAC6xDMY6Ym/e+euy
         W48ej/8Dctxo5jGbc2Ff6uubr/EOgTT9Nlw44Sf1Ro6VTWOQTEfabUVTjtdAGh1CQsck
         EYuDPRQKHx660ZK72plBF5ya7lqMmMvqQR4Ez4KJc4V56Wfy5xGD/PU+4+acS/K9p2BK
         eUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787953204; x=1788558004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L1CZ4hC5eYja2pTSLPNFsmaZ74+4e8ET9A/ihm5k1iU=;
        b=DMrgtk6PXqAj71hAAEJrnkceJ94xc2g3ciMoM/zLfdLwwRUnInOehBlYaHQ+K346em
         esBmPQ4Th9xfd8qJv7Ss58wvmbp8/OODdW4QH9vFKZpgJkPYgj+RYJxq1ui90A7iAu37
         IXuc2Yp++NlFKA2oeTbGw4Ld8tttzhXuz7ggJr3sX/RpP/mgWEMpYKrTX1O+5qy6Ald2
         DiJbuzsnm0TUq6Gj4Pgo/JxP15ZAIjf0wsVAKitkqY4IwYcDP8Eb5C3bFPiy3V7G9Bpl
         Gk68bnxmIbqmw47L5OuqTj5BLREOAUPkZm2H2Ty8TbNro1sX0FPFYSgzWuuWIlRdur6B
         saAg==
X-Gm-Message-State: AFuF++nSP06A8X4XZuA68FvfHAjxbVdafhw6XZu4Px4WSduqD5qu1xpa
	WJLlf1IeW7h/do6mUgVPaHy5mUdZQVtoLdbTk4RqsHehPUkqnFkmfYEFJsZAqw==
X-Gm-Gg: AYBFou3cYxub8KAPcY1wvXblWdWDI/TaOtPm33Fcv86LYSHAhZT0S7iB+ka2bXuh0EQ
	zOv8q/oyMQ+hKpQBhmaxDLvxyU7/rVB9HmrBbetfwMsQy802rH3WWzTIguEz0zJ5VWRzh4StIcW
	CYLO9fWLzJlAA2yGCQZhANWL1KRREKwOv8yrNSWXZSCILARtL0V5OshBV2zntOXaDCtj01/XlNR
	8HMd81bWyZZyfGp4RmrxgeFYNR6GAiFKbbWhY4oRuP86pM1HCCmWHLSjzy5zhas6/8b885NavNj
	gYUc+Q3KbrW7/Ub8CXNBObsccPbKbKL0tJ/FxJNA7vx8v5GMmt+tz7l+9VJKHMbKug9YC73/c9z
	ICmn8OsUHtTYhvVB7QQrTySTjuX5d6t7XjrjpPeFXiteq+1MrQhnm/pSG+fb+ElnyfhiXPM/7mQ
	86aUHMalotOgiym9pA+9MK3ckXMVLCEKcg3e7HKF+DraLTLEHH7pDKXoiR5cf9FelWYcezyg==
X-Received: by 2002:a05:6000:4609:b0:482:e451:6810 with SMTP id ffacd0b85a97d-482f7976116mr17795265f8f.1.1787953203667;
        Fri, 28 Aug 2026 14:40:03 -0700 (PDT)
Received: from 12-castle ([2a02:c7b:31c:5900:81d5:330b:a8a4:d338])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb28276sm6960070f8f.29.2026.08.28.14.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 14:40:03 -0700 (PDT)
From: Martin Kavasi <martin.kavasi3@gmail.com>
X-Google-Original-From: Martin Kavasi <1ai1d7wbz@proton.me>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net
Subject: Re: [PATCH] docs: hu_HU: add Hungarian translation of howto.rst
Date: Fri, 28 Aug 2026 22:40:02 +0100
Message-ID: <20260828214002.46392-1-1ai1d7wbz@proton.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87wltam90w.fsf@trenco.lwn.net>
References: <87wltam90w.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I believe that this is the write way to contact you

I understand that the discussion should remain public

I also wanted to ask about the MAINTAINERS entry for Hungarian
documentation. Should I keep myself listed as the Hungarian
documentation maintainer, or would you prefer that entry to be
handled differently, or to remove it?
