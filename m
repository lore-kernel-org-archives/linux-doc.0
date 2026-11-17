Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794927456;
	b=EEfOqu4jEm1w3Dzjtq9KelZsbU1T1XswM0eERwUPXpl4LGCn6UZScFljsLvgHfQUPIl5
	 HfGer1cKIAq9eoc6U7mlDcmuECwkH6d2FrFZCx86XcQ4rcwiqlE3uJ5UFUTKvOYnhYEnQ
	 513kURNVt+mqKU4Vvciw3FfTCv8FMF/qCBoqBb93g+gDO1do4E5vCJ4jwftiwdVyBCAHZ
	 tyDP/3v7r6DtEEIckHdViHxMVFMGgdUHKKs9DsjCzRUdPwVoEKTS+I15OUFEJ+GuD0uQt
	 oXsA3i5qcvb74JrU4HMLI3rU7OO5X6AOnL+14tDUYjKD8J/X9mJCPrx3uC7WooreTPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927456;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=VaHYdskxBgJ5f/Er/TW8oHSSBf5pSt0lOXwfBFfdPtk=;
	b=o+QiWkzvxpwzNNU+Noiw1iYsX6l5XkbRwtQVFmFkNpxbSIuSZyJz6Ej88kwnJXobBz0Q
	 x6OFAqXAShS2uAicYhBe8d32NQ1tGf8sRIsH3LZt/cwXfJ2Jeb7liO8RHSetbQkUECIfk
	 xL+Je1M5Pr2dUr5M53QrQxxUotdYIhjoBnAKIiIu+vCosP7ScsOOkXisSufBJhuugTIR/
	 yzxcLrLrqCd4A49eakS+QweD++E3MPkNqa6MdrikQ07wrgqoDGwr6JoeaK7v4hQGpQfhx
	 yVTlFH8tbN09//KgAIG8Ic0pDNedDrOswAzVztxx/g23k09PiIq+pV6CPGsOzThD/RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MQXzxndD;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B49E606A32F
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 14:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B49E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MQXzxndD
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso1772104a12.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 06:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927456; x=1795532256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VaHYdskxBgJ5f/Er/TW8oHSSBf5pSt0lOXwfBFfdPtk=;
        b=oJAc50GqbUFvLK36rMzEQk5U11Saa6iJdj5W++8ne89D6HHHxIV9nXK1y/AitLSUA+
         uVQAwHaba1xZLneEiuTs+ohatg+zJMhBMTqkqZd6ubFeeJ+5cEP/FbzgdAK7Z8vkasjZ
         TAPHZPsBD4fm8zpqnnHaRJLLaVXvNVFQ17LcQ8ziCq7s4tOe8X83Trixt3EqwJv6azHN
         xfm/Vtt/3jFgcF9A2qmMCo/pI8sJh6zm//ArJ/peVTfIv5Es9DpzudgK574DtMHFaSne
         MPPfUx8+75pzxcGk/KTspOqExGeDhesYk2fMXr0Oexg6BEX6XkckGfoOttQWOHLXyzi4
         Gi0A==
X-Forwarded-Encrypted: i=1; AL+hErG2P4q/GHKV5idkAVjikLKvvJSWnRywSt6D5rjaV6JcB/9pyjBPq9Y37gadEHFI4MhRbPvldChb2HQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yiXrSOco5tX6zVw0m2hyu61JSFZP7ZxP1hglDtNP9eV0nFj3R
	AqQCMKXJoeyFV0KEd+9LEwdNuLCzALzUYyf2gcgDdHaYqzMOH07fWIGAjQON/tqq16ewYXvpfQH
	5fErynDtkXfN0P/LXxWdPjq1tO8dQXNGxKVl3AfAtv8Z4BZp2YfhSxDZWgzkYFhfM1I6TgChxof
	1dNoKF25TOKhPibsM1sJHoqoIQ/eodnwTX9O4XHBgOo7iDcNN9DICrw+Mu1Gx1BT1mcW8cdCSqs
	89Q4xqX3wGZBvhWkw==
X-Gm-Gg: AZFdTZd/ghvNsqXPC7ViBfKfDdr4u18IxEWgiypU7rJ/pZXrfS0hZZh13cZ+5X2DRD2
	Czme1vgrZTyca7SzycPs8xablSRgC3BpwwJzTHEgxUFafAA+q9Ku9W20KsrF3zHgDSV+guvNzYj
	PfRInqj4bgT+2UfwkLqTP/u6TuwJe2RyRKTT53mSfBPc1VF6XBAeA3SwhqFSImSX5SYXHIBsLBm
	kOvjx/KLhuDKLm677oKeplbC3Oe3ZMDx+PcsSmq1D0zKBj6BYWt7STDEa8pJre5Ers1GA9MYxyU
	XCEcEYR6cF7oxxQPNSkWrqw/1+IAPm+afZYa/0j5F6g0omnl6T8EWgXShhYp7qX4KDTPoeppoNT
	kg0GC/OjHaC/HSlWOPsprdcN7VgyVmziCOj6nR7vGXMrAo/8Gjd4rvAg5i5CElPgsGfEPsB9JlJ
	7NHj/scb23gbgdT+DRxwrRcQPJ3WQu8mYYbHOpQQ==
X-Received: by 2002:a17:90a:e710:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3b1b0a428b8mr12097988a91.27.1794927455650;
        Tue, 17 Nov 2026 06:57:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ac02cce6sm1954726a91.7.2026.11.17.06.57.35
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:57:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a3705ea6ccso916732f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 06:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794927454; x=1795532254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VaHYdskxBgJ5f/Er/TW8oHSSBf5pSt0lOXwfBFfdPtk=;
        b=MQXzxndDtFgWOGjBJYZcm7FR2WUsUwITGci+9Hz7iVjEdMoDstOQCTgoMBzKwFUy+m
         ojMMilr8N8FCjFCyJebAs/tYY2n+GrqerUKnVmGdWJqANHbIncSV0qbP7RrQ1izH/AR8
         5nwWuK8yGVWtCObLASWh3w9XMlYy6S9RLejNc=
X-Forwarded-Encrypted: i=1; AL+hErEWIGs5PfngS4I4H/g7kYdSUyi6gWmAV/HkoQ2r5KpJim3T6GsHlqYevd8KsNBdJaI65x7Qk07BDR8=@vger.kernel.org
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6f45:2a77 with SMTP id 5b1f17b1804b1-4bb6f452d39mr188021335e9.11.1794927453473;
        Tue, 17 Nov 2026 06:57:33 -0800 (PST)
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6f45:2a77 with SMTP id
 5b1f17b1804b1-4bb6f452d39mr188020445e9.11.1794927452733; Tue, 17 Nov 2026
 06:57:32 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116074849.475815-1-stefan.chulski@broadcom.com>
 <CAKYAXd9KT=1vLYsnRKxmiM6pLJQNACXuodD8wNQzb8S5apiuRQ@mail.gmail.com>
 <CA+Fu+LPL7xqpV_vjjjehedOFtuuBqgZHZTSqJ+FgweUpYo2uBw@mail.gmail.com>
 <CAKYAXd--x9UajLQwzRUwxRZ7PFW5T02xyHdSAnThAo326p_kxw@mail.gmail.com>
 <CA+Fu+LPnXMd9rMtywkZL77XzLq8n+8AiBW2T8Cau10YnVbofiQ@mail.gmail.com>
 <CAKYAXd-xM=gmpjz7g0+n+ZBA4Vb0Sz2i7B89Cs7XdHUY7U6WdA@mail.gmail.com> <1840b905-479a-46e3-97a9-b2f40cd50c29@kylinos.cn>
In-Reply-To: <1840b905-479a-46e3-97a9-b2f40cd50c29@kylinos.cn>
From: Stefan Chulski <stefan.chulski@broadcom.com>
Date: Tue, 17 Nov 2026 16:57:19 +0200
X-Gm-Features: Aa3M54q6UrvDJCXyy-Tq8up-xKFoPuFafstRfqFIuifIOUygyu9m1cZGcxONfis
Message-ID: <CA+Fu+LNry=dgUdEpULq6vZhnLRdVX39syn4E0Qafia36dHTn8w@mail.gmail.com>
Subject: Re: [PATCH RFC v1] ksmbd: add use_unbound_wq module parameter for the
 ksmbd-io workqueue
To: Huiwen He <hehuiwen@kylinos.cn>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Tom Talpey <tom@talpey.com>, ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	linux-cifs@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ilya Lifshits <ilya.lifshits@broadcom.com>, 
	Gil Benamar <gil.benamar@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, Nov 17, 2026 at 4:40=E2=80=AFPM Huiwen He <hehuiwen@kylinos.cn> wro=
te:
>
> Hi Namjae, Stefan,
>
> Simply routing WRITE requests to an unbound workqueue is not sufficient,
> as I've observed performance regressions across a number of workloads.
> I've since developed a more complete approach and will post it soon.
>
> Thanks,
> Huiwen

Sounds good, please cc me on the new patchset when you post it.
I originally tried to keep my changes as simple as possible, but I
look forward to seeing your approach.

Regards,
Stefan
