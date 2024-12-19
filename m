Received: from smtp1.cs.Stanford.EDU (smtp1.cs.stanford.edu [171.64.64.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5544C35948
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 18:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=171.64.64.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734633478; cv=none; b=PZ8H6GS2Lhgsaj3nAzdV8MzbKYZ7iGIGrNKYlCW5sX5bREWbfE+HKw29XWRKATdLFF4g4usWrOkx5ac22TX0kHLau8GnXl2l1n7dE7EScHWkNoZR6VQKw+wSCR5w4WdMzp155ziqttQFA2KvuE2BLNXijjKIZXUcbM5I3AuRTcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734633478; c=relaxed/simple;
	bh=csrDjjWtZDw7fYf3+yTFWafFtsG77AS7KFJzGf1U1fE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=NU0elzevByAgPMM/nmFpE8zcab1L6DYPh7gTGMHJOzG+djS/KgXePmh2RGsAPVD6+tlXI7fcx5q22UCjtkA+rHRkwi7Zo8k6jr5yFqpi7O7Ekhbq/XTCCs7SEzFaUSq4Xhq7p/Y+gJpxM2mTsCrn2rLOUxvKpq3LeJQey2KyB1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.stanford.edu; spf=pass smtp.mailfrom=cs.stanford.edu; dkim=pass (2048-bit key) header.d=cs.stanford.edu header.i=@cs.stanford.edu header.b=JgvT/7UN; arc=none smtp.client-ip=171.64.64.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.stanford.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.stanford.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.stanford.edu header.i=@cs.stanford.edu header.b="JgvT/7UN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cs.stanford.edu; s=cs2308; h=Content-Type:To:Subject:Message-ID:Date:From:
	MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=csrDjjWtZDw7fYf3+yTFWafFtsG77AS7KFJzGf1U1fE=; t=1734633477; x=1735497477; 
	b=JgvT/7UNaM+tnoMrbDfrQy1JKHljf4v6zS38EeKgzWqNBiFK63W7tKMGX4GX9IwucWl/A6lc8Nr
	NDIv4wN5SLVfU6QCvCZJophDOtyrQXvSTKQiWLpUyN3T5sLXuzCTjN3o9Xs8wg2svCl2UqqF7PXfA
	mJhdPdFT9BCGIc9Ejvi405D2IvBroTVORSqOUD4JaGsDJOO50uZOmAVHMVZ6Lms6rFV6HvBLMy+mV
	QhpqzV7QntYPpYvNFP84mDzcupy/IPH2oCpcK3hhs06+tYYCAE2elsM8vrxmU/dUcT1Ofl2+9cuh1
	+oW05jp05yvfJjgHZCxGXoaWmIKS85/NId+w==;
Received: from mail-oo1-f41.google.com ([209.85.161.41]:43097)
	by smtp1.cs.Stanford.EDU with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <ouster@cs.stanford.edu>)
	id 1tOLPH-0007Mq-T2
	for linux-doc@vger.kernel.org; Thu, 19 Dec 2024 10:37:56 -0800
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5ee9db85af0so1069684eaf.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 10:37:55 -0800 (PST)
X-Gm-Message-State: AOJu0Yz89Qg+ribahuBv4nhejf0CUGfALh3NHcGT3suEVg97BJLveR6L
	t0TbjwbGkoeyiKTZhZNDCCC8DdRxM2ulrPFS+pnCjgUKITw2Jd8xYDhSad0CMAixK000ZmILXwc
	K4P/DZeZKaMyN1201zOewC7RsxiY=
X-Google-Smtp-Source: AGHT+IE2oTlai1mireylOE9WNvD5BdDrQBp0fOgd0G7iui8gchKazz65grxjn+F1GzUlXCGD5v5Kl/BbqEf9ufgzHYg=
X-Received: by 2002:a05:6870:fe8b:b0:2a7:8c73:be33 with SMTP id
 586e51a60fabf-2a7d1397e8dmr2258634fac.16.1734633475335; Thu, 19 Dec 2024
 10:37:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: John Ousterhout <ouster@cs.stanford.edu>
Date: Thu, 19 Dec 2024 10:37:20 -0800
X-Gmail-Original-Message-ID: <CAGXJAmzfRzE=A94NT5ETtj3bZc-=2oLg-9E5Kjh4o_-iuw1q8g@mail.gmail.com>
Message-ID: <CAGXJAmzfRzE=A94NT5ETtj3bZc-=2oLg-9E5Kjh4o_-iuw1q8g@mail.gmail.com>
Subject: Bug in kernel-doc ("-" misinterpretation)
To: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Score: 3.0
X-Spam-Level: ***
X-Scan-Signature: 6bee508a35d8245455fa42c2dd36c733

kernel-doc gets confused by code like the following:

/**
 * define HOMA_MIN_DEFAULT_PORT - The 16-bit port space is divided into
 * two nonoverlapping regions. Ports 1-32767 are reserved exclusively
 * for well-defined server ports. The remaining ports are used for client
 * ports; these are allocated automatically by Homa. Port 0 is reserved.
 */
#define HOMA_MIN_DEFAULT_PORT 0x8000

It seems to use the last "-" on the line (the one in "16-bit") rather
than the first one, so it produces the following false error message:

homa.h:50: warning: expecting prototype for HOMA_MIN_DEFAULT_PORT -
The 16(). Prototype was for HOMA_MIN_DEFAULT_PORT() instead

There are similar problems if there is a ":" later on the line.

-John-
