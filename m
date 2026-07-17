Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BC0371885
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 16:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784307050; cv=pass; b=OfQFIikxGONMEdI8wFLFs/GgsIVQazHFK6ICXFeBQKSIOWCnLb2RFBUGhi7dRD7ctfYY6NSnrKvZ+uawtXjVPXOwztufyFYpHl4yrSIp1vQyR+X72YDehU3dgY7dg+g3KUMZkoYwOaaFyzgpTM53H+LgR6hwWfDwvjDn5s+oSEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784307050; c=relaxed/simple;
	bh=Phdlpz/EWIhX9awcSf1NNfiYXxmPbOkBK8deLlKJkFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmW6HLYuQUKqHuerw1uWXjz8i7Jc8VrXdQSARpg6SJTJT6UnEJKivsp5InDuFMLjW1Win7UkYUfxvkE+7L77s5ckhj88pAA3hQ2N7p44w2y8sOP/iTBSDCk78YMKe/XP8Ncn/F5+7hS0PUUaEoupvGzcYW/EwmDMGAIjyofD3CQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pMZPQwP9; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pMZPQwP9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47640541585so4055838f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 09:50:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784307047; cv=none;
        d=google.com; s=arc-20260327;
        b=Zf4rBYDbNW6SGPCiYPEwWjzYkKIc7Q87dRP8dtOaDyPrwuPaAiyMm+EHJKsvfOAVu4
         1hEY/MDU/z9ONtkruFblM1+cIW5EL+xqH+qgzsBcXsZyYZG2gBKWHFE5TVJ82dkTK8c8
         baPuWmZN51p+OUIuTQC3nOxwszgk5vYbFK44tUEUZx3C8SgbK4lzULJo/+xLsn8jbQXG
         DVvM9Jwncqtk5HZE0YMworVtGeLJE68t3r2qinwMHr5pUAEMkzFKKpYwraUm7qr5DAYc
         VScTt1G6ncm+grrxqZxaY9SQgENRnVWA6YQuW8eN9/D0MgsYUhvYrfmSKKJcGF5qQmOF
         qW9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Phdlpz/EWIhX9awcSf1NNfiYXxmPbOkBK8deLlKJkFA=;
        fh=p1cn9dH/1bgqAydZDH0Kq2IXikDrUSpVDK5AEJZ4V0k=;
        b=WrCSwjGoDDi2ZErbakwc+68sdV8+82+tMTlQ0XiANS60ZuGOubPsFtgp11Rk7K2K0w
         1Ww21KQ0uweWUu4zxATYCS+PZIuWve8lvR9Ned5H1fiH8YEQlHNURzochu2fp8GmyfKw
         aDz4eyNpQDY27z78+VbPN4KnRq6V0QTXGJ23xNas4oPeCDeYtxC5y3CYmgBHUzuuY9mC
         xV+atwD2zxvDKuskctWaN97WZltvri3b3zgBBkw0OkiJF4VNFbTebfIBhIBqDKQTzfnr
         cSokwS8lVmGydEeNAEyU/HCWsFa/HMsSo2TvLsL0kHE7EC8OfU0/URHPi5ae7EfKRneP
         nq8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784307047; x=1784911847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Phdlpz/EWIhX9awcSf1NNfiYXxmPbOkBK8deLlKJkFA=;
        b=pMZPQwP94G0txnl+ycQxniDtYXGTxVXgZveETOd5otjpu8Sqy9KVe0XfBha56LI8Kb
         exs+/h9JGS5T1L4WtsjH8wFaEKQobQ0jwfZiVg2GcZVaJcgcqH0PUuJhbS57gTJmhrMn
         pUq4eHwaHm+cnwl8z+3dddUvwbeJ2D9uF5WPf8UnGmWsfOqW0TjHJteXEfYHEnEig/fu
         VW6hZVL1J1JmNEsDX6NjyJQ2VlRtAlAzlOjiBs0Jxy7Zf8NkWN1rYjFN/iRxk/ouauoh
         ZhUOA72eyrqvGyziqZTFJbe4Wq65joqKBTlMNgMJnAL5FFoDUOickmwGvW1BKjRs5fi/
         HW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784307047; x=1784911847;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Phdlpz/EWIhX9awcSf1NNfiYXxmPbOkBK8deLlKJkFA=;
        b=Cb+X7n/ThLPB07lNlYoFky4gMulzaxrdQbRIl9yLKwYyq6jsP9Ggqn5nweoujyPBVb
         xO+CRJ0uODmhbVY1IwfXQME7pmylv3rHVBji77nnnqSa0k2rPlAAB0eVWmS4zl2MMCPs
         mkLk+jHUD+9ww5tEFnDlyjCUWOZz6h6muOC/Niq1/DaywyY+7PazX4xaxmmbwfGgiFc5
         zzuNk9HhoguSSfSP20WIFXI6ZKiH6foV8tgC+2g2O2GW5yzjGJSO0jfTcnOF+iCOhufL
         R1eBUFPcVpPUoa7SQcAy1FsIocezMIRjNrU/b4wJuxXpAGr/H7JMd4DGexHDPZv0vFhK
         l+lQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNZQbLgLAEYw/QHxiwa7lgOOITp99U3RXDlIoM9Pnaxbsf9YIUQXvdZ4QdaiNO/P5aAooeK6PsMhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDMvRmubf+yHpQeZ9l/0/5QVzG8JKhFf3gSXWg1WUcNYsi22yA
	AwKCKHbCjr1N0Dd2iIlcMVNdsbeoH2snheuriwbqvSq/RB0igM8R27Ai34nK6nIv0ThgdaXjcMv
	YVQ1mKIoPXYXtGD36QnSwAbemMZ0JGF4=
X-Gm-Gg: AfdE7cn6ZIEzvHrfgW5G7w9PRXU+YgnGUtEBt2/DEGpK6Ltzip6txRKuhlsUaQClwaJ
	leD74shxJr3y5AVzlvnPnYak1LrcMCBxgOZ04NSt7CJFiNkhc4Outx8zBb5SFyOoIsln+ENHKM9
	fbxTsOR/m6F9+ROQiGMbpdIXQcxLUITkppPAzgNEKzGtmxthtpffl/nSRs6jbPi8pIhQFsPqWM0
	826ooU9IA4K4taYnjCb46L7wV7z++YpSscx54nyz+aUiPPqkQl5fYLItst75rHZ7dTNlOCcKzlC
	1BB0//D+v5JdsBrhcABeaRHKONSI4KHLwQ==
X-Received: by 2002:a05:6000:41e7:b0:465:81cb:bb20 with SMTP id
 ffacd0b85a97d-47f6230767dmr4664199f8f.9.1784307046735; Fri, 17 Jul 2026
 09:50:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714081510.16895-1-jiahao.kernel@gmail.com>
 <20260714081510.16895-3-jiahao.kernel@gmail.com> <CAO9r8zNiT63LUHx8X5i_aboX1UWuGkcFf+p9ch-pekURUuDdXg@mail.gmail.com>
 <2bc8e4f6-46a0-5b74-6eaa-59e7aef9227e@gmail.com> <CAO9r8zOFg_mnNGbFFd_h8FAwRCbQ9vXk47EF5f1CLg1cDVGB5Q@mail.gmail.com>
 <b910e870-9583-a2f5-b681-e69edb9af290@gmail.com> <CAO9r8zMLGMpsQ+HbLA5SFSMEc_ctuZoScJMkybnXMp+_0MW-yQ@mail.gmail.com>
In-Reply-To: <CAO9r8zMLGMpsQ+HbLA5SFSMEc_ctuZoScJMkybnXMp+_0MW-yQ@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 17 Jul 2026 09:50:33 -0700
X-Gm-Features: AUfX_mwfN7sZA8DWdA37gcvmiy0U6J390q-PiCo0povzean0soAfe8xUbAlBFJs
Message-ID: <CAKEwX=Patm4+gxtxwDYBFXFh+jfaOUSvtKtVZFvp=oQwNmdu1Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Yosry Ahmed <yosry@kernel.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 1:35=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
>
> It is a bit alarming that the store rejection rate is still 43% with
> batching, but we can worry about this later :)

Yeah I think it's unavoidable at the time the global shrinker is
awaken, unfortunately :( We need to kick off shrinking way ahead of
time if we want to avoid this, especially since the rate of zswap out
is going to be faster than the rate of writeback (CPU vs IO).

Sort of why we implement the proactive reclaimers :)
