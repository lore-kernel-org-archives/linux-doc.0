Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E573EBF2D
	for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 04:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769401365; cv=none; b=BuumT5xMhVqI3D6jmZR+S2q4VNDJY6xnWPAXKtlIOErd4CAsFpPXD6K/9IQSG95TkWJt3AGPydXqFr5bZ/B67FlMUdMiRJziy92Ow3lQVsf/gLLgp2tmjlwn3qsAwAmE8y8TYNtpmZLietN4pEvttH+rxIbCWu5FHkMibIL0Rls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769401365; c=relaxed/simple;
	bh=e4QsZET6UZ+1H0vD+BcRDTxGDlM0hhs4k8to6PScDKU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=p/lWLdhZsnYpVlhrdPp9MK4ikEo8eK7c/xHk8Ylm++4rdYgFlYH72LMtgHim6dC3+E3fhz64yoM+pQV6p4D6kQFCVoECRJl6/mk8lcFCzQZvvA4RoxcGMKXiiR6cjoAhg+SfColMB3Ncg5Ju3MGS6c6D0ipczbKu54lZywpFZzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxFGad10; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxFGad10"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82307c6902eso1771362b3a.3
        for <linux-doc@vger.kernel.org>; Sun, 25 Jan 2026 20:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769401364; x=1770006164; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+XJK0+ARuYa5Ty9ZZI1bj6RQjF63ZwhVPzjpjM2zqE=;
        b=IxFGad101gbEB+Wf7c7drR+/yTScDX2F2o60ZEq/Ib6KaDxU9Tw9lq/Nz5/F81h56l
         848zWn8Ns+3fea2CB9z3t9ioquxzckEeZQJbil7i4mZXwhPA76e6p+TZu6JSPE58XVEq
         t2v155oWnGZ2wPH7DsuKJc6sajUGudj8AahyvEtCMJ+Jv0/o7OwTjWlTblbXsR60bOy8
         30Wn/B9/ekVm66GosJ8ZPkDtdWrsqVFe1DztiMDe0IWTiS2s222onJkHy895qbaafguB
         NyTjnKrY1lljRODuJxAMFsAUNoyG7EU/YWHrvVlJQnoyqC4E3GDODTtp2FcHhYhVfgzm
         sBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769401364; x=1770006164;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+XJK0+ARuYa5Ty9ZZI1bj6RQjF63ZwhVPzjpjM2zqE=;
        b=HX1WsmAKo2OxhH+FSn6uofCZx0sAni0FahEI1IC6/02r8tmCb3DRx6bLFfjcDr6Ef+
         EbW/PiQjaCh7h+ZfkDKs1nSulDQK/ub4S4o+yRKWhjewlk7sP6+xiP52CvQHGoG56RDv
         jfoh44FZuO3gvuCdW0sqN8fpH2EBRyHL8I4d/P6VSJzSfkiGBS+llVDEILYue2g6CDSO
         KSs6cliJACZuUK3D9mbcQg7vKBFUyxgOe8P1fnoB7M+qymg7RYkX5d4UGqc1co/kY3rR
         WJiLhZ7nAM/OPZAWpQmrO1mQjocNipFsio1h9p8upvKjah424vGyiF/EscrgzfzI7eYz
         0WTA==
X-Forwarded-Encrypted: i=1; AJvYcCWD5vLtvQp0gp0N6B4L4aMhXPRFh9ifZ2my2mWoSwwgXor6hihWkHC2rHfSV37y5rk4BTt+8S/O2VU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+1fCVkt3aqY2Nti5xyWr9+W+N/inD1npU6plkpOyEZHL2OP/S
	G9bBYN6iL+CWzQN1GwfCq6+duepz2bnhKBsdPpSiffTvjdvX1ZePHI61
X-Gm-Gg: AZuq6aLzx6dHRtZHTsl9HfX9QOUO87mUacRH+pohKVykxOc7HWo7wPjsiiEfwS2cYNB
	q19t/U6yUq5rolUjYrlPEzDS0RXUraHr+uDYsG1FV95/r0RVDOcjwQMXAk0r0CgwCJrxh2fARLd
	iiP3UuzyJaVnBzEraKcDQAoHzhrsOjWQnKDStGwyZ5rS8ojZIQwBQ6+6QCdP+RshBZ00p95i7Wx
	L9D6Z7AAi/39nSXP5gfEAADv1d/Rx9tdwFy4w63StKi5DcJ1AfKbTF/Ej/GenWyZiFg2/OL3Sxt
	rDP6KWE5N3VT2yDWhtGb8bwHSFlGq9oRPg0lukr3WA+QYO5+7NMm/oudpNKLUE4LOAyjcaGFaBm
	b2BHwQd1q2DPjazSuQgLHSeGa4GmelHVaUzHMH1J1nfECiBGHVwAel28pASLOBZkzyR642DDVM5
	H4AQwGbOBO6LiGQogZ3n83amCGv0NLD53twAg1X3hwdranvYsKf2NNq1Ez9XMAUliLtRIKVwwUR
	Qr5rDiPrZDnzzlqwChGew==
X-Received: by 2002:a05:6a00:ab87:b0:81f:4164:79b0 with SMTP id d2e1a72fcca58-82341259667mr2641917b3a.31.1769401363753;
        Sun, 25 Jan 2026 20:22:43 -0800 (PST)
Received: from ?IPV6:2405:201:c005:c1:4125:1b86:6db5:52c1? ([2405:201:c005:c1:4125:1b86:6db5:52c1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873e903sm8111036b3a.51.2026.01.25.20.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 20:22:43 -0800 (PST)
Message-ID: <58223eae-e0e8-4d3e-be1a-7f48b337299d@gmail.com>
Date: Mon, 26 Jan 2026 09:52:39 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: workflows@vger.kernel.org
Cc: jonathan@lwn.net, gregkh@linuxfoundation.org, linux-doc@vger.kernel.org
From: John Ashrith <johnashrith6@gmail.com>
Subject: [PATCH v4] docs: clarify CC list guidance wording
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 From 1de01779d580e104bea0148409c3c8c76d204c41 Mon Sep 17 00:00:00 2001
From: John Ashrith <johnashrith6@gmail.com>
Date: Sun, 25 Jan 2026 14:48:28 +0000
Subject: [PATCH] docs: clarify CC list guidance wording

Clarify that recipients should not be removed from the CC list without a
good reason, and that replies should not be sent only to the list address.
This avoids ambiguity in the guidance.

Signed-off-by: John Ashrith <johnashrith6@gmail.com>
---
v4:
- Add changelog text to the commit message
- Ensure patch is sent as text/plain without mail client mangling
- Place version notes below the --- line

  Documentation/process/howto.rst | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/howto.rst 
b/Documentation/process/howto.rst
index 9438e03d6..5a29111d6 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -403,7 +403,7 @@ interacting with the list (or any list):

  If multiple people respond to your mail, the CC: list of recipients may
  get pretty large. Don't remove anybody from the CC: list without a good
-reason, or don't reply only to the list address. Get used to receiving the
+reason, and don't reply only to the list address. Get used to receiving the
  mail twice, one from the sender and the one from the list, and don't try
  to tune that by adding fancy mail-headers, people will not like it.

--
2.43.0

