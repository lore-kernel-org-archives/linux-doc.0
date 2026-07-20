Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C593CB2DC
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 07:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784533613; cv=none; b=Lu7h0kP6vDdA+Tx9QIB1fedjBlwF88oYtUk3n1vMQnIiPLicemc0WbQJis2ByNhDDT4JiNVsi9E50j0U7s0864sF9NHsByiDCF+RfBJSUz7vdN4nR8GPZ6drkh/MXD+0pWRGrXFuFMey3LxwIw4K6dUHZQYNabPiwaYakJmcOLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784533613; c=relaxed/simple;
	bh=VBFMC6gMRGQjnOOMnqz3WWXF9dKEnW+4BDfCilMYA+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AL5V0MzLlJarCcXZkbRHS0KGnjUtZcFHmc4Uugg0JAzxqgVfur4/4yOMX326xEz1tXLYVGStUDCECljrZdeckZGFkn0hhPAQtMMWuBhlfzUXjfV05jWjk6XA3zMT+8xnycYSTnwl4hzyDYRLc023ddqvLsUTpI0uLJLrhQJZSqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNxN3l99; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNxN3l99"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso5642601a12.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 00:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784533612; x=1785138412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4JxCC+goeza64OVbUVLoVnq7BPupRW4/8OEnjh/c3NY=;
        b=QNxN3l99u2TQa9XF9UCNXXzxNlnclCDJV0wfOXqNCo12lBo6TgZeHtXQZZL+GmBVyp
         7CLAjc8u/e4IYmUobZXANXf/p6uYEWNsGTIOgBYmwpD/AHnSPEYlhfoQuOwi1O4YpbhG
         Sw0MdrojC8EkgcHqOCWoU/SOl0JvCIK+jeUNN8S8689FXtx/h+rV0Z+dUBTjjITpWgfq
         UzS4X3p+R6G3XAjdZDR9x8+djTqZgshTVethTZ/VSVL4Cz9NxXLpLgqhCWbZkxdQjElv
         Lo9NdemDnbb+GD9t24jtiKDnd3+EM8OufFCEKr7e1/fJpKLto4tuR/CopBql42qUZIUG
         Y78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533612; x=1785138412;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JxCC+goeza64OVbUVLoVnq7BPupRW4/8OEnjh/c3NY=;
        b=ayOBePf8UASGRNtOrv7rHZZCEwD1MNTg5GORlcQy+Gv6wtyphhmAmUC8BHPF0MVXGz
         x/UxXlDmIUUcpHO8Bj/4CXbnvZR3QaNOPbUdbP+IU2t3/khGVBQAW/W00X/qkaFr8Lig
         gzdzcgx3eSHvGYnoJxijkNHXGeDyG0ixL5faa9bdnD2kTAhkJI2vyI1Gf766A/mQrUfg
         BT+johBb/bd8jMczzPFratnrScx7WLXK3j9/cbVbfXKnp/BDmyzcnlhIHL4m06ENPdy3
         W5FWxe+yQHoFpmJkUaVwlfBCd3AMVdZ0zB+53IV88h8blZ4F8lctQfxbTrteleSN70iQ
         uFSA==
X-Gm-Message-State: AOJu0YzPC9EzkdIGZplQFhaIHAirPjVU5wQDM6YZKw6AhcmMavgpS9SZ
	WBGzBLopw07hmiwgUaUUCBcc5zhSaT1NcjMHaSj5SZc4eCz4qBxhn2l4qra8Hg==
X-Gm-Gg: AfdE7ck20TmCye3FpqsUZQYMA4M5JkLK4zZaGIeZ4Tu23y/L65Y2g8jmlIuwM6/iAhT
	dLx9ZLM2KLPdB2qeKY+6BK3JOofR1suKK0UN9MPY+1tSvjHJPAYYHnKEm+xDZuDi8HreeUPlFhd
	XZKXSpoA67GMzKK5JwwiJSJBZNXFk89MOWUCgA7ZSUsMGI9V+yTEdePEzu+LSoAMKz4IqZDhQim
	hwlGgrnmzoT2Rn5fwGE+fD/D9jgBu61X1oJNt/JC1LCVejpP2nOz/FA7rNt5zsjPEck6wraN1Ct
	E5jvf1+WqPpMdT5QEZxJQ8hrOQlIRaz+a+vR6Npqe0iI/fDmO/dvNTBfqd2RGcGBondGKYMV6Eo
	ont2JMXIwgzfrxDcSt/Wwp3cjepG0RefMaEW00l6/QGpu+PGWOqaiTBWb1RQL6KL/t6E+cH5M4c
	LSLaNoYmWUNPAEIuiEbbIFa3lbmzZH4GkG1bZhUCaIXt0wcus=
X-Received: by 2002:a05:6a00:2e0e:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-84c293053a3mr13157169b3a.7.1784533612039;
        Mon, 20 Jul 2026 00:46:52 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adc33easm5290652b3a.13.2026.07.20.00.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 00:46:51 -0700 (PDT)
Message-ID: <113d2aa0-a4b3-4bda-81ba-9d23cc237d0a@gmail.com>
Date: Mon, 20 Jul 2026 16:46:48 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH]docs: ja_JP: Add 1.Intro.rst Japanese Ver
To: dayodayo <dayodayo1410@gmail.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net
References: <CAKJLdqb=dqSJ56FSRL2eBJWdtuknjkmDo=+et_BZOmbWUHuKJA@mail.gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <CAKJLdqb=dqSJ56FSRL2eBJWdtuknjkmDo=+et_BZOmbWUHuKJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

First of all, I am glad to see a new contributor for ja_JP translation.
You are welcome!

On Mon, 20 Jul 2026 11:20:43 +0900, dayodayo wrote:
> From d4614a0754863767726edf4ae1dba3f058c30d54 Mon Sep 17 00:00:00 2001
> From: Sakamoto Yuto <sakadayo1210@gmail.com>
> Date: Mon, 20 Jul 2026 09:29:46 +0900
> Subject: [PATCH] Translate Documentation\process\1.Intro.rst into Japanese to
>  Documentation\translations\ja_JP\1.Intro.rst
> 
> Signed-off-by: Sakamoto Yuto <dayodayo1410@gmail.com>
> ---
>  .../translations/ja_JP/process/1.Intro.rst    | 176 ++++++++++++++++++
>  1 file changed, 176 insertions(+)
>  create mode 100644 Documentation/translations/ja_JP/process/1.Intro.rst
> 
> diff --git a/Documentation/translations/ja_JP/process/1.Intro.rst
> b/Documentation/translations/ja_JP/process/1.Intro.rst
> new file mode 100644
> index 000000000000..a3d0a12fdf75
> --- /dev/null
> +++ b/Documentation/translations/ja_JP/process/1.Intro.rst
[...]

I couldn't apply this patch on docs-next.

How did you send it?

On how to send patches, please refer to
Documentation/process/email-clients.rst.

Thanks, Akira

