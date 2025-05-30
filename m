Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F1E22C355
	for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748610453; cv=none; b=q6Q/W98qdkseTo9HtG7DPRzUxSoPDp6o2L9S8cYHo8qG5DynQ4kwbOdcRvjrGgfROP1x1wi5UvnG4FYWnDt/Xzan2fRm+/hYRXqWsW9njIj4VAO1WXksmqDPKS/kgsw+VXq7Nx2QlXrJ47kJpE0qnm2SCFS8iwTzzy3QKfJOT6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748610453; c=relaxed/simple;
	bh=h4jwctbW8pXg3O6hJrQAv0f+KY+PlydbIAeGTRF0HdE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GEt5EGWB1iZZ916cENQCcJQYk2FjvGewAypQ2SkdssxWzW9b+d9fulf5evhX8HE0Nj1QG0aunOYweWelOxpZ9sHQ9lzQbNMyH2IbviH8MCa26lY/fRpzx/PyayvlJ6hvhzh8YVcaZ2+UheAdNrlVB2r7pBL6S152RM2iys690oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=VO6PZKdE; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="VO6PZKdE"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-86a07a1acffso141871439f.0
        for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 06:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1748610450; x=1749215250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+zllA0JepvlfuREVmf3nCF0usvpNrfKCbR5PkTeodQ=;
        b=VO6PZKdEzYmCiAL4/bfvM6EAnbxC1HVa8lz2kZMsMzLCRm7p0n9+W8yJD9IH2JxkaR
         nHe5CksjbM8qHonhSykwH0P7+D2ZBc+P8PcJosgYRAl6FzM0UVx+qpXHueJUjPVZlhea
         xd+h6mQNBch6coBDdk/ozPsQFt1hdcOjzdv8RkvcrmpWU01ykoCDZiQf5weiy2Kue1su
         ZICHzVsKoE0ZGEC/Rc9u9csSEljXJy7XRRFnm9dukspZqTQfCvxD+Ip70K6RlDaiaAQJ
         3OYuFoVNxR3ocTp49r7HxVadcFmcDHP+MpaLlDDV051EEu7DYnOrMSvegGUk15UO+JoE
         71IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748610450; x=1749215250;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+zllA0JepvlfuREVmf3nCF0usvpNrfKCbR5PkTeodQ=;
        b=uFa9BQeyJ51vF3bquwJSQ3qbdbR+H/EVcpdLgrcG6CCDuJNpYWeD1FxghXkJf0a8w9
         pbWmylLQxCFsTvpb+rxgQnv4kVpSDyp6fBbUH1unnEtHVlAtRI4nrcZoRkY/YwPa7cPD
         xHGpxL2qjYLBGSyToyxsdWhkHYX0aXOxZGJ6JOVFH0RhE+Tg2hRUBJSOeSOj8Ye0qQ0O
         MdYp9GCyFMihi9FFAQv7/EJRGsPhQ8WD3Icm4tJ2qd4KaX3YiieJ82eBcJLV8IHii1rR
         KB6Ue4icZKAZKc2ZACCnikNBtuQMrlmjHaNNpvyRhlN0hWsVkwWCc6whV237htNCQih/
         6gtg==
X-Forwarded-Encrypted: i=1; AJvYcCV6Z/Yq6bod7S3AhWcKzX7D6dyhITgsYtJHHfF4VReGwkUGY8zdy3mHFi6h/8T9jpcuvwqE9aFGSqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0uLgPmAHucppN41ITmOsks82Yp77AAKXvNcADHic9KOuqhwpO
	aHsuhKBWgavz4EbtyVR8Mt4VxXoTmN7/dSzw1nfel8ZMQeil9iTi6xOECfwvqKP+SEI=
X-Gm-Gg: ASbGncuMpzjb6Civ1qRQWB7jqQSFOAt7MCkPvMnzWpR+4XDEkx8kchLuuoAHXjo1yGf
	q15SgFO+efeuloCrTt/Up5qQoleoSomSQBMADCeh+NbkEgHy2pMvoiQ2V/bKCOwRXnZNt2QLwyR
	BgOj+DsWxpMHfuklE6d+sIVPPR1om3t779nsTevgvbCFAdiHBDE5ELTKaVHFKJp3B1i3RD0xD75
	5qp8lRmW5LhjxnaRgOSlVogVbSHqLHfn9/i9IIYGjfRqWZTLvJ0IL5LRUd8D1EbRXoaFZ85ZHkA
	ssf5wJLMfjXU4vcBgz0AAhs/iTU9J7xua82jgsa0UA==
X-Google-Smtp-Source: AGHT+IFfMvqEazUYtf2SirmN7JtlcpvFyW/az1d0hhAS8lUwYVAN/ahd2bFle1R0bSvbYHbgXjTrew==
X-Received: by 2002:a05:6602:4017:b0:86c:f2c1:70d2 with SMTP id ca18e2360f4ac-86d000aeacdmr411795639f.3.1748610449967;
        Fri, 30 May 2025 06:07:29 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdd7ed8154sm424022173.100.2025.05.30.06.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 06:07:29 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <ming.lei@redhat.com>, 
 Caleb Sander Mateos <csander@purestorage.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Uday Shankar <ushankar@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20250529-ublk_task_per_io-v8-0-e9d3b119336a@purestorage.com>
References: <20250529-ublk_task_per_io-v8-0-e9d3b119336a@purestorage.com>
Subject: Re: [PATCH v8 0/9] ublk: decouple server threads from
 ublk_queues/hctxs
Message-Id: <174861044873.875376.13955426854748469811.b4-ty@kernel.dk>
Date: Fri, 30 May 2025 07:07:28 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Thu, 29 May 2025 17:47:09 -0600, Uday Shankar wrote:
> This patch set aims to allow ublk server threads to better balance load
> amongst themselves by decoupling server threads from ublk_queues/hctxs,
> so that multiple threads can service I/Os that are issued from a single
> CPU. This can improve performance for workloads in which ublk server CPU
> is a bottleneck, and for which load is issued from CPUs which are not
> balanced across ublk_queues/hctxs.
> 
> [...]

Applied, thanks!

[1/9] ublk: have a per-io daemon instead of a per-queue daemon
      commit: b8af2e5dfcc3314c09a97dabcf6e2b1f644cf820
[2/9] selftests: ublk: kublk: plumb q_id in io_uring user_data
      commit: b9c564b74d8aa549d74f97b6a9f429fedb9a4e97
[3/9] selftests: ublk: kublk: tie sqe allocation to io instead of queue
      commit: c306e71dba79624cee2eb5a80bc5013b47943241
[4/9] selftests: ublk: kublk: lift queue initialization out of thread
      commit: 83f5c5d62905353a1be597c62d82b0ad14f23a7f
[5/9] selftests: ublk: kublk: move per-thread data out of ublk_queue
      commit: f21561bc01bf887c2f620d2e4a9a52b999f776cd
[6/9] selftests: ublk: kublk: decouple ublk_queues from ublk server threads
      commit: 5163fa0f106d7a31c185559f95c7afd3672e69e6
[7/9] selftests: ublk: add functional test for per io daemons
      commit: 5e580d6b7e2004e308148a67d9ade3f26fd5949d
[8/9] selftests: ublk: add stress test for per io daemons
      commit: 6b29c3106a5fc2b4e14facf1ee7e663554f805bd
[9/9] Documentation: ublk: document UBLK_F_PER_IO_DAEMON
      commit: b02f5eedbcabe6e1982fdd7ff3f0ac5d1fddc68f

Best regards,
-- 
Jens Axboe



