Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368F11E531
	for <linux-doc@vger.kernel.org>; Sun, 18 Feb 2024 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708271354; cv=none; b=pVxzIJLUrbTzME7TEybJqEN6q92Wc+f94MtC9hJSdyiS/SXc0574djzklW7vYdQq5LfzCKgDkvpnf8iWgATBYNb3s0aCl93vvp1S4jf4nMTn/ADFObaQN8Y6Zn6IjUjZbbJgBWGTpBgkOuFXJO/clQjc/vH9LSo+fCiFK5htx/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708271354; c=relaxed/simple;
	bh=uUUcGmDFRSmL7GTgnjM61bKv7gozmIiAPYDRShfrSNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rBrDq73jXPpRepu7wzfxp1oygmUdZhNIaPyXRfzHycwoJm080gKH+/UarhigtBU4/YVUubozuoevrpVNOCqmGOWg0dp6rCCP/GPlekAidvdfHpESo+Rxbpn8dgS4h30OUJuAIDKbxmRnBW3ZWYmdpsLpnK8TomxSNjRo7JxxD5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDw/QhgM; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDw/QhgM"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d944e8f367so30297975ad.0
        for <linux-doc@vger.kernel.org>; Sun, 18 Feb 2024 07:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708271352; x=1708876152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k9fy4RvZxcYuVztnKXdOY1qQPRduKmvkTULd+uqL4Oo=;
        b=lDw/QhgMD/H2MxZxYKxJbA01611y3LfX69Oj68Cj50VSG8P2RgOykLuYFHr1tCkqY6
         2kBbbRoUTbQGCJubm0TkeMAJESi8ubhY4Bf9grlykA+aSpHMxE4v5nZmB2CnnjFBDcpa
         Hr24AUNeOUE2kyeZXsr7aq83Yay1O+ObvQ6oRnO/9nnH49uOsZtT28tRcECsvE0L6HWV
         vhFjMAoFAVzGxUjIt1OR6VKRJPrGQdIeEdtem3V7g5hG525z56wVafChVajWkT8BWvX/
         GfcL43IDWpswBSOWdrwwAhbwCkjULzsPJRmel3Pou4bd0xoia1E9QCk/0WWTmqDr8y5P
         whmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708271352; x=1708876152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k9fy4RvZxcYuVztnKXdOY1qQPRduKmvkTULd+uqL4Oo=;
        b=tUgxH7kuybT6mHtYhvLeH69HesNxP+NnvS5BE19JQVmD8mBHk4djjzgOTyGdgLgX8X
         fYLMNSnRoMiUGCCSg33GNsD7GLBAy/phpcQV1+GpYKSW90h+cfpRsuikJlJA5g0mZkYg
         jnpyEc2vcGLR10xjTFWC2GsGfeInc3wW4vsDz929gFHwfd2AsTXkKY/RaWg5z/rxkwTo
         OgWrG83ZigARJ/k1DDQKRUiqAtiIbHOMH9d73A21le0vdcW7xcmahOKp4sERV0qQoupr
         HBjTFZ5yC/CBC/6h1rjzf5VMNhMqJbszNDCKH/zveIYTTnizAxHlxJjjM9MY+SN/UzUt
         rb5A==
X-Forwarded-Encrypted: i=1; AJvYcCULYPgIBJ3YiABP5laEbSv3fMQ6qWvtVK3ddqsYgBVQEMyrV7yYDYKOV77+b2mj04Y3wWCOqjZoeKtu+edqhk+fnfZVUEp9Cgjx
X-Gm-Message-State: AOJu0Ywe2oziHjscl8Ks51MFxb+akquecPT4mQ+cgV4IwIbg7GDA5Br2
	2Xg0/kUmT1DdxF8f9xG+HxxHXWd1xZS09L8VbQ3yf/o6ztud6d0HshcCkHuM
X-Google-Smtp-Source: AGHT+IFuXbLda308/BMeb1TMc4EkOKCl+6Ul1qbtn9ewXZUjKXSCY6YRmoS0hkYMETtTgFTDbg6fEg==
X-Received: by 2002:a17:903:286:b0:1db:c741:6f74 with SMTP id j6-20020a170903028600b001dbc7416f74mr3815125plr.2.1708271352318;
        Sun, 18 Feb 2024 07:49:12 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id iz13-20020a170902ef8d00b001db9493104fsm2846707plb.79.2024.02.18.07.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 07:49:12 -0800 (PST)
Message-ID: <67f6ac60-7957-4b92-9d72-a08fbad0e028@gmail.com>
Date: Mon, 19 Feb 2024 00:49:08 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PDF misery
To: Jonathan Corbet <corbet@lwn.net>
Cc: Vegard Nossum <vegard.nossum@oracle.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Akira Yokosawa
 <akiyks@gmail.com>, linux-doc@vger.kernel.org
References: <8734tqsrt7.fsf@meer.lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <8734tqsrt7.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2024/02/18 6:29, Jonathan Corbet wrote:
...
> One is the dreaded Latex "too deeply nested" message that causes
> everything to explode while generating filesystems.pdf.  The problem,
> specifically, is .../filesystems/xfs/xfs-online-fsck-design.rst, which
> blows the limits in two ways.  This patch "fixes" it - this clearly
> isn't something to apply, it's just a demonstration of the problem:

So, there is a handy answer in the Sphinx documentation.

Just look at https://www.sphinx-doc.org/en/master/latex.html
and search 'maxlistdepth'.

You can set this variable in conf.py, say,

    'maxlistdepth': '9',

Now the deep lists in xfs-online-fsck-design.rst can be built
into PDF.

Problem solved.

It's getting late here, so can anybody prepare a proper patch
with my

Suggested-by: Akira Yokosawa <akiyks@gmail.com>

?

        Thanks, Akira
