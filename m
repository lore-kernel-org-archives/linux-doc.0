Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.217.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793199834;
	b=Wz2A71jcofehBHThDbHawexaEMd2RNkmgmLHnm30U2/BaYSqMJ1+JA3Wiljud4kBfd4q
	 EBDvpPwR4a0J7BCnSSWTRir5bWYSf3q600FyPKTWMNNs1fzqYpOCLV9Zj0cizi0Gmd5yB
	 zM5J4i2rhqgexxSaZSsXlSPKbXXADA0rqWGgSykqfedVU6yGBC92Bgft3NCx3mW926k2j
	 77DE0zLAAqKetWiLhebyNXtcdeMY0cQ20hlIZMIrg8PGXsWQ6hdrx5ycR9khlze9prLt5
	 nP7mlYA4ib6X/LWu25tPHMLNsmWLeU9EXdKTybuCq0AYFV/HJtU0ivX7zASjwQrn8iA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=awGn2E34n5xBoC2fXIOuNMr+45oeRxGM6R0LvPLWK+U=;
	b=W5GZGo1s7a+mbDBY/MmPW+o/epNcHmEdwQNNDwgypNRqLyohcVJl5oD8C5FhrK0AIQKQ
	 TqjXEsNY1vnPCfm2ynBPPTFsY4MnsadxBfBtSnXhtCdvGAesYsNbzmkN5ILROP/cuOOJ6
	 4mVL34+WGwFKrcc7OHda6/d8f7a329kRoQrdmQ3I+PUpYWe8d7ALKZ5AGJymwT6GqRb2Y
	 +haj3on6UZzvmTvzHCJ6p956TIAOx6kD7y8Spdhdf9IG2UFeNeIpYYqt6qbNfZL8ycZoM
	 yWEblhxQ86p2RNnEEas/ccBgU9XOuNadJVOk+IpPu+BZJ3BWzBq2MMvBOD+Q7q8DF/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EkYI916C;
	arc=fail smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC69D606A31A
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 15:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC69D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EkYI916C
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7ce645a1c6aso654634137.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 08:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793199833; cv=none;
        d=google.com; s=arc-20260327;
        b=FhYJbFdfF0kn0lBv8Qr2mYzr+CtsckiLM1/MlX+7l9IbnSRTOWp+8E3QP7BEE8ZBDL
         XEWDvhDOGLfkcit1rgIbmoMe6UI7IPvfE9f4upK8jumUAjGLX9KR26bpamzWT8kg/PHa
         ogLqqMD9lTvkKYH+hqutzV6JPPjZ4e19DwxRsUhH83mj838jCHfirkkxQOMPlGqy//zo
         l/DS005L69e3y2ETNymLgJbqsNCTPO3T+tNp/dy2/JpXTPN5OcQS4Z6VXd7teAdTTg2k
         YJ5KrinIQbh1kmMg0cFUJ/7HF74TUDkwGc2D7s6Y0M5NMeAUMvGeMUBXIxSIR9qBgglk
         0ssA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=awGn2E34n5xBoC2fXIOuNMr+45oeRxGM6R0LvPLWK+U=;
        fh=w1img0GQK5LXYA9U3rZPSJxJjwkRgVMqOuj9YvS6mHk=;
        b=TCmpBeZpeOTeJkFQyipyva9RqC9p/4FXgJV4l0loJWSpsPfAUqZQ6/gf6QHz8gvCSA
         UyDU5yWqMAu4VhBe/IDBM0pJS+21/F3gU19LdeGGdjGTMPlimcwZtKRlsUff+0QhyE7s
         LUHuRzYNMMkqu4tMln90ZkSNS+Hvd7EuqtjecfB8SFA714u2nQVnXr/GD9QD+W6IYoll
         hmla4QI4feELHd5ndP/JH2O7dj0T9cSe/CPLgDvwo9kSVZNXVMYW1Bh0EM7ODXsA59h6
         DzrCGwvvrLHCKKBIsFy4zDZkgSCJHwEJt34dJAY6cHYDXPNUgsUQEsa3O4L16zrDAxhE
         Gsqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793199833; x=1793804633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=awGn2E34n5xBoC2fXIOuNMr+45oeRxGM6R0LvPLWK+U=;
        b=EkYI916CHi0fFZPKq292wFAojURC9kUkHh3E1HebbsISBU7zAaxiLCNI24BRX3vVTY
         CYpvCFCHIXWLXGdmnExv+ndV1HAqmdnCtG3d9VLbyhcRzIMoYglufAxq8VNzXnJ1YjQx
         Lf0Mw7IO3eCMsrMq24ws6r1MLH6tvKT2/xoOcHZ/+1uTYUI2Z8edhmsbyAA+S/1t2UEv
         nlUzMBMPQn3WIo99fBLzpXFv7VcYIKDqTvlIuKliXZ9+8pVhIP2W8HFhFsJMA7TXK84y
         rteW56FlFqMmhtM3OfnGfe7nqIOua+WfefzyXDDw+T7Igy0mRVaDxricG7nYWbfz3yCT
         qwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199833; x=1793804633;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awGn2E34n5xBoC2fXIOuNMr+45oeRxGM6R0LvPLWK+U=;
        b=AgbdW03ZlDlKuYzMZAP9L2wPQeVTE7wKp2a8owYJHd86uadVHlZviyvDianfEhvnKx
         +vhM+ASClLe6ASUqViKEY0DwXdu9uxLPyF3cenikPFlvSoZPBTc4ir3eFO+YQevCYqOv
         P2DJ10u7REG+wTBpoTrWNo/5KTe5BpMxwxWO0fO/3M5b88pn7DiQR8KjG7Pa/flb23TU
         U7BkwVK295IAnUqpllOoXLePEZRITefaLIxl2DWGKoF6I1TAagN8M+m4VG48w9xn9h2V
         Osmb53f9duTcNNeadMxZZWNgCw226tCDWBP9x/O2y9kbUR1EHC0M6ismR3XgZHIOtQyN
         TxwA==
X-Forwarded-Encrypted: i=1; AKwUvBwITIAI9737Ea+g+SeHoT0vgj2oWORiqp5Qa46dLuk+1R9X+Rc1ipGn+UdBoHY5zJEZ15qrlqF2hPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOKN8/ppaOD14UEYXVOwtLgllRs/4wTp1ZXgmF9pLQTJHkdtf0
	T9RmBRTGzEag6lkG6LlgZEv1pxwmARlLY4wNbBdp6OimoN9olNjxmFCHco/PqhYDsyMrLt7oGhv
	9TM4wbv5zLg/pYTUvGWeZz4BwEzflavo=
X-Gm-Gg: AYBFou0P6Jw2LAUGZCRYDKc9vZ7uzP7Ecrt9zBeuo3R0nwQL0CZOp/Oizr8PvcFABuw
	ebbX5kXjSKeiVHgz/6Pi8ru2W9e1d1uzG3P0BlhObV6JwFsSbVlqYWr2NhgMEN8ILx/Pw2n9Abu
	R9ZxiPU1I6ZUa7WP1eW8m2wa8d1cTLfJ76X4oamksib0A1dCtAF8XumUnKfaiUztzDoFaVrQw0R
	7Sxa9JN1jlK66HX3KFBUH8uMoM1yuE/Cvw6GdkN8Zi/s8NUzY7keY7sKPrkDJPpJVzUqSIezAyf
	kWcQtZRXK8Q+zvb4PqHbW2p20pLTlp/ekMyebf8QA0UaPd7CA9/xeseCQqW6c99v5QtWV4BaTYk
	l/rLqoIiG+a/ac4lsoSq/pwe1QyxXLRRA6N9K9qBClFOygOFQCSVm0ZCXKckv/jaDOGD4zUlzk3
	6Qp5QPA09mS88tVL1bB6Oi7O+6fG8qiw==
X-Received: by 2002:a05:6102:448f:b0:7cb:bb33:8413 with SMTP id
 ada2fe7eead31-7d03a417ec3mr1297169137.9.1793199832560; Wed, 28 Oct 2026
 08:03:52 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028041253.74839-1-lizhe.67@bytedance.com> <20261028041253.74839-3-lizhe.67@bytedance.com>
In-Reply-To: <20261028041253.74839-3-lizhe.67@bytedance.com>
From: Joshua Hahn <joshua.hahnjy@gmail.com>
Date: Wed, 28 Oct 2026 11:03:40 -0400
X-Gm-Features: AclHuK_0y881Zt-9WzkHkMimi_VBCkr1qyy4N5JRQ7yKOQQhsOVN3bLe2ggK2js
Message-ID: <CAN+CAwPM=-sRDypP0+ZxX8_CziBRjXbxKEE3UZGLzkmOWrajNg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] sched/numa: do not feed tiering promotions into
 task placement stats
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, bsegall@google.com, david@kernel.org, 
	dietmar.eggemann@arm.com, gourry@gourry.net, juri.lelli@redhat.com, 
	kprateek.nayak@amd.com, ljs@kernel.org, mgorman@suse.de, mingo@redhat.com, 
	peterz@infradead.org, riel@redhat.com, rostedt@goodmis.org, 
	vincent.guittot@linaro.org, vschneid@redhat.com, ziy@nvidia.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 12:14=E2=80=AFAM Li Zhe <lizhe.67@bytedance.com> wr=
ote:
>
> NUMA balancing has separate mode bits for normal task placement and
> memory tiering. In memory-tiering-only mode, NUMA hinting faults on
> slow-tier pages are used to detect hot pages and promote them to a top
> tier. They are not normal task-placement faults.
>
> For slow-tier folios, memory tiering reuses the folio last-cpupid field
> to store access-time metadata. numa_migrate_check() therefore cannot
> return a real cpupid for those faults. Before this change, it returned th=
e
> same all-ones last_cpupid value that normal AutoNUMA uses for a first or
> unknown access.
>
> That can make a memory-tiering-only promotion look like an ordinary first
> private AutoNUMA fault. After a successful promotion, do_numa_page()
> reports the target top-tier node to task_numa_fault(), so the existing
> slow-node skip no longer applies. task_numa_fault() then accounts the
> fault in p->numa_faults and p->numa_faults_locality, and
> task_numa_placement() can consume that sample to update normal task
> placement state even though normal NUMA balancing is disabled. In other
> words, hot-page promotion feedback can leak into the CPU placement
> heuristic.

Hi Zhe,

Thanks for the revision. To me, this looks more like a fix than an
optimization, since there really is incorrect NUMA balancing behavior
happening that could be visible in userspace (unintended
task-placement and related accounting). On the other hand patch 3/3
doesn't seem like a fix to me despite the name, since this one would
mitigate the incorrect behavior.

How about we pull this one out of the series and submit it
independently with an appropriate Fixes: tag and cc:stable, and
discuss 1 and 3 later on? Unfortunately this is also not a great time
to submit new features or behaviors as we are in the middle of a large
merge window, and there are a bunch of fixes that maintainers might be
busy looking into : -(

Regardless, thank you for the fix, Zhe! I don't have a strong
preference on the ordering of this against pghot, but if other folks
are concerned that this could create more churn, I think it would be
reasonable to wait for patches 1 and 3 after we discuss with Bharata.

I hope you have a great day : -)
Joshua
